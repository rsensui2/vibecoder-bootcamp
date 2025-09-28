# Vibe Coder Bootcamp - Curriculum Overview (2025年9月版・最終案)

## 🎯 Program Overview
AI時代の新しい開発者「Vibe Coder」を育成する全5回プログラム（週1講義×4回 + Demo Day）。
AIエージェントとの協働を前提とした、実践的なカリキュラム構成。

## 🚀 Core Philosophy
`ビジネス要件 → AIとの対話 → システム要件定義 → AI駆動実装 → 自動デプロイ`

従来の「コードを書く」から「AIと対話する」へのパラダイムシフトを体験する。

---

## 📅 Session 1: Mindset Revolution & Business Requirements
**日程:** 第1週 / **時間:** 3時間

### 🎯 Learning Objectives
- AI前提の新しい思考法（Vibe Coder Mindset）の習得
- ビジネスアイデアのAI可読形式への構造化
- 主要AIツールの理解と実践

### 📚 Detailed Curriculum

#### 1-1_orientation-and-mindset.md (45分)
- **🎯 Goal:** Vibe Coderの哲学を理解し、AI協働の思考法を身につける
- **📚 Topics:**
  - Vibe Coderとは: 「AIオーケストレーター」の新定義
  - なぜ非エンジニアが輝くのか
  - AIの成長を前提とした投資思考
  - 「知識」から「対話力」への価値転換
- **🔄 Updated:** AIエージェントとの協働を前提とした新しい価値観

#### 1-2_business-cases-and-llm-basics.md (45分)
- **🎯 Goal:** 実践的なAI活用事例とLLMの基本原理を理解
- **📚 Topics:**
  - 事例1: コミュニケーション円滑化プロトタイプ
  - 事例2: 実プロジェクト背景（mygear.jp, calendy.biz, mdnow.tokyo）
  - LLMの仕組みと"Text is KING"原則
  - プロンプトエンジニアリングの基礎
- **💡 New:** 最新のAI成功事例を追加

#### 1-3_business-requirements-practice.md (30分)
- **🎯 Goal:** アイデアを構造化されたビジネス要件に変換
- **📚 Topics:**
  - AI可読形式の要件定義構造
  - ビジネス要件の必須要素
  - 課題・ユーザー・価値・モデルの言語化
  - AIへの業務委譲の考え方

#### 1-4_tools-and-homework.md (15分)
- **🎯 Goal:** 主要AIツールの把握と実践準備
- **📚 Topics:**
  - 主要ツール: ChatGPT, Claude, Cursor, v0, Bolt.new, Windsurf
  - 最新ツール: NotebookLM, Genspark, Manus
  - v0実践デモ（5分でUI生成）
  - **宿題:**
    1. ビジネス要件のMarkdown作成
    2. v0/Cursorでのアプリ試作

---

## 📅 Session 2: System Architecture & Technical Requirements
**日程:** 第2週 / **時間:** 3時間

### 🎯 Learning Objectives
- Webアプリケーションの動作原理を理解
- AIによる自動システム要件定義書の生成
- AI駆動開発環境の構築とエラー対処法の習得

### 📚 Detailed Curriculum

#### 2-1_homework-review-and-web-basics.md (45分)
- **🎯 Goal:** Webアプリの基本構造とAPIの概念理解
- **📚 Topics:**
  - 宿題レビューとフィードバック
  - フロントエンド・バックエンド・DBの役割
  - APIの仕組みと重要性
  - APIキーの管理とセキュリティ
- **🔄 Updated:** API first設計の重要性を強調

#### 2-2_tech-stack-and-ai-requirements.md (45分)
- **🎯 Goal:** モダン技術スタックとAI要件定義の実践
- **📚 Topics:**
  - Vibe Coder推奨スタック（Next.js 15, TypeScript, Tailwind CSS v4）
  - Supabase vs Firebase vs Clerk比較
  - **演習:**
    - `system-requirements-prompt.md`実行
    - `detailed_requirements_prompt.md`での詳細化
    - Mermaid図の自動生成
- **🔄 Updated:** 2段階プロンプトシステムに変更

#### 2-3_ai-agent-development.md (45分) **[大幅改訂]**
- **🎯 Goal:** AI Agent時代の開発スタイル習得
- **📚 Topics:**
  - **パラダイムシフト:** コマンド記憶 → AI対話
  - Cursor Composer/Agentの活用法
  - AIへの効果的な指示パターン集
  - **Next.js特有のエラー対処法:**
    - Tailwind CSS v4設定エラー
    - Hydration Mismatchの解決
    - Image最適化エラー
    - Server/Client Component境界
    - Server Actionsエラー
    - TypeScript/JSXエラー
  - **エラー解決テンプレート集**
- **✨ New:** AI Agentファーストアプローチ

#### 2-4_git-and-homework.md (15分)
- **🎯 Goal:** バージョン管理の基礎と次回準備
- **📚 Topics:**
  - Git/GitHubの基本（AI経由での操作）
  - **宿題:**
    - システム要件のレビュー・修正
    - GitHubへのプッシュ（AIに指示）
    - 開発環境セットアップ

---

## 📅 Session 3: Backend Implementation with AI
**日程:** 第3週 / **時間:** 3時間

### 🎯 Learning Objectives
- データベースと認証の基礎理解
- AIを活用したSupabase/Clerk実装
- AI駆動でのCRUD機能構築

### 📚 Detailed Curriculum

#### 3-1_database-and-supabase.md (60分)
- **🎯 Goal:** DB設計とSupabase実装をAIで自動化
- **📚 Topics:**
  - データベースの基本概念
  - 要件定義書からのER図自動生成
  - SupabaseテーブルのAI構築
  - RLS（Row Level Security）設定
  - **AI活用:** スキーマ生成プロンプト
