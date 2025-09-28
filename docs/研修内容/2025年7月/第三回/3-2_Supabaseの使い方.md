# AI駆動開発でマスターするSupabase実践

## 概要

本ユニットでは「**AIに任せる開発スタイル**」を体感しながら、Supabaseのセットアップから CRUD、最新の認証 (`@supabase/ssr`) 連携まで 90 分でマスターします。

2024 Q4 に **`@supabase/auth-helpers-*` がメンテナンスモード入りし、`@supabase/ssr` が公式推奨** となったため、ドキュメントやテンプレートも刷新されています。

Supabase は Postgres 互換のバックエンドに **リアルタイム、ストレージ、RLS** まで統合した "Firebase for SQL" 的サービスで、Next.js との相性は抜群です。

> **ゴール:**  
> - **Cursor**（AIエディタ）にプロンプトを投げるだけで Supabase 連携コードが生成できる  
> - App Router＋Server Components で読み込みを、Server Actions で書き込みを実装  
> - Vercel 連携までワンストップで完走

---

## 学習目標

- **AIプロンプト**で Supabase の初期設定を自動化し、環境変数を安全に管理できる  
- `@supabase/ssr` を用いて **Cookie ベース**の安全な認証フローを構築できる  
- Next.js 15 の **Server Components / Server Actions** を組み合わせて CRUD を実装できる  
- Supabase の **RLS（Row Level Security）** とポリシー設計の勘所を理解する  
- Vercel Marketplace の **Supabase Integration** で env を自動同期できる  
- 旧 Auth Helpers → `@supabase/ssr` 移行手順を説明できる

---

## 準備

1. **[3-1_データベース基礎](./3-1_データベース基礎.md)** を読了している  
2. Supabase で新規プロジェクトを作成し、**Project URL** と **anon (public) key** を控えておく  
3. 環境要件

| Tool | Version (2025-07) | Install |
|------|------------------|---------|
| Node.js | ≥ 20.12 | `nvm install 20` |
| pnpm / npm 9 | – | `corepack enable` |
| Supabase CLI | ≥ 1.142 | `brew install supabase/tap/supabase` |
| Vercel CLI | ≥ 31 | `npm i -g vercel` |

4. `create-next-app -e with-supabase` が **App Router＋Tailwind＋shadcn/ui** 対応済みテンプレートです。

---

## 1. Supabase 連携の土台作り (ハンズオン)

ここからは **Cursor** と対話しながらコーディングします。

### ステップ 1: 必要ライブラリのインストール

**▶ Cursor への指示（例）**  
> 「Next.js プロジェクトで Supabase を使いたいので、公式パッケージをインストールしてください。Auth Helpers は非推奨のため `@supabase/ssr` を使ってください。」

Cursor から提案されるコマンド:

```bash
pnpm add @supabase/ssr @supabase/supabase-js
```

💡 **Deep Dive: @supabase/ssr とは？**
- Auth Helpers の API を フレームワーク非依存 に再実装した新パッケージ
- Cookie 署名・更新を内部で完結し、Edge Runtime でも動作
- createBrowserClient / createServerClient の 2 本だけ覚えれば OK

### ステップ 2: 環境変数の設定

**▶ Cursor への指示（例）**

> 「.env.local に NEXT_PUBLIC_SUPABASE_URL と NEXT_PUBLIC_SUPABASE_ANON_KEY を追記して下さい。値は後ほど手入力します。」

```env
NEXT_PUBLIC_SUPABASE_URL="YOUR_SUPABASE_URL"
NEXT_PUBLIC_SUPABASE_ANON_KEY="YOUR_SUPABASE_ANON_KEY"
```

**💡 非エンジニア向け解説: .env ファイルとは？**

### .env ファイルの基本

**.env ファイル**は「**環境変数（Environment Variables）**」を保存するファイルです。

**身近な例で説明すると：**
- 家の鍵を玄関ドアに貼り付けておくのは危険
- でも毎回覚えるのは大変
- だから「金庫」に入れて、必要な時だけ取り出す
- **.env = プログラム専用の金庫**

### .env ファイルの書き方

