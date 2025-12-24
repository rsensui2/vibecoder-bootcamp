# Vercel デプロイガイド

**最終更新日**: 2025-12-18

## 目次
- [Vercelとは](#vercelとは)
- [初回デプロイ手順](#初回デプロイ手順)
- [環境変数の設定](#環境変数の設定)
- [ドメイン設定](#ドメイン設定)
- [よく使う機能](#よく使う機能)
- [トラブルシューティング](#トラブルシューティング)

---

## Vercelとは

### 概要
- Next.jsの開発元が提供するホスティングプラットフォーム
- GitHubと連携して自動デプロイ
- 無料プランでも本格的なアプリをホスティング可能

### 主な特徴
- **自動デプロイ**: Gitにpushするだけで自動デプロイ
- **プレビューデプロイ**: ブランチごとにプレビュー環境を自動生成
- **高速**: エッジネットワークで世界中に高速配信
- **簡単設定**: 環境変数やドメインの設定が簡単

---

## 初回デプロイ手順

### 前提条件
- GitHubにプロジェクトをpush済み
- Vercelアカウント作成済み（GitHub連携推奨）

### ステップバイステップ

#### 1. Vercelにログイン
1. [Vercel](https://vercel.com)にアクセス
2. "Continue with GitHub"でログイン

#### 2. 新規プロジェクト作成
1. ダッシュボードで「Add New」→「Project」をクリック
2. GitHubリポジトリ一覧から対象プロジェクトを選択
3. 「Import」をクリック

#### 3. プロジェクト設定
```
Project Name: my-next-app（自動で入力される）
Framework Preset: Next.js（自動検出）
Root Directory: ./（通常はそのまま）
Build Command: npm run build（自動設定）
Output Directory: .next（自動設定）
```

#### 4. 環境変数の設定（必要な場合）
- 「Environment Variables」セクションで追加
- 例:
  ```
  Name: DATABASE_URL
  Value: postgresql://...
  ```

#### 5. デプロイ
1. 「Deploy」ボタンをクリック
2. 1〜3分でデプロイ完了
3. デプロイ後、URLが発行される（例: `https://my-app.vercel.app`）

---

## 環境変数の設定

### デプロイ後に環境変数を追加

1. プロジェクトダッシュボードで「Settings」タブをクリック
2. 左メニューから「Environment Variables」を選択
3. 環境変数を追加:

```
Key: NEXT_PUBLIC_API_URL
Value: https://api.example.com
Environment: Production
```

### 環境の種類
- **Production**: 本番環境（mainブランチ）
- **Preview**: プレビュー環境（PRやブランチ）
- **Development**: ローカル開発（通常は使わない）

### 重要な注意点
1. 環境変数を追加/変更したら**Redeploy**が必要
2. `NEXT_PUBLIC_`プレフィックスはブラウザに公開される
3. APIキーなどの秘密情報は`NEXT_PUBLIC_`を付けない

### 再デプロイ手順
1. 「Deployments」タブを開く
2. 最新のデプロイにカーソルを合わせる
3. 右側の「...」→「Redeploy」をクリック

---

## ドメイン設定

### カスタムドメインの追加

#### 1. ドメインを取得
- Google Domains、お名前.com、Cloudflareなどで取得

#### 2. Vercelにドメインを追加
1. プロジェクトダッシュボードで「Settings」→「Domains」
2. 取得したドメインを入力（例: `myapp.com`）
3. 「Add」をクリック

#### 3. DNS設定
Vercelが指示するDNS設定を、ドメインレジストラで設定：

```
Type: A
Name: @
Value: 76.76.21.21

Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

#### 4. 確認
- 設定後、数分〜数時間で反映
- Vercelダッシュボードで「Valid Configuration」と表示されればOK

### サブドメイン
```
例: blog.myapp.com

Type: CNAME
Name: blog
Value: cname.vercel-dns.com
```

---

## よく使う機能

### 1. プレビューデプロイ

#### 仕組み
- GitHub PRを作成すると自動でプレビュー環境を生成
- PRごとに専用URLが発行される
- mainブランチにマージ前に確認可能

#### 使い方
1. 新しいブランチで作業
2. GitHubでPRを作成
3. Vercelが自動でデプロイ → PRコメントにURLが表示
4. レビュー後、mainにマージ → 本番環境に自動デプロイ

### 2. ログの確認

1. プロジェクトダッシュボードで「Deployments」タブ
2. 対象デプロイをクリック
3. 「Build Logs」または「Function Logs」でログ確認

### 3. ロールバック（以前のバージョンに戻す）

1. 「Deployments」タブで過去のデプロイを選択
2. 右側の「...」→「Promote to Production」をクリック

---

## トラブルシューティング

### よくあるエラーと解決策

#### 1. ビルドエラー: `Command "npm run build" exited with 1`
- **原因**: ビルド時にエラーが発生
- **解決策**:
  - ローカルで`npm run build`を実行してエラー確認
  - TypeScriptのエラーを修正
  - 環境変数が正しく設定されているか確認

#### 2. 環境変数が読み込まれない
- **原因**: Redeployしていない、または設定ミス
- **解決策**:
  - Vercel設定で環境変数を確認
  - Redeployを実行
  - `NEXT_PUBLIC_`プレフィックスを確認

#### 3. `404: This page could not be found`
- **原因**: ルーティング設定のミス、またはビルド失敗
- **解決策**:
  - `app/page.tsx`または`pages/index.tsx`が存在するか確認
  - Build Logsでエラー確認

#### 4. APIルートが動かない
- **原因**: Serverless Function のタイムアウトまたはエラー
- **解決策**:
  - Function Logsでエラー確認
  - 無料プランは10秒制限あり（Pro以上で延長可能）

#### 5. デプロイが遅い
- **原因**: 大きな依存関係、またはビルド処理が重い
- **解決策**:
  - 不要な依存関係を削除
  - `.vercelignore`で不要ファイルを除外
  - キャッシュを活用

#### 6. カスタムドメインが反映されない
- **原因**: DNS設定の伝播待ち、または設定ミス
- **解決策**:
  - DNS設定を再確認
  - 数時間〜24時間待つ
  - [DNS Checker](https://dnschecker.org/)で確認

---

## ベストプラクティス

### 1. ブランチ戦略
```
main → 本番環境
develop → 開発環境（Preview）
feature/* → 機能ごとのプレビュー
```

### 2. 環境変数管理
- `.env.local`に開発用の環境変数
- `.env.example`でサンプルを提供
- Vercelには本番用の環境変数を設定

### 3. セキュリティ
- APIキーは必ず環境変数に
- `NEXT_PUBLIC_`プレフィックスは慎重に使う
- `.gitignore`に`.env.local`を追加

### 4. パフォーマンス
- 画像は`next/image`で最適化
- 不要な依存関係を削除
- Dynamic Importで遅延ロード

---

## よく使うコマンド（Vercel CLI）

### インストール
```bash
npm install -g vercel
```

### 使い方
```bash
# ログイン
vercel login

# デプロイ（プレビュー）
vercel

# デプロイ（本番）
vercel --prod

# 環境変数を追加
vercel env add

# 環境変数一覧
vercel env ls

# ログ確認
vercel logs
```

---

## 参考リンク
- [Vercel公式ドキュメント](https://vercel.com/docs)
- [Next.js + Vercel デプロイガイド](https://nextjs.org/learn/basics/deploying-nextjs-app)
- [VibeCoder育成プログラム - デプロイ講義](../../研修内容/)
