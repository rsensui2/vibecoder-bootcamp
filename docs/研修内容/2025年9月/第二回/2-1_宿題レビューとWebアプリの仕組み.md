---
marp: true
theme: default
paginate: true
---

# **第二回**
## 宿題レビューとWebアプリの仕組み
### 〜AIと共に創る、次世代の開発手法〜

**Vibe Coder Bootcamp**
TEKION Group / 泉水亮介
2025年9月23日

---

# 本日のゴール

## 🎯 **3つの重要な成果**

1. **宿題を通じて得た学び**を全員で共有
2. **Webアプリの基本構造**を深く理解
3. **APIが持つ無限の可能性**を体感

### 💡 なぜこれが重要か？
**「知識」から「実践」への橋渡し**
- 第一回で学んだ概念を実際のコードに変換
- エラーとの対話から生まれる深い理解
- 明日から使える実践的スキルの習得

---

# アジェンダ

## 📋 **本日の流れ**（90分）

| 時間 | 内容 | 重点ポイント |
|------|------|------------|
| **20分** | 宿題レビュー | 成功体験の共有 |
| **10分** | Vibe Coderマインドセット | 心構えの確立 |
| **30分** | Webアプリの仕組み | 構造の理解 |
| **20分** | APIの魔法 | 外部サービス活用 |
| **10分** | まとめと次回予告 | 実践への準備 |

---

# 第1部：宿題レビュー
## あなたのアイデアが形になった瞬間

---

# 宿題の振り返り

## 📝 **第一回の宿題内容**

### 環境構築タスク
- ✅ Cursorのインストールと基本設定
- ✅ ChatGPT Plus / Claude Proの契約
- ✅ GitHubアカウントの作成
- ✅ v0.devアカウントの作成

### 実践課題
- 🎨 v0を使った簡単なUI作成
- 💻 Cursorでの基本的なコード編集
- 🤖 AIチャットでの要件定義練習

---

# 宿題レビューのアプローチ

## 🌟 **成果共有の進め方**

### 発表時に意識すべき3つのポイント

1. **何を作ろうとしたか**
   - 解決したかった課題
   - 実装を試みた機能

2. **どんな壁にぶつかったか**
   - 技術的な困難
   - AIとの対話での課題

3. **どう解決したか**
   - 試行錯誤のプロセス
   - 得られた学び

---

# よくある実装パターンと学び

## 💡 **典型的な成功事例**

### パターン1：UIコンポーネントの作成
```
v0へのプロンプト例：
「モダンなダッシュボードUIを作成してください。
- カード形式でデータを表示
- レスポンシブデザイン
- ダークモード対応」
```
**学び**: 具体的な要件指定が重要

### パターン2：データ処理の実装
```javascript
// よくある課題：非同期処理の扱い
// 解決策：async/awaitの適切な使用
async function fetchData() {
  try {
    const response = await fetch('/api/data')
    return await response.json()
  } catch (error) {
    console.error('Error:', error)
  }
}
```
**学び**: エラーハンドリングの重要性

---

# 共通の学びポイント

## 💎 **全員が経験した3つの発見**

### 1. **完璧主義の罠**
- 最初から100点を目指さない
- 60点で動かし、改善を重ねる

### 2. **AIとの対話スキル**
- 曖昧な指示 → 曖昧な結果
- 具体的な指示 → 期待通りの結果

### 3. **エラーは友達**
- エラーメッセージを恐れない
- そのままAIにコピペして解決

---

# 第2部：Vibe Coderマインドセット
## AI時代の新しい学習法

---

# これから始まる実装の旅

## 🚀 **4つの心構え**

技術的な話に入る前に、初学者が挫折しないための重要な心構えを共有します。

これらは単なる精神論ではなく、**実際の開発現場で成功している人たちの共通点**です。

---

# 心構え①：AIを相棒として信頼する

## 🤝 **AI駆動開発の基本姿勢**

### ❌ 従来のプログラミング学習
「コードを暗記して自分で書く」
- 文法の習得に時間がかかる
- デバッグに苦労する
- 学習曲線が急峻

### ⭕ Vibe Coderの学習法
「AIと対話しながら作る」
- **要件を言語化**してAIに伝える
- **生成されたコードを理解**する
- **改善点をAIと議論**する

---

# 心構え②：プロンプトは設計書

## 📝 **AIへの指示の重要性**

### プロンプトの進化プロセス

#### Level 1: 曖昧な指示
```
「Todoアプリを作って」
```

#### Level 2: 具体的な要件
```
「Todoアプリを作って。
- タスクの追加・削除機能
- 完了/未完了の切り替え
- ローカルストレージで保存」
```

#### Level 3: ビジネス要件まで含む
```
「個人事業主向けのタスク管理アプリ：
- 優先度設定（緊急/重要マトリクス）
- 締切日のリマインダー
- カテゴリ分類（仕事/プライベート）」
```

---

