BEGIN TRANSACTION;

--adding in a drop if exists. may be optional
---TEST TO SEE IF MERGE WORKS--

CREATE TABLE users (
  user_id INT GENERATED BY DEFAULT AS IDENTITY
  (START WITH 1001 INCREMENT BY 1),
  email VARCHAR(50) NOT NULL UNIQUE,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(200) NOT NULL,
  role VARCHAR(50) NOT NULL,
  CONSTRAINT PK_user PRIMARY KEY (user_id),
  CONSTRAINT UQ_username UNIQUE (username),
  CONSTRAINT UQ_email UNIQUE (email)
);

CREATE TABLE posts (
   post_id INT GENERATED BY DEFAULT AS IDENTITY
   (START WITH 2001 INCREMENT BY 1),
   username VARCHAR(50),
   caption VARCHAR (500),
   image_url VARCHAR(100),
   created_at TIMESTAMP,
   CONSTRAINT PK_post PRIMARY KEY (post_id),
   CONSTRAINT FK_posts_users FOREIGN KEY (username) REFERENCES users (username)
);

CREATE TABLE likes (
   like_id INT GENERATED BY DEFAULT AS IDENTITY
   (START WITH 3001 INCREMENT BY 1),
   username VARCHAR(50),
   post_id INT,
   CONSTRAINT PK_like PRIMARY KEY (like_id),
   CONSTRAINT FK_likes_users FOREIGN KEY (username) REFERENCES users (username),
   CONSTRAINT FK_likes_posts FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

CREATE TABLE comments (
   comment_id INT GENERATED BY DEFAULT AS IDENTITY
   (START WITH 4001 INCREMENT BY 1),
   username VARCHAR(50),
   post_id INT,
   comment VARCHAR (255),
   comment_created TIMESTAMP,
   CONSTRAINT PK_comment PRIMARY KEY (comment_id),
   CONSTRAINT FK_comments_users FOREIGN KEY (username) REFERENCES users (username),
   CONSTRAINT FK_comments_posts FOREIGN KEY (post_id) REFERENCES posts (post_id)
);

--CREATE TABLE follow (
--    follower_username VARCHAR(50),
--    following_username VARCHAR(50),
--    CONSTRAINT PK_follow PRIMARY KEY(follow_id),
--    CONSTRAINT FK_follow_users FOREIGN KEY (username) REFERENCES users (username)
--
--);


COMMIT TRANSACTION;