```env
# コメント：# で始まる行は説明用
NEXT_PUBLIC_SUPABASE_URL="https://your-project.supabase.co"
NEXT_PUBLIC_SUPABASE_ANON_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."

# 重要なルール
# 1. = の前後にスペースは入れない
# 2. 値は "" で囲む（推奨）
# 3. 大文字と小文字を区別する
# 4. 日本語や特殊文字は避ける
```

### 環境変数の種類

| 接頭辞 | 用途 | 例 |
|--------|------|-----|
| `NEXT_PUBLIC_` | ブラウザでも使える公開情報 | API の URL、公開キー |
| なし | サーバーでのみ使える秘密情報 | 秘密キー、パスワード |

### なぜコードに直接書かないの？

**危険な例：**
```javascript
// ❌ 絶対にやってはいけない
const apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**理由：**
1. **GitHub に公開される** → 全世界に秘密が漏れる
2. **悪用される** → 他人があなたのデータベースを操作
3. **高額請求** → 知らない間に大量のリクエストが発生
4. **修正が困難** → 一度公開すると取り消せない

**安全な例：**
```javascript
// ✅ 正しい方法
const apiKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
```

### .gitignore との関係

```gitignore
# このファイルに書くとGitHubにアップロードされない
.env
.env.local
.env.production
```

環境変数は **.gitignore** で除外されるため、GitHub に公開されません。

### ステップ 3: Supabase クライアントの作成

**▶ Cursor への指示（例）**

> 「lib/supabase フォルダに client.ts（ブラウザ用）と server.ts（サーバー用）を作成してください。」

```typescript
// lib/supabase/client.ts
import { createBrowserClient } from '@supabase/ssr'

export const supabase = createBrowserClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
)
```

```typescript
// lib/supabase/server.ts
import { cookies } from 'next/headers'
import { createServerClient } from '@supabase/ssr'

export const createClient = () =>
  createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { cookies }
  )
```

Cookie は HttpOnly; Secure; SameSite=Lax で自動生成され、追加設定不要です。

---

## 2. AI と共に実装する CRUD 操作 (ハンズオン)

### ステップ 4: データ取得 (Read) ― Server Components

**▶ Cursor への指示（例）**

> 「app/posts/page.tsx を Server Component として作成し、posts テーブルを created_at 降順で一覧表示してください。」

```typescript
import { createClient } from '@/lib/supabase/server'

export default async function PostsPage() {
  const supabase = createClient()
  const { data: posts, error } = await supabase
    .from('posts')
    .select('*')
    .order('created_at', { ascending: false })

  if (error) return <p>エラー: {error.message}</p>

  return (
    <div className="space-y-4">
      <h1 className="text-xl font-bold">投稿一覧</h1>
      {posts.map(p => <div key={p.id}>{p.content}</div>)}
    </div>
  )
}
```

**Server Components が有利な理由**
1. 初期 HTML にデータを含めて返せるため 高速描画
2. API キーがブラウザに漏れず 安全
3. 計算コストをサーバー側で肩代わりし 端末負荷を軽減

### ステップ 5: データ作成 (Create) ― Server Actions

**▶ Cursor への指示（例）**

> 「app/posts/page.tsx に投稿フォームを追加し、Server Action で posts に insert。完了後は revalidate してください。」

```typescript
import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'

// …PostsPage の上部省略…
async function createPost(formData: FormData) {
  'use server'
  const content = formData.get('content') as string
  if (!content) return
  const supabase = createClient()
  await supabase.from('posts').insert({
    content,
    user_id: '00000000-0000-0000-0000-000000000000'
  })
  revalidatePath('/posts')
}
```

Server Actions は API エンドポイント不要でセキュアに DB 操作が可能です。

### ステップ 6: 更新 (Update) / 削除 (Delete)

**演習ヒント:** update / delete は `supabase.from('posts').update({...}).eq('id', id)` のように eq 句でレコードを特定し、完了後 revalidatePath を忘れずに。

### ステップ 7: RLS とポリシー

Supabase Dashboard → Auth → Policies:

```sql
CREATE POLICY "Users can edit own posts"
  ON public.posts FOR ALL
  USING ( auth.uid() = user_id );
