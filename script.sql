create table users ("user_id": int not null primary key, "name": varchar(50) not null, "profilePic": BLOB, "email": varchar(75) not null, "created_at": timestamp not null default current_timestamp())

CREATE TABLE posts ("post_id": int not null auto_increment unique primary key, "title": varchar(50) not null, "description": varchar(250), "image": BLOB, "date": timestamp not null default current_timestamp(), "author": int not null, foreign key (author) references users(user_id) on delete cascade);

CREATE TABLE comments("comment_id": int not null auto_increment unique primary key, "likes": int default 0, "dislikes": int default 0, "comment": varchar(250) not null, "posted_by": int not null, "posted_on": timestamp default current_timestamp(), "last_updated": timestamp default current_timestamp, "parent_post": int, foreign key (posted_by) references users(user_id), foreign key (parent_post) references posts(post_id));

