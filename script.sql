-- Users table
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    profile_pic BLOB,
    email VARCHAR(75) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE posts (
    post_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    image BLOB,
    date_posted TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Comments table
CREATE TABLE comments (
    comment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    comment TEXT NOT NULL,
    posted_by INT NOT NULL,
    posted_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    parent_post_id INT,
    FOREIGN KEY (posted_by) REFERENCES users(user_id),
    FOREIGN KEY (parent_post_id) REFERENCES posts(post_id)
);


