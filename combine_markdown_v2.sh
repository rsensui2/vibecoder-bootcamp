#!/bin/bash

# 出力ファイル名
OUTPUT_FILE="第一回_統合版_v2_$(date +%Y%m%d_%H%M%S).md"

# ヘッダーを追加
echo "# 第一回 統合版\n" > "$OUTPUT_FILE"

# 一時ファイルにファイル一覧を出力
find "/Users/sensuiryousuke/Library/CloudStorage/GoogleDrive-rsensui@tekion.jp/マイドライブ/TEKION Group/VibeCoder育成プログラム/docs/研修内容/ライト版/第一回" -name "*.md" | sort -V > /tmp/filelist.txt

# ファイルを順番に結合
while IFS= read -r file; do
    # ファイル名から番号とタイトルを抽出（例：1-0_事前準備.md → 1-0 事前準備）
    title=$(basename "$file" .md | sed 's/_/ /')
    
    # 進行状況を表示
    echo "処理中: $title"
    
    # セクション区切りを追加
    echo -e "\n---\n" >> "$OUTPUT_FILE"
    echo -e "## $title\n" >> "$OUTPUT_FILE"
    
    # ファイルの内容を追加
    cat "$file" >> "$OUTPUT_FILE"
done < /tmp/filelist.txt

# 一時ファイルを削除
rm /tmp/filelist.txt

echo "\n統合が完了しました: $OUTPUT_FILE"
echo "統合されたファイル数: $(grep -c '^## ' "$OUTPUT_FILE")"
