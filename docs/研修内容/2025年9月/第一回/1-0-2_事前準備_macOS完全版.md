---
title: "事前準備 - macOS完全版【ハイブリッド実行】"
track: "ライト版・第1回"
author: "TEKION Group / 泉水亮介"
last_updated: "2025年10月23日"
category: "事前準備"
os: "macOS"
execution_method: "ステップ0=手動、ステップ1=Cursor自動"
estimated_time: "15〜20分（手動5分+Cursor自動10分）"
---

# 事前準備 - macOS完全版【ハイブリッド実行】

## 🎯 このドキュメントの全体像

### ✅ 前提条件
- [1-0-1_事前準備_アカウント作成【最優先】](./1-0-1_事前準備_アカウント作成【最優先】.md) を完了済み
- Cursorアプリをインストール済み

### 📊 実行方法の分担

| ステップ | 誰が実行 | 内容 | 所要時間 |
|---------|---------|------|---------|
| **ステップ0** | **あなた（手動）** | Xcode Command Line Tools + Homebrew | 約5分 |
| **ステップ1** | **Cursor（自動）** | 残りすべてのツール + Next.jsプロジェクト | 約10分 |

---

## ⚠️ 重要：なぜ2ステップに分かれているのか？

### ステップ0をあなたがやる理由
1. **Xcode Command Line Tools**: ポップアップが表示され、ボタンをクリックする必要がある
2. **Homebrew**: macOSのパスワード入力が必要（セキュリティ上、Cursorからは実行不可）

### ステップ1をCursorがやる理由
- Homebrewさえインストールされていれば、残りは全自動で実行可能
- ターミナルコマンドに慣れていなくても安心

---

# ステップ0: あなたがやること【必須・約5分】

> **初心者の方へ**: ターミナルを初めて触る方でも大丈夫です。以下の手順を**コピー＆ペースト**するだけで完了します。

## 0-1. ターミナルを開く

### 方法1: Spotlightで開く（おすすめ）
1. **Cmd + Space**（スペースキー）を押す
2. 「ターミナル」と入力
3. **Enter**キーを押す

### 方法2: Finderから開く
1. **Finder**を開く
2. **アプリケーション** → **ユーティリティ** → **ターミナル.app**をダブルクリック

### ターミナルが開いたら
黒い（または白い）ウィンドウが開きます。これが**ターミナル**です。

---

## 0-2. Xcode Command Line Toolsをインストール

### 📋 手順

#### 1. 以下のコマンドをコピー
```bash
xcode-select --install
```

#### 2. ターミナルに貼り付けて Enter
- **貼り付け方**: **Cmd + V**を押す
- **Enter**キーを押す

#### 3. ポップアップが表示されます

![Xcode Command Line Toolsインストールダイアログ]

ポップアップに以下のボタンが表示されます：
- **インストール** ← これをクリック
- キャンセル
- Xcodeを入手...

#### 4. 「インストール」ボタンをクリック

#### 5. 利用規約が表示されます
- **同意する**をクリック

#### 6. インストール開始
- 約5〜10分かかります（ネットワーク速度による）
- 進行状況バーが表示されます
- **インストールが完了するまで待ちます**

#### 7. 「ソフトウェアがインストールされました」と表示されたら完了
- **完了**ボタンをクリック

### ✅ 確認方法
ターミナルで以下を実行：
```bash
xcode-select -p
```

以下のように表示されればOK：
```
/Library/Developer/CommandLineTools
```

---

## 0-3. Homebrewをインストール

### 📋 手順

#### 1. 以下のコマンドをコピー
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 2. ターミナルに貼り付けて Enter
- **Cmd + V**で貼り付け
- **Enter**キーを押す

#### 3. 何が起こるか（途中で操作が必要）

##### 3-1. 「Press RETURN to continue」と表示される
- **Enter**キーを押す

##### 3-2. パスワード入力を求められる
```
Password:
```
- **macOSのログインパスワード**を入力
- **重要**: パスワードを入力しても画面には何も表示されません（セキュリティ対策）
- 正しく入力して**Enter**キーを押す

##### 3-3. インストールが開始される
- 約3〜5分かかります
- いろいろな文字が流れますが、気にしなくてOK

##### 3-4. インストール完了
「Installation successful!」と表示されたら成功です。

#### 4. 【重要】Apple Siliconの場合のみ：PATHを設定

