---
title: "事前準備 - Windows完全版【ハイブリッド実行】"
track: "ライト版・第1回"
author: "TEKION Group / 泉水亮介"
last_updated: "2025年10月23日"
category: "事前準備"
os: "Windows"
execution_method: "ステップ0=手動、ステップ1=Cursor自動"
estimated_time: "15〜20分（手動3分+Cursor自動12分）"
---

# 事前準備 - Windows完全版【ハイブリッド実行】

## 🎯 このドキュメントの全体像

### ✅ 前提条件
- [1-0-1_事前準備_アカウント作成【最優先】](./1-0-1_事前準備_アカウント作成【最優先】.md) を完了済み
- Cursorアプリをインストール済み
- Windows 10または Windows 11

### 📊 実行方法の分担

| ステップ | 誰が実行 | 内容 | 所要時間 |
|---------|---------|------|---------|
| **ステップ0** | **あなた（手動）** | PowerShell実行ポリシー設定 | 約3分 |
| **ステップ1** | **Cursor（自動）** | すべてのツール + Next.jsプロジェクト | 約12分 |

---

## ⚠️ 重要：なぜ2ステップに分かれているのか？

### ステップ0をあなたがやる理由
1. **PowerShell実行ポリシー設定**: **管理者権限**が必要（セキュリティ上、Cursorからは実行不可）
2. **Windows特有のセキュリティ**: この設定をしないと、npm/pnpm/Vercel CLI等が正常に動作しない

### ステップ1をCursorがやる理由
- PowerShell実行ポリシーさえ設定されていれば、残りは全自動で実行可能
- コマンドに慣れていなくても安心

---

# ステップ0: あなたがやること【必須・約3分】

> **初心者の方へ**: PowerShellを初めて触る方でも大丈夫です。以下の手順を**コピー＆ペースト**するだけで完了します。

## 🔴 最重要：PowerShell実行ポリシーとは？

### なぜこの設定が必要なのか？
- WindowsのPowerShellは、セキュリティのため**デフォルトでスクリプトの実行を禁止**しています
- npm、pnpm、Vercel CLI等は、内部で**PowerShellスクリプト（.ps1ファイル）**を使用します
- 実行ポリシーが`Restricted`（制限）のままだと、`UnauthorizedAccess`（権限なし）エラーが発生します

### RemoteSignedとは？
- **RemoteSigned**: ローカルで作成されたスクリプトは実行可能、インターネットからダウンロードされたスクリプトには信頼できる発行元の署名が必要
- **CurrentUserスコープ**: 現在のユーザーアカウントにのみ適用され、システム全体には影響しない
- **開発に最適**: セキュリティを保ちつつ、開発作業に必要な柔軟性を提供

---

## 0-1. PowerShellを管理者権限で開く

### 📋 手順（Windows 11の場合）

#### 方法1: スタートメニューから（おすすめ）

1. **スタートボタン**（Windowsマーク）を**右クリック**
2. 「**Windows PowerShell (管理者)**」または「**ターミナル (管理者)**」を選択
3. 「ユーザーアカウント制御」ダイアログが表示されたら「**はい**」をクリック

#### 方法2: 検索から

1. **Windowsキー**を押す
2. 「**PowerShell**」と入力
3. 右側に表示される「**管理者として実行**」をクリック
4. 「ユーザーアカウント制御」で「**はい**」をクリック

### 📋 手順（Windows 10の場合）

1. **スタートボタン**を**右クリック**
2. 「**Windows PowerShell (管理者)**」を選択
3. 「ユーザーアカウント制御」で「**はい**」をクリック

### PowerShellが開いたら

青い（または黒い）ウィンドウが開き、以下のような表示になります：
```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\WINDOWS\system32>
```

**重要**: タイトルバーに「**管理者**」と表示されていることを確認してください。

---

## 0-2. 実行ポリシーを確認

### 📋 手順

#### 1. 以下のコマンドをコピー
```powershell
Get-ExecutionPolicy -Scope CurrentUser
```

#### 2. PowerShellに貼り付けて Enter
- **貼り付け方**: **Ctrl + V**を押す（または右クリック→貼り付け）
- **Enter**キーを押す

#### 3. 結果を確認

以下のいずれかが表示されます：

