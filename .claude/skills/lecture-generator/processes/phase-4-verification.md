# Phase 4: 品質検証

**目的**: 統合チェック、構造チェック、定量的検証、品質基準チェック

---

## ステップ4-1: 統合チェック（最優先）

### 目的

9月版の新規加筆が100%保持され、7月版の充実した内容が適切に統合されているかを確認。

### チェック1: 9月版の新規加筆（最優先）

```yaml
check_september_additions:
  question: "9月版の新規加筆内容は100%保持されているか？"
  importance: "⭐⭐⭐⭐⭐ 最優先"

  method:
    step_1: "Phase 1のステップ1-1で特定した新規加筆リストを参照"
    step_2: "9月版と11月版を並べて比較"
    step_3: "新規加筆が一文字も削られていないことを確認"

  verification_points:
    new_business_cases:
      - "新しいビジネス事例が100%存在"
      - "表現が変わっていない"
      - "内容が削られていない"

    new_diagrams:
      - "新しい図解が100%存在"
      - "図の内容が変わっていない"

    new_explanations:
      - "新しい説明が100%存在"
      - "説明が簡略化されていない"

    new_concepts:
      - "新しい概念が100%存在"
      - "概念の定義が変わっていない"

  action_if_missing:
    priority: "最優先"
    action: "即座に追加"
    note: "このチェックで不合格なら、Phase 3に戻る"

  output_format: |
    ## 9月版の新規加筆チェック

    ### 新しいビジネス事例
    - [ ] 事例1: [タイトル] → ✅ 保持 / ❌ 不足
    - [ ] 事例2: [タイトル] → ✅ 保持 / ❌ 不足

    ### 新しい図解
    - [ ] 図解1: [説明] → ✅ 保持 / ❌ 不足
    - [ ] 図解2: [説明] → ✅ 保持 / ❌ 不足

    ### 新しい説明
    - [ ] 説明1: [トピック] → ✅ 保持 / ❌ 不足
    - [ ] 説明2: [トピック] → ✅ 保持 / ❌ 不足

    ### 新しい概念
    - [ ] 概念1: [名称] → ✅ 保持 / ❌ 不足
    - [ ] 概念2: [名称] → ✅ 保持 / ❌ 不足

    **結果**: [合格 / 不合格]
```

### チェック2: 7月版の充実した内容（高優先）

```yaml
check_july_enrichment:
  question: "7月版の充実した内容は取り込まれているか？"
  importance: "⭐⭐⭐⭐ 高"

  method:
    step_1: "Phase 1のステップ1-2で特定した充実した内容リストを参照"
    step_2: "7月版と11月版を比較"
    step_3: "充実した内容が適切に統合されていることを確認"

  verification_points:
    better_explanations:
      - "より充実していた説明が統合されている"
      - "9月版より詳しい説明が採用されている"

    removed_content:
      - "9月版で削られた重要な具体例が復活している"
      - "9月版で削られた有用な図解が復活している"

    useful_visuals:
      - "7月版の有用な図解が統合されている"
      - "7月版の比較表が統合されている"

    practical_tips:
      - "実践的なTipsが追加されている"
      - "ベストプラクティスが追加されている"

  action_if_missing:
    priority: "高"
    action: "Phase 1のリストを確認し、不足分を追加"

  output_format: |
    ## 7月版の充実した内容チェック

    ### より充実していた説明
    - [ ] 説明1: [トピック] → ✅ 統合 / ❌ 不足
    - [ ] 説明2: [トピック] → ✅ 統合 / ❌ 不足

    ### 削られた重要な具体例
    - [ ] 例1: [タイトル] → ✅ 復活 / ❌ 不足
    - [ ] 例2: [タイトル] → ✅ 復活 / ❌ 不足

    ### 有用な図解
    - [ ] 図解1: [説明] → ✅ 統合 / ❌ 不足
    - [ ] 図解2: [説明] → ✅ 統合 / ❌ 不足

    ### 実践的なTips
    - [ ] Tips1: [内容] → ✅ 追加 / ❌ 不足
    - [ ] Tips2: [内容] → ✅ 追加 / ❌ 不足

    **結果**: [合格 / 不合格]
```

### チェック3: 重複の排除

```yaml
check_no_duplication:
  question: "重複する内容はないか？"

  method:
    step_1: "同じトピックを扱うセクションを特定"
    step_2: "内容が重複していないか確認"
    step_3: "重複がある場合は削除"

  verification_points:
    - "同じビジネス事例が複数回登場していない"
    - "同じ説明が繰り返されていない"
    - "同じ図解が複数回登場していない"

  action_if_found:
    - "重複する内容を削除"
    - "9月版を優先"

  output_format: |
    ## 重複チェック

    - [ ] ビジネス事例の重複なし
    - [ ] 説明の重複なし
    - [ ] 図解の重複なし

    **結果**: [合格 / 不合格]
```

