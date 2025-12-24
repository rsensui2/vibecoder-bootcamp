# Next.js ガイド

**最終更新日**: 2025-12-18
**対象バージョン**: Next.js 14以降（App Router）

## 目次
- [Next.jsとは](#nextjsとは)
- [プロジェクト構造](#プロジェクト構造)
- [App Routerの基本](#app-routerの基本)
- [よく使うAPI](#よく使うapi)
- [環境変数](#環境変数)
- [トラブルシューティング](#トラブルシューティング)

---

## Next.jsとは

### 概要
- Reactベースのフルスタックフレームワーク
- サーバーサイドレンダリング（SSR）対応
- ファイルベースのルーティング
- 開発体験（DX）が優れている

### 主な特徴
- **ゼロコンフィグ**: 設定不要ですぐに開発開始
- **高速**: 自動最適化とビルトインパフォーマンス
- **SEOフレンドリー**: サーバーサイドレンダリング
- **TypeScript対応**: 標準でサポート

---

## プロジェクト構造

### 基本的なディレクトリ構成

```
my-next-app/
├── app/                    # App Router（Next.js 13+）
│   ├── layout.tsx         # ルートレイアウト
│   ├── page.tsx           # トップページ
│   ├── globals.css        # グローバルCSS
│   ├── api/               # APIルート
│   └── (routes)/          # ページディレクトリ
├── public/                 # 静的ファイル（画像など）
├── components/            # 再利用可能なコンポーネント
├── lib/                   # ユーティリティ関数
├── types/                 # TypeScript型定義
├── .env.local            # 環境変数（ローカル）
├── next.config.js        # Next.js設定
├── package.json          # 依存関係
└── tsconfig.json         # TypeScript設定
```

### 重要なディレクトリ

#### `app/`ディレクトリ
- **App Router**の中心
- フォルダ構造がそのままURLになる
- 特別なファイル名の役割:
  - `page.tsx`: ページコンポーネント
  - `layout.tsx`: レイアウト
  - `loading.tsx`: ローディング表示
  - `error.tsx`: エラー表示
  - `not-found.tsx`: 404ページ

#### `public/`ディレクトリ
- 画像、フォント、faviconなど
- `/`からアクセス可能
- 例: `public/logo.png` → `/logo.png`

---

## App Routerの基本

### ページの作成

```typescript
// app/page.tsx (トップページ: /)
export default function Home() {
  return (
    <div>
      <h1>ホームページ</h1>
    </div>
  )
}

// app/about/page.tsx (aboutページ: /about)
export default function About() {
  return (
    <div>
      <h1>About Us</h1>
    </div>
  )
}
```

### 動的ルート

```typescript
// app/posts/[id]/page.tsx (/posts/1, /posts/2 など)
export default function Post({ params }: { params: { id: string } }) {
  return <div>投稿ID: {params.id}</div>
}
```

### レイアウト

```typescript
// app/layout.tsx (全ページ共通レイアウト)
export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="ja">
      <body>
        <header>ヘッダー</header>
        <main>{children}</main>
        <footer>フッター</footer>
      </body>
    </html>
  )
}
```

### リンク

```typescript
import Link from 'next/link'

export default function Navigation() {
  return (
    <nav>
      <Link href="/">ホーム</Link>
      <Link href="/about">About</Link>
      <Link href="/posts/1">投稿1</Link>
    </nav>
  )
}
```

---

## よく使うAPI

### Server ComponentとClient Component

#### Server Component（デフォルト）
- サーバーでレンダリング
- データベース直接アクセス可能
- バンドルサイズが小さい

```typescript
// app/posts/page.tsx
async function getPosts() {
  const res = await fetch('https://api.example.com/posts')
  return res.json()
}

export default async function Posts() {
  const posts = await getPosts()
  return <div>{/* posts表示 */}</div>
}
```

#### Client Component
- ブラウザでレンダリング
- `'use client'`ディレクティブが必要
- useState, useEffectなどのHooksが使える

```typescript
'use client'

import { useState } from 'react'

export default function Counter() {
  const [count, setCount] = useState(0)
  return (
    <button onClick={() => setCount(count + 1)}>
      カウント: {count}
    </button>
  )
}
```

### 画像の最適化

```typescript
import Image from 'next/image'

export default function Avatar() {
  return (
    <Image
      src="/avatar.jpg"
      alt="アバター"
      width={100}
      height={100}
    />
  )
}
```

### メタデータ（SEO）

```typescript
// app/page.tsx
import { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'ホームページ',
  description: 'これはホームページです',
}

export default function Home() {
  return <div>ホーム</div>
}
```

### API Routes

```typescript
// app/api/hello/route.ts
import { NextResponse } from 'next/server'

export async function GET() {
  return NextResponse.json({ message: 'Hello World' })
}

export async function POST(request: Request) {
  const body = await request.json()
  return NextResponse.json({ data: body })
}
```

---

## 環境変数

### 環境変数とは

環境変数とは、**アプリケーションの設定情報を外部に保存する仕組み**です。コードに直接書くのではなく、別ファイル（`.env.local`）に保存することで：

- **セキュリティ向上**: APIキーやパスワードをコードから分離
- **環境ごとの設定切り替え**: 開発環境と本番環境で異なる値を使用可能
- **秘密情報の保護**: Gitにコミットせず、秘密を守る

例えば、Supabaseの接続情報やClerkのAPIキーなどを環境変数で管理します。

### `.env.local` ファイルの作成方法

#### 1. ファイルを作成

プロジェクトのルートディレクトリ（`package.json`と同じ階層）に `.env.local` というファイルを作成します。

**Cursorでの作成方法**:
1. ファイルツリーでプロジェクトルートを右クリック
2. 「New File」を選択
3. `.env.local` と入力して Enter

#### 2. キーとバリューを書く

`.env.local` の中身は、`キー名=値` の形式で書きます。

```bash
# .env.local の例

# Supabase設定
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJ...

# Clerk設定
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx
CLERK_SECRET_KEY=sk_test_xxxxx

# その他
DATABASE_URL=postgresql://user:pass@localhost:5432/mydb
API_SECRET_KEY=your-secret-key-here
```

**書き方のルール**:
- `=` の前後にスペースは入れない
- 値に空白が含まれる場合は `""` で囲む（通常は不要）
- `#` で始まる行はコメント

#### 3. `.gitignore` に追加（重要！）

`.env.local` は秘密情報を含むため、**Gitにコミットしてはいけません**。

`.gitignore` に以下を追加（Next.jsプロジェクトでは通常デフォルトで含まれています）:

```
# .gitignore
.env.local
```

### キーとバリューの説明

#### キー（Key）
環境変数の名前です。通常、大文字とアンダースコアで書きます。

例: `NEXT_PUBLIC_API_URL`、`DATABASE_URL`

#### バリュー（Value）
その環境変数に設定する値です。

例: `https://api.example.com`、`postgresql://localhost:5432/mydb`

#### `NEXT_PUBLIC_` プレフィックスの意味

Next.jsでは、環境変数の名前に `NEXT_PUBLIC_` を付けるかどうかで、使える場所が変わります：

| プレフィックス | 使える場所 | 用途 |
|--------------|----------|------|
| **`NEXT_PUBLIC_`** | サーバー＆ブラウザ | ブラウザに公開してもOKな値（例: APIのURL） |
| **なし** | サーバーのみ | 秘密情報（例: APIキー、データベースパスワード） |

**重要**: APIキーなどの秘密情報には `NEXT_PUBLIC_` を**絶対に付けない**でください。ブラウザに公開され、誰でも見られてしまいます。

### 使い方

#### サーバーコンポーネント（Server Component）

サーバーコンポーネントでは、**すべての環境変数**を使えます。

```typescript
// app/api/data/route.ts
export async function GET() {
  // どちらも使える
  const apiUrl = process.env.NEXT_PUBLIC_API_URL
  const secretKey = process.env.API_SECRET_KEY

  // ...
}
```

#### クライアントコンポーネント（Client Component）

クライアントコンポーネントでは、**`NEXT_PUBLIC_` が付いた環境変数のみ**使えます。

```typescript
'use client'

export default function MyComponent() {
  // ✅ OK: NEXT_PUBLIC_ が付いている
  const apiUrl = process.env.NEXT_PUBLIC_API_URL

  // ❌ NG: NEXT_PUBLIC_ が付いていないので undefined になる
  const secretKey = process.env.API_SECRET_KEY // undefined
}
```

### よくある設定例

#### Supabaseの場合

```bash
# .env.local
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...
```

- `NEXT_PUBLIC_` を付ける理由: ブラウザからSupabaseにアクセスするため

#### Clerkの場合

```bash
# .env.local
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx
CLERK_SECRET_KEY=sk_test_xxxxx
```

- `PUBLISHABLE_KEY`: ブラウザで使うので `NEXT_PUBLIC_` を付ける
- `SECRET_KEY`: サーバーのみで使うので `NEXT_PUBLIC_` を付けない

### 環境変数が読み込まれない場合

#### 1. 開発サーバーを再起動

`.env.local` を変更したら、必ず開発サーバーを再起動してください。

```bash
# ターミナルで
Ctrl + C  # サーバー停止
npm run dev  # 再起動
```

#### 2. ファイル名が正しいか確認

- ✅ 正しい: `.env.local`
- ❌ 間違い: `env.local`（先頭の `.` が必要）
- ❌ 間違い: `.env.local.txt`（拡張子は付けない）

#### 3. プロジェクトルートに配置されているか確認

`.env.local` は `package.json` と同じ階層に配置する必要があります。

### 環境変数の確認方法

環境変数が正しく読み込まれているか確認したい場合：

```typescript
console.log('API URL:', process.env.NEXT_PUBLIC_API_URL)
```

ターミナル（サーバーサイド）またはブラウザのコンソール（クライアントサイド）で値が表示されれば、正しく読み込まれています。

### セキュリティのベストプラクティス

1. **`.env.local` は絶対にGitにコミットしない**
2. **秘密情報には `NEXT_PUBLIC_` を付けない**
3. **`.env.example` でサンプルを提供**

`.env.example` の例:
```bash
# .env.example（これはGitにコミットしてOK）
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url-here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
CLERK_SECRET_KEY=your-clerk-secret-key-here
```

チームメンバーや他の開発者は、この `.env.example` をコピーして `.env.local` を作成し、実際の値を入れます。

---

## トラブルシューティング

### よくあるエラーと解決策

#### 1. `You're importing a component that needs useState. It only works in a Client Component`
- **原因**: Server ComponentでuseStateなどのHooksを使っている
- **解決策**: ファイルの先頭に`'use client'`を追加

```typescript
'use client'  // これを追加

import { useState } from 'react'
```

#### 2. `Error: Text content does not match server-rendered HTML`
- **原因**: サーバーとクライアントのレンダリング結果が異なる
- **解決策**:
  - `suppressHydrationWarning`を使用
  - または条件付きレンダリングを避ける

```typescript
<time suppressHydrationWarning>
  {new Date().toLocaleString()}
</time>
```

#### 3. `Module not found: Can't resolve`
- **原因**: インポートパスが間違っている、またはパッケージ未インストール
- **解決策**:
  - パスを確認（大文字小文字、拡張子）
  - `npm install パッケージ名`でインストール

#### 4. 画像が表示されない
- **原因**: `next/image`の設定ミス、または外部画像の未設定
- **解決策**:
  - `public/`内の画像は`/`から始めるパス
  - 外部画像は`next.config.js`に追加

```javascript
// next.config.js
module.exports = {
  images: {
    domains: ['example.com'],
  },
}
```

#### 5. 環境変数が読み込まれない
- **原因**: 開発サーバーの再起動が必要
- **解決策**:
  - `.env.local`を変更したら`npm run dev`を再起動
  - ブラウザで使う場合は`NEXT_PUBLIC_`プレフィックスを確認

#### 6. `Port 3000 is already in use`
- **原因**: 別のプロセスがポート3000を使用中
- **解決策**:
  ```bash
  # 別のポートで起動
  PORT=3001 npm run dev

  # またはプロセスを終了（Mac/Linux）
  lsof -ti:3000 | xargs kill -9
  ```

---

## よく使うコマンド

```bash
# 開発サーバー起動
npm run dev

# プロダクションビルド
npm run build

# ビルド後の起動
npm start

# リント（コード品質チェック）
npm run lint
```

---

## Tips

### 開発のベストプラクティス

1. **Server ComponentとClient Componentを適切に使い分ける**
   - デフォルトはServer Component
   - インタラクティブな部分だけClient Component

2. **環境変数の管理**
   - `.env.local`はGitにコミットしない
   - `.env.example`でサンプルを提供

3. **型安全性**
   - TypeScriptを活用
   - `any`型は極力避ける

4. **パフォーマンス**
   - 画像は`next/image`を使う
   - 動的インポート`dynamic()`で遅延ロード

---

## 参考リンク
- [Next.js公式ドキュメント](https://nextjs.org/docs)
- [VibeCoder育成プログラム - Next.js実装ガイド](../../研修内容/)
