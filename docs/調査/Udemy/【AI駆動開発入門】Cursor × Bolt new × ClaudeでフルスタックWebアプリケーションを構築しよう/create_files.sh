#!/usr/bin/env bash
set -e

# 目次を初期化
echo "# AI駆動開発入門 目次" > 目次.md
echo "" >> 目次.md

while IFS='|' read -r num title; do
  # ファイル名を作成（00-タイトル.md 形式）
  # 特殊文字を除去
  safe_title=$(echo "$title" | tr -d '\/:*?"<>|')
  fname="$(printf "%02d-%s.md" "$num" "$safe_title")"

  # 目次にリンク追加
  echo "- [$num. $title]($fname)" >> 目次.md

  # レクチャーファイル作成（既にあればスキップ）
  if [[ ! -e "$fname" ]]; then
    {
      echo "# $num. $title"
      echo ""
      echo "<!-- ↓ここにトランスクリプション貼り付け -->"
    } > "$fname"
  fi
done < lec.txt