### チェック4: 論理的な流れ

```yaml
check_logical_flow:
  question: "論理的な流れは自然か？"

  verification_points:
    section_connections:
      - "セクション間のつながりが自然"
      - "前のセクションから次のセクションへの流れがスムーズ"

    chapter_connections:
      - "章間のつながりが明確"
      - "前章 → 本章 → 次章の流れが自然"

    independence:
      - "各章が独立性を保つ（講義で選択的に使える）"
      - "必要最小限の前提知識"

  action_if_unnatural:
    - "セクションの順序を調整"
    - "つなぎの文を追加"
    - "橋渡しセクション（🚀）を改善"

  output_format: |
    ## 論理的な流れチェック

    - [ ] セクション間のつながりが自然
    - [ ] 章間のつながりが明確
    - [ ] 各章の独立性が保たれている

    **結果**: [合格 / 不合格]
```

---

## ステップ4-2: 構造チェック（lecture-quality-standards準拠）

### 目的

必須セクション、フロントマター、見出し階層が正しく配置されているかを確認。

### チェック1: YAMLフロントマター

```yaml
frontmatter_check:
  requirement: "全7項目完備"

  items:
    - "title"
    - "track"
    - "author"
    - "last_updated"
    - "category"
    - "duration"
    - "target_audience"

  verification:
    - "すべての項目が存在"
    - "形式が正しい"
    - "内容が適切"

  output_format: |
    ## YAMLフロントマターチェック

    - [ ] title: 存在、形式正しい
    - [ ] track: 存在、形式正しい
    - [ ] author: 存在、形式正しい
    - [ ] last_updated: 存在、形式正しい
    - [ ] category: 存在、形式正しい
    - [ ] duration: 存在、形式正しい
    - [ ] target_audience: 存在、形式正しい

    **結果**: [合格 / 不合格]
```

### チェック2: 必須セクション

```yaml
mandatory_sections_check:
  lecture_level:
    sections:
      - "## 🎯 この講義で学ぶこと"
      - "## 📌 この講義の位置づけ"
    placement: "講義の冒頭"
    verification:
      - "両方のセクションが存在"
      - "絵文字が正しい"
      - "内容が適切（3-6項目）"

  chapter_level:
    sections:
      - "## 🎯 この章で学ぶこと"
      - "## 📌 この章の位置づけ"
      - "## 💡 この章のまとめ"
      - "## 🚀 次の章への橋渡し"
    placement: "各章"
    verification:
      - "すべての章に4つのセクションが存在"
      - "絵文字が正しい"
      - "内容が適切"

  output_format: |
    ## 必須セクションチェック

    ### 講義レベル
    - [ ] 🎯 この講義で学ぶこと
    - [ ] 📌 この講義の位置づけ

    ### 章レベル（各章）
    - [ ] 第1章: 🎯📌💡🚀すべて存在
    - [ ] 第2章: 🎯📌💡🚀すべて存在
    - [ ] 第3章: 🎯📌💡🚀すべて存在
    - [ ] [すべての章]

    **結果**: [合格 / 不合格]
```

### チェック3: 章区切り

```yaml
separators_check:
  requirement: "章区切りに --- 使用"

  verification:
    - "章と章の間に --- が存在"
    - "セクション区切りに適宜 --- が使用"

  output_format: |
    ## 章区切りチェック

    - [ ] 章と章の間に --- 存在
    - [ ] セクション区切りに適宜 --- 使用

    **結果**: [合格 / 不合格]
```

### チェック4: 見出し階層

```yaml
heading_hierarchy_check:
  levels:
    h1: "# 大見出し（講義タイトル、章タイトル）"
    h2: "## 中見出し（セクション）"
    h3: "### 小見出し（サブセクション）"

  verification:
    - "見出し階層が正しい（#、##、###の順）"
    - "見出しがスキップされていない（# → ### など）"

  output_format: |
    ## 見出し階層チェック

    - [ ] # → ## → ### の順序で使用
    - [ ] 見出しのスキップなし

    **結果**: [合格 / 不合格]
```

---

## ステップ4-3: 定量的検証（柔軟な基準）

### 目的

最低限のボリューム、図表数を確認（november_2025_update_prompt.md準拠）。

### 定量的指標