| 表示 | 意味 | 次の操作 |
|------|------|---------|
| `RemoteSigned` | ✅ 既に正しく設定されています | **ステップ1へ進む** |
| `Restricted` | ❌ デフォルト状態（スクリプト実行不可） | **次の手順へ** |
| `Undefined` | ❌ 未設定 | **次の手順へ** |
| `AllSigned` | ⚠️ 厳しすぎる設定 | **次の手順へ** |

**`RemoteSigned`と表示された場合**: このステップ0は完了です。ステップ1に進んでください。

**それ以外が表示された場合**: 次の手順で設定を変更します。

---

## 0-3. 実行ポリシーを変更

### 📋 手順

#### 1. 以下のコマンドをコピー
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 2. PowerShellに貼り付けて Enter
- **Ctrl + V**で貼り付け
- **Enter**キーを押す

#### 3. 確認プロンプトが表示される

以下のようなメッセージが表示されます：

```
実行ポリシーの変更
実行ポリシーは、信頼されていないスクリプトからの保護に役立ちます。実行ポリシーを変更すると、
about_Execution_Policies のヘルプ トピック (https://go.microsoft.com/fwlink/?LinkID=135170)
で説明されているセキュリティ上の危険にさらされる可能性があります。
実行ポリシーを変更しますか?
[Y] はい(Y)  [A] すべて続行(A)  [N] いいえ(N)  [L] すべて無視(L)  [S] 中断(S)  [?] ヘルプ (既定値は "N"):
```

#### 4. 「A」を入力

- **「A」**（エー）を入力
- **Enter**キーを押す

**「A」を選ぶ理由**: 「すべて続行」を意味し、今後同様の確認をスキップできます。

#### 5. 完了

何も表示されず、次のプロンプト（`PS C:\...>`）が表示されたら成功です。

---

## 0-4. 設定を確認

### 📋 手順

#### もう一度確認コマンドを実行
```powershell
Get-ExecutionPolicy -Scope CurrentUser
```

#### 結果の確認
```
RemoteSigned
```
と表示されればOK！

---

## 0-5. PowerShellを閉じる

設定が完了したら、管理者PowerShellを閉じてください：
- ウィンドウの **×ボタン**をクリック
- または `exit` と入力して Enter

---

## 🎉 ステップ0完了！

おつかれさまでした！これで手動作業は終わりです。

次は**ステップ1（Cursor自動実行）**に進みます。

---

# ステップ1: Cursorにやらせること【自動・約12分】

## 📖 実行手順

### 1-1. Cursorを起動
1. スタートメニューから**Cursor**を起動
2. GitHubアカウントでログイン

### 1-2. Composerを開く
- **Ctrl + I**を押す

### 1-3. このドキュメントの「Cursor向け実行指示書」をコピー

1. このMarkdownファイルをCursorで開く
2. 下の「📋 Cursor向け実行指示書」セクション全体を選択
3. **Ctrl + C**でコピー

### 1-4. Composerに貼り付けて実行

Composerに以下のプロンプトと一緒に貼り付け：

```
以下のドキュメントを読んで、Windows環境でNext.js開発に必要なツールを
自動インストールしてください。

【重要】PowerShell実行ポリシーは既に設定済みです。
残りのツールをすべて自動でインストールしてください。

[ここに「Cursor向け実行指示書」全体を貼り付け]
```

---

# 📋 Cursor向け実行指示書

> **Cursor Composerへ**: 以下の指示に従って、Windows環境の自動セットアップを実行してください。

## 🎯 実行目標
WindowsでNext.js開発に必要な環境を構築する（PowerShell実行ポリシーは既に設定済み）。

## 📊 インストール対象ツール

| ツール | 説明 | インストール方法 |
|-------|------|----------------|
| **winget** | Windowsパッケージマネージャ | 確認のみ（Windows 11標準） |
| **Node.js LTS** | JavaScriptランタイム | `winget install OpenJS.NodeJS.LTS` |
| **pnpm** | パッケージマネージャ | `winget install pnpm.pnpm` |
| **Git** | バージョン管理 | `winget install Git.Git` |
| **Windows Terminal** | 高機能ターミナル | `winget install Microsoft.WindowsTerminal` |
| **PowerShell 7** | 最新PowerShell（推奨） | `winget install Microsoft.PowerShell` |
| **Vercel CLI** | デプロイツール | `npm install -g vercel` |
| **Supabase CLI** | データベースツール | `npm install -g supabase` |

