# Claude Code サブエージェント & プロンプト最適化 ナレッジベース

**作成日**: 2025年11月8日
**目的**: Claude Codeのサブエージェント機能と自動プロンプト最適化技術を習得し、VibeCoder育成プログラムの講義資料を高品質かつ一貫性を保って生成する

---

## 📚 ドキュメント一覧

### 基礎編

#### 1. [サブエージェント機能 - 完全ガイド](01_sub-agents-overview.md)
**読了時間**: 20分
**難易度**: ⭐⭐☆☆☆

**内容**:
- サブエージェントとは何か
- なぜサブエージェントが必要か
- 主要な特徴（独立コンテキスト、カスタムプロンプト、ツール制限）
- 実践的なユースケース
- コンテキスト枯渇問題の解決

**こんな人におすすめ**:
- Claude Codeサブエージェントを初めて学ぶ人
- コンテキスト枯渇に悩んでいる人
- 大規模タスクを効率化したい人

---

#### 2. [サブエージェントの設定と実装ガイド](02_sub-agents-configuration.md)
**読了時間**: 30分
**難易度**: ⭐⭐⭐☆☆

**内容**:
- 3つの作成方法（`/agents`コマンド、ファイル直接作成、CLI）
- YAMLフロントマターとシステムプロンプトの詳細
- ツールアクセス制限の設定
- 自動選択 vs 明示的指定
- トラブルシューティング

**こんな人におすすめ**:
- 実際にサブエージェントを作成したい人
- 設定ファイルの書き方を知りたい人
- ベストプラクティスを学びたい人

---

### 応用編

#### 3. [自動プロンプト最適化技術 - 2025年版完全ガイド](03_prompt-optimization-techniques.md)
**読了時間**: 40分
**難易度**: ⭐⭐⭐⭐☆

**内容**:
- プロンプト最適化とは
- 6つの主要手法（OPRO、進化的、DSPy、Self-Refine、Reflexion、ベイズ最適化）
- Claude Code向けツール3選
- 実践的な適用方法
- LLM-as-a-Judgeの注意点

**こんな人におすすめ**:
- プロンプトの品質を自動改善したい人
- 最新の最適化手法を知りたい人
- 研究論文レベルの知識を得たい人

---

### 実践編

#### 4. [サブエージェントベース・プロンプト最適化システムの実践実装](04_practical-implementation.md)
**読了時間**: 60分
**難易度**: ⭐⭐⭐⭐⭐

**内容**:
- システム概要とアーキテクチャ設計
- 4つの専門サブエージェントの実装
  - `quality-analyzer`: 品質分析
  - `prompt-optimizer`: プロンプト最適化
  - `content-generator`: コンテンツ生成
  - `consistency-checker`: 整合性チェック
- 完全なワークフロー
- ケーススタディ

**こんな人におすすめ**:
- 実際にシステムを構築したい人
- 講義資料生成を自動化したい人
- エンドツーエンドの実装を学びたい人

---

### 参考資料

#### 5. [お手本ファイル品質分析レポート](05_quality-benchmarking.md)
**読了時間**: 30分
**難易度**: ⭐⭐☆☆☆

**内容**:
- 1-1_オリエンテーションとマインドセット変革.md の詳細分析
- 構造、視覚要素、教育効果、文章品質、一貫性の5観点評価
- 定量的評価（文字数、図表数、読了時間）
- YAML形式の品質基準書
- 再現可能性の検証

**こんな人におすすめ**:
- お手本の品質特性を理解したい人
- 品質基準を知りたい人
- 同等の品質を再現したい人

---

## 🗺️ 学習パス

### 初学者向け（推奨順）

```mermaid
graph LR
    Start[開始] --> Doc1[01_概要]
    Doc1 --> Doc2[02_設定]
    Doc2 --> Doc5[05_品質分析]
    Doc5 --> Practice[簡単なサブエージェント作成]

    style Start fill:#10b981,color:#fff
    style Practice fill:#10b981,color:#fff
```

**所要時間**: 約3時間

1. [01_sub-agents-overview.md](01_sub-agents-overview.md) - 全体像を理解
2. [02_sub-agents-configuration.md](02_sub-agents-configuration.md) - 設定方法を学ぶ
3. [05_quality-benchmarking.md](05_quality-benchmarking.md) - 品質基準を把握
4. **実践**: 簡単なサブエージェント（例: code-reviewer）を作成

---

### 中級者向け（推奨順）