# 心構え③：エラーはAIとの対話材料

## 🐛 **エラーを恐れない理由**

### Vibe Coderのエラー対処法

```
1. エラーが発生
   ↓
2. エラーメッセージをそのままCursor/Claudeにコピペ
   ↓
3. AIが原因と解決策を提示
   ↓
4. AIが修正コードを生成
   ↓
5. 理解して次へ進む
```

### 重要な視点の転換
- **エラー = 失敗** ではない
- **エラー = AIへの具体的な質問** である
- むしろエラーが出た方が学習効率が高い

---

# 心構え④：動くものを早く作る

## 🚀 **Agentモードの活用**

### CursorのComposerで実現する高速開発

#### 従来の開発
```
1. 設計（1週間）
2. コーディング（2週間）
3. テスト（1週間）
4. リリース（計1ヶ月）
```

#### AI駆動開発
```
1. Composerに要件を投げる（5分）
2. 動くプロトタイプ生成（10分）
3. 対話しながら改善（1時間）
4. デプロイ（計2時間）
```

### ポイント
**完璧より速度**を優先し、**ユーザーフィードバック**で改善

---

# 第3部：Webアプリの仕組み
## デジタル世界の建築学

---

# Webアプリケーションの全体像

## 🏗️ **建物に例えて理解する**

```mermaid
graph LR
    A[ユーザー<br/>訪問者] -->|リクエスト| B[フロントエンド<br/>受付・ロビー]
    B -->|API通信| C[バックエンド<br/>オフィス]
    C -->|データ操作| D[データベース<br/>倉庫]
    D -->|データ返却| C
    C -->|レスポンス| B
    B -->|表示| A
```

### それぞれの役割
- **フロントエンド**: お客様をもてなす空間
- **バックエンド**: 実務を処理する作業場
- **データベース**: 情報を安全に保管する金庫

---

# フロントエンド：ユーザー体験の最前線

## 🎨 **役割と責任範囲**

### 主な仕事（具体例付き）

| 責任範囲 | 具体例 | 使用技術 |
|----------|--------|----------|
| **UI設計** | ボタン、フォーム、メニュー | HTML/CSS |
| **UX最適化** | ローディング表示、エラー表示 | JavaScript |
| **インタラクション** | クリック、スワイプ、ドラッグ | React/Vue |
| **レスポンシブ対応** | スマホ/PC表示切り替え | CSS Media Query |

---

# フロントエンドの実装例

## 💻 **実際のコード**

```javascript
// Reactコンポーネントの例
function ProductCard({ product }) {
  const [isLiked, setIsLiked] = useState(false)

  const handleLike = async () => {
    // APIを呼び出してバックエンドと通信
    const response = await fetch('/api/products/like', {
      method: 'POST',
      body: JSON.stringify({ productId: product.id })
    })

    if (response.ok) {
      setIsLiked(true)
      // UIを即座に更新（楽観的更新）
    }
  }

  return (
    <div className="product-card">
      <h3>{product.name}</h3>
      <button onClick={handleLike}>
        {isLiked ? '❤️' : '🤍'}
      </button>
    </div>
  )
}
```

---

# バックエンド：ビジネスロジックの心臓部

## ⚙️ **役割と責任範囲**

### 主な仕事（具体例付き）

| 責任範囲 | 具体例 | なぜ重要か |
|----------|--------|-----------|
| **データ処理** | 価格計算、在庫確認 | ビジネスルールの実装 |
| **認証・認可** | ログイン、権限チェック | セキュリティの要 |
| **API提供** | データの送受信 | フロントとの橋渡し |
| **外部連携** | 決済、メール送信 | サービスの拡張 |

---

# バックエンドの実装例

## 🔧 **実際のコード**

```javascript
// Node.js + Expressの例
app.post('/api/products/like', async (req, res) => {
  try {
    // 1. ユーザー認証の確認
    const userId = getUserFromToken(req.headers.authorization)
    if (!userId) {
      return res.status(401).json({ error: '認証が必要です' })
    }

    // 2. ビジネスロジックの実行
    const { productId } = req.body

    // 3. データベースの更新
    await db.likes.create({
      userId,
      productId,
      createdAt: new Date()
    })

    // 4. 成功レスポンス
    res.status(200).json({ success: true })

  } catch (error) {
    // 5. エラーハンドリング
    console.error('Like処理エラー:', error)
    res.status(500).json({ error: 'サーバーエラー' })
  }
})
```

---

# フロントエンドとバックエンドの連携

## 🔄 **データの流れを追跡**

```mermaid
sequenceDiagram
    participant U as ユーザー
    participant F as フロントエンド
    participant B as バックエンド
    participant D as データベース

    U->>F: ❤️ボタンクリック
    F->>F: UIを楽観的に更新
    F->>B: POST /api/products/like
    B->>B: 認証チェック
    B->>D: いいね情報を保存
    D-->>B: 保存完了
    B-->>F: 成功レスポンス
    F-->>U: 最終UI確定
```

