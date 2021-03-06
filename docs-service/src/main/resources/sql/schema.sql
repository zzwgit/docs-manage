DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL COMMENT '用户名',
  `email` VARCHAR(100) DEFAULT '' COMMENT '邮箱',
  `password` VARCHAR(64) DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户表';

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(100) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色表';

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` INT NOT NULL COMMENT '用户ID',
  `role_id` INT NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户-角色表';

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `owner_id` INT NOT NULL COMMENT '创建者ID',
  `name` VARCHAR(40) NOT NULL COMMENT '项目名称',
  `description` VARCHAR(255) DEFAULT '' COMMENT '项目描述',
  `visit_code` VARCHAR(64) DEFAULT '' COMMENT '访问码',
  `created_at` DATETIME NOT NULL COMMENT '创建时间',
  `updated_at` DATETIME DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目表';

DROP TABLE IF EXISTS `directory`;
CREATE TABLE `directory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL COMMENT '目录所属项目ID',
  `parent_id` INT DEFAULT 0 COMMENT '父级目录ID',
  `name` VARCHAR(100) NOT NULL COMMENT '目录名称',
  `sort_code` INT DEFAULT 0 COMMENT '排序码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '文档目录表';

DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `directory_id` INT NOT NULL COMMENT '所在目录ID',
  `name` VARCHAR(100) NOT NULL COMMENT '文档名称',
  `content` TEXT DEFAULT NULL COMMENT '文档内容',
  `sort_code` INT DEFAULT 0 COMMENT '排序码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '文档表';

DROP TABLE IF EXISTS `document_history`;
CREATE TABLE `document_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `document_id` INT NOT NULL COMMENT '原文档ID',
  `content` TEXT DEFAULT NULL COMMENT '历史文档内容',
  `saved_time` DATETIME NOT NULL COMMENT '保存时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '文档历史纪录表';