##### 4-1. 自分のMacがApple Siliconか確認
ターミナルで実行：
```bash
uname -m
```

**結果の見方**:
- `arm64` と表示 → **Apple Silicon（M1/M2/M3/M4）** → 次の手順を実行
- `x86_64` と表示 → **Intel Mac** → スキップしてステップ1へ

##### 4-2. Apple Siliconの場合、以下を実行

**コマンド1**: 以下をコピーして貼り付け、Enter
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
```

**コマンド2**: 以下をコピーして貼り付け、Enter
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
```

**コマンド3**: 以下をコピーして貼り付け、Enter
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### ✅ 確認方法
ターミナルで以下を実行：
```bash
brew --version
```

以下のように**バージョン番号が表示**されればOK：
```
Homebrew 4.x.x
```

もし「command not found: brew」と表示される場合：
1. ターミナルを完全に閉じる
2. ターミナルを開き直す
3. もう一度 `brew --version` を実行

---

## 🎉 ステップ0完了！

おつかれさまでした！これで手動作業は終わりです。

次は**ステップ1（Cursor自動実行）**に進みます。

---

# ステップ1: Cursorにやらせること【自動・約10分】

## 📖 実行手順

### 1-1. Cursorを起動
1. **Applications**フォルダから**Cursor**を起動
2. GitHubアカウントでログイン

### 1-2. Composerを開く
- **Cmd + I**を押す

### 1-3. このドキュメントの「Cursor向け実行指示書」をコピー

1. このMarkdownファイルをCursorで開く
2. 下の「📋 Cursor向け実行指示書」セクション全体を選択
3. **Cmd + C**でコピー

### 1-4. Composerに貼り付けて実行

Composerに以下のプロンプトと一緒に貼り付け：

```
以下のドキュメントを読んで、macOS環境でNext.js開発に必要なツールを
自動インストールしてください。

【重要】Xcode Command Line ToolsとHomebrewは既にインストール済みです。
残りのツールをすべて自動でインストールしてください。

[ここに「Cursor向け実行指示書」全体を貼り付け]
```

---

# 📋 Cursor向け実行指示書

> **Cursor Composerへ**: 以下の指示に従って、macOS環境の自動セットアップを実行してください。

## 🎯 実行目標
macOSでNext.js開発に必要な環境を構築する（Xcode Command Line ToolsとHomebrewは既にインストール済み）。

## 📊 インストール対象ツール

| ツール | 説明 | インストール方法 |
|-------|------|----------------|
| **Node.js LTS** | JavaScriptランタイム | `brew install node@lts` |
| **pnpm** | パッケージマネージャ | `brew install pnpm` |
| **Git** | バージョン管理 | `brew install git` |
| **Vercel CLI** | デプロイツール | `npm install -g vercel` |
| **Supabase CLI** | データベースツール | `brew install supabase/tap/supabase` |

## 🔍 実行フロー

### フェーズ1: 環境確認
```bash
# 1. macOSバージョン確認
sw_vers

# 2. CPUアーキテクチャ確認
uname -m
# 出力: arm64（Apple Silicon）または x86_64（Intel）

# 3. 既存ツールの確認
which brew    # Homebrewがインストール済みか確認
which node    # Node.jsの状態確認
which pnpm    # pnpmの状態確認
which git     # Gitの状態確認
which vercel  # Vercel CLIの状態確認
which supabase # Supabase CLIの状態確認

# 4. Homebrewの動作確認
brew --version
brew doctor
```

### フェーズ2: Node.js LTS
```bash
# Node.js LTSをインストール
brew install node@lts

# リンクを設定
brew link node@lts --force --overwrite

# 確認
node -v  # v20以上が表示されればOK
npm -v   # バージョンが表示されればOK
```

### フェーズ3: pnpm
```bash
# pnpmをインストール
brew install pnpm

# 確認
pnpm -v  # バージョンが表示されればOK
```

### フェーズ4: Git
```bash
# Gitをインストール
brew install git

# 確認
git --version  # バージョンが表示されればOK

# Git初期設定（ユーザーに情報を聞く）
echo "GitHubユーザー名を入力してください:"
read git_user_name
echo "GitHubメールアドレスを入力してください:"
read git_user_email

git config --global user.name "$git_user_name"
git config --global user.email "$git_user_email"

# 設定確認
git config --global user.name
git config --global user.email
```

### フェーズ5: Vercel CLI
```bash
# Vercel CLIをインストール
npm install -g vercel

# 確認
vercel --version  # バージョンが表示されればOK
```

