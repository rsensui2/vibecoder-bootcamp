#!/bin/bash

# 出力ファイル名
OUTPUT_FILE="第一回_統合版_$(date +%Y%m%d).md"

# ヘッダーを追加
echo "# 第一回 統合版\n" > "$OUTPUT_FILE"

# ファイルをソートして結合
find "/Users/sensuiryousuke/Library/CloudStorage/GoogleDrive-rsensui@tekion.jp/マイドライブ/TEKION Group/VibeCoder育成プログラム/docs/研修内容/ライト版/第一回" -name "*.md" | sort | while read -r file; do
    # ファイル名から番号とタイトルを抽出（例：1-0_事前準備.md → 1-0 事前準備）
    title=$(basename "$file" .md | sed 's/_/ /')
    
    # セクション区切りを追加
    echo -e "\n---\n" >> "$OUTPUT_FILE"
    echo -e "## $title\n" >> "$OUTPUT_FILE"
    
    # ファイルの内容を追加
    cat "$file" >> "$OUTPUT_FILE"
done

echo "統合ファイルが作成されました: $OUTPUT_FILE"