## 🔍 実行フロー

### フェーズ0: PowerShell実行ポリシー確認（最優先）

```powershell
# 実行ポリシーを確認
$policy = Get-ExecutionPolicy -Scope CurrentUser

Write-Host "=== PowerShell実行ポリシー確認 ===" -ForegroundColor Cyan
Write-Host "現在の設定: $policy" -ForegroundColor Cyan

if ($policy -eq "RemoteSigned" -or $policy -eq "Unrestricted") {
    Write-Host "✅ PowerShell実行ポリシーは正しく設定されています。" -ForegroundColor Green
} else {
    Write-Host "❌ PowerShell実行ポリシーの設定が必要です。" -ForegroundColor Red
    Write-Host ""
    Write-Host "以下のコマンドを**管理者PowerShell**で実行してください：" -ForegroundColor Yellow
    Write-Host "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "設定方法は、ドキュメントの「ステップ0」を参照してください。" -ForegroundColor Yellow
    Write-Host ""

    # ユーザーに確認
    $response = Read-Host "設定を完了しましたか？ (Y/N)"
    if ($response -ne "Y") {
        Write-Host "❌ PowerShell実行ポリシーを設定してから再実行してください。" -ForegroundColor Red
        Write-Host "処理を中断します。" -ForegroundColor Red
        exit
    }
}

Write-Host ""
```

### フェーズ1: 環境確認

```powershell
Write-Host "=== 環境確認 ===" -ForegroundColor Cyan

# 1. Windowsバージョン確認
Write-Host "Windowsバージョン:" -ForegroundColor Yellow
systeminfo | Select-String "OS Name", "OS Version"

# 2. PowerShellバージョン確認
Write-Host ""
Write-Host "PowerShellバージョン:" -ForegroundColor Yellow
$PSVersionTable.PSVersion

# 3. wingetが利用可能か確認
Write-Host ""
Write-Host "wingetバージョン:" -ForegroundColor Yellow
try {
    winget --version
    Write-Host "✅ wingetが利用可能です。" -ForegroundColor Green
} catch {
    Write-Host "❌ wingetが見つかりません。" -ForegroundColor Red
    Write-Host "Microsoft Storeから'App Installer'をインストールしてください。" -ForegroundColor Yellow
    exit
}

# 4. 既存ツールの確認
Write-Host ""
Write-Host "既存ツールの確認:" -ForegroundColor Yellow
$tools = @("node", "npm", "pnpm", "git", "vercel", "supabase")
foreach ($tool in $tools) {
    $exists = Get-Command $tool -ErrorAction SilentlyContinue
    if ($exists) {
        Write-Host "  ✅ $tool がインストール済み" -ForegroundColor Green
    } else {
        Write-Host "  ⚪ $tool は未インストール" -ForegroundColor Gray
    }
}

Write-Host ""
```

### フェーズ2: wingetソースの更新

```powershell
Write-Host "=== wingetソースを更新 ===" -ForegroundColor Cyan
winget source update
Write-Host "✅ wingetソースを更新しました。" -ForegroundColor Green
Write-Host ""
```

### フェーズ3: Node.js LTSのインストール

```powershell
Write-Host "=== Node.js LTSをインストール ===" -ForegroundColor Cyan

# Node.jsが既にインストールされているか確認
$nodeExists = Get-Command node -ErrorAction SilentlyContinue
if ($nodeExists) {
    $nodeVersion = node -v
    Write-Host "Node.jsは既にインストールされています: $nodeVersion" -ForegroundColor Yellow
    $response = Read-Host "再インストールしますか？ (Y/N)"
    if ($response -ne "Y") {
        Write-Host "Node.jsのインストールをスキップします。" -ForegroundColor Yellow
        Write-Host ""
    } else {
        winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
    }
} else {
    winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
}

# PATHの更新を促す
Write-Host ""
Write-Host "⚠️ Node.jsのインストールが完了しました。" -ForegroundColor Yellow
Write-Host "PATHを反映するため、**このPowerShellウィンドウを閉じて、Cursorを再起動**してください。" -ForegroundColor Yellow
Write-Host "その後、Cursorで再度このスクリプトを実行してください。" -ForegroundColor Yellow
Write-Host ""

# ユーザーに確認
$response = Read-Host "Cursorを再起動しましたか？ (Y/N)"
if ($response -ne "Y") {
    Write-Host "Cursorを再起動してから再実行してください。" -ForegroundColor Red
    exit
}

# Node.jsバージョン確認
Write-Host "Node.jsバージョン確認:" -ForegroundColor Cyan
node -v
npm -v
Write-Host ""
```