### フェーズ6: Supabase CLI
```bash
# Supabase CLIをインストール
brew install supabase/tap/supabase

# 確認
supabase --version  # バージョンが表示されればOK
```

### フェーズ7: 最終確認と結果表示
```bash
# すべてのツールのバージョンを表示
echo "=== 環境構築完了 ==="
echo ""
echo "【macOS情報】"
sw_vers
echo ""
echo "CPU: $(uname -m)"
echo ""
echo "【インストール済みツール】"
echo "Homebrew: $(brew --version | head -n 1)"
echo "Node.js: $(node -v)"
echo "npm: $(npm -v)"
echo "pnpm: $(pnpm -v)"
echo "Git: $(git --version)"
echo "Vercel CLI: $(vercel --version)"
echo "Supabase CLI: $(supabase --version)"
echo ""
echo "✅ すべてのツールが正常にインストールされました！"
```

### フェーズ8: Next.jsプロジェクト作成

環境構築が完了したら、サンプルプロジェクトを作成してください。

```bash
# ホームディレクトリに移動
cd ~

# projectsフォルダを作成
mkdir -p projects
cd projects

# Next.jsプロジェクトを作成
pnpm create next-app@latest my-first-app

# 対話形式の質問に以下のように回答:
# ✔ Would you like to use TypeScript? → Yes
# ✔ Would you like to use ESLint? → Yes
# ✔ Would you like to use Tailwind CSS? → Yes
# ✔ Would you like your code inside a `src/` directory? → Yes
# ✔ Would you like to use App Router? → Yes
# ✔ Would you like to use Turbopack for `next dev`? → Yes
# ✔ Would you like to customize the import alias? → No

# プロジェクトに移動
cd my-first-app

# 開発サーバーを起動
pnpm dev

# ブラウザで http://localhost:3000 を開くようユーザーに指示
```

## ⚠️ エラーハンドリング

### エラー1: `command not found: brew`（Apple Silicon）
```bash
# PATHが設定されていない可能性
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zprofile
```

その後、ユーザーに以下を伝える：
「ターミナルを再起動してください。その後、もう一度Cursorで実行してください。」

### エラー2: `node: command not found`
```bash
# Node.jsのリンクが切れている
brew unlink node@lts
brew link node@lts --force --overwrite
```

### エラー3: `brew doctor` で警告が出る
```bash
# クリーンアップを実行
brew cleanup

# 警告内容を確認して、必要に応じて対処
# 多くの警告は無視して問題ない
```

### エラー4: Gitのインストールに失敗
```bash
# Homebrewのアップデート
brew update

# 再度インストール
brew install git
```

### エラー5: npm install -g でエラー
```bash
# npmのキャッシュをクリア
npm cache clean --force

# 再度インストール
npm install -g vercel
```

## 📝 ユーザーへの報告形式

実行完了後、以下の形式で結果を表示してください：

```
✅ macOS環境構築が完了しました！

【インストール済みツール】
| ツール | バージョン | ステータス |
|-------|----------|----------|
| macOS | 14.5 | ✅ |
| CPU | arm64 | ✅ |
| Homebrew | 4.x.x | ✅ |
| Node.js | v22.x.x | ✅ |
| npm | 10.x.x | ✅ |
| pnpm | 10.x.x | ✅ |
| Git | 2.x.x | ✅ |
| Vercel CLI | 47.x.x | ✅ |
| Supabase CLI | 2.x.x | ✅ |

【Next.jsプロジェクト】
プロジェクト名: my-first-app
場所: ~/projects/my-first-app

【次のステップ】
1. ブラウザで http://localhost:3000 を開いてNext.jsアプリを確認
2. Cursorでプロジェクトを開く: `cursor ~/projects/my-first-app`
3. src/app/page.tsx を編集してみる

【Git設定の確認】
ユーザー名: [設定したユーザー名]
メールアドレス: [設定したメールアドレス]
```

## 🔄 トラブル時の自己診断

問題が発生した場合、以下を実行して原因を特定してください：

```bash
# 1. 環境情報を収集
echo "=== システム情報 ==="
sw_vers
uname -m
echo ""

echo "=== PATH確認 ==="
echo $PATH
echo ""

echo "=== Homebrew診断 ==="
which brew
brew --version
brew doctor
echo ""

echo "=== Node.js診断 ==="
which node
which npm
node -v
npm -v
echo ""

# 2. エラーログを確認
# 3. 上記の「エラーハンドリング」セクションを参照
# 4. それでも解決しない場合は、エラーメッセージをユーザーに報告
```