- **🔄 Updated:** AI駆動のDB設計フロー

#### 3-2_auth-and-clerk.md (60分)
- **🎯 Goal:** 認証システムをAIで迅速実装
- **📚 Topics:**
  - 認証・認可の基本理解
  - Clerk導入（`clerk-integration-prompt.md`）
  - Google/GitHub認証の設定
  - Supabase連携（Webhook）
  - **AI活用:** 認証フロー自動生成
- **🔄 Updated:** Clerk公式AIプロンプト活用

#### 3-3_crud-and-homework.md (15分)
- **🎯 Goal:** CRUD機能の完成と次回準備
- **📚 Topics:**
  - Server Actions実装パターン
  - useActionState/useOptimistic活用
  - **宿題:** CRUD機能の完成

---

## 📅 Session 4: Frontend & Deployment
**日程:** 第4週 / **時間:** 3時間

### 🎯 Learning Objectives
- フロントエンド実装の完成
- Vercelへの自動デプロイ
- 本番環境の運用基礎

### 📚 Detailed Curriculum

#### 4-1_implementation-review.md (60分)
- **🎯 Goal:** 実装レビューとデプロイ準備
- **📚 Topics:**
  - 宿題レビューと改善点
  - ビルドエラーの対処
  - パフォーマンス最適化
  - デプロイチェックリスト
- **🔄 Updated:** エラー対処法を充実

#### 4-2_vercel-deployment.md (60分)
- **🎯 Goal:** 本番環境への自動デプロイ
- **📚 Topics:**
  - Vercel連携設定
  - 環境変数の管理
  - ドメイン設定
  - Analytics/監視設定
  - **AI活用:** デプロイ自動化
- **✨ New:** CI/CDパイプライン

#### 4-3_demo-preparation.md (15分)
- **🎯 Goal:** Demo Day準備
- **📚 Topics:**
  - プレゼンテーション構成
  - デモシナリオ作成
  - **宿題:** アプリ完成と発表準備

---

## 📅 Session 5: Demo Day & Graduation
**日程:** 第5週 / **時間:** 2時間

### 🎯 Learning Objectives
- 成果発表と相互フィードバック
- Vibe Coderとしての今後の成長戦略

### 📚 Detailed Curriculum

#### 5-1_demo-presentations.md (90分)
- **🎯 Goal:** 成果物の発表と共有
- **📚 Topics:**
  - 各参加者の成果発表（5-10分）
  - 質疑応答とフィードバック
  - ベストプラクティスの共有
  - 相互評価とネットワーキング

#### 5-2_summary-and-next-steps.md (30分)
- **🎯 Goal:** 学習の総括と継続的成長
- **📚 Topics:**
  - 学習内容の振り返り
  - Vibe Coder認定証授与
  - 継続学習ロードマップ
  - コミュニティ参加案内

---

## 📊 Key Updates in This Version

### 1. **AI Agent-First Approach** 🤖
- コマンド記憶からAI対話への完全シフト
- Cursor Composer/Agentを中心とした開発フロー
- エラー解決もAI経由での対処法を重視

### 2. **Latest Technology Stack** 🛠️
- Next.js 15対応
- Tailwind CSS v4の新記法
- React 19/Server Components
- TypeScript 5.4+

### 3. **Comprehensive Error Patterns** 🐛
- Next.js特有の10種類以上のエラーパターン
- 各エラーに対するAI質問テンプレート
- 実践的な解決フローの提供

### 4. **Two-Stage Requirements System** 📝
- システム要件 → 詳細要件の2段階生成
- Mermaid図の自動生成
- より精密な設計書作成

### 5. **Production-Ready Focus** 🚀
- デプロイまでを前提とした構成
- 環境変数管理
- CI/CDパイプライン
- 監視・分析の基礎

---

## 🎓 Expected Outcomes

### Technical Skills
- AIツールを活用した要件定義能力
- AI駆動でのフルスタック開発スキル
- エラー解決とデバッグ能力
- デプロイと運用の基礎知識

### Soft Skills
- AIとの効果的な対話能力
- 構造化思考とドキュメント作成
- プロジェクト管理能力
- プレゼンテーション力

### Deliverables
- 完成したWebアプリケーション
- ビジネス要件定義書
- システム要件定義書
- GitHubリポジトリ
- デプロイ済みURL

---

## 📚 Reference Materials

### Essential Tools
- [Cursor](https://cursor.com) - AI統合開発環境
- [Claude](https://claude.ai) - AI アシスタント
- [v0](https://v0.dev) - UI生成ツール
- [Supabase](https://supabase.com) - Backend as a Service
- [Vercel](https://vercel.com) - デプロイプラットフォーム

### Documentation
- [Next.js 15 Docs](https://nextjs.org/docs)
- [Tailwind CSS v4](https://tailwindcss.com/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)

### Support Resources
- Slack Channel: #vibe-coder-bootcamp
- Office Hours: 毎週水曜 19:00-20:00
- GitHub Discussions: VibeCoder育成プログラム

---

## 🔄 Version History

### v3.0.0 (2025-09-23)
- AI Agent-first approachへの全面改訂
- Next.js 15/Tailwind CSS v4対応
- エラー対処パターンの大幅拡充
- 2段階要件定義システム導入

### v2.0.0 (2025-07-01)
- 初期バージョン（38ファイル統合版）

---

*This curriculum is designed to transform non-engineers into AI-powered developers who can build real-world applications.*

**"The future belongs to those who can orchestrate AI, not just code."**