### フェーズ4: pnpmのインストール

```powershell
Write-Host "=== pnpmをインストール ===" -ForegroundColor Cyan

# pnpmが既にインストールされているか確認
$pnpmExists = Get-Command pnpm -ErrorAction SilentlyContinue
if ($pnpmExists) {
    $pnpmVersion = pnpm -v
    Write-Host "pnpmは既にインストールされています: $pnpmVersion" -ForegroundColor Yellow
} else {
    winget install --id pnpm.pnpm -e --accept-source-agreements --accept-package-agreements

    Write-Host "⚠️ pnpmのインストールが完了しました。" -ForegroundColor Yellow
    Write-Host "Cursorを再起動してください。" -ForegroundColor Yellow

    $response = Read-Host "再起動しましたか？ (Y/N)"
    if ($response -ne "Y") {
        Write-Host "Cursorを再起動してから再実行してください。" -ForegroundColor Red
        exit
    }

    # pnpmバージョン確認
    pnpm -v
}

Write-Host ""
```

### フェーズ5: Gitのインストール

```powershell
Write-Host "=== Gitをインストール ===" -ForegroundColor Cyan

# Gitが既にインストールされているか確認
$gitExists = Get-Command git -ErrorAction SilentlyContinue
if ($gitExists) {
    $gitVersion = git --version
    Write-Host "Gitは既にインストールされています: $gitVersion" -ForegroundColor Yellow
} else {
    winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements

    Write-Host "⚠️ Gitのインストールが完了しました。" -ForegroundColor Yellow
    Write-Host "Cursorを再起動してください。" -ForegroundColor Yellow

    $response = Read-Host "再起動しましたか？ (Y/N)"
    if ($response -ne "Y") {
        Write-Host "Cursorを再起動してから再実行してください。" -ForegroundColor Red
        exit
    }

    # Gitバージョン確認
    git --version
}

# Git初期設定
Write-Host ""
Write-Host "Git初期設定:" -ForegroundColor Yellow
$gitUserName = Read-Host "GitHubユーザー名を入力してください"
$gitUserEmail = Read-Host "GitHubメールアドレスを入力してください"

git config --global user.name "$gitUserName"
git config --global user.email "$gitUserEmail"

Write-Host "✅ Git設定完了" -ForegroundColor Green
Write-Host "  ユーザー名: $(git config --global user.name)" -ForegroundColor Cyan
Write-Host "  メール: $(git config --global user.email)" -ForegroundColor Cyan
Write-Host ""
```

### フェーズ6: Windows Terminal（任意）

```powershell
Write-Host "=== Windows Terminalをインストール（任意） ===" -ForegroundColor Cyan

$terminalExists = Get-Command wt -ErrorAction SilentlyContinue
if ($terminalExists) {
    Write-Host "Windows Terminalは既にインストールされています。" -ForegroundColor Yellow
} else {
    $response = Read-Host "Windows Terminalをインストールしますか？ (Y/N)"
    if ($response -eq "Y") {
        winget install --id Microsoft.WindowsTerminal -e --accept-source-agreements --accept-package-agreements
        Write-Host "✅ Windows Terminalをインストールしました。" -ForegroundColor Green
    } else {
        Write-Host "Windows Terminalのインストールをスキップします。" -ForegroundColor Yellow
    }
}

Write-Host ""
```

### フェーズ7: PowerShell 7（任意）