```yaml
quantitative_check:
  total_lines:
    minimum: 500  # 各章
    note: "november_2025_update_prompt.md準拠"
    measurement: "wc -l ファイル名"

  total_chars:
    note: "柔軟に対応（1-1の30,000-40,000字は特殊）"
    guideline: "9月版の3-5倍が目安"
    measurement: "len(file_content)"

  mermaid_diagrams:
    guideline: "1-3個/章"
    note: "7月版+9月版の有用な図を統合"
    measurement: "file_content.count('```mermaid')"

  tables:
    guideline: "2-4個/章"
    note: "7月版+9月版の有用な表を統合"
    measurement: "file_content.count('|---')"

  emojis:
    guideline: "適切に使用"
    types: "🎯📌💡🚀✅"
    measurement: "count_emojis(file_content)"

  pass_criteria:
    - "最低500行以上（各章）"
    - "9月版の新規加筆100%保持"
    - "7月版の充実した内容取り込み"
    - "構造が1-1準拠"
```

### 測定方法

```bash
# 総行数
wc -l ファイル名.md

# 総文字数
cat ファイル名.md | wc -c

# Mermaid図の数
grep -c '```mermaid' ファイル名.md

# 表の数
grep -c '|---' ファイル名.md

# 絵文字の数
grep -o '🎯\|📌\|💡\|🚀\|✅' ファイル名.md | wc -l
```

### 測定テンプレート

```markdown
## 定量的検証結果

### ファイル: X-X_タイトル.md

| 指標 | 実測値 | 基準値 | 判定 |
|------|--------|--------|------|
| **総行数** | XXX行 | 最低500行 | ✅ / ❌ |
| **総文字数** | XX,XXX字 | 柔軟 | ✅ / ❌ |
| **Mermaid図** | XX個 | 1-3個/章 | ✅ / ❌ |
| **表** | XX個 | 2-4個/章 | ✅ / ❌ |
| **絵文字** | XX個 | 適切 | ✅ / ❌ |

**総合判定**: [合格 / 不合格]

### 改善が必要な場合

- [ ] 総行数を500行以上に（現在XXX行）
- [ ] Mermaid図を追加（現在XX個、目標1-3個/章）
- [ ] 表を追加（現在XX個、目標2-4個/章）
```

---

## ステップ4-4: 品質基準チェック（lecture-quality-standards準拠）

### 目的

lecture-quality-standards Skillで定義された品質基準をすべて満たしているかを確認。

### チェック1: 視覚要素

```yaml
visual_elements_check:
  mermaid_color_scheme:
    requirement: "カラースキーム統一（#3b82f6, #10b981, #f59e0b, #ef4444）"
    verification:
      - "すべてのMermaid図が統一カラー"
      - "1-1と同じカラースキーム"

  table_formatting:
    requirement: "表の見出し太字、重要セル強調"
    verification:
      - "見出し行が太字"
      - "重要なセルが太字またはコード"

  emoji_usage:
    requirement: "絵文字の適切な使用"
    verification:
      - "🎯📌💡🚀✅が適切に使用"
      - "不要な絵文字がない"

  output_format: |
    ## 視覚要素チェック

    - [ ] Mermaid図のカラースキーム統一
    - [ ] 表の見出し太字
    - [ ] 絵文字の適切な使用

    **結果**: [合格 / 不合格]
```

### チェック2: 教育効果

```yaml
educational_effect_check:
  learning_objectives:
    requirement: "学習目標3-6項目"
    verification:
      - "各章に3-6項目の学習目標"
      - "行動動詞使用（理解する、習得する、実践する）"

  examples:
    requirement: "具体例豊富"
    verification:
      - "各概念に1つ以上の具体例"
      - "ビジネス事例含む"

  business_cases:
    requirement: "ビジネス事例含む"
    verification:
      - "実際のビジネス課題を扱う事例"
      - "非エンジニアが共感できる事例"

  output_format: |
    ## 教育効果チェック

    - [ ] 学習目標3-6項目（各章）
    - [ ] 行動動詞使用
    - [ ] 具体例豊富
    - [ ] ビジネス事例含む

    **結果**: [合格 / 不合格]
```

### チェック3: 文章品質

```yaml
writing_quality_check:
  tone:
    requirement: "セミフォーマル、ポジティブ・エンパワーメント"
    verification:
      - "敬語と平易な表現のバランス"
      - "「できる」「実現できる」を強調"
      - "非エンジニア向けの平易な表現"

  readability:
    requirement: "段落長3-7行、文長30-60文字"
    verification:
      - "段落が長すぎない"
      - "文が長すぎない"

  emphasis:
    requirement: "**太字**、`コード`、> 引用を適切に使用"
    verification:
      - "重要な概念が太字"
      - "ツール名・技術用語がコード"
      - "重要な注意事項が引用"

  output_format: |
    ## 文章品質チェック

    - [ ] トーンがセミフォーマル
    - [ ] ポジティブ・エンパワーメント
    - [ ] 非エンジニア向けの平易な表現
    - [ ] 段落長3-7行
    - [ ] 文長30-60文字
    - [ ] 強調技法の適切な使用

    **結果**: [合格 / 不合格]
