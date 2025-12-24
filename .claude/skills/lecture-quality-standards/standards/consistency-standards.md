# 一貫性基準詳細

VibeCoder育成プログラム講義資料の一貫性に関する詳細な品質基準

---

## 用語統一リスト

### 必須統一用語

| 用語 | 正しい表記 | 誤った表記 |
|------|----------|----------|
| **Vibe Coder** | Vibe Coder（大文字V、大文字C、スペースあり） | vibe coder, VibeCoder, VIBE CODER |
| **AI駆動開発** | AI駆動開発（漢字） | AI driven development, AI-driven開発 |
| **IDE型AI** | IDE型AI（IDEは大文字、型はカタカナ） | IDE型ai, ide型AI, IDEがたAI |
| **チャット型AI** | チャット型AI（カタカナ） | chat型AI, Chat型AI |
| **コンテクストコントロール** | コンテクストコントロール（カタカナ） | Context Control, context control |
| **プロトタイプ** | プロトタイプ（カタカナ） | Prototype, prototype |
| **エンジニア** | エンジニア（カタカナ） | Engineer, engineer |
| **デプロイ** | デプロイ（カタカナ） | Deploy, deploy |

### ツール名（英語）

| ツール | 正しい表記 | 誤った表記 |
|--------|----------|----------|
| **Cursor** | Cursor（大文字C） | cursor, CURSOR |
| **Claude** | Claude（大文字C） | claude, CLAUDE |
| **ChatGPT** | ChatGPT（大文字C、大文字GPT） | chatgpt, ChatGpt, Chat GPT |
| **GitHub Copilot** | GitHub Copilot（大文字G、大文字H、大文字C） | github copilot, Github Copilot |
| **v0** | v0（小文字v、数字0） | V0, v-0 |
| **Bolt.new** | Bolt.new（大文字B、ドット、小文字new） | bolt.new, Bolt.New |
| **Supabase** | Supabase（大文字S） | supabase, SUPABASE |
| **Clerk** | Clerk（大文字C） | clerk, CLERK |
| **Vercel** | Vercel（大文字V） | vercel, VERCEL |

### フレームワーク・技術（英語）

| 技術 | 正しい表記 | 誤った表記 |
|------|----------|----------|
| **Next.js** | Next.js（大文字N、ドット、小文字js） | Nextjs, nextjs, Next.JS |
| **React** | React（大文字R） | react, REACT |
| **TypeScript** | TypeScript（大文字T、大文字S） | Typescript, typescript |
| **JavaScript** | JavaScript（大文字J、大文字S） | Javascript, javascript, JS |
| **HTML** | HTML（全て大文字） | html, Html |
| **CSS** | CSS（全て大文字） | css, Css |
| **Tailwind CSS** | Tailwind CSS（大文字T、大文字CSS） | tailwind css, TailwindCSS |

### 一般用語（カタカナ）

| 用語 | 正しい表記 | 誤った表記 |
|------|----------|----------|
| **プログラミング** | プログラミング（カタカナ） | Programming, programming |
| **アプリケーション** | アプリケーション（カタカナ） | Application, application |
| **データベース** | データベース（カタカナ） | Database, database, DB |
| **フロントエンド** | フロントエンド（カタカナ） | Front-end, frontend |
| **バックエンド** | バックエンド（カタカナ） | Back-end, backend |
| **ワークフロー** | ワークフロー（カタカナ） | Workflow, workflow |

---

## フォーマット規則

### セクションタイトル

#### レベル2（##）

**ルール**:
- 絵文字 + スペース + タイトル
- タイトルは**太字なし**
- 語尾に「。」なし

**正しい例**:
```markdown
## 🎯 この章で学ぶこと
## 📌 この章の位置づけ
## 💡 この章のまとめ
## 🚀 次の章への橋渡し
```

**誤った例**:
```markdown
## 🎯**この章で学ぶこと**  ← 太字不要
## 🎯この章で学ぶこと。    ← 語尾に「。」不要
## 🎯  この章で学ぶこと    ← スペース2個は不要
```

#### レベル3（###）