```powershell
Write-Host "=== PowerShell 7をインストール（任意・推奨） ===" -ForegroundColor Cyan

$ps7Exists = Get-Command pwsh -ErrorAction SilentlyContinue
if ($ps7Exists) {
    Write-Host "PowerShell 7は既にインストールされています。" -ForegroundColor Yellow
} else {
    $response = Read-Host "PowerShell 7をインストールしますか？ (Y/N)"
    if ($response -eq "Y") {
        winget install --id Microsoft.PowerShell -e --accept-source-agreements --accept-package-agreements
        Write-Host "✅ PowerShell 7をインストールしました。" -ForegroundColor Green
        Write-Host "Cursorの設定で、デフォルトシェルをPowerShell 7に変更することを推奨します。" -ForegroundColor Yellow
    } else {
        Write-Host "PowerShell 7のインストールをスキップします。" -ForegroundColor Yellow
    }
}

Write-Host ""
```

### フェーズ8: Vercel CLI

```powershell
Write-Host "=== Vercel CLIをインストール ===" -ForegroundColor Cyan

$vercelExists = Get-Command vercel -ErrorAction SilentlyContinue
if ($vercelExists) {
    Write-Host "Vercel CLIは既にインストールされています。" -ForegroundColor Yellow
} else {
    npm install -g vercel
    Write-Host "✅ Vercel CLIをインストールしました。" -ForegroundColor Green
}

# バージョン確認
vercel --version
Write-Host ""
```

### フェーズ9: Supabase CLI

```powershell
Write-Host "=== Supabase CLIをインストール ===" -ForegroundColor Cyan

$supabaseExists = Get-Command supabase -ErrorAction SilentlyContinue
if ($supabaseExists) {
    Write-Host "Supabase CLIは既にインストールされています。" -ForegroundColor Yellow
} else {
    npm install -g supabase
    Write-Host "✅ Supabase CLIをインストールしました。" -ForegroundColor Green
}

# バージョン確認
supabase --version
Write-Host ""
```

### フェーズ10: 最終確認と結果表示

```powershell
Write-Host "=================================================" -ForegroundColor Green
Write-Host "=== 環境構築完了 ===" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host ""

Write-Host "【Windows情報】" -ForegroundColor Yellow
systeminfo | Select-String "OS Name", "OS Version"
Write-Host ""

Write-Host "【PowerShell】" -ForegroundColor Yellow
Write-Host "バージョン: $($PSVersionTable.PSVersion)" -ForegroundColor Cyan
Write-Host ""

Write-Host "【インストール済みツール】" -ForegroundColor Yellow

$tools = @{
    "Node.js" = "node -v"
    "npm" = "npm -v"
    "pnpm" = "pnpm -v"
    "Git" = "git --version"
    "Vercel CLI" = "vercel --version"
    "Supabase CLI" = "supabase --version"
}

foreach ($tool in $tools.GetEnumerator()) {
    $command = $tool.Value
    try {
        $version = Invoke-Expression $command 2>$null
        Write-Host "  ✅ $($tool.Key): $version" -ForegroundColor Green
    } catch {
        Write-Host "  ❌ $($tool.Key): 未インストール" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "【Git設定】" -ForegroundColor Yellow
Write-Host "  ユーザー名: $(git config --global user.name)" -ForegroundColor Cyan
Write-Host "  メール: $(git config --global user.email)" -ForegroundColor Cyan
Write-Host ""

Write-Host "✅ すべてのツールが正常にインストールされました！" -ForegroundColor Green
Write-Host ""
```

### フェーズ11: Next.jsプロジェクト作成

環境構築が完了したら、サンプルプロジェクトを作成してください。

