-- ============================================
-- SQLクエリサンプル集
-- ============================================

-- 1. テーブル作成
-- ============================================

-- ユーザーテーブル
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 投稿テーブル
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    status VARCHAR(20) DEFAULT 'draft', -- draft, published, archived
    view_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- コメントテーブル
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- いいねテーブル
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(post_id, user_id)
);

-- ============================================
-- 2. サンプルデータの挿入
-- ============================================

-- ユーザーデータ
INSERT INTO users (username, email, password_hash, full_name) VALUES
('tanaka_taro', 'tanaka@example.com', '$2a$10$example_hash_1', '田中 太郎'),
('suzuki_hanako', 'suzuki@example.com', '$2a$10$example_hash_2', '鈴木 花子'),
('yamada_jiro', 'yamada@example.com', '$2a$10$example_hash_3', '山田 次郎'),
('watanabe_sakura', 'watanabe@example.com', '$2a$10$example_hash_4', '渡辺 さくら'),
('ito_kenji', 'ito@example.com', '$2a$10$example_hash_5', '伊藤 健二');

-- 投稿データ
INSERT INTO posts (user_id, title, content, status, view_count) VALUES
(1, 'AI駆動開発の基礎', 'AI駆動開発について学んだことをまとめました。Cursorの使い方から始めて...', 'published', 150),
(1, 'Supabase入門', 'Supabaseを使ったデータベース設計のポイントを解説します。', 'published', 89),
(2, 'React Hooks完全ガイド', 'useState、useEffect、useContextなど、主要なHooksを解説します。', 'published', 234),
(2, 'Next.jsでSSR実装', 'Next.jsを使ったサーバーサイドレンダリングの実装方法について。', 'draft', 0),
(3, 'TypeScript型定義のベストプラクティス', '型安全性を高めるためのTypeScriptの使い方を紹介します。', 'published', 167),
(3, '認証システムの実装', 'Clerkを使った認証システムの実装手順をまとめました。', 'published', 98),
(4, 'デプロイメント完全ガイド', 'Vercelを使ったデプロイの手順と注意点を解説します。', 'published', 201),
(5, 'データベース設計の基礎', '正規化とインデックスの重要性について説明します。', 'published', 145);

-- コメントデータ
INSERT INTO comments (post_id, user_id, content) VALUES
(1, 2, 'とても参考になりました！ありがとうございます。'),
(1, 3, 'Cursorの設定方法が詳しく書かれていて助かります。'),
(2, 1, 'Supabaseの使い方がよくわかりました。'),
(2, 4, 'RDB図の書き方も教えてほしいです。'),
(3, 1, 'useEffectの依存配列についてもっと詳しく知りたいです。'),
(3, 5, '実践的な例が多くて理解しやすかったです。'),
(5, 2, '型定義の重要性がよくわかりました。'),
(5, 4, 'Genericsの使い方も追加で解説してほしいです。'),
(7, 1, '環境変数の設定方法が詳しく書かれていて助かりました。'),
(7, 3, 'デプロイ時のエラー対処法も知りたいです。');

-- いいねデータ
INSERT INTO likes (post_id, user_id) VALUES
(1, 2), (1, 3), (1, 4),
(2, 1), (2, 3),
(3, 1), (3, 4), (3, 5),
(5, 2), (5, 4),
(7, 1), (7, 3), (7, 5);

-- ============================================
-- 3. SELECTクエリの例
-- ============================================

-- 基本的なSELECT
SELECT * FROM users;
SELECT id, username, email FROM users;
SELECT * FROM posts WHERE status = 'published';

-- WHERE句の使用
SELECT * FROM users WHERE id = 1;
SELECT * FROM posts WHERE view_count > 100;
SELECT * FROM posts WHERE created_at >= '2024-01-01';

-- JOINの使用
-- 投稿とユーザー情報を結合
SELECT 
    p.id,
    p.title,
    p.content,
    u.username,
    u.full_name,
    p.created_at
FROM posts p
INNER JOIN users u ON p.user_id = u.id
WHERE p.status = 'published'
ORDER BY p.created_at DESC;

-- 投稿ごとのコメント数とユーザー情報
SELECT 
    p.id AS post_id,
    p.title,
    u.username AS author,
    COUNT(c.id) AS comment_count
FROM posts p
INNER JOIN users u ON p.user_id = u.id
LEFT JOIN comments c ON p.id = c.post_id
GROUP BY p.id, p.title, u.username
ORDER BY comment_count DESC;

-- 投稿ごとのいいね数
SELECT 
    p.id,
    p.title,
    COUNT(l.id) AS like_count
FROM posts p
LEFT JOIN likes l ON p.id = l.post_id
GROUP BY p.id, p.title
ORDER BY like_count DESC;

-- ユーザーごとの投稿数
SELECT 
    u.id,
    u.username,
    u.full_name,
    COUNT(p.id) AS post_count
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id, u.username, u.full_name
ORDER BY post_count DESC;

-- サブクエリの使用
-- 平均閲覧数を超える投稿
SELECT 
    id,
    title,
    view_count
FROM posts
WHERE view_count > (
    SELECT AVG(view_count) FROM posts WHERE status = 'published'
)
AND status = 'published'
ORDER BY view_count DESC;

-- 最もコメントが多い投稿
SELECT 
    p.id,
    p.title,
    COUNT(c.id) AS comment_count
FROM posts p
INNER JOIN comments c ON p.id = c.post_id
GROUP BY p.id, p.title
HAVING COUNT(c.id) = (
    SELECT MAX(comment_count)
    FROM (
        SELECT COUNT(id) AS comment_count
        FROM comments
        GROUP BY post_id
    ) AS subquery
);

-- 集計関数の使用
SELECT 
    COUNT(*) AS total_users,
    COUNT(DISTINCT p.id) AS total_posts,
    AVG(p.view_count) AS avg_views,
    MAX(p.view_count) AS max_views
FROM users u
LEFT JOIN posts p ON u.id = p.user_id;

-- 日付での集計
SELECT 
    DATE(created_at) AS post_date,
    COUNT(*) AS posts_per_day
FROM posts
WHERE status = 'published'
GROUP BY DATE(created_at)
ORDER BY post_date DESC;

-- 複雑なクエリ: ユーザーの詳細情報と統計
SELECT 
    u.id,
    u.username,
    u.full_name,
    u.email,
    COUNT(DISTINCT p.id) AS total_posts,
    COUNT(DISTINCT c.id) AS total_comments,
    COUNT(DISTINCT l.id) AS total_likes_given,
    SUM(p.view_count) AS total_views
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
LEFT JOIN comments c ON u.id = c.user_id
LEFT JOIN likes l ON u.id = l.user_id
GROUP BY u.id, u.username, u.full_name, u.email
ORDER BY total_posts DESC;

-- ============================================
-- 4. UPDATE/DELETEクエリの例
-- ============================================

-- UPDATE
UPDATE posts 
SET view_count = view_count + 1 
WHERE id = 1;

UPDATE posts 
SET status = 'published', updated_at = CURRENT_TIMESTAMP 
WHERE id = 4;

-- DELETE
DELETE FROM comments WHERE id = 1;
DELETE FROM posts WHERE status = 'draft' AND created_at < '2024-01-01';

-- ============================================
-- 5. インデックスの作成
-- ============================================

CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_status ON posts(status);
CREATE INDEX idx_posts_created_at ON posts(created_at);
CREATE INDEX idx_comments_post_id ON comments(post_id);
CREATE INDEX idx_likes_post_id ON likes(post_id);