### ポイント
**楽観的更新**: レスポンスを待たずにUIを先に更新
→ ユーザー体験が劇的に向上

---

# 2025年の最新アーキテクチャ

## 🚀 **エッジコンピューティングの台頭**

### 従来のアーキテクチャ
```
ユーザー → CDN → サーバー（東京） → DB
         ↑------ 遅延: 200ms ------↑
```

### 2025年のアーキテクチャ
```
ユーザー → エッジ（最寄り） → グローバルDB
         ↑-- 遅延: 5ms --↑
```

### 利用可能な技術
- **Vercel Edge Functions**
- **Cloudflare Workers**
- **Deno Deploy**
- **Bun on Edge**

**結果**: 世界中どこでも高速なレスポンス

---

# 第4部：API - 外部サービスの力を借りる魔法
## 巨人の肩に乗る開発手法

---

# APIとは？機能の「コンセント」

## 🔌 **身近な例で理解する**

### 電化製品とコンセントの関係

| 電化製品 | コンセント | 得られる力 |
|----------|------------|------------|
| 掃除機 | 家庭用電源 | 吸引力 |
| エアコン | 家庭用電源 | 冷暖房 |
| **あなたのアプリ** | **API** | **高度な機能** |

### APIを使うメリット
1. **開発時間の大幅短縮**（数ヶ月→数分）
2. **専門知識不要**（地図、AI、決済のプロ不要）
3. **メンテナンス不要**（提供元が管理）

---

# 実際のAPI活用事例

## 🌍 **Google Maps API**

### 実装前（自前で作る場合）
- 地図データの収集: **不可能**
- 経路計算アルゴリズム: **超困難**
- リアルタイム交通情報: **不可能**

### API使用後（5分で実装）
```javascript
// たった数行で地図を表示
const map = new google.maps.Map(document.getElementById('map'), {
  center: { lat: 35.681236, lng: 139.767125 }, // 東京駅
  zoom: 15
})

// マーカーを追加
new google.maps.Marker({
  position: { lat: 35.681236, lng: 139.767125 },
  map: map,
  title: 'ここです！'
})
```

---

# TEKION Groupの実践事例

## 🚀 **泉水の個人プロジェクト**

### mygear.jp - 個人の持ち物管理
- **課題:** 所有物の整理と把握が困難
- **解決:** Supabase + Next.jsで高速実装
- **ポイント:** シンプルなCRUD操作で価値提供

### calendy.biz - カレンダー統合
- **課題:** 複数カレンダーの管理が煩雑
- **解決:** Google Calendar API統合
- **学び:** 外部APIで既存サービス連携

### mdnow.tokyo - Markdown即座公開
- **課題:** ドキュメント公開のプロセスが面倒
- **解決:** Vercel Edge Functionsで即座デプロイ
- **ポイント:** シンプルさが最大の武器

---

# ライブラリ：コードの部品箱

## 📦 **APIとライブラリの違い**

### ライブラリとは？
**他の開発者が作った「コードの部品集」**
- あなたのアプリの**中に組み込む**
- **無料**で使えることが多い
- **自分のサーバー**で動作

### APIとライブラリの使い分け

| 項目 | API | ライブラリ |
|------|-----|-----------|
| **動作場所** | 外部サーバー | 自分のアプリ内 |
| **料金** | 従量課金が多い | 基本無料 |
| **例** | Google Maps API | React, Lodash |
| **メンテナンス** | 提供元が管理 | 自分で更新管理 |

---

# 実践的なライブラリ活用

## 🎨 **よく使うライブラリの例**

### CSSフレームワーク：Tailwind CSS
```html
<!-- Tailwind CSSでスタイリング -->
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  クリックしてください
</button>
<!-- クラス名を組み合わせるだけでプロ級のデザイン -->
```

**Tailwind CSSの特徴:**
- CSSを書かずにクラス名だけでデザイン
- AIと相性抜群（AIがクラス名を生成しやすい）
- 軽量で高速

### UIコンポーネント：shadcn/ui
```typescript
// shadcn/uiのボタンコンポーネント
import { Button } from "@/components/ui/button"

<Button variant="outline" size="lg">
  モダンなボタン
</Button>
// → Tailwind CSSベースの美しいコンポーネント
```

**shadcn/uiの特徴:**
- コピペで使える（npmインストール不要）
- Tailwind CSSで完全カスタマイズ可能
- **2025年最も人気**のUIライブラリ

### ユーティリティライブラリ
```javascript
// Lodashで配列操作
import _ from 'lodash'

const users = [
  { name: '田中', age: 25 },
  { name: '佐藤', age: 30 }
]

const sorted = _.sortBy(users, 'age')
// → 複雑な処理も簡単に
```

