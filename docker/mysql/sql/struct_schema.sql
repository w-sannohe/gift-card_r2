CREATE TABLE `user_info` (
    `user_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'ユーザーID',
    `user_name` varchar(11) DEFAULT '' COMMENT 'ユーザー名',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザー情報';

CREATE TABLE `user_login` (
    `user_id` int(10) COMMENT 'ユーザーID',
    `user_pass` varchar(11) DEFAULT '' COMMENT 'パスワード',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    REFERENCES user_info (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ログイン情報';

CREATE TABLE `situation` (
    `situation_id` int(4) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'シチュエーションID',
    `situation_name` varchar(11) DEFAULT '' COMMENT 'シチュエーション名',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='シチュエーション情報';

CREATE TABLE `card_info` (
    `card_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'カードID',
    `user_id` int(10) NOT NULL COMMENT 'ユーザーID',
    `situation_id` int(4) NOT NULL COMMENT 'シチュエーションID',
    `hash` varchar(11) NOT NULL DEFAULT '' UNIQUE KEY COMMENT 'ハッシュ',
    `URL` varchar(11) NOT NULL DEFAULT '' COMMENT 'シチュエーション名',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY card_info(user_id)
    --     REFERENCES user_info(user_id),
    -- FOREIGN KEY card_info(situation_id)
    --     REFERENCES situation(situation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='カード情報';

CREATE TABLE `frame_design` (
    `frame_id` int(4) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'フレームID',
    `situation_id` int(4) COMMENT 'シチュエーションID',
    `frame_name` varchar(11) DEFAULT '' COMMENT 'フレーム名',
    `frame_path` varchar(11) DEFAULT '' COMMENT '格納場所',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY(situation_id)
    --     REFERENCES situation(situation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='フレームデザイン情報';

CREATE TABLE `frame_user_daata` (
    `frame_user_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'ユーザーフレームID',
    `card_id` int(10) COMMENT 'カードID',
    `frame_id` int(4) COMMENT 'フレームID',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY(card_id)
    --     REFERENCES card_info(card_id)
    -- FOREIGN KEY(frame_id)
    --     REFERENCES frame_design(frame_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ユーザーが選んだフレーム情報';

CREATE TABLE `photo_user_daata` (
    `photo_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '写真ID',
    `card_id` int(10) COMMENT 'カードID',
    `photo_path` varchar(11) DEFAULT '' COMMENT '格納場所',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY(card_id)
    --     REFERENCES card_info(card_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='写真情報';

CREATE TABLE `fixed_phrase` (
    `fixed_phrase_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '定型文ID',
    `card_id` int(10) COMMENT 'カードID',
    `situation_id` int(4) COMMENT 'シチュエーションID',
    `phrase` varchar(11) DEFAULT '' COMMENT '定型文',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY(card_id)
    --     REFERENCES card_info(card_id)
    -- FOREIGN KEY(situation_id)
    --     REFERENCES situation(situation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定型文情報';

CREATE TABLE `text_user_data` (
    `text_id` int(10) UNSIGNED ZEROFILL NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'テキストID',
    `card_id` int(10) COMMENT 'カードID',
    `text` varchar(11) DEFAULT '' COMMENT 'メッセージ',
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '作成日時',
    `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日時'
    -- FOREIGN KEY(card_id)
    --     REFERENCES card_info(card_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='メッセージ情報';