**ルール**:
- タイトルのみ
- 絵文字なし
- **太字なし**
- 語尾に「。」なし

**正しい例**:
```markdown
### Cursorとは
### Composerモードの使い方
### Supabaseのセットアップ
```

**誤った例**:
```markdown
### **Cursorとは**        ← 太字不要
### 🎯 Cursorとは         ← 絵文字不要
### Cursorとは。          ← 語尾に「。」不要
```

### リストマーカー

#### 番号付きリスト

**ルール**:
- `1. 2. 3. ...`（自動採番）
- インデント: 3スペース（ネスト時）

**正しい例**:
```markdown
1. ステップ1
2. ステップ2
3. ステップ3
   1. サブステップ1
   2. サブステップ2
```

**誤った例**:
```markdown
① ステップ1              ← 丸数字不可
1) ステップ1             ← 括弧不可
(1) ステップ1            ← 括弧不可
```

#### 箇条書きリスト

**ルール**:
- `-`（ハイフン）のみ使用
- `*`や`+`は使用しない
- インデント: 2スペース（ネスト時）

**正しい例**:
```markdown
- 項目1
- 項目2
- 項目3
  - サブ項目1
  - サブ項目2
```

**誤った例**:
```markdown
* 項目1                  ← アスタリスク不可
+ 項目1                  ← プラス不可
・項目1                  ← 中黒不可
```

#### チェックリスト

**ルール**:
- `- [ ]`（未チェック）
- `- [x]`（チェック済み）
- `- ✅`（完了マーク）

**正しい例**:
```markdown
- [ ] タスク1
- [x] タスク2（完了）
- ✅ タスク3（推奨アクション）
```

### コードブロック

#### 言語指定

**ルール**:
- 必ず言語を指定
- 小文字で統一

**正しい例**:
````markdown
```typescript
const greeting: string = "Hello";
```

```markdown
# Markdownコード例
```

```bash
npm install
```
````

**誤った例**:
````markdown
```
コード（言語指定なし）← 不可
```

```TypeScript          ← 大文字不可
```

```ts                 ← 略語は避ける（typescriptが推奨）
```
````

#### インデント

**ルール**:
- 4スペースで統一
- タブは使用しない

**正しい例**:
```typescript
function example() {
    const name = "Vibe Coder";
    if (name) {
        console.log(name);
    }
}
```

#### コメント

**ルール**:
- 日本語で記述
- 簡潔に

**正しい例**:
```typescript
// ユーザー情報を取得
const user = await getUser();

// 認証チェック
if (!user.isAuthenticated) {
    // エラーメッセージを表示
    throw new Error("認証が必要です");
}
```

---

## トーンの一貫性

### 全章で統一すべき要素

| 要素 | 統一ルール |
|------|----------|
| **語尾** | です・ます調 |
| **敬語レベル** | セミフォーマル |
| **ポジティブ度** | エンパワーメント |
| **対象読者** | 非エンジニア |
| **技術深度** | 初学者でも理解可能 |

### トーンシフトの禁止

#### ❌ 悪い例（トーンシフト）

```markdown
# 第1章：Vibe Coderとは何か

Vibe Coderは、AI駆動開発を実践する新しい開発者である。
従来の開発者とは異なり、コードを書くのではなく要件を定義する。

---

# 第2章：AIツールの全体像

みなさん、AIツールって色々あるよね！
今日はその全体像を見ていこう！
```

**問題点**:
- 第1章: だ・である調、論文調
- 第2章: カジュアル、口語調
- トーンが一貫していない

#### ✅ 良い例（トーン統一）

```markdown
# 第1章：Vibe Coderとは何か

Vibe Coderは、AI駆動開発を実践する新しい開発者です。
従来の開発者とは異なり、コードを書くのではなく要件を定義します。

**重要なポイント**:
Vibe Coderになるために、プログラミングの深い知識は不要です。
必要なのは、**日本語力**と**要件定義力**です。

---

# 第2章：AIツールの全体像

この章では、AI駆動開発で使用する主要なツールの全体像を学びます。

**主なツールカテゴリ**:
- **IDE型AI**: コード生成・編集
- **チャット型AI**: 要件定義・レビュー
- **プロトタイピングツール**: UI設計

それぞれのツールの特徴と使い分けを理解することで、
効率的な開発ワークフローを構築できます。
```

