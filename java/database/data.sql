BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('viv','$2a$10$SkpetsQ1NPbAwC/YQQ3jb..PGCfafOvMMMtqIp3d0DSHoYJ1tMQkG','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('maryam','$2a$10$dIKOD/Bgxwt5rVa7gsymCeXoAPwG/q/PNLQ5oq4Jf0iS.B2.QRPIy','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('kay','$2a$10$ZeOorYllgNirm2vIx8KBveEWA3/MGO89eH8KP0cKsCBd/gnokrjy2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('nix','$2a$10$GlsSjcOvqTajVWg3vCRLwelkX9QPkKHajLu1r/LKK/0qmQTQ.PL6m','ROLE_USER');

INSERT INTO posts (username, caption, image_url, created_at) VALUES ('viv', 'test caption', 'test url', '09/26/2023');
INSERT INTO posts (username, caption, image_url, created_at) VALUES ('maryam', 'test caption', 'test url', '09/25/2023');
INSERT INTO posts (username, caption, image_url, created_at) VALUES ('kay', 'test caption', 'test url', '09/24/2023');
INSERT INTO posts (username, caption, image_url, created_at) VALUES ('nix', 'test caption', 'test url', '09/23/2023');

--INSERT INTO likes (username, post_id) VALUES ();
--INSERT INTO likes (username, post_id) VALUES ();
--INSERT INTO likes (username, post_id) VALUES ();
--INSERT INTO likes (username, post_id) VALUES ();
--
--INSERT INTO comments (username, post_id, comment, comment_created) VALUES ();
--INSERT INTO comments (username, post_id, comment, comment_created) VALUES ();
--INSERT INTO comments (username, post_id, comment, comment_created) VALUES ();
--INSERT INTO comments (username, post_id, comment, comment_created) VALUES ();
--
--INSERT INTO follow (follower_username, following_username) VALUES ();
--INSERT INTO follow (follower_username, following_username) VALUES ();
--INSERT INTO follow (follower_username, following_username) VALUES ();
--INSERT INTO follow (follower_username, following_username) VALUES ();

--will populate with dummy data after meeting with Eric

COMMIT TRANSACTION;