```mermaid
graph LR
    Start[初学者パス完了] --> Doc3[03_最適化技術]
    Doc3 --> Tool[ツール試用]
    Tool --> Doc4[04_実践実装]
    Doc4 --> Build[システム構築]

    style Start fill:#3b82f6,color:#fff
    style Build fill:#10b981,color:#fff
```

**所要時間**: 約5時間

1. [03_prompt-optimization-techniques.md](03_prompt-optimization-techniques.md) - 最適化手法を学ぶ
2. **実践**: claude-code-prompt-optimizer などのツールを試す
3. [04_practical-implementation.md](04_practical-implementation.md) - 統合システムを理解
4. **実践**: 4つのサブエージェントを実装

---

### 上級者向け（推奨順）

```mermaid
graph LR
    Start[中級者パス完了] --> Custom[カスタマイズ]
    Custom --> Scale[スケール化]
    Scale --> Optimize[継続最適化]

    style Start fill:#8b5cf6,color:#fff
    style Optimize fill:#10b981,color:#fff
```

**所要時間**: 継続的

1. **カスタマイズ**: プロジェクト特有の要件に合わせてサブエージェントを調整
2. **スケール化**: 複数プロジェクトへの展開
3. **継続最適化**: Reflexionループで品質向上

---

## 🎯 ユースケース別ガイド

### ケース1: 「コンテキスト枯渇を解決したい」

**推奨ドキュメント**:
1. [01_sub-agents-overview.md](01_sub-agents-overview.md) - セクション「コンテキスト枯渇問題の解決」
2. [02_sub-agents-configuration.md](02_sub-agents-configuration.md) - セクション「タスク分解エージェント」

**実装例**:
- `task-decomposer`: 大きなタスクを分割
- `task-executor`: 小さなタスクを実行
- `quality-checker`: 品質検証

---

### ケース2: 「プロンプトを自動改善したい」

**推奨ドキュメント**:
1. [03_prompt-optimization-techniques.md](03_prompt-optimization-techniques.md) - 全体
2. [04_practical-implementation.md](04_practical-implementation.md) - セクション「prompt-optimizer」

**実装例**:
- OPRO手法でプロンプトを反復改善
- Self-Refine で自己批評ループ

---

### ケース3: 「講義資料を自動生成したい」

**推奨ドキュメント**:
1. [05_quality-benchmarking.md](05_quality-benchmarking.md) - 品質基準を理解
2. [04_practical-implementation.md](04_practical-implementation.md) - 全体システムを実装

**実装例**:
- 4つのサブエージェントを組み合わせ
- お手本ファイルから品質基準を抽出
- 一貫性のある全16ファイルを生成

---

## 📊 ドキュメント比較表

| ドキュメント | 読了時間 | 難易度 | 理論/実践 | 推奨対象 |
|------------|---------|--------|----------|---------|
| 01_概要 | 20分 | ⭐⭐☆☆☆ | 理論7:実践3 | 初学者 |
| 02_設定 | 30分 | ⭐⭐⭐☆☆ | 理論4:実践6 | 初学者〜中級者 |
| 03_最適化技術 | 40分 | ⭐⭐⭐⭐☆ | 理論8:実践2 | 中級者 |
| 04_実践実装 | 60分 | ⭐⭐⭐⭐⭐ | 理論3:実践7 | 中級者〜上級者 |
| 05_品質分析 | 30分 | ⭐⭐☆☆☆ | 理論5:実践5 | 初学者〜中級者 |

---

## 🔧 実装チェックリスト

### Phase 1: 基礎習得（所要時間: 3時間）

- [ ] 01_概要を読み、サブエージェントの概念を理解
- [ ] 02_設定を読み、作成方法を理解
- [ ] `/agents` コマンドで簡単なサブエージェントを1つ作成
- [ ] 作成したサブエージェントを実行して動作確認

---

### Phase 2: プロンプト最適化（所要時間: 4時間）

- [ ] 03_最適化技術を読み、主要手法を理解
- [ ] claude-code-prompt-optimizer をインストール
- [ ] `<optimize>` タグで既存プロンプトを改善
- [ ] 改善前後の品質を比較

---

### Phase 3: システム構築（所要時間: 8時間）

- [ ] 05_品質分析を読み、品質基準を理解
- [ ] 04_実践実装を読み、アーキテクチャを理解
- [ ] `quality-analyzer` サブエージェントを実装
- [ ] `prompt-optimizer` サブエージェントを実装
- [ ] `content-generator` サブエージェントを実装
- [ ] `consistency-checker` サブエージェントを実装
- [ ] 全体ワークフローをテスト
- [ ] サンプル講義資料を1つ生成

---

### Phase 4: 本番運用（継続的）