**良い点**:
- 全章でです・ます調
- セミフォーマルな語調
- ポジティブ・エンパワーメント
- 非エンジニアに配慮

---

## 一貫性チェックリスト

### ✅ 用語統一

- [ ] Vibe Coder（大文字V、大文字C、スペースあり）
- [ ] AI駆動開発（漢字）
- [ ] IDE型AI（IDEは大文字）
- [ ] チャット型AI（カタカナ）
- [ ] ツール名が英語（Cursor, Claude, ChatGPT等）
- [ ] フレームワーク名が正しい（Next.js, React等）

### ✅ フォーマット

- [ ] セクションタイトルが統一（絵文字 + タイトル）
- [ ] 番号付きリストが`1. 2. 3.`形式
- [ ] 箇条書きリストが`-`（ハイフン）
- [ ] チェックリストが`- [ ]`または`- ✅`
- [ ] コードブロックに言語指定
- [ ] インデントが4スペース
- [ ] コメントが日本語

### ✅ トーン

- [ ] 全章でです・ます調
- [ ] セミフォーマル
- [ ] ポジティブ・エンパワーメント
- [ ] 非エンジニアに配慮
- [ ] トーンシフトがない

---

## 一貫性違反の修正例

### 違反例1: 用語統一の違反

#### ❌ Before（違反）

```markdown
vibe coderは、AI driven developmentを実践します。
IDE型aiやchat型AIを使い、prototypeを作成します。
```

#### ✅ After（修正）

```markdown
Vibe Coderは、AI駆動開発を実践します。
IDE型AIやチャット型AIを使い、プロトタイプを作成します。
```

### 違反例2: フォーマットの違反

#### ❌ Before（違反）

```markdown
## 🎯**この章で学ぶこと**

① Cursorの使い方
* Composerモードの起動
+ コードの生成

```typescript
const name = "Vibe Coder";  // User name
```
```

#### ✅ After（修正）

```markdown
## 🎯 この章で学ぶこと

1. Cursorの使い方
2. Composerモードの起動
3. コードの生成

```typescript
const name = "Vibe Coder";  // ユーザー名
```
```

### 違反例3: トーンの違反

#### ❌ Before（違反）

```markdown
Cursorは優れたツールである。開発者はこれを使用すべきだ。
プログラミングの知識が必要であり、初心者には難しい。
```

#### ✅ After（修正）

```markdown
Cursorは優れたツールです。Vibe Coderを目指す方には最適です。
プログラミングの深い知識は不要で、**非エンジニアでも使いこなせます**。
```

---

## 一貫性維持のためのツール

### 検索・置換リスト

以下の検索・置換を実行して一貫性を確保：

| 検索 | 置換 |
|------|------|
| `vibe coder` | `Vibe Coder` |
| `VibeCoder` | `Vibe Coder` |
| `AI-driven` | `AI駆動` |
| `IDE型ai` | `IDE型AI` |
| `chat型AI` | `チャット型AI` |
| `cursor` | `Cursor` |
| `claude` | `Claude` |
| `chatgpt` | `ChatGPT` |
| `next.js` | `Next.js` |
| `Nextjs` | `Next.js` |
| `react` | `React` |

### 正規表現チェック

```regex
# トーンチェック: だ・である調を検出
(です|ます)。[^。]*?(だ|である)。

# ツール名チェック: 小文字のツール名を検出
\b(cursor|claude|chatgpt|supabase|clerk|vercel)\b

# フォーマットチェック: 誤ったリストマーカーを検出
^[*+・①②③④⑤⑥⑦⑧⑨⑩]\s
```

---

**関連資料**:
- [構造基準](structure-standards.md)
- [視覚要素基準](visual-standards.md)
- [教育効果基準](educational-standards.md)
- [文章品質基準](writing-standards.md)
- [メインSKILL.md](../SKILL.md)