### 日付処理ライブラリ
```javascript
// date-fnsで日付操作
import { format, addDays } from 'date-fns'
import { ja } from 'date-fns/locale'

const tomorrow = addDays(new Date(), 1)
const formatted = format(tomorrow, 'yyyy年MM月dd日', { locale: ja })
// → "2025年09月24日" のように日本語表示
```

**ライブラリ = 先人の知恵の結晶を活用**

---

# APIキーとは何か？

## 🔑 **APIを使うための「鍵」**

### APIキーの役割
APIはコンセントに例えましたが、**APIキーは「電気の契約」**のようなものです。

```
APIキーなし = 「無断で電気を使う」→ 使えない ❌
APIキー あり = 「契約して電気を使う」→ 使える ✅
```

### なぜAPIキーが必要なのか

1. **本人確認**
   - 誰が使っているか特定
   - 不正利用の防止

2. **使用量の測定**
   - どれだけAPIを呼び出したか記録
   - 料金計算の基礎

3. **セキュリティ**
   - 悪意のある利用者をブロック
   - アクセス制限

---

# APIキーの具体例

## 📋 **実際のAPIキー**

### Supabase（データベース）

```bash
# プロジェクトURL
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co

# 公開用キー（ブラウザで使える）
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_xxxxx...

# 秘密キー（サーバーのみ、複数作成可能）
SUPABASE_SECRET_KEY=sb_secret_xxxxx...

# データベース接続文字列（オプション：直接DB接続が必要な場合）
DATABASE_URL=postgresql://postgres.xxxxx:[PASSWORD]@aws-0-ap-northeast-1.pooler.supabase.com:6543/postgres
```