```

### チェック4: 一貫性

```yaml
consistency_check:
  terminology:
    requirement: "用語統一"
    items:
      - "Vibe Coder（大文字V、大文字C）"
      - "AI駆動開発"
      - "IDE型AI"

  tool_names:
    requirement: "ツール名英語（Cursor, Claude, ChatGPT）"
    verification:
      - "ツール名が英語で統一"
      - "表記が統一"

  formatting:
    requirement: "フォーマット統一"
    verification:
      - "見出しの形式が統一"
      - "箇条書きの形式が統一"

  output_format: |
    ## 一貫性チェック

    - [ ] Vibe Coder表記統一
    - [ ] AI駆動開発表記統一
    - [ ] IDE型AI表記統一
    - [ ] ツール名英語（Cursor, Claude, ChatGPT）
    - [ ] フォーマット統一

    **結果**: [合格 / 不合格]
```

---

## 品質スコアリング

### スコア計算

```yaml
quality_scoring:
  categories:
    structure:
      points: 10
      criteria:
        - "YAMLフロントマター（2点）"
        - "必須セクション（4点）"
        - "見出し階層（2点）"
        - "章区切り（2点）"

    visual_elements:
      points: 10
      criteria:
        - "絵文字（2点）"
        - "Mermaid図（4点）"
        - "表（4点）"

    educational_effect:
      points: 10
      criteria:
        - "学習目標（3点）"
        - "具体例（4点）"
        - "段階的設計（3点）"

    writing_quality:
      points: 10
      criteria:
        - "トーン（3点）"
        - "読みやすさ（4点）"
        - "強調技法（3点）"

    consistency:
      points: 10
      criteria:
        - "用語統一（5点）"
        - "フォーマット統一（5点）"

  total: 50

  ranking:
    45_50: "⭐⭐⭐⭐⭐（優秀）そのまま使用可"
    40_44: "⭐⭐⭐⭐（良好）微調整推奨"
    35_39: "⭐⭐⭐（普通）改善必要"
    30_34: "⭐⭐（不十分）大幅改善必要"
    0_29: "⭐（不可）再生成推奨"
```

### スコアシートテンプレート

```markdown
## 品質スコアシート

### ファイル: X-X_タイトル.md

| カテゴリ | 配点 | 実得点 | 評価 |
|---------|------|--------|------|
| **構造** | 10点 | X点 | 詳細 |
| **視覚要素** | 10点 | X点 | 詳細 |
| **教育効果** | 10点 | X点 | 詳細 |
| **文章品質** | 10点 | X点 | 詳細 |
| **一貫性** | 10点 | X点 | 詳細 |
| **合計** | 50点 | XX点 | - |

### 評価ランク

**スコア**: XX/50
**ランク**: ⭐⭐⭐⭐⭐ / ⭐⭐⭐⭐ / ⭐⭐⭐ / ⭐⭐ / ⭐
**判定**: [そのまま使用可 / 微調整推奨 / 改善必要 / 大幅改善必要 / 再生成推奨]

### 改善が必要な項目

- [ ] [改善項目1]
- [ ] [改善項目2]
- [ ] [改善項目3]
```

---

## 総合チェックリスト

### ステップ4-1: 統合チェック

- [ ] 9月版の新規加筆100%保持（最優先）
- [ ] 7月版の充実した内容統合（高優先）
- [ ] 重複の排除
- [ ] 論理的な流れ

### ステップ4-2: 構造チェック

- [ ] YAMLフロントマター（7項目完備）
- [ ] 必須セクション（🎯📌💡🚀）
- [ ] 章区切り（---）
- [ ] 見出し階層

### ステップ4-3: 定量的検証

- [ ] 総行数（最低500行/章）
- [ ] Mermaid図（1-3個/章）
- [ ] 表（2-4個/章）

### ステップ4-4: 品質基準チェック

- [ ] 視覚要素
- [ ] 教育効果
- [ ] 文章品質
- [ ] 一貫性

### 品質スコア

- [ ] 総合スコア45/50以上

---

**次のフェーズ**: [Phase 5: 反復改善](phase-5-improvement.md)