---

## 📚 参考情報（Cursor用）

### Homebrewについて
- **公式サイト**: https://brew.sh
- **Apple Silicon対応**: `/opt/homebrew` にインストール
- **Intel Mac対応**: `/usr/local` にインストール

### Node.jsについて
- **公式サイト**: https://nodejs.org
- **LTSとは**: Long Term Support（長期サポート版）
- **推奨**: 常に最新のLTSバージョンを使用

### pnpmについて
- **公式サイト**: https://pnpm.io
- **利点**: npmより高速、ディスク容量節約
- **互換性**: npmと完全互換

### Gitについて
- **公式サイト**: https://git-scm.com
- **初期設定**: user.nameとuser.emailは必須
- **GitHubとの連携**: SSH鍵設定は別途必要（講義で説明）

### Vercel CLIについて
- **公式ドキュメント**: https://vercel.com/docs/cli
- **用途**: Next.jsアプリのデプロイ
- **認証**: 初回デプロイ時に `vercel login` が必要

### Supabase CLIについて
- **公式ドキュメント**: https://supabase.com/docs/guides/cli
- **用途**: ローカル開発、マイグレーション管理
- **認証**: プロジェクト作成時に認証が必要

---

## 🎯 実行目標の確認

Cursor Composerは以下を達成してください：

- [ ] macOS環境を確認
- [ ] Homebrewの動作確認
- [ ] Node.js LTSをインストール
- [ ] pnpmをインストール
- [ ] Gitをインストールし、初期設定（ユーザー情報入力）
- [ ] Vercel CLIをインストール
- [ ] Supabase CLIをインストール
- [ ] すべてのバージョンを確認
- [ ] Next.jsプロジェクトを作成
- [ ] 開発サーバーを起動
- [ ] 結果をユーザーに報告

---

## ❓ よくある質問（Cursor用）

### Q: ユーザーにGit設定情報を聞く方法は？
**A**: `echo` でプロンプトを表示し、`read` コマンドで入力を受け取ってください。例：
```bash
echo "GitHubユーザー名を入力してください:"
read git_user_name
```

### Q: インストール中にエラーが発生した場合は？
**A**: エラーメッセージを読み取り、「エラーハンドリング」セクションを参照して自動修正してください。解決できない場合は、エラー内容をユーザーに報告してください。

### Q: 既に一部のツールがインストールされている場合は？
**A**: スキップして次に進んでください。ただし、バージョンが古すぎる場合（例: Node.js v16以下）は、`brew upgrade node@lts` で更新を推奨してください。

### Q: Apple SiliconとIntelの判別方法は？
**A**: `uname -m` の出力で判断します。`arm64`ならApple Silicon、`x86_64`ならIntelです。

### Q: ユーザーが途中で中断したら？
**A**: 実行状況を報告し、どこまで完了したか、どこから再開すればよいかを提示してください。

### Q: Next.jsプロジェクト作成時の対話形式の質問にどう答える？
**A**: 上記の「フェーズ8」に記載された推奨設定に従ってください。すべて「Yes」または「デフォルト」で問題ありません。

---

## 🤖 Cursor Composerへの最終メッセージ

このドキュメントは、**あなた（Cursor Composer）が自律的に実行するための完全な指示書**です。

### 重要な前提
- **ユーザーはXcode Command Line ToolsとHomebrewを既にインストール済み**です
- あなたはそれ以降のツールをすべて自動でインストールします

### 実行時の注意事項
1. **ユーザーは開発の初心者です**。専門用語を避け、わかりやすく説明してください
2. **コマンド実行前に必ず何をするか説明**してください
3. **エラーが発生したら、自動的に解決策を試す**か、ユーザーに明確な指示を出してください
4. **Git設定ではユーザーに情報を聞く**必要があります（GitHubユーザー名とメールアドレス）
5. **すべての作業が完了したら、わかりやすい形式で結果を報告**してください
6. **ユーザーが不安にならないよう、常にポジティブなトーンで対応**してください

**あなたなら完璧に実行できます。頑張ってください！** 🚀

---

**最終更新日**: 2025年10月23日
**作成者**: TEKION Group / 泉水亮介
**ドキュメントバージョン**: 4.0（ハイブリッド実行版）