💡 **取得方法**:
1. [Supabase Dashboard](https://supabase.com/dashboard) → Settings → API
2. **Project URL** をコピー
3. **Publishable Key** (`sb_publishable_...`) をコピー
4. **Secret Key** (`sb_secret_...`) をコピー（⚠️ 絶対に公開しない）

### Clerk（認証サービス）
```bash
# 公開用キー
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx

# 秘密キー
CLERK_SECRET_KEY=sk_test_xxxxx
```

### Google Maps API
```bash
GOOGLE_MAPS_API_KEY=AIzaSyD...
```

⚠️ **セキュリティ警告**: Google Maps APIキーには必ず制限を設定してください
- **アプリケーション制限**: HTTPリファラー制限（ウェブサイトの場合）
- **API制限**: 使用するAPIのみ有効化（Maps JavaScript API等）
- 未制限のキーは不正利用・高額課金のリスクあり

---

# 環境変数ファイルの完全理解

## 🔐 **なぜ環境変数が必要なのか**

APIキーやデータベースURLなど、**秘密情報**をコードに直接書くと：
- ❌ GitHubに公開され、悪用される
- ❌ 開発環境と本番環境で設定を変えられない
- ❌ セキュリティリスクが高まる

**解決策**: 環境変数ファイルで管理する

---

# .env ファイルの種類と使い分け

## 📂 **3種類のファイルの違い**

| ファイル名 | 用途 | Git管理 | 優先度 | 例 |
|-----------|------|---------|--------|-----|
| `.env` | 全環境共通のデフォルト値 | ✅ 含める | 低 | 開発用サンプルURL |
| **`.env.local`** | **ローカル開発用（APIキー含む）** | ❌ **除外** | **高** | **実際のAPIキー** |
| `.env.production` | 本番環境専用 | ❌ 除外 | 最高 | Vercelで設定 |
| `.env.example` | テンプレート（値は空欄） | ✅ 含める | - | `DATABASE_URL=` |

### Next.jsの読み込み優先順位
```
.env.local > .env.production > .env
```

---

# NEXT_PUBLIC_ プレフィックスの重要性

## 🔑 **クライアント vs サーバーサイド環境変数**

```bash
# ブラウザ（クライアント）で使える環境変数
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxx

# サーバーサイドでのみ使える環境変数（秘密情報）
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...
CLERK_SECRET_KEY=sk_test_xxx
DATABASE_URL=postgresql://...
```

### ⚠️ 重要な原則

**APIキーなど秘密情報には `NEXT_PUBLIC_` を絶対に付けない**

```typescript
// ❌ 危険：ブラウザに公開される
NEXT_PUBLIC_STRIPE_SECRET_KEY=sk_live_xxx

// ✅ 安全：サーバーサイドのみ
STRIPE_SECRET_KEY=sk_live_xxx
```

---

# セキュアな環境変数管理

## 📝 **.env.example テンプレートの作成**

**個人開発でも必須**のファイル：

```bash
# .env.example（GitHubに含める）
# ========================================
# Supabase
# 取得方法: https://supabase.com/dashboard → Settings → API
# ========================================
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=
SUPABASE_SECRET_KEY=

# Database接続（オプション：Prisma等で直接DB接続が必要な場合）
# 取得方法: プロジェクトページ → Connect → Transaction Mode
# 注意: パスワードに特殊文字が含まれる場合はURLエンコードすること
DATABASE_URL=

# ========================================
# Clerk
# 取得方法: https://dashboard.clerk.com → API Keys
# ========================================
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
```

**キーの名前だけ記載し、値は空欄にする**

---

# .gitignore の設定確認

## 🚫 **必ずGitから除外するファイル**

```bash
# .gitignore
.env*.local
.env.production

# 既存の.gitignoreに追加されているか確認
```

### 確認方法
```bash
# ターミナルで実行
cat .gitignore | grep ".env"
```

### もし含まれていなければ追加
```bash
echo ".env*.local" >> .gitignore
echo ".env.production" >> .gitignore
```

---

# 環境変数のセットアップ手順

## 🔧 **プロジェクト開始時の手順**

### 1. .env.exampleをコピー
```bash
cp .env.example .env.local
```

### 2. 各サービスからAPIキーを取得

**Supabase**:
1. [supabase.com/dashboard](https://supabase.com/dashboard)
2. プロジェクト選択
3. **Settings → API**
4. 以下をコピー：
   - **Project URL**: `https://xxxxx.supabase.co`
   - **Publishable Key**: `sb_publishable_...`（公開用）
   - **Secret Key**: `sb_secret_...`（秘密、⚠️ 絶対に公開しない）

5. **（オプション）Database接続が必要な場合**:
   - プロジェクトページで「**Connect**」ボタンをクリック
   - **Transaction Mode**（推奨、ポート6543）の接続文字列をコピー
   - パスワードに記号（`@`, `:`, `/`, `#`等）が含まれる場合は**URLエンコード**が必要：
     ```javascript
     // JavaScriptの場合
     const encodedPassword = encodeURIComponent(password)

     // 例: p@ss:word → p%40ss%3Aword
     ```

**Clerk**:
1. [dashboard.clerk.com](https://dashboard.clerk.com)
2. Application選択
3. API Keys
4. キーをコピー

### 3. .env.localにペースト
```bash
# .env.local

# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=sb_publishable_xxxxx...
SUPABASE_SECRET_KEY=sb_secret_xxxxx...

# Database接続（オプション：Prisma等で直接DB接続が必要な場合）
# パスワードは必ずURLエンコードすること！
DATABASE_URL=postgresql://postgres.xxxxx:[URLエンコード済みPASSWORD]@aws-0-ap-northeast-1.pooler.supabase.com:6543/postgres

# Clerk
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_xxxxx
CLERK_SECRET_KEY=sk_test_xxxxx
```

⚠️ **重要**: Database Passwordに特殊文字（`@`, `:`, `/`, `#`等）が含まれる場合は必ずURLエンコードしてください
- 例: `p@ss:word` → `p%40ss%3Aword`
- JavaScriptの場合: `encodeURIComponent(password)`

### 4. セキュリティチェック
```bash
# .env.localがGitで無視されているか確認
git status | grep .env.local
# → 表示されなければOK（無視されている）

# .gitignoreの内容確認
cat .gitignore | grep ".env"
# → .env*.local が含まれていればOK
```

---

# API キー漏洩時の対処法

## ⚠️ **もしAPIキーをGitHubに公開してしまったら**

### 即座に実行する5つのステップ

1. **キーを無効化**（各サービスのダッシュボード）
   - Supabase: Settings → API → Reset anon/service_role key
   - Clerk: API Keys → Revoke key

2. **新しいキーを発行**

3. **`.env.local`を更新**

4. **Gitの履歴から削除**（必要に応じて）
   ```bash
   # 上級者向け - BFG Repo-Cleanerなどのツールを使用
   ```

5. **再発防止策**
   - .gitignoreの再確認
   - コミット前の確認習慣

### 予防策
- **事前に`.gitignore`を設定**
- **コミット前に`git status`で確認する習慣**
- **GitGuardianなど監視ツールの活用**

---

# Cursor Agentへの環境変数セットアップ指示

## 💬 **プロジェクト初期化時のプロンプトテンプレート**

```markdown
Next.js 15プロジェクトの環境変数ファイルを作成してください。

## セットアップ要件
1. **環境変数ファイルの作成**
   - `.env.local` を作成（以下の変数を含む）:
     ```
     # Supabase
     NEXT_PUBLIC_SUPABASE_URL=
     NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY=
     SUPABASE_SECRET_KEY=

     # Database接続（オプション：Prisma等で直接DB接続が必要な場合）
     DATABASE_URL=

     # Clerk
     NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
     CLERK_SECRET_KEY=
     ```

2. **`.env.example`テンプレートを作成**
   - 上記と同じキーを含むが、値は空欄に
   - 各キーの取得方法をコメントで記載

3. **`.gitignore`の確認**
   - 以下が含まれているか確認:
     ```
     .env*.local
     .env.production
     ```

4. **README.mdに環境変数セットアップ手順を追加**
   - Supabase APIキー取得方法:
     - Settings → API → Project URL, Publishable Key, Secret Keyをコピー
   - Database接続が必要な場合:
     - プロジェクトページ → Connect → Transaction Mode の接続文字列をコピー
     - パスワードに特殊文字（@, :, /, #等）が含まれる場合はURLエンコードすること
   - Clerk APIキー取得方法:
     - dashboard.clerk.com → API Keys

## セキュリティチェック
- 環境変数ファイルがGit管理されていないか確認
- NEXT_PUBLIC_プレフィックスが適切に使用されているか確認
- Secret Key（sb_secret_...）にはNEXT_PUBLIC_を付けないこと
- Database Passwordは必ずURLエンコードすること

上記を実行し、完了したら報告してください。
```

---

# 環境変数のベストプラクティス

## ✅ **安全に使うための5つのルール**

### 1. 秘密情報には`NEXT_PUBLIC_`を付けない
```bash
# ✅ 正しい
DATABASE_PASSWORD=secret123
STRIPE_SECRET_KEY=sk_live_xxx

# ❌ 危険
NEXT_PUBLIC_DATABASE_PASSWORD=secret123
NEXT_PUBLIC_STRIPE_SECRET_KEY=sk_live_xxx
```

### 2. .env.localは絶対にGitにコミットしない
```bash
# .gitignore に必ず含める
.env*.local
```

### 3. .env.exampleを必ず作る
```bash
# 何が必要かを示すテンプレート
DATABASE_URL=
API_KEY=
```

### 4. 本番環境ではホスティングサービスで設定
```bash
# Vercelの場合
Settings → Environment Variables
```

### 5. 定期的にキーをローテーション
- 3〜6ヶ月ごとに新しいキーに更新
- 古いキーは無効化

---

# AI APIで実現する未来

## 🤖 **OpenAI / Claude API**

### 活用例：カスタマーサポートBot

```javascript
async function answerCustomerQuestion(question) {
  const response = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${API_KEY}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      model: 'gpt-4',
      messages: [
        {
          role: 'system',
          content: 'あなたは親切なカスタマーサポートです。'
        },
        {
          role: 'user',
          content: question
        }
      ]
    })
  })

  const data = await response.json()
  return data.choices[0].message.content
}
```

**結果**: 24時間対応の高品質サポート

---

# 決済もAPIで簡単実装

## 💳 **Stripe API**

### 従来の決済実装
- PCI DSS準拠: **数百万円のコスト**
- セキュリティ監査: **数ヶ月**
- 各カード会社との契約: **複雑な手続き**

### Stripe API使用後
```javascript
// たった10行で決済実装
const stripe = Stripe('pk_test_xxx')

async function handlePayment(amount) {
  const { error } = await stripe.confirmPayment({
    elements,
    confirmParams: {
      return_url: 'https://myapp.com/success',
    },
  })

  if (error) {
    showError(error.message)
  }
}
```

**手数料3.6%で世界中の決済に対応**

---

# 今後使うAPI：Clerk（認証）

## 🔐 **次世代の認証システム**

### Clerkが解決する課題

| 従来の実装 | Clerk使用後 |
|-----------|------------|
| パスワード管理: 複雑 | 不要（Clerkが管理） |
| OAuth実装: 1週間 | 5分 |
| 2要素認証: 困難 | デフォルトで対応 |
| セッション管理: バグの温床 | 自動管理 |

### 実装例
```javascript
import { SignIn } from "@clerk/nextjs"

// これだけで完全な認証画面
export default function LoginPage() {
  return <SignIn />
}
```

**Google、GitHub、Twitterログインも自動対応**

---

# 今後使うAPI：Supabase（BaaS）

## 🗄️ **Backend as a Service**

### Supabaseが提供する機能

```mermaid
graph TB
    A[Supabase] --> B[認証]
    A --> C[データベース]
    A --> D[ストレージ]
    A --> E[リアルタイム]
    A --> F[Edge Functions]
    A --> G[Vector DB]
```

### 実装例

```javascript
// データベース操作が超簡単
import { createClient } from '@supabase/supabase-js'

// Supabaseクライアントを作成
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY
)

// データ取得
const { data } = await supabase
  .from('products')
  .select('*')
  .eq('category', 'electronics')

// リアルタイム購読
supabase
  .from('messages')
  .on('INSERT', (payload) => {
    console.log('新着メッセージ:', payload.new)
  })
  .subscribe()
```

---

# APIキー：魔法を使うための鍵

## 🔑 **大切な認証情報**

### APIキーとは？

**あなた専用の認証コード**
```
OPENAI_API_KEY="sk-proj-abc123xyz..."
GOOGLE_MAPS_KEY="AIzaSyDaGmWK..."
```

### 3つの重要な役割

1. **身分証明**: あなたが正規利用者であることの証明
2. **利用量追跡**: どれだけAPI使ったかの記録
3. **課金管理**: 使用量に応じた請求

---

# APIキーの安全な管理方法

## 🔒 **絶対に守るべきルール**

### ❌ 絶対にやってはいけないこと

```javascript
// 絶対ダメ！GitHubに公開されてしまう
const API_KEY = "sk-proj-abc123xyz..."
```

### ⭕ 正しい管理方法

```bash
# .env.localファイルに記載
OPENAI_API_KEY="sk-proj-abc123xyz..."
GOOGLE_MAPS_KEY="AIzaSyDaGmWK..."
```

```javascript
// 環境変数から読み込む
const apiKey = process.env.OPENAI_API_KEY
```

```bash
# .gitignoreに必ず追加
.env.local
.env
```

---

# APIキー漏洩時の対処法

## 🚨 **緊急時の行動フロー**

### もしGitHubにpushしてしまったら...

1. **即座にAPIキーを無効化**
   - 各サービスの管理画面へ急ぐ
   - 「Revoke」または「削除」をクリック

2. **新しいキーを生成**
   - 新規キーを作成
   - .env.localを更新

3. **GitHubから削除**
   ```bash
   git filter-branch --force --index-filter \
     "git rm --cached --ignore-unmatch .env" \
     --prune-empty --tag-name-filter cat -- --all
   ```

4. **請求を確認**
   - 不正利用がないかチェック

---

# APIのコスト管理

## 💰 **賢い使い方**

### 各サービスの料金体系（2025年9月時点）

| サービス | 無料枠 | 有料プラン |
|---------|--------|------------|
| **OpenAI** | なし | $0.01/1000トークン |
| **Claude** | なし | $0.003/1000トークン |
| **Google Maps** | $200/月 | $0.007/リクエスト |
| **Supabase** | 500MB・50,000行 | $25/月〜 |
| **Clerk** | 5,000ユーザー | $25/月〜 |

### 節約のコツ
1. **開発中は無料枠を活用**
2. **キャッシュを適切に使用**
3. **使用量上限を設定**

---

# 実践演習：API統合の流れ

## 🎯 **実際にやってみよう**

### タスク：天気情報を表示するアプリ

```javascript
// 1. APIキーを環境変数に設定
// .env.local
WEATHER_API_KEY="your-key-here"

// 2. APIを呼び出す関数
async function getWeather(city) {
  const response = await fetch(
    `https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${process.env.WEATHER_API_KEY}`
  )
  return response.json()
}

// 3. UIに表示
function WeatherCard({ city }) {
  const [weather, setWeather] = useState(null)

  useEffect(() => {
    getWeather(city).then(setWeather)
  }, [city])

  return (
    <div>
      <h2>{city}の天気</h2>
      <p>{weather?.main?.temp}°C</p>
    </div>
  )
}
```

---

# APIエラーへの対処

## 🐛 **よくあるエラーと解決法**

### エラーパターンと対処

| エラー | 原因 | 解決方法 |
|--------|------|----------|
| **401 Unauthorized** | APIキーが無効 | キーを確認・再生成 |
| **429 Too Many Requests** | レート制限 | 待つ or プラン upgrade |
| **403 Forbidden** | 権限不足 | スコープを確認 |
| **500 Internal Error** | API側の問題 | 時間を置いて再試行 |

### エラーハンドリングの実装
```javascript
try {
  const data = await callAPI()
} catch (error) {
  if (error.status === 429) {
    // レート制限の場合は再試行
    await sleep(1000)
    return retry()
  }
  // ユーザーに分かりやすく表示
  showError('一時的にサービスが利用できません')
}
```

---

# まとめ：本日の学び

## 📚 **3つの重要な理解**

### 1. 宿題から得た実践知
- **完璧を求めず、まず動かす**
- **エラーはAIへの質問材料**
- **小さな成功体験の積み重ね**

### 2. Webアプリの基本構造
- **フロントエンド**: ユーザーと対話する窓口
- **バックエンド**: ビジネスロジックの実装場所
- **データベース**: 情報の永続化

### 3. APIの革命的パワー
- **巨人の肩に乗る開発**
- **数ヶ月の開発を数分に短縮**
- **APIキーは大切に管理**

---

# 次回予告：第三回

## 🚀 **いよいよ本格実装へ！**

### 学習内容
1. **LLMの基礎理解**
   - なぜAIは賢いのか？
   - プロンプトエンジニアリングの極意

2. **AI駆動要件定義**
   - アイデアを仕様書に変換
   - Claudeと作る設計書

3. **Cursor実践開発**
   - Composerモードをマスター
   - AIペアプログラミング

4. **技術スタック選定**
   - Next.js / React の使い分け
   - なぜこの技術を選ぶのか

---

# 宿題：次回までの準備

## 📝 **実践課題**

### 必須課題
1. **本日の復習**
   - フロント/バックの役割を説明できるようになる
   - APIの概念を他者に説明できるようになる

2. **環境準備**
   - Node.js 20以上をインストール
   - Cursorの拡張機能を追加

### チャレンジ課題
**「あなたが作りたいアプリ」のアイデアメモ**
- どんな問題を解決したいか
- 誰が使うのか
- どんな機能が必要か

---

# 質疑応答

## ❓ **よくある質問**

### Q: フロントとバックエンド、どちらから学ぶべき？
**A**: フロントエンドから始めることを推奨
- 結果が目に見えてモチベーション維持しやすい
- v0やCursorでの生成が簡単
- 徐々にバックエンドを追加していける

### Q: APIの利用料金が心配です
**A**: 開発段階では月1000円以内で収まります
- 各サービスの無料枠を活用
- 使用量制限を設定
- 本番環境でも売上に応じて調整可能

---

# 最後に：Vibe Coderへの道

## 🌟 **今日から始まる変化**

### あなたはもう始まっている
- 宿題を通じて**最初の一歩**を踏み出した
- エラーと向き合う**勇気**を持った
- AIと対話する**スキル**を身につけ始めた

### これから起きること
1. **来週**: 簡単なアプリが作れるように
2. **来月**: 本格的なサービスを構築
3. **3ヶ月後**: あなたのアイデアが形に

**「できるかな？」ではなく「何を作ろうか？」**

---

# 参考資料とリソース

## 📚 **さらに学びたい方へ**

### 公式ドキュメント
- [React公式](https://react.dev) - UIライブラリ
- [Next.js](https://nextjs.org) - フルスタックフレームワーク
- [Supabase](https://supabase.com) - BaaSドキュメント
- [Clerk](https://clerk.com) - 認証ドキュメント

### 学習リソース
- [MDN Web Docs](https://developer.mozilla.org) - Web技術の百科事典
- [web.dev](https://web.dev) - Googleの学習サイト
- [Qiita](https://qiita.com) - 日本語技術記事

### コミュニティ
- TEKION Vibe Coder Discord
- 受講生専用Slackチャンネル

---

# Thank You!

## 🙏 **本日もお疲れ様でした**

### 次回お会いするまでに
- 今日の学びを**実践**してみてください
- 分からないことは**Discord**で質問
- 小さな成功を**共有**してください

### Remember:
> **"The best way to learn is to teach"**
> 学んだことを誰かに教えることが、最高の学習法

**See you next week! 🚀**

### 連絡事項
- 質問・相談は**Slack**の#vibe-coderチャンネルへ
- 宿題の提出も同チャンネルで共有

---

# 付録：トラブルシューティング

## 🔧 **つまずいた時の解決法**

### Cursor関連
| 問題 | 解決方法 |
|------|----------|
| AIが反応しない | APIキーを再確認 |
| 生成が遅い | モデルをGPT-4oに変更 |
| コードが動かない | package.jsonを確認 |

### API関連
| 問題 | 解決方法 |
|------|----------|
| 401エラー | APIキーの設定確認 |
| CORS エラー | バックエンド経由で呼び出し |
| レート制限 | リトライロジック実装 |

---

# 付録：用語集

## 📖 **今日出てきた重要用語**

| 用語 | 意味 | 例 |
|------|------|-----|
| **フロントエンド** | ユーザーが見る画面側 | React, Vue |
| **バックエンド** | サーバー側の処理 | Node.js, Python |
| **API** | プログラム間の接続口 | REST API, GraphQL |
| **APIキー** | API利用の認証コード | sk-proj-xxx... |
| **環境変数** | 設定値を保存する仕組み | .env.local |
| **レスポンシブ** | 画面サイズ対応 | スマホ/PC両対応 |
| **非同期処理** | 待たずに次の処理へ | async/await |
| **CORS** | 異なるドメイン間通信 | クロスオリジン |

---

# 付録：チートシート

## 💡 **すぐに使えるコードスニペット**

### API呼び出しの基本形
```javascript
async function callAPI(endpoint, data) {
  try {
    const response = await fetch(endpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${process.env.API_KEY}`
      },
      body: JSON.stringify(data)
    })

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`)
    }

    return await response.json()
  } catch (error) {
    console.error('API Error:', error)
    throw error
  }
}
```

---

# 付録：2025年の技術トレンド

## 🔮 **最新動向（o3 MCP調査結果）**

### フロントエンド
- **React 19**: Server Componentsが標準化
- **Next.js 15**: Partial Pre-Renderingで爆速化
- **Bun**: Node.jsより100倍高速な実行環境

### バックエンド
- **Edge Functions**: 5ms以下のレスポンス
- **Durable Objects**: 分散型ステート管理
- **GraphQL Federation 2**: マイクロサービス統合

### セキュリティ
- **OAuth 2.1**: より安全な認証標準
- **Zero Trust Architecture**: 全アクセスを検証
- **SLSA準拠**: サプライチェーン保護

**これらの技術も、基本を理解すれば怖くない！**