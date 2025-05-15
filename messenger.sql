CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` VARCHAR(20) NOT NULL,
    `user_pw` VARCHAR(20) NOT NULL,
    `user_name` VARCHAR(20) NOT NULL,
    `prof_pic` VARCHAR(100) NOT NULL,
    `prof_mess` VARCHAR(100) NOT NULL,
    `withdraw` TINYINT(1) NOT NULL DEFAULT 0,
    `register_date` DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL UNIQUE,
    `creator` INT NOT NULL,
    `link` VARCHAR(100) NOT NULL,
    `max_users` INT NOT NULL,
    `withdraw` TINYINT(1) NOT NULL DEFAULT 0,
    `created_date` DATE NOT NULL,
    FOREIGN KEY (`creator`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `details` VARCHAR(200) NOT NULL,
    `writer` INT NOT NULL,
    `channel` INT NOT NULL,
    `created_date` DATE NOT NULL,
    FOREIGN KEY (`writer`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATE NOT NULL,
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `blocker` INT NOT NULL,
    `blocked` INT NOT NULL,
    `block_date` DATE NOT NULL,
    FOREIGN KEY (`blocker`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
