#!/usr/bin/env python3
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
import json
import time

def scrape_quiz_with_selenium(url):
    """
    Seleniumを使用してClassMarkerのクイズ結果をスクレイピング
    """
    # Chrome optionsの設定
    chrome_options = Options()
    chrome_options.add_argument('--headless')  # ヘッドレスモード
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')

    driver = None
    try:
        # WebDriverの初期化
        driver = webdriver.Chrome(options=chrome_options)

        print(f"ページにアクセス中: {url}")
        driver.get(url)

        # ページが完全に読み込まれるまで待機
        time.sleep(5)

        # ページタイトルの取得
        print(f"ページタイトル: {driver.title}")

        # JavaScriptが実行されているか確認
        page_source = driver.page_source

        # クイズデータを格納するリスト
        quiz_data = []

        # 様々なセレクタで質問要素を探す
        selectors = [
            # ClassMarkerで一般的に使用されるセレクタ
            "div.question-container",
            "div.quiz-question",
            "div.test-question",
            "div.result-question",
            "div[class*='question']",
            "div[class*='quiz']",
            "div[class*='result']",
            # より一般的なセレクタ
            "section.question",
            "article.question",
            ".question-wrapper",
            ".question-block"
        ]

        question_elements = []
        for selector in selectors:
            try:
                elements = driver.find_elements(By.CSS_SELECTOR, selector)
                if elements:
                    print(f"セレクタ '{selector}' で {len(elements)} 個の要素を発見")
                    question_elements.extend(elements)
            except:
                continue

        if not question_elements:
            # テーブル形式でデータが表示されている可能性
            tables = driver.find_elements(By.TAG_NAME, "table")
            print(f"テーブル数: {len(tables)}")

            for table in tables:
                rows = table.find_elements(By.TAG_NAME, "tr")
                for row in rows:
                    cells = row.find_elements(By.TAG_NAME, "td")
                    if len(cells) >= 2:
                        quiz_data.append({
                            'question': cells[0].text.strip(),
                            'answer': cells[1].text.strip() if len(cells) > 1 else "N/A"
                        })

        # 質問要素から情報を抽出
        for idx, element in enumerate(question_elements):
            try:
                question_text = element.text.strip()
                if question_text:
                    # 回答を探す
                    answer_text = ""
                    answer_elements = element.find_elements(By.CSS_SELECTOR, "[class*='answer'], [class*='correct'], [class*='response']")
                    if answer_elements:
                        answer_text = " ".join([elem.text.strip() for elem in answer_elements])

                    quiz_data.append({
                        'question_number': idx + 1,
                        'question': question_text,
                        'answer': answer_text or "回答が見つかりません"
                    })
            except Exception as e:
                print(f"要素の処理中にエラー: {e}")
                continue

        # ページソースを保存（デバッグ用）
        with open('page_source.html', 'w', encoding='utf-8') as f:
            f.write(page_source)
        print("ページソースをpage_source.htmlに保存しました")

        # 結果の表示と保存
        if quiz_data:
            print(f"\n=== {len(quiz_data)} 個の質問を取得 ===")
            for item in quiz_data[:3]:  # 最初の3つを表示
                print(f"\n質問: {item.get('question', '')[:100]}...")
                print(f"回答: {item.get('answer', '')[:100]}...")

            # JSONファイルに保存
            with open('quiz_results_selenium.json', 'w', encoding='utf-8') as f:
                json.dump(quiz_data, f, ensure_ascii=False, indent=2)
            print(f"\n全{len(quiz_data)}件の結果をquiz_results_selenium.jsonに保存しました")
        else:
            print("\n質問データが見つかりませんでした")
            print("ページにログインが必要か、アクセス制限がある可能性があります")

            # ページの最初の部分を表示
            print("\nページコンテンツ（最初の2000文字）:")
            print(page_source[:2000])

        return quiz_data

    except Exception as e:
        print(f"エラーが発生しました: {e}")
        return None
    finally:
        if driver:
            driver.quit()

if __name__ == "__main__":
    url = "https://www.classmarker.com/online-test/start/results/?quiz=37h68c000fe7cbcc"
    results = scrape_quiz_with_selenium(url)