```powershell
Write-Host "=== Next.jsプロジェクトを作成 ===" -ForegroundColor Cyan

# ホームディレクトリに移動
Set-Location $env:USERPROFILE

# projectsフォルダを作成
if (-not (Test-Path "projects")) {
    New-Item -ItemType Directory -Path "projects"
    Write-Host "✅ projectsフォルダを作成しました。" -ForegroundColor Green
}

Set-Location "projects"

# Next.jsプロジェクトを作成
Write-Host ""
Write-Host "Next.jsプロジェクトを作成します..." -ForegroundColor Yellow
Write-Host "対話形式の質問には以下のように回答してください：" -ForegroundColor Yellow
Write-Host "  ✔ Would you like to use TypeScript? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like to use ESLint? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like to use Tailwind CSS? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like your code inside a src/ directory? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like to use App Router? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like to use Turbopack for next dev? → Yes" -ForegroundColor Cyan
Write-Host "  ✔ Would you like to customize the import alias? → No" -ForegroundColor Cyan
Write-Host ""

pnpm create next-app@latest my-first-app

# プロジェクトに移動
Set-Location "my-first-app"

Write-Host ""
Write-Host "✅ Next.jsプロジェクトを作成しました。" -ForegroundColor Green
Write-Host "場所: $((Get-Location).Path)" -ForegroundColor Cyan
Write-Host ""

# 開発サーバーを起動
Write-Host "開発サーバーを起動しますか？ (Y/N)" -ForegroundColor Yellow
$response = Read-Host
if ($response -eq "Y") {
    Write-Host "開発サーバーを起動しています..." -ForegroundColor Cyan
    Write-Host "ブラウザで http://localhost:3000 を開いてください。" -ForegroundColor Yellow
    Write-Host "停止する場合は Ctrl + C を押してください。" -ForegroundColor Yellow
    Write-Host ""
    pnpm dev
} else {
    Write-Host "開発サーバーは起動しませんでした。" -ForegroundColor Yellow
    Write-Host "後で起動する場合は、プロジェクトフォルダで `pnpm dev` を実行してください。" -ForegroundColor Cyan
}
```

### フェーズ12: 完了メッセージ

```powershell
Write-Host ""
Write-Host "=================================================" -ForegroundColor Green
Write-Host "【次のステップ】" -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host ""
Write-Host "1. ブラウザで http://localhost:3000 を開いてNext.jsアプリを確認" -ForegroundColor Cyan
Write-Host "2. Cursorでプロジェクトを開く:" -ForegroundColor Cyan
Write-Host "   Set-Location $env:USERPROFILE\projects\my-first-app" -ForegroundColor Yellow
Write-Host "   cursor ." -ForegroundColor Yellow
Write-Host "3. src\app\page.tsx を編集してみる" -ForegroundColor Cyan
Write-Host ""
```

## ⚠️ エラーハンドリング

### エラー1: `UnauthorizedAccess`エラー
```powershell
# PowerShell実行ポリシーが設定されていない
# ステップ0を実行してください

Write-Host "❌ PowerShell実行ポリシーが設定されていません。" -ForegroundColor Red
Write-Host "ドキュメントの「ステップ0」を実行してください。" -ForegroundColor Yellow
```

### エラー2: `winget: command not found`
```powershell
# wingetが利用できない
# Microsoft Storeから「App Installer」をインストール

Write-Host "❌ wingetが見つかりません。" -ForegroundColor Red
Write-Host "Microsoft Storeから'App Installer'をインストールしてください。" -ForegroundColor Yellow
Write-Host "https://www.microsoft.com/store/productId/9NBLGGH4NNS1" -ForegroundColor Cyan
```

### エラー3: `node: command not found`（インストール後）
```powershell
# PATHが反映されていない
# PowerShellを再起動

Write-Host "❌ Node.jsがインストールされていますが、コマンドが見つかりません。" -ForegroundColor Red
Write-Host "以下を試してください：" -ForegroundColor Yellow
Write-Host "1. PowerShellを完全に閉じる" -ForegroundColor Cyan
Write-Host "2. Cursorを再起動" -ForegroundColor Cyan
Write-Host "3. もう一度このスクリプトを実行" -ForegroundColor Cyan
```

### エラー4: npm install -g でエラー
```powershell
# npmのキャッシュをクリア
npm cache clean --force

# 再度インストール
npm install -g vercel
```

## 📝 ユーザーへの報告形式

実行完了後、フェーズ10とフェーズ12で表示される形式で結果を報告してください。

---

## 📚 参考情報（Cursor用）

### wingetについて
- **公式サイト**: https://learn.microsoft.com/ja-jp/windows/package-manager/winget/
- **Windows 11**: 標準搭載
- **Windows 10**: Microsoft Storeから「App Installer」をインストール

### PowerShell実行ポリシーについて
- **公式ドキュメント**: https://learn.microsoft.com/ja-jp/powershell/module/microsoft.powershell.core/about/about_execution_policies
- **RemoteSigned**: 推奨設定
- **CurrentUserスコープ**: ユーザー単位で設定

### Node.jsについて
- **公式サイト**: https://nodejs.org
- **LTS**: Long Term Support（長期サポート版）