```

RLS を有効にすると、SQL 側で認証済みユーザーしか更新不可の保証ができます。

---

## 非エンジニア向け解説: URI・URL・Callback とは？

開発でよく出てくる用語を、Supabase の具体例で理解しましょう。

### URI と URL の違い

**URI（Uniform Resource Identifier）**
- **「住所」の概念**
- インターネット上のリソースを特定する仕組み
- URLを含む、より広い概念

**URL（Uniform Resource Locator）**
- **「具体的な住所」**
- 実際にアクセスできる場所を指定

**身近な例：**
```
URI: 「東京都渋谷区の◯◯ビル」（概念）
URL: 「〒150-0041 東京都渋谷区神南1-1-1」（具体的な住所）
```

### 実際のURI例

**Webサイト系：**
```
https://www.google.com          ← URL（場所）
https://api.supabase.com        ← URL（場所）
mailto:support@example.com      ← URI（メール識別子）
tel:+81-90-1234-5678           ← URI（電話番号識別子）
```

**ファイル系：**
```
file:///Users/username/document.pdf    ← ローカルファイル
ftp://server.com/files/data.csv        ← FTPサーバー
```

**アプリ系：**
```
myapp://open/profile/123               ← モバイルアプリのカスタムスキーム
slack://channel?team=T123&id=C456      ← Slackアプリ
```

### 💡 誰かに聞かれた時の答え方

**質問：「URIとURLの違いは？」**

**回答例：**
> 「URIは識別子の総称で、URLはその中でも場所を示すものです。
> 
> 例えば：
> - `https://supabase.com` → URL（Webサイトの場所）
> - `mailto:contact@supabase.com` → URI（メールアドレスの識別子、場所ではない）
> 
> つまり、すべてのURLはURIですが、すべてのURIがURLではありません。」



### 開発現場でのURI活用例

**1. API エンドポイント設計**
```
# RESTful URI設計
GET  /api/users/123           ← ユーザー取得
POST /api/users               ← ユーザー作成
PUT  /api/users/123           ← ユーザー更新
```

**2. Supabase Table URI**
```
supabase://project-id/table/users     ← 概念的なURI
https://api.supabase.co/rest/v1/users  ← 実際のURL
```

**3. 認証リダイレクト**
```
# OAuth フロー
myapp://auth/callback                  ← アプリに戻るURI
https://myapp.com/auth/callback        ← Web版のURL
```

### Supabase での具体例

```env
# これが Supabase Project URL
NEXT_PUBLIC_SUPABASE_URL="https://abcdefghijk.supabase.co"
```

**URLの構成要素：**
```
https://abcdefghijk.supabase.co
 ↑      ↑           ↑
 |      |           |
 |      |           └─ ドメイン名
 |      └─ プロジェクトID（あなた専用の識別子）
 └─ プロトコル（通信方式）
```

### Callback URL とは？

**Callback = 「折り返し電話」**

**日常の例：**
1. お店に電話 → 「担当者が不在です」
2. 「後で折り返し電話します」
3. 担当者から電話がかかってくる ← これが Callback

**ログイン処理での例：**
1. あなたのアプリからGoogleログインボタンを押す
2. Googleのページに移動してログイン
3. Googleがあなたのアプリに「ログイン完了」を通知 ← Callback
4. アプリに戻ってきてログイン状態になる

### Supabase 認証での Callback URL

```
設定例：
Callback URL: https://your-app.vercel.app/auth/callback
```

**処理の流れ：**
```
1. ユーザーがログインボタンクリック
   ↓
2. Supabase Auth ページに移動
   ↓
3. ユーザーがログイン情報入力
   ↓
4. Supabase が callback URL に結果を送信
   ↓
5. あなたのアプリが結果を受け取り
   ↓
6. ログイン完了 or エラー表示
```

### よくある Callback URL の設定

| 環境 | Callback URL例 |
|------|----------------|
| 開発環境 | `http://localhost:3000/auth/callback` |
| 本番環境 | `https://your-app.vercel.app/auth/callback` |
| プレビュー環境 | `https://your-app-git-feature.vercel.app/auth/callback` |

