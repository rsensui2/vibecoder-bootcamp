# VibeCoder育成プログラム - プロジェクト情報

## 概要
このリポジトリは、TEKION GroupのVibeCoder育成プログラムの教材とドキュメントを管理しています。
AI駆動開発を学ぶための包括的なトレーニングプログラムです。

## ドキュメント検索システム
Markdown RAG (Retrieval-Augmented Generation) システムを使用して、ドキュメントの意味検索が可能です。

### 検索可能なトピック
- **要件定義**: AI駆動開発における要件定義の方法論
- **Cursor**: AI統合開発環境の使い方
- **Supabase**: データベースとバックエンドサービス
- **Clerk**: 認証システムの実装
- **デプロイ**: Vercelを使用したデプロイメント

## ディレクトリ構造

```
docs/
├── 研修内容/
│   ├── ライト版/
│   │   ├── 第一回/ - AI駆動開発の基礎とVibe Coderの概念
│   │   ├── 第二回/ - LLM基礎、要件定義、Cursor環境構築
│   │   ├── 第三回/ - データベース、Supabase、認証（Clerk）
│   │   └── 第四回/ - デプロイとVercel
│   └── 【要件定義型AI駆動開発の極意】.md
└── 調査/
    └── Udemy/ - AI駆動開発入門コース（65レッスン）
```

## 主要な学習コンテンツ

### 第一回: AI駆動開発の基礎
- Vibe Coderとは何か
- AIツールカオスマップ
- チャット型AIツール（ChatGPT、Claude等）
- v0とCursorの紹介
- APIキーの理解

### 第二回: 実践的な開発手法
- LLMの基礎理解
- AI駆動要件定義の方法
- Cursor開発環境構築
- 技術スタックの選定
- バージョン管理とドキュメント作成

### 第三回: バックエンド開発
- データベース基礎
- Supabaseの使い方
- 認証システムの理解
- ClerkでのGoogle認証実装

### 第四回: デプロイメント
- デプロイの概念
- Vercelを使った簡単デプロイ
- 環境変数の本番設定

### Udemy講座: 実践的なSNSアプリ開発
完全なフルスタックWebアプリケーション開発の実践：
1. **要件定義フェーズ** (レッスン8-14)
   - Claudeを使った要件定義・機能要件の作成
   - データベース設計とRDB図
   - 技術スタック選定
   - ディレクトリ設計

2. **開発フェーズ** (レッスン15-39)
   - Cursor + Bolt.new でのUI開発
   - Supabase + Prismaでのデータベース実装
   - DALパターンでのデータフェッチ
   - リファクタリング

3. **認証実装** (レッスン40-48)
   - Clerkによるユーザー認証
   - Webhook実装
   - ngrokでのローカルテスト

4. **機能実装** (レッスン49-61)
   - Server Actions実装
   - いいね機能（useOptimistic）
   - フォロー/アンフォロー機能
   - 返信機能
   - 画像アップロード（Supabase Storage）

5. **デプロイ** (レッスン62-65)
   - ビルドとセキュリティチェック
   - Vercelへのデプロイ

## 検索用キーワード
- 要件定義、機能要件、詳細設計
- Cursor、Composer、.cursorrules
- Supabase、Prisma、データベース設計
- Clerk、認証、Webhook
- Server Actions、useOptimistic、useActionState
- Vercel、デプロイ、環境変数
- Bolt.new、UI開発
- Next.js、React、TypeScript

## 使用方法
このプロジェクトで作業する際は、以下のMCPツールを活用してください：

1. **ドキュメント検索**: `mcp__markdown_rag__search_documents`
   ```
   例: query="Supabase 認証", k=5
   ```

2. **特定トピックの深掘り**: 関連ファイルを直接読み込み
   ```
   例: Read "docs/研修内容/ライト版/第三回/3-2_Supabaseの使い方.md"
   ```

## 注意事項
- このリポジトリはGit管理されており、現在mainブランチで作業中
- ドキュメントは随時更新される可能性があります
- 実装時は最新のベストプラクティスに従ってください