- [ ] 1-1〜4-4の全16ファイルを生成
- [ ] 整合性チェックを実行
- [ ] 不一致箇所を修正
- [ ] 品質レビュー
- [ ] フィードバックをサブエージェントに反映
- [ ] 次のプロジェクトへ展開

---

## 💡 よくある質問（FAQ）

### Q1: サブエージェントとSlash Commandの違いは？

**A**:
- **Slash Command**: 単純なコマンド実行、プロンプト展開
- **サブエージェント**: 独立コンテキスト、カスタムツール、複雑なタスク対応

詳細: [01_sub-agents-overview.md](01_sub-agents-overview.md)

---

### Q2: プロンプト最適化は毎回必要？

**A**:
- **初回**: 必ず最適化
- **2回目以降**: 品質に満足なら不要、改善したい場合は再最適化

詳細: [03_prompt-optimization-techniques.md](03_prompt-optimization-techniques.md)

---

### Q3: どのモデルを使うべき？

**A**:
- **軽量タスク**: Haiku（コスト重視）
- **通常タスク**: Sonnet（バランス重視）
- **高度なタスク**: Opus（品質重視）

詳細: [02_sub-agents-configuration.md](02_sub-agents-configuration.md) - セクション「model」

---

### Q4: エラーが出たらどうする？

**A**:
1. [02_sub-agents-configuration.md](02_sub-agents-configuration.md) - セクション「トラブルシューティング」を確認
2. サブエージェントのログを確認
3. ツール制限を見直す
4. プロンプトを明確化

---

## 🌟 ベストプラクティス

### 1. 単一責任の原則

❌ **悪い例**:
```yaml
name: general-helper
description: コードレビューもテストもドキュメントも作る
```

✅ **良い例**:
```yaml
name: code-reviewer
description: セキュリティとパフォーマンスの観点でコードをレビューする
```

---

### 2. 最小権限の原則

❌ **悪い例**:
```yaml
tools: # 全ツール継承
```

✅ **良い例**:
```yaml
tools: Read, Grep  # レビューに必要な読み取りツールのみ
```

---

### 3. 明確な説明

❌ **悪い例**:
```yaml
description: コードを見る
```

✅ **良い例**:
```yaml
description: TypeScriptコードのセキュリティ脆弱性とパフォーマンス問題を検出し、具体的な改善コードを提示する
```

---

## 📚 参考資料

### 公式ドキュメント

- [Claude Code 公式 - Sub-agents](https://code.claude.com/docs/ja/sub-agents)
- [Anthropic Prompt Improver](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering/prompt-improver)

### 学術論文

- [OPRO - ICLR 2024](https://proceedings.iclr.cc/paper_files/paper/2024/hash/3339f19c5fcee3ad74502947a32be9e6-Abstract-Conference.html)
- [DSPy - arXiv 2023](https://arxiv.org/abs/2310.03714)
- [Self-Refine - NeurIPS 2023](https://proceedings.neurips.cc/paper_files/paper/2023/hash/91edff07232fb1b55a505a9e9f6c0ff3-Abstract-Conference.html)
- [Reflexion - arXiv 2023](https://arxiv.org/abs/2303.11366)

### コミュニティ記事（Zenn）

- [Claude Code のサブエージェント機能の基本的な使い方](https://zenn.dev/ino_h/articles/2025-09-10-claude-code-subagents-basics)
- [ClaudeCodeのSub agentsでコンテキスト枯渇問題をサクッと解決](https://zenn.dev/tacoms/articles/552140c84aaefa)
- [ClaudeCodeのサブエージェント機能で、テスト修正を自動化](https://zenn.dev/smartshopping/articles/cfd3bd069133ee)

### GitHubリポジトリ

- [claude-code-prompt-optimizer](https://github.com/johnpsasser/claude-code-prompt-optimizer)
- [claude-code-prompt-improver](https://github.com/severity1/claude-code-prompt-improver)
- [claude-agents（コミュニティ共有）](https://github.com/iannuttall/claude-agents)

---

## 🚀 次のステップ

このナレッジベースを活用して:

1. **学習**: 推奨パスに従ってドキュメントを読む
2. **実践**: チェックリストに沿ってサブエージェントを実装
3. **応用**: VibeCoder育成プログラムの講義資料を生成
4. **共有**: 成功事例やノウハウをチームに展開

---

## 📝 更新履歴

| 日付 | バージョン | 更新内容 |
|------|-----------|---------|
| 2025-11-08 | 1.0.0 | 初版作成 |

---

**作成者**: VibeCoder育成プログラム
**最終更新**: 2025年11月8日
**ライセンス**: MIT License
