#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import json

def scrape_quiz_results(url):
    """
    ClassMarkerのクイズ結果ページから質問と回答をスクレイピング
    """
    try:
        # ページを取得
        response = requests.get(url)
        response.raise_for_status()

        # BeautifulSoupでHTML解析
        soup = BeautifulSoup(response.text, 'html.parser')

        # デバッグ用にHTMLの一部を出力
        print("ページタイトル:", soup.title.string if soup.title else "タイトルなし")

        # クイズデータを格納するリスト
        quiz_data = []

        # 質問要素を探す（ClassMarkerの典型的な構造）
        # 質問ブロックを探す
        question_blocks = soup.find_all(['div', 'section', 'article'], class_=lambda x: x and any(word in x.lower() for word in ['question', 'quiz', 'result']))

        if not question_blocks:
            # クラス名で見つからない場合、より一般的な方法で探す
            question_blocks = soup.find_all('div', recursive=True)

        print(f"見つかった要素数: {len(question_blocks)}")

        # 各質問ブロックを解析
        for idx, block in enumerate(question_blocks):
            # 質問テキストを探す
            question_text = None
            answer_text = None

            # 質問番号や質問文を含む可能性のある要素を探す
            if block.get_text(strip=True):
                text = block.get_text(strip=True)

                # 質問パターンを探す
                if any(pattern in text for pattern in ['Question', 'Q.', '問', '質問']):
                    question_text = text

                    # 回答を探す
                    answer_elements = block.find_all(['span', 'div', 'p'], class_=lambda x: x and 'answer' in x.lower())
                    if answer_elements:
                        answer_text = ' '.join([elem.get_text(strip=True) for elem in answer_elements])

                    if question_text:
                        quiz_data.append({
                            'question_number': idx + 1,
                            'question': question_text,
                            'answer': answer_text or 'No answer found'
                        })

        # 結果を表示
        if quiz_data:
            print("\n=== スクレイピング結果 ===")
            for item in quiz_data:
                print(f"\n質問 {item['question_number']}:")
                print(f"  Q: {item['question'][:100]}...")
                print(f"  A: {item['answer'][:100]}...")
        else:
            print("\n質問と回答が見つかりませんでした。")
            print("\nページのHTML構造（最初の1000文字）:")
            print(str(soup)[:1000])

        # JSONファイルに保存
        with open('quiz_results.json', 'w', encoding='utf-8') as f:
            json.dump(quiz_data, f, ensure_ascii=False, indent=2)

        print(f"\n結果をquiz_results.jsonに保存しました。")

        return quiz_data

    except requests.exceptions.RequestException as e:
        print(f"ページの取得に失敗しました: {e}")
        return None
    except Exception as e:
        print(f"エラーが発生しました: {e}")
        return None

if __name__ == "__main__":
    url = "https://www.classmarker.com/online-test/start/results/?quiz=37h68c000fe7cbcc"
    results = scrape_quiz_results(url)