### 🚨 よくあるエラーと対処法

**エラー例：**
```
Error: Invalid callback URL
```

**原因と対処：**
1. **設定し忘れ** → Supabase Dashboard で Callback URL を追加
2. **URLが間違っている** → 本番URLとローカルURLの違いを確認
3. **HTTPSとHTTPの混在** → 本番環境では必ずHTTPSを使用

**Supabase Dashboard での設定場所：**
```
Authentication > Settings > Site URL
Authentication > Settings > Redirect URLs
```

### セキュリティの重要性

**危険な設定：**
```
# ❌ ワイルドカードは危険
Callback URL: https://*.vercel.app/auth/callback
```

**安全な設定：**
```
# ✅ 具体的なURLを列挙
https://your-app.vercel.app/auth/callback
https://your-app-staging.vercel.app/auth/callback
```

**理由：** 悪意のあるサイトがあなたの認証情報を盗む可能性があるため

---

## 3. 最新認証フローと移行ガイド

### 3-1. @supabase/ssr の実装ポイント

| ターゲット | ヘルパー |
|-----------|----------|
| ブラウザ | createBrowserClient |
| Server Component / Action | createServerClient |
| Middleware | createServerClient({ cookies, headers }) |

Edge / Bun / Cloudflare でも動作検証済み。

### 3-2. 旧 Auth Helpers → @supabase/ssr 差分

| やること | 旧 | 新 |
|---------|---|---|
| パッケージ | @supabase/auth-helpers-nextjs | @supabase/ssr |
| Client生成 | createPagesBrowserClient | createBrowserClient |
| SSR Client | createServerComponentClient | createServerClient |
| Cookie更新 | withMiddlewareAuth | 独自ミドルウェアで OK |

**移行手順**
1. `pnpm remove @supabase/auth-helpers-nextjs`
2. `pnpm add @supabase/ssr`
3. import パスを置換 → 9 割以上はそのまま動作

---

## 4. デプロイ: Vercel 連携

1. GitHub に push
2. Vercel Dashboard → Add New Project でリポジトリ選択
3. Supabase Integration を ON にすると env が自動同期＆Preview Branch 用 Redirect URL も生成されます。
4. `vercel --prod` で再デプロイ可能

Postgres 17 への自動アップグレードが 2025 年内に予定されていますが、既存アプリは追加作業不要とアナウンス済みです。

---

## 5. 演習課題

| プラン | 課題 | 成果物 |
|-------|------|--------|
| Essentials | ① 一覧表示 ② 新規作成 | posts 以外の任意テーブルで CRUD 最小実装 |
| Transformation | 上記＋③ 更新 ④ 削除 | Server Actions で Update/Delete 実装、RLS ポリシー設定 |

---

## まとめ

- 2025-07 時点で クイックスタート URL は有効だが、Auth Helpersは非推奨。@supabase/ssr を必ず使用。
- supabase-js v2.48+ で型安全性が向上し、デフォルト returning: 'minimal' へ変更。
- App Router＋Server Actions により API 不要のフルスタック開発が可能。
- Vercel × Supabase Integration で env・Redirect URL 同期が自動化。
- 旧プロジェクトは import 替え＋ミドルウェア修正のみで移行完了。

---

## 参考リンク

- [Supabase Docs – Next.js Quickstart](https://supabase.com/docs/guides/getting-started/quickstarts/nextjs)
- [Supabase Docs – Auth Helpers (legacy notice)](https://supabase.com/docs/guides/auth/auth-helpers/nextjs)
- [GitHub – supabase/auth-helpers (deprecated)](https://github.com/supabase/auth-helpers)
- [Migration Guide – Auth Helpers → SSR](https://supabase.com/docs/guides/troubleshooting/how-to-migrate-from-supabase-auth-helpers-to-ssr-package-5NRunM)
- [Vercel Marketplace – Supabase Integration](https://vercel.com/marketplace/supabase)
- [Medium – Supabase in Next.js 全手順解説](https://yagyaraj234.medium.com/setting-up-supabase-in-next-js-a-comprehensive-guide-78fc6d0d738c)