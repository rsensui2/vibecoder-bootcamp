# Clerk 認証ガイド

**最終更新日**: 2025-12-18

## 目次
- [Clerkとは](#clerkとは)
- [プロジェクトのセットアップ](#プロジェクトのセットアップ)
- [基本的な認証実装](#基本的な認証実装)
- [ユーザー情報の取得](#ユーザー情報の取得)
- [保護されたルート](#保護されたルート)
- [Webhook設定](#webhook設定)
- [トラブルシューティング](#トラブルシューティング)

---

## Clerkとは

### 概要
- モダンな認証・ユーザー管理サービス
- React/Next.jsと相性が良い
- UIコンポーネントが提供される（すぐに使える）
- OAuth対応（Google、GitHub、Twitterなど）

### 主な特徴
- **簡単セットアップ**: 数分で認証機能を実装
- **美しいUI**: カスタマイズ可能な認証画面
- **多機能**: MFA、組織管理、Webhookなど
- **無料プラン**: 月間10,000 MAU（アクティブユーザー）まで無料

---

## プロジェクトのセットアップ

### 1. Clerkアカウント作成

1. [Clerk](https://clerk.com)にアクセス
2. サインアップ（GitHubアカウント推奨）
3. 「Create application」をクリック
4. アプリケーション情報を入力:
   ```
   Application name: my-app
   認証方法を選択: Email, Google など
   ```

### 2. APIキーの取得

プロジェクト作成後、ダッシュボードで:
1. 「API Keys」をクリック
2. 必要な値をコピー:
   ```
   Publishable key: pk_test_...
   Secret key: sk_test_...
   ```

### 3. Next.jsプロジェクトにインストール

```bash
npm install @clerk/nextjs
```

### 4. 環境変数の設定

`.env.local`に追加:

```bash
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_test_...
CLERK_SECRET_KEY=sk_test_...

# オプション: リダイレクトURL（デフォルトでOK）
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL=/
NEXT_PUBLIC_CLERK_AFTER_SIGN_UP_URL=/
```

### 5. ClerkProviderでラップ

```typescript
// app/layout.tsx
import { ClerkProvider } from '@clerk/nextjs'
import './globals.css'

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <ClerkProvider>
      <html lang="ja">
        <body>{children}</body>
      </html>
    </ClerkProvider>
  )
}
```

---

## 基本的な認証実装

### サインインページの作成

```typescript
// app/sign-in/[[...sign-in]]/page.tsx
import { SignIn } from '@clerk/nextjs'

export default function SignInPage() {
  return (
    <div className="flex items-center justify-center min-h-screen">
      <SignIn />
    </div>
  )
}
```

### サインアップページの作成

```typescript
// app/sign-up/[[...sign-up]]/page.tsx
import { SignUp } from '@clerk/nextjs'

export default function SignUpPage() {
  return (
    <div className="flex items-center justify-center min-h-screen">
      <SignUp />
    </div>
  )
}
```

### ユーザーボタンの追加

```typescript
// components/Header.tsx
import { UserButton } from '@clerk/nextjs'

export default function Header() {
  return (
    <header>
      <nav>
        <h1>My App</h1>
        {/* 右上にユーザーボタン表示 */}
        <UserButton afterSignOutUrl="/" />
      </nav>
    </header>
  )
}
```

---

## ユーザー情報の取得

### Server Component でユーザー取得

```typescript
// app/dashboard/page.tsx
import { currentUser } from '@clerk/nextjs/server'

export default async function Dashboard() {
  const user = await currentUser()

  if (!user) {
    return <div>ログインしてください</div>
  }

  return (
    <div>
      <h1>こんにちは、{user.firstName}さん</h1>
      <p>Email: {user.emailAddresses[0].emailAddress}</p>
      <img src={user.imageUrl} alt="Avatar" />
    </div>
  )
}
```

### Client Component でユーザー取得

```typescript
'use client'

import { useUser } from '@clerk/nextjs'

export default function Profile() {
  const { isLoaded, isSignedIn, user } = useUser()

  if (!isLoaded) {
    return <div>読み込み中...</div>
  }

  if (!isSignedIn) {
    return <div>ログインしてください</div>
  }

  return (
    <div>
      <h1>{user.fullName}</h1>
      <p>{user.primaryEmailAddress?.emailAddress}</p>
    </div>
  )
}
```

### User IDの取得

```typescript
// Server Component
import { auth } from '@clerk/nextjs/server'

export default async function Page() {
  const { userId } = auth()

  if (!userId) {
    return <div>未認証</div>
  }

  return <div>User ID: {userId}</div>
}
```

---

## 保護されたルート

### Middlewareで保護

```typescript
// middleware.ts（プロジェクトルート）
import { clerkMiddleware, createRouteMatcher } from '@clerk/nextjs/server'

const isProtectedRoute = createRouteMatcher([
  '/dashboard(.*)',
  '/admin(.*)',
])

export default clerkMiddleware((auth, req) => {
  if (isProtectedRoute(req)) auth().protect()
})

export const config = {
  matcher: [
    '/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)',
    '/(api|trpc)(.*)',
  ],
}
```

### コンポーネントレベルで保護

```typescript
// app/dashboard/page.tsx
import { auth } from '@clerk/nextjs/server'
import { redirect } from 'next/navigation'

export default async function Dashboard() {
  const { userId } = auth()

  if (!userId) {
    redirect('/sign-in')
  }

  return <div>保護されたコンテンツ</div>
}
```

---

## Webhook設定

Webhookを使うと、ユーザーの作成・更新・削除時にデータベースを同期できます。

### 1. Clerkでエンドポイント設定

1. Clerkダッシュボードで「Webhooks」をクリック
2. 「Add Endpoint」をクリック
3. Endpoint URLを入力:
   ```
   開発環境: https://your-ngrok-url.ngrok.io/api/webhooks/clerk
   本番環境: https://your-domain.com/api/webhooks/clerk
   ```
4. イベントを選択:
   - `user.created`
   - `user.updated`
   - `user.deleted`
5. Signing Secretをコピー

### 2. 環境変数に追加

```bash
CLERK_WEBHOOK_SECRET=whsec_...
```

### 3. Webhookエンドポイント作成

```typescript
// app/api/webhooks/clerk/route.ts
import { Webhook } from 'svix'
import { headers } from 'next/headers'
import { WebhookEvent } from '@clerk/nextjs/server'

export async function POST(req: Request) {
  const WEBHOOK_SECRET = process.env.CLERK_WEBHOOK_SECRET

  if (!WEBHOOK_SECRET) {
    throw new Error('Missing CLERK_WEBHOOK_SECRET')
  }

  // ヘッダー取得
  const headerPayload = headers()
  const svix_id = headerPayload.get('svix-id')
  const svix_timestamp = headerPayload.get('svix-timestamp')
  const svix_signature = headerPayload.get('svix-signature')

  if (!svix_id || !svix_timestamp || !svix_signature) {
    return new Response('Error: Missing headers', { status: 400 })
  }

  // Body取得
  const payload = await req.json()
  const body = JSON.stringify(payload)

  // Webhook検証
  const wh = new Webhook(WEBHOOK_SECRET)
  let evt: WebhookEvent

  try {
    evt = wh.verify(body, {
      'svix-id': svix_id,
      'svix-timestamp': svix_timestamp,
      'svix-signature': svix_signature,
    }) as WebhookEvent
  } catch (err) {
    console.error('Webhook verification failed:', err)
    return new Response('Error: Verification failed', { status: 400 })
  }

  // イベント処理
  const eventType = evt.type

  if (eventType === 'user.created') {
    const { id, email_addresses, first_name, last_name } = evt.data

    // データベースにユーザー作成
    // await createUserInDatabase({
    //   clerkId: id,
    //   email: email_addresses[0].email_address,
    //   firstName: first_name,
    //   lastName: last_name,
    // })

    console.log('User created:', id)
  }

  return new Response('Webhook processed', { status: 200 })
}
```

### 4. ローカルテスト（ngrok使用）

```bash
# ngrokインストール（初回のみ）
brew install ngrok

# ngrokで公開
ngrok http 3000

# 表示されたURLをClerkのWebhook設定に追加
# 例: https://abc123.ngrok.io/api/webhooks/clerk
```

---

## トラブルシューティング

### よくあるエラーと解決策

#### 1. `Clerk: Missing publishableKey`
- **原因**: 環境変数が設定されていない
- **解決策**:
  - `.env.local`を確認
  - `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`があるか確認
  - 開発サーバーを再起動

#### 2. サインイン後にリダイレクトされない
- **原因**: リダイレクトURLが正しく設定されていない
- **解決策**:
  - `.env.local`で`NEXT_PUBLIC_CLERK_AFTER_SIGN_IN_URL`を確認
  - または`<SignIn afterSignInUrl="/" />`で明示的に指定

#### 3. `user is null` になる
- **原因**: 認証されていない、またはコンポーネントのロードタイミング
- **解決策**:
  ```typescript
  const { isLoaded, isSignedIn, user } = useUser()

  if (!isLoaded) return <div>Loading...</div>
  if (!isSignedIn) return <div>Please sign in</div>
  ```

#### 4. Webhookが動かない
- **原因**: Signing Secretが間違っている、またはngrokの期限切れ
- **解決策**:
  - Signing Secretを再確認
  - ngrokを再起動して新しいURLを設定
  - ログで詳細エラーを確認

#### 5. `Middleware redirect loop`
- **原因**: サインインページ自体が保護されている
- **解決策**:
  ```typescript
  // middleware.ts
  const isPublicRoute = createRouteMatcher([
    '/sign-in(.*)',
    '/sign-up(.*)',
    '/',
  ])

  export default clerkMiddleware((auth, req) => {
    if (!isPublicRoute(req)) auth().protect()
  })
  ```

---

## ベストプラクティス

### 1. ユーザー情報の同期
- Webhookでデータベースに同期
- `user.created`時にプロフィール作成
- `user.updated`時にプロフィール更新

### 2. 環境変数の管理
- ローカル: `.env.local`
- 本番: Vercelの環境変数
- テスト用と本番用でClerkプロジェクトを分ける

### 3. カスタマイズ
```typescript
// カスタムスタイル
<SignIn
  appearance={{
    elements: {
      formButtonPrimary: 'bg-blue-500 hover:bg-blue-600',
    }
  }}
/>
```

### 4. エラーハンドリング
```typescript
const { isLoaded, isSignedIn, user } = useUser()

if (!isLoaded) {
  return <LoadingSpinner />
}

if (!isSignedIn) {
  return <Redirect to="/sign-in" />
}
```

---

## よく使うコンポーネント

```typescript
import {
  SignIn,           // サインイン画面
  SignUp,           // サインアップ画面
  UserButton,       // ユーザーボタン（右上のアイコン）
  UserProfile,      // ユーザープロフィール編集
  SignInButton,     // カスタムサインインボタン
  SignUpButton,     // カスタムサインアップボタン
  SignOutButton,    // サインアウトボタン
} from '@clerk/nextjs'
```

---

## 参考リンク
- [Clerk公式ドキュメント](https://clerk.com/docs)
- [Next.js + Clerk クイックスタート](https://clerk.com/docs/quickstarts/nextjs)
- [VibeCoder育成プログラム - Clerk講義](../../研修内容/)