### pnpmについて
- **公式サイト**: https://pnpm.io
- **利点**: npmより高速、ディスク容量節約

### Gitについて
- **公式サイト**: https://git-scm.com
- **初期設定**: user.nameとuser.emailは必須

### Vercel CLIについて
- **公式ドキュメント**: https://vercel.com/docs/cli
- **用途**: Next.jsアプリのデプロイ

### Supabase CLIについて
- **公式ドキュメント**: https://supabase.com/docs/guides/cli
- **用途**: ローカル開発、マイグレーション管理

---

## 🎯 実行目標の確認

Cursor Composerは以下を達成してください：

- [ ] PowerShell実行ポリシーの確認
- [ ] Windows環境の確認
- [ ] wingetソースの更新
- [ ] Node.js LTSをインストール
- [ ] pnpmをインストール
- [ ] Gitをインストールし、初期設定（ユーザー情報入力）
- [ ] Windows Terminal（任意）
- [ ] PowerShell 7（任意・推奨）
- [ ] Vercel CLIをインストール
- [ ] Supabase CLIをインストール
- [ ] すべてのバージョンを確認
- [ ] Next.jsプロジェクトを作成
- [ ] 開発サーバーを起動（ユーザー選択）
- [ ] 結果をユーザーに報告

---

## ❓ よくある質問（Cursor用）

### Q: ユーザーにGit設定情報を聞く方法は？
**A**: `Read-Host` でプロンプトを表示し、入力を受け取ってください。例：
```powershell
$gitUserName = Read-Host "GitHubユーザー名を入力してください"
```

### Q: インストール中にエラーが発生した場合は？
**A**: エラーメッセージを読み取り、「エラーハンドリング」セクションを参照して自動修正してください。解決できない場合は、エラー内容をユーザーに報告してください。

### Q: 既に一部のツールがインストールされている場合は？
**A**: スキップして次に進んでください。ユーザーに「既にインストール済み」と報告してください。

### Q: wingetが見つからない場合は？
**A**: Microsoft Storeから「App Installer」をインストールするようユーザーに指示してください。

### Q: ユーザーが途中で中断したら？
**A**: 実行状況を報告し、どこまで完了したか、どこから再開すればよいかを提示してください。

### Q: Next.jsプロジェクト作成時の対話形式の質問にどう答える？
**A**: フェーズ11に記載された推奨設定に従ってください。すべて「Yes」または「デフォルト」で問題ありません。

### Q: PATH更新のためにCursorを再起動する必要がある場合は？
**A**: ユーザーに明確に伝え、再起動を促してください。再起動後、スクリプトを再実行するように指示してください。

---

## 🤖 Cursor Composerへの最終メッセージ

このドキュメントは、**あなた（Cursor Composer）が自律的に実行するための完全な指示書**です。

### 重要な前提
- **ユーザーはPowerShell実行ポリシーを既に設定済み**です
- あなたはそれ以降のツールをすべて自動でインストールします

### 実行時の注意事項
1. **ユーザーは開発の初心者です**。専門用語を避け、わかりやすく説明してください
2. **コマンド実行前に必ず何をするか説明**してください
3. **Windows特有の問題**（PATH更新、Cursor再起動）に注意してください
4. **エラーが発生したら、自動的に解決策を試す**か、ユーザーに明確な指示を出してください
5. **Git設定ではユーザーに情報を聞く**必要があります（GitHubユーザー名とメールアドレス）
6. **PowerShellの文字が流れる様子**を見せることで、作業の進捗を伝えてください
7. **すべての作業が完了したら、わかりやすい形式で結果を報告**してください
8. **ユーザーが不安にならないよう、常にポジティブなトーンで対応**してください

### Windows特有の重要ポイント
- **PATH更新のためにCursor再起動が必要**な場合があります（Node.js, pnpm, Git後）
- ユーザーに明確に伝え、再起動を促してください
- PowerShellコマンドは**PowerShell形式**で実行してください（bashではありません）

**あなたなら完璧に実行できます。頑張ってください！** 🚀

---

**最終更新日**: 2025年10月23日
**作成者**: TEKION Group / 泉水亮介
**ドキュメントバージョン**: 4.0（ハイブリッド実行版）
