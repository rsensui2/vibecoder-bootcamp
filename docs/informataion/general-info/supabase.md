# Supabase ガイド

**最終更新日**: 2025-12-18

## 目次
- [Supabaseとは](#supabaseとは)
- [プロジェクトのセットアップ](#プロジェクトのセットアップ)
- [データベース操作](#データベース操作)
- [認証機能](#認証機能)
- [ストレージ](#ストレージ)
- [Next.jsとの連携](#nextjsとの連携)
- [トラブルシューティング](#トラブルシューティング)

---

## Supabaseとは

### 概要
- オープンソースのFirebase代替
- PostgreSQLベースのデータベース
- 認証、ストレージ、リアルタイム機能を提供
- 無料プランでも十分な機能

### 主な機能
- **データベース**: PostgreSQL（リレーショナルDB）
- **認証**: Email/Password、OAuth（Google、GitHubなど）
- **ストレージ**: ファイルアップロード・管理
- **リアルタイム**: データベース変更の即時反映
- **Edge Functions**: サーバーレス関数

---

## プロジェクトのセットアップ

### 1. Supabaseプロジェクト作成

1. [Supabase](https://supabase.com)にアクセス
2. GitHubアカウントでサインイン
3. 「New Project」をクリック
4. プロジェクト情報を入力:
   ```
   Name: my-app
   Database Password: （強力なパスワード）
   Region: Northeast Asia (Tokyo)
   ```
5. 「Create new project」をクリック（2〜3分待つ）

### 2. APIキーの取得

1. プロジェクトダッシュボードで「Settings」→「API」
2. 重要な値をコピー:
   ```
   Project URL: https://xxxxx.supabase.co
   anon public: eyJhbGc... (公開用キー)
   service_role: eyJhbGc... (管理用キー、公開しない！)
   ```

### 3. Next.jsプロジェクトにインストール

```bash
npm install @supabase/supabase-js
```

### 4. 環境変数の設定

`.env.local`に追加:

```bash
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...
```

### 5. Supabaseクライアントの初期化

```typescript
// lib/supabase.ts
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

---

## データベース操作

### テーブルの作成

#### SQL Editor で作成
1. ダッシュボードで「SQL Editor」をクリック
2. 新しいクエリを作成:

```sql
-- postsテーブルを作成
CREATE TABLE posts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Row Level Security (RLS) を有効化
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- 誰でも読み取り可能なポリシー
CREATE POLICY "Anyone can read posts" ON posts
  FOR SELECT USING (true);
```

### データの取得（SELECT）

```typescript
// すべての投稿を取得
const { data, error } = await supabase
  .from('posts')
  .select('*')

// 特定の投稿を取得
const { data, error } = await supabase
  .from('posts')
  .select('*')
  .eq('id', postId)
  .single()

// 条件付き取得
const { data, error } = await supabase
  .from('posts')
  .select('*')
  .gte('created_at', '2025-01-01')
  .order('created_at', { ascending: false })
  .limit(10)
```

### データの挿入（INSERT）

```typescript
const { data, error } = await supabase
  .from('posts')
  .insert([
    { title: '新しい投稿', content: 'コンテンツ' }
  ])
  .select()
```

### データの更新（UPDATE）

```typescript
const { data, error } = await supabase
  .from('posts')
  .update({ title: '更新されたタイトル' })
  .eq('id', postId)
  .select()
```

### データの削除（DELETE）

```typescript
const { error } = await supabase
  .from('posts')
  .delete()
  .eq('id', postId)
```

---

## 認証機能

### Email/Passwordでのサインアップ

```typescript
const { data, error } = await supabase.auth.signUp({
  email: 'user@example.com',
  password: 'password123',
})
```

### ログイン

```typescript
const { data, error } = await supabase.auth.signInWithPassword({
  email: 'user@example.com',
  password: 'password123',
})
```

### OAuthログイン（Google）

#### 1. Supabaseで設定
1. 「Authentication」→「Providers」→「Google」
2. Google Cloud Consoleで認証情報を作成
3. Client IDとClient Secretを入力

#### 2. コードで実装

```typescript
const { data, error } = await supabase.auth.signInWithOAuth({
  provider: 'google',
  options: {
    redirectTo: 'http://localhost:3000/auth/callback',
  },
})
```

### 現在のユーザーを取得

```typescript
const { data: { user } } = await supabase.auth.getUser()
```

### ログアウト

```typescript
const { error } = await supabase.auth.signOut()
```

### セッション管理

```typescript
// セッション取得
const { data: { session } } = await supabase.auth.getSession()

// セッション変更を監視
supabase.auth.onAuthStateChange((event, session) => {
  console.log(event, session)
})
```

---

## ストレージ

### バケット作成

1. ダッシュボードで「Storage」をクリック
2. 「New bucket」→ 名前を入力（例: `avatars`）
3. Public/Privateを選択

### ファイルアップロード

```typescript
const file = event.target.files[0]

const { data, error } = await supabase.storage
  .from('avatars')
  .upload(`public/${file.name}`, file)
```

### ファイルURL取得

```typescript
const { data } = supabase.storage
  .from('avatars')
  .getPublicUrl('public/avatar.jpg')

console.log(data.publicUrl)
```

### ファイル削除

```typescript
const { error } = await supabase.storage
  .from('avatars')
  .remove(['public/avatar.jpg'])
```

---

## Next.jsとの連携

### Server Component でのデータ取得

```typescript
// app/posts/page.tsx
import { supabase } from '@/lib/supabase'

export default async function PostsPage() {
  const { data: posts } = await supabase
    .from('posts')
    .select('*')

  return (
    <div>
      {posts?.map(post => (
        <div key={post.id}>{post.title}</div>
      ))}
    </div>
  )
}
```

### Client Component でのデータ取得

```typescript
'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'

export default function Posts() {
  const [posts, setPosts] = useState([])

  useEffect(() => {
    async function fetchPosts() {
      const { data } = await supabase.from('posts').select('*')
      setPosts(data || [])
    }
    fetchPosts()
  }, [])

  return <div>{/* posts表示 */}</div>
}
```

### Server Actions との連携

```typescript
// app/actions.ts
'use server'

import { supabase } from '@/lib/supabase'
import { revalidatePath } from 'next/cache'

export async function createPost(formData: FormData) {
  const title = formData.get('title') as string
  const content = formData.get('content') as string

  const { error } = await supabase
    .from('posts')
    .insert([{ title, content }])

  if (error) throw error

  revalidatePath('/posts')
}
```

---

## トラブルシューティング

### よくあるエラーと解決策

#### 1. `401 Unauthorized` / `Permission denied`
- **原因**: Row Level Security (RLS) が有効で、ポリシーが設定されていない
- **解決策**:
  ```sql
  -- 一時的に全員に読み取り許可（開発時）
  CREATE POLICY "Enable read access for all users" ON posts
    FOR SELECT USING (true);

  -- 認証済みユーザーのみ挿入可能
  CREATE POLICY "Authenticated users can insert" ON posts
    FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
  ```

#### 2. `Failed to fetch`
- **原因**: 環境変数が正しく設定されていない
- **解決策**:
  - `.env.local`の値を確認
  - `NEXT_PUBLIC_`プレフィックスを確認
  - 開発サーバーを再起動

#### 3. データが取得できない（空配列）
- **原因**: テーブルにデータがない、またはRLS
- **解決策**:
  - Supabase Table Editorでデータを確認
  - RLSポリシーを確認
  - SQL Editorで直接クエリを試す

#### 4. `relation "public.posts" does not exist`
- **原因**: テーブルが作成されていない
- **解決策**:
  - SQL Editorでテーブル作成クエリを実行
  - Table Editorで確認

#### 5. OAuth認証が動かない
- **原因**: リダイレクトURLの設定ミス
- **解決策**:
  - Supabase: 「Authentication」→「URL Configuration」
  - Site URLとRedirect URLsを確認:
    ```
    Site URL: http://localhost:3000
    Redirect URLs: http://localhost:3000/auth/callback
    ```

#### 6. ファイルアップロードが失敗
- **原因**: バケットのアクセス権限
- **解決策**:
  - Storage設定でバケットをPublicに変更
  - またはRLSポリシーを設定

---

## ベストプラクティス

### 1. Row Level Security (RLS)
- **必ず有効化**: 本番環境では必須
- **最小権限の原則**: 必要最小限の権限を付与

```sql
-- ユーザーは自分の投稿のみ編集可能
CREATE POLICY "Users can update own posts" ON posts
  FOR UPDATE USING (auth.uid() = user_id);
```

### 2. 型安全性

```typescript
// Database型を生成（Supabase CLI使用）
// supabase gen types typescript --project-id xxx > types/database.types.ts

import { Database } from '@/types/database.types'

export const supabase = createClient<Database>(url, key)
```

### 3. エラーハンドリング

```typescript
const { data, error } = await supabase.from('posts').select('*')

if (error) {
  console.error('Error fetching posts:', error)
  return
}

// dataを使用
```

### 4. 環境変数の管理
- ローカル: `.env.local`
- 本番: Vercelの環境変数設定
- `service_role`キーは絶対にクライアントに公開しない

---

## 参考リンク
- [Supabase公式ドキュメント](https://supabase.com/docs)
- [Next.js + Supabase クイックスタート](https://supabase.com/docs/guides/getting-started/quickstarts/nextjs)
- [VibeCoder育成プログラム - Supabase講義](../../研修内容/)
