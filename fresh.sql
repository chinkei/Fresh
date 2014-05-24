--
-- 用户表
--
DROP TABLE IF EXISTS `fh_user`;
CREATE TABLE `fh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` char(16) NOT NULL COMMENT '用户名',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `invite_from_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '来自邀请用户',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `phone` char(16) NOT NULL DEFAULT '' COMMENT '电话号码',
  `role_id` int(11) NOT NULL DEFAULT '1' COMMENT '角色ID',
  `area_id` int(11) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `path` char(32) NOT NULL DEFAULT '' COMMENT '头像路径',
  `face` char(64) NOT NULL DEFAULT '' COMMENT '会员头像',
  `signed` char(64) NOT NULL DEFAULT '' COMMENT '签名',
  `blog` char(32) NOT NULL DEFAULT '' COMMENT '博客',
  `about` char(255) NOT NULL DEFAULT '' COMMENT '关于我',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登陆IP',
  `address` char(64) NOT NULL DEFAULT '',
  `count_login` int(11) NOT NULL DEFAULT '0' COMMENT '统计登录次数',
  `count_score` int(11) NOT NULL DEFAULT '0' COMMENT '统计积分',
  `count_follow` int(11) NOT NULL DEFAULT '0' COMMENT '统计用户跟随的',
  `count_followed` int(11) NOT NULL DEFAULT '0' COMMENT '统计用户被跟随的',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0启用1禁用',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  `is_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未验证1验证',
  `verify_code` char(11) NOT NULL DEFAULT '' COMMENT '验证码',
  `reset_pwd` char(32) NOT NULL DEFAULT '' COMMENT '重设密码',
  `reset_code` char(32) NOT NULL DEFAULT '' COMMENT '重设验证码',
  `reset_valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '重设验证时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登陆时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1;

--
-- 小组表
--
DROP TABLE IF EXISTS `fh_group`;
CREATE TABLE `fh_group` (
	`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小组ID',
	`user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
	`cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
	`group_name` char(32) NOT NULL DEFAULT '' COMMENT '群组名字',
	`group_desc` text NOT NULL COMMENT '小组介绍',
	`group_icon` char(255) DEFAULT '' COMMENT '小组图标',
	`count_topic_today` int(11) NOT NULL DEFAULT '0' COMMENT '统计今天发帖',
	`count_topic` int(11) NOT NULL DEFAULT '0' COMMENT '帖子统计',
	`count_user` int(11) NOT NULL DEFAULT '0' COMMENT '小组成员数',
	`role_name_user` char(32) NOT NULL DEFAULT '成员' COMMENT '成员角色名称',
	`is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
	`is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开或者私密',
	`is_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
	`is_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许会员发帖',
	`create_time` int(11) DEFAULT '0' COMMENT '创建时间',
	`update_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
	PRIMARY KEY (`id`),
	KEY `user_id` (`user_id`),
	KEY `group_name` (`group_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- 小组设置表
--
DROP TABLE IF EXISTS `fh_group_setting`;
CREATE TABLE `fh_group_setting` (
  `key` char(32) NOT NULL DEFAULT '' COMMENT '选项名字',
  `data` char(255) NOT NULL DEFAULT '' COMMENT '选项内容',
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `fh_group_setting` (`key`, `data`) VALUES
	('IS_CREATE', '0'),
	('MAX_JOIN', '50'),
	('GROUP_IS_AUDIT', '0'),
	('TOPIC_IS_AUDIT', '0');

--
-- 小组分类表
--
DROP TABLE IF EXISTS `fh_group_category`;
CREATE TABLE `fh_group_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `category_name` char(32) NOT NULL DEFAULT '' COMMENT '分类名称',
  `sort_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_name` (`category_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- 小组话题表
--
DROP TABLE IF EXISTS `fh_group_topics`;
CREATE TABLE `fh_group_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '小组ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(64) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `count_comment` int(11) NOT NULL DEFAULT '0' COMMENT '回复统计',
  `count_view` int(11) NOT NULL DEFAULT '0' COMMENT '帖子展示数',
  `count_collect` int(11) NOT NULL DEFAULT '0' COMMENT '喜欢收藏数',
  `count_attach` int(11) NOT NULL DEFAULT '0' COMMENT '统计附件',
  `count_recommend` int(11) NOT NULL DEFAULT '0' COMMENT '推荐人数',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `is_audit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许评论',
  `is_notice` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通知',
  `is_digest` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精华帖子',
  `has_video` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有视频',
  `has_photo` tinyint(1) NOT NULL DEFAULT '0',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 小组话题收藏表
--
DROP TABLE IF EXISTS `fh_group_topics_collects`;
CREATE TABLE `fh_group_topics_collects` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '收藏时间',
  UNIQUE KEY `id_user_topic` (`user_id`,`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 小组话题推荐表
--
DROP TABLE IF EXISTS `fh_group_topics_recommend`;
CREATE TABLE `fh_group_topics_recommend` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `content` char(250) NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '推荐时间',
  UNIQUE KEY `id_user_topic` (`user_id`,`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 小组用户表
--
DROP TABLE IF EXISTS `fh_group_users`;
CREATE TABLE `fh_group_users` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '群组ID',
  `is_admin` int(11) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '加入时间',
  UNIQUE KEY `id_user_topic` (`user_id`,`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 表的结构 `ik_message`
--
DROP TABLE IF EXISTS `fh_message`;
CREATE TABLE `fh_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '发送用户ID',
  `to_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '接收消息的用户ID',
  `title` char(64) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `is_spam` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否垃圾邮件',
  `is_inbox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在收件箱显示',
  `is_outbox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在发件箱显示',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`messageid`),
  KEY `to_user_id` (`to_user_id`,`is_read`),
  KEY `user_id` (`user_id`,`to_user_id`,`is_read`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短消息表' AUTO_INCREMENT=1 ;

--
-- 群组帖子评论表
--
DROP TABLE IF EXISTS `fh_group_topics_comments`;

CREATE TABLE `fh_group_topics_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_time`  int(11) DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 评论评价表
--
DROP TABLE IF EXISTS `fh_base_comment_rate`;

CREATE TABLE `fh_base_comment_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_type` varchar(30) NOT NULL DEFAULT '',
  `comment_id` int(11) NOT NULL DEFAULT '0',
  `rate` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在发件箱显示',
  `created_time`  int(11) DEFAULT '0' COMMENT '回复时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `comment_id` (`comment_type`, `comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 地区表
--
DROP TABLE IF EXISTS `fh_base_area`;
CREATE TABLE `fh_base_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '地域id－父id',
  `name` varchar(50) NOT NULL DEFAULT '0' COMMENT '地域名称',
  `name_path` varchar(256) NOT NULL DEFAULT '0' COMMENT '地域名字路径',
  `path` varchar(256) NOT NULL DEFAULT '0' COMMENT '地域ID路径',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '级别标识，暂不用',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标识，1－正常；0－删除',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) ,
  KEY `level` (`level`),
  KEY `name` (`name`) 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('1','0','北京市',',北京市,',',1,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('336','0','天津市',',天津市,',',336,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('598','0','河北省',',河北省,',',598,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2995','0','山西省',',山西省,',',2995,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4527','0','内蒙古',',内蒙古,',',4527,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5953','0','辽宁省',',辽宁省,',',5953,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7574','0','吉林省',',吉林省,',',7574,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8530','0','黑龙江',',黑龙江,',',8530,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10132','0','上海市',',上海市,',',10132,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10367','0','江苏省',',江苏省,',',10367,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11922','0','浙江省',',浙江省,',',11922,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13540','0','安徽省',',安徽省,',',13540,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15288','0','福建省',',福建省,',',15288,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16493','0','江西省',',江西省,',',16493,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18175','0','山东省',',山东省,',',18175,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20268','0','河南省',',河南省,',',20268,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22802','0','湖北省',',湖北省,',',22802,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24148','0','湖南省',',湖南省,',',24148,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26695','0','广东省',',广东省,',',26695,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28430','0','广西省',',广西省,',',28430,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29874','0','海南省',',海南省,',',29874,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30137','0','重庆市',',重庆市,',',30137,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31098','0','四川省',',四川省,',',31098,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('35946','0','贵州省',',贵州省,',',35946,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37586','0','云南省',',云南省,',',37586,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39002','0','西藏',',西藏,',',39002,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39767','0','陕西省',',陕西省,',',39767,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41628','0','甘肃省',',甘肃省,',',41628,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43132','0','青海省',',青海省,',',43132,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43585','0','宁夏',',宁夏,',',43585,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43853','0','新疆',',新疆,',',43853,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44973','0','台湾',',台湾,',',44973,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45364','0','香港',',香港,',',45364,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45383','0','澳门',',澳门,',',45383,','1','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2','1','东城区',',北京市,东城区,',',1,2,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13','1','西城区',',北京市,西城区,',',1,13,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21','1','崇文区',',北京市,崇文区,',',1,21,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29','1','宣武区',',北京市,宣武区,',',1,29,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38','1','朝阳区',',北京市,朝阳区,',',1,38,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('82','1','丰台区',',北京市,丰台区,',',1,82,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('104','1','石景山区',',北京市,石景山区,',',1,104,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('115','1','海淀区',',北京市,海淀区,',',1,115,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('145','1','门头沟区',',北京市,门头沟区,',',1,145,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('159','1','房山区',',北京市,房山区,',',1,159,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('188','1','通州区',',北京市,通州区,',',1,188,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('204','1','顺义区',',北京市,顺义区,',',1,204,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('227','1','昌平区',',北京市,昌平区,',',1,227,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('245','1','大兴区',',北京市,大兴区,',',1,245,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('263','1','怀柔区',',北京市,怀柔区,',',1,263,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('280','1','平谷区',',北京市,平谷区,',',1,280,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('299','1','密云县',',北京市,密云县,',',1,299,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('320','1','延庆县',',北京市,延庆县,',',1,320,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('337','336','和平区',',天津市,和平区,',',336,337,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('344','336','河东区',',天津市,河东区,',',336,344,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('358','336','河西区',',天津市,河西区,',',336,358,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('372','336','南开区',',天津市,南开区,',',336,372,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('385','336','河北区',',天津市,河北区,',',336,385,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('396','336','红桥区',',天津市,红桥区,',',336,396,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('407','336','塘沽区',',天津市,塘沽区,',',336,407,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('420','336','汉沽区',',天津市,汉沽区,',',336,420,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('430','336','大港区',',天津市,大港区,',',336,430,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('439','336','东丽区',',天津市,东丽区,',',336,439,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('449','336','西青区',',天津市,西青区,',',336,449,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('459','336','津南区',',天津市,津南区,',',336,459,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('469','336','北辰区',',天津市,北辰区,',',336,469,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('482','336','武清区',',天津市,武清区,',',336,482,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('513','336','宝坻区',',天津市,宝坻区,',',336,513,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('536','336','宁河县',',天津市,宁河县,',',336,536,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('551','336','静海县',',天津市,静海县,',',336,551,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('570','336','蓟县',',天津市,蓟县,',',336,570,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('599','598','石家庄市',',河北省,石家庄市,',',598,599,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('896','598','唐山市',',河北省,唐山市,',',598,896,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('1136','598','秦皇岛市',',河北省,秦皇岛市,',',598,1136,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('1237','598','邯郸市',',河北省,邯郸市,',',598,1237,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('1498','598','邢台市',',河北省,邢台市,',',598,1498,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('1712','598','保定市',',河北省,保定市,',',598,1712,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2078','598','张家口市',',河北省,张家口市,',',598,2078,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2327','598','承德市',',河北省,承德市,',',598,2327,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2551','598','衡水市',',河北省,衡水市,',',598,2551,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2681','598','廊坊市',',河北省,廊坊市,',',598,2681,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2788','598','沧州市',',河北省,沧州市,',',598,2788,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('2996','2995','太原市',',山西省,太原市,',',2995,2996,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3111','2995','大同市',',山西省,大同市,',',2995,3111,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3260','2995','阳泉市',',山西省,阳泉市,',',2995,3260,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3310','2995','长治市',',山西省,长治市,',',2995,3310,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3470','2995','晋城市',',山西省,晋城市,',',2995,3470,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3562','2995','朔州市',',山西省,朔州市,',',2995,3562,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3643','2995','晋中市',',山西省,晋中市,',',2995,3643,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3787','2995','运城市',',山西省,运城市,',',2995,3787,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('3954','2995','忻州市',',山西省,忻州市,',',2995,3954,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4160','2995','临汾市',',山西省,临汾市,',',2995,4160,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4349','2995','吕梁市',',山西省,吕梁市,',',2995,4349,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4528','4527','呼和浩特市',',内蒙古,呼和浩特市,',',4527,4528,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4641','4527','包头市',',内蒙古,包头市,',',4527,4641,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4754','4527','乌海市',',内蒙古,乌海市,',',4527,4754,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('4778','4527','赤峰市',',内蒙古,赤峰市,',',4527,4778,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5031','4527','通辽市',',内蒙古,通辽市,',',4527,5031,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5205','4527','鄂尔多斯市',',内蒙古,鄂尔多斯市,',',4527,5205,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5311','4527','呼伦贝尔市',',内蒙古,呼伦贝尔市,',',4527,5311,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5453','4527','巴彦淖尔市',',内蒙古,巴彦淖尔市,',',4527,5453,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5587','4527','乌兰察布市',',内蒙古,乌兰察布市,',',4527,5587,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5761','4527','兴安盟',',内蒙古,兴安盟,',',4527,5761,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5853','4527','锡林郭勒盟',',内蒙古,锡林郭勒盟,',',4527,5853,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5927','4527','阿拉善盟',',内蒙古,阿拉善盟,',',4527,5927,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('5954','5953','沈阳市',',辽宁省,沈阳市,',',5953,5954,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6208','5953','大连市',',辽宁省,大连市,',',5953,6208,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6379','5953','鞍山市',',辽宁省,鞍山市,',',5953,6379,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6491','5953','抚顺市',',辽宁省,抚顺市,',',5953,6491,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6580','5953','本溪市',',辽宁省,本溪市,',',5953,6580,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6644','5953','丹东市',',辽宁省,丹东市,',',5953,6644,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6737','5953','锦州市',',辽宁省,锦州市,',',5953,6737,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6860','5953','营口市',',辽宁省,营口市,',',5953,6860,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('6939','5953','阜新市',',辽宁省,阜新市,',',5953,6939,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7041','5953','辽阳市',',辽宁省,辽阳市,',',5953,7041,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7109','5953','盘锦市',',辽宁省,盘锦市,',',5953,7109,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7170','5953','铁岭市',',辽宁省,铁岭市,',',5953,7170,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7280','5953','朝阳市',',辽宁省,朝阳市,',',5953,7280,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7439','5953','葫芦岛市',',辽宁省,葫芦岛市,',',5953,7439,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7575','7574','长春市',',吉林省,长春市,',',7574,7575,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7745','7574','吉林市',',吉林省,吉林市,',',7574,7745,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('7911','7574','四平市',',吉林省,四平市,',',7574,7911,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8011','7574','辽源市',',吉林省,辽源市,',',7574,8011,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8058','7574','通化市',',吉林省,通化市,',',7574,8058,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8160','7574','白山市',',吉林省,白山市,',',7574,8160,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8232','7574','松原市',',吉林省,松原市,',',7574,8232,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8317','7574','白城市',',吉林省,白城市,',',7574,8317,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8430','7574','延边朝鲜族自治州',',吉林省,延边朝鲜族自治州,',',7574,8430,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8531','8530','哈尔滨市',',黑龙江,哈尔滨市,',',8530,8531,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('8826','8530','齐齐哈尔市',',黑龙江,齐齐哈尔市,',',8530,8826,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9004','8530','鸡西市',',黑龙江,鸡西市,',',8530,9004,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9090','8530','鹤岗市',',黑龙江,鹤岗市,',',8530,9090,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9150','8530','双鸭山市',',黑龙江,双鸭山市,',',8530,9150,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9237','8530','大庆市',',黑龙江,大庆市,',',8530,9237,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9338','8530','伊春市',',黑龙江,伊春市,',',8530,9338,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9542','8530','佳木斯市',',黑龙江,佳木斯市,',',8530,9542,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9657','8530','七台河市',',黑龙江,七台河市,',',8530,9657,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9703','8530','牡丹江市',',黑龙江,牡丹江市,',',8530,9703,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9800','8530','黑河市',',黑龙江,黑河市,',',8530,9800,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('9886','8530','绥化市',',黑龙江,绥化市,',',8530,9886,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10080','8530','大兴安岭地区',',黑龙江,大兴安岭地区,',',8530,10080,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10133','10132','黄浦区',',上海市,黄浦区,',',10132,10133,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10140','10132','卢湾区',',上海市,卢湾区,',',10132,10140,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10145','10132','徐汇区',',上海市,徐汇区,',',10132,10145,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10159','10132','长宁区',',上海市,长宁区,',',10132,10159,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10170','10132','静安区',',上海市,静安区,',',10132,10170,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10176','10132','普陀区',',上海市,普陀区,',',10132,10176,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10186','10132','闸北区',',上海市,闸北区,',',10132,10186,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10196','10132','虹口区',',上海市,虹口区,',',10132,10196,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10207','10132','杨浦区',',上海市,杨浦区,',',10132,10207,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10220','10132','闵行区',',上海市,闵行区,',',10132,10220,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10233','10132','宝山区',',上海市,宝山区,',',10132,10233,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10246','10132','嘉定区',',上海市,嘉定区,',',10132,10246,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10260','10132','浦东新区',',上海市,浦东新区,',',10132,10260,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10284','10132','金山区',',上海市,金山区,',',10132,10284,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10295','10132','松江区',',上海市,松江区,',',10132,10295,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10314','10132','青浦区',',上海市,青浦区,',',10132,10314,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10326','10132','南汇区',',上海市,南汇区,',',10132,10326,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10341','10132','奉贤区',',上海市,奉贤区,',',10132,10341,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10350','10132','崇明县',',上海市,崇明县,',',10132,10350,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10368','10367','南京市',',江苏省,南京市,',',10367,10368,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10504','10367','无锡市',',江苏省,无锡市,',',10367,10504,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10595','10367','徐州市',',江苏省,徐州市,',',10367,10595,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10768','10367','常州市',',江苏省,常州市,',',10367,10768,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10834','10367','苏州市',',江苏省,苏州市,',',10367,10834,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('10945','10367','南通市',',江苏省,南通市,',',10367,10945,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11089','10367','连云港市',',江苏省,连云港市,',',10367,11089,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11207','10367','淮安市',',江苏省,淮安市,',',10367,11207,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11364','10367','盐城市',',江苏省,盐城市,',',10367,11364,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11535','10367','扬州市',',江苏省,扬州市,',',10367,11535,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11631','10367','镇江市',',江苏省,镇江市,',',10367,11631,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11690','10367','泰州市',',江苏省,泰州市,',',10367,11690,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11802','10367','宿迁市',',江苏省,宿迁市,',',10367,11802,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('11923','11922','杭州市',',浙江省,杭州市,',',11922,11923,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12136','11922','宁波市',',浙江省,宁波市,',',11922,12136,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12293','11922','温州市',',浙江省,温州市,',',11922,12293,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12597','11922','嘉兴市',',浙江省,嘉兴市,',',11922,12597,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12679','11922','湖州市',',浙江省,湖州市,',',11922,12679,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12752','11922','绍兴市',',浙江省,绍兴市,',',11922,12752,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12876','11922','舟山市',',浙江省,舟山市,',',11922,12876,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('12925','11922','衢州市',',浙江省,衢州市,',',11922,12925,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13038','11922','金华市',',浙江省,金华市,',',11922,13038,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13199','11922','台州市',',浙江省,台州市,',',11922,13199,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13340','11922','丽水市',',浙江省,丽水市,',',11922,13340,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13541','13540','合肥市',',安徽省,合肥市,',',13540,13541,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13643','13540','芜湖市',',安徽省,芜湖市,',',13540,13643,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13701','13540','蚌埠市',',安徽省,蚌埠市,',',13540,13701,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13784','13540','淮南市',',安徽省,淮南市,',',13540,13784,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13857','13540','马鞍山市',',安徽省,马鞍山市,',',13540,13857,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13893','13540','淮北市',',安徽省,淮北市,',',13540,13893,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13930','13540','铜陵市',',安徽省,铜陵市,',',13540,13930,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('13960','13540','安庆市',',安徽省,安庆市,',',13540,13960,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14156','13540','黄山市',',安徽省,黄山市,',',13540,14156,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14271','13540','滁州市',',安徽省,滁州市,',',13540,14271,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14460','13540','阜阳市',',安徽省,阜阳市,',',13540,14460,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14645','13540','宿州市',',安徽省,宿州市,',',13540,14645,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14758','13540','巢湖市',',安徽省,巢湖市,',',13540,14758,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('14840','13540','六安市',',安徽省,六安市,',',13540,14840,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15017','13540','亳州市',',安徽省,亳州市,',',13540,15017,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15123','13540','池州市',',安徽省,池州市,',',13540,15123,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15181','13540','宣城市',',安徽省,宣城市,',',13540,15181,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15289','15288','福州市',',福建省,福州市,',',15288,15289,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15485','15288','厦门市',',福建省,厦门市,',',15288,15485,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15549','15288','莆田市',',福建省,莆田市,',',15288,15549,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15606','15288','三明市',',福建省,三明市,',',15288,15606,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15755','15288','泉州市',',福建省,泉州市,',',15288,15755,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('15931','15288','漳州市',',福建省,漳州市,',',15288,15931,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16078','15288','南平市',',福建省,南平市,',',15288,16078,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16225','15288','龙岩市',',福建省,龙岩市,',',15288,16225,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16363','15288','宁德市',',福建省,宁德市,',',15288,16363,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16494','16493','南昌市',',江西省,南昌市,',',16493,16494,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16614','16493','景德镇市',',江西省,景德镇市,',',16493,16614,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16673','16493','萍乡市',',江西省,萍乡市,',',16493,16673,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16731','16493','九江市',',江西省,九江市,',',16493,16731,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16945','16493','新余市',',江西省,新余市,',',16493,16945,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('16983','16493','鹰潭市',',江西省,鹰潭市,',',16493,16983,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('17029','16493','赣州市',',江西省,赣州市,',',16493,17029,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('17338','16493','吉安市',',江西省,吉安市,',',16493,17338,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('17573','16493','宜春市',',江西省,宜春市,',',16493,17573,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('17767','16493','抚州市',',江西省,抚州市,',',16493,17767,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('17937','16493','上饶市',',江西省,上饶市,',',16493,17937,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18176','18175','济南市',',山东省,济南市,',',18175,18176,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18322','18175','青岛市',',山东省,青岛市,',',18175,18322,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18510','18175','淄博市',',山东省,淄博市,',',18175,18510,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18626','18175','枣庄市',',山东省,枣庄市,',',18175,18626,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18696','18175','东营市',',山东省,东营市,',',18175,18696,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18748','18175','烟台市',',山东省,烟台市,',',18175,18748,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('18909','18175','潍坊市',',山东省,潍坊市,',',18175,18909,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19110','18175','济宁市',',山东省,济宁市,',',18175,19110,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19278','18175','泰安市',',山东省,泰安市,',',18175,19278,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19371','18175','威海市',',山东省,威海市,',',18175,19371,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19447','18175','日照市',',山东省,日照市,',',18175,19447,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19506','18175','莱芜市',',山东省,莱芜市,',',18175,19506,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19528','18175','临沂市',',山东省,临沂市,',',18175,19528,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19721','18175','德州市',',山东省,德州市,',',18175,19721,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('19858','18175','聊城市',',山东省,聊城市,',',18175,19858,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20004','18175','滨州市',',山东省,滨州市,',',18175,20004,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20097','18175','菏泽市',',山东省,菏泽市,',',18175,20097,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20269','20268','郑州市',',河南省,郑州市,',',20268,20269,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20452','20268','开封市',',河南省,开封市,',',20268,20452,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20577','20268','洛阳市',',河南省,洛阳市,',',20268,20577,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20775','20268','平顶山市',',河南省,平顶山市,',',20268,20775,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('20916','20268','安阳市',',河南省,安阳市,',',20268,20916,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21058','20268','鹤壁市',',河南省,鹤壁市,',',20268,21058,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21102','20268','新乡市',',河南省,新乡市,',',20268,21102,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21264','20268','焦作市',',河南省,焦作市,',',20268,21264,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21379','20268','濮阳市',',河南省,濮阳市,',',20268,21379,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21470','20268','许昌市',',河南省,许昌市,',',20268,21470,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21575','20268','漯河市',',河南省,漯河市,',',20268,21575,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21636','20268','三门峡市',',河南省,三门峡市,',',20268,21636,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21718','20268','南阳市',',河南省,南阳市,',',20268,21718,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('21964','20268','商丘市',',河南省,商丘市,',',20268,21964,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22163','20268','信阳市',',河南省,信阳市,',',20268,22163,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22375','20268','周口市',',河南省,周口市,',',20268,22375,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22582','20268','驻马店市',',河南省,驻马店市,',',20268,22582,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22784','20268','济源市',',河南省,济源市,',',20268,22784,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22803','22802','武汉市',',湖北省,武汉市,',',22802,22803,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('22973','22802','黄石市',',湖北省,黄石市,',',22802,22973,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23028','22802','十堰市',',湖北省,十堰市,',',22802,23028,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23153','22802','宜昌市',',湖北省,宜昌市,',',22802,23153,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23274','22802','襄樊市',',湖北省,襄樊市,',',22802,23274,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23384','22802','鄂州市',',湖北省,鄂州市,',',22802,23384,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23411','22802','荆门市',',湖北省,荆门市,',',22802,23411,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23474','22802','孝感市',',湖北省,孝感市,',',22802,23474,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23589','22802','荆州市',',湖北省,荆州市,',',22802,23589,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23714','22802','黄冈市',',湖北省,黄冈市,',',22802,23714,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23855','22802','咸宁市',',湖北省,咸宁市,',',22802,23855,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23932','22802','随州市',',湖北省,随州市,',',22802,23932,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('23978','22802','恩施土家族苗族自治州',',湖北省,恩施土家族苗族自治州,',',22802,23978,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24074','22802','仙桃市',',湖北省,仙桃市,',',22802,24074,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24094','22802','潜江市',',湖北省,潜江市,',',22802,24094,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24111','22802','天门市',',湖北省,天门市,',',22802,24111,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24138','22802','神农架林区',',湖北省,神农架林区,',',22802,24138,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24149','24148','长沙市',',湖南省,长沙市,',',24148,24149,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24325','24148','株洲市',',湖南省,株洲市,',',24148,24325,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24468','24148','湘潭市',',湖南省,湘潭市,',',24148,24468,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24555','24148','衡阳市',',湖南省,衡阳市,',',24148,24555,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('24780','24148','邵阳市',',湖南省,邵阳市,',',24148,24780,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25007','24148','岳阳市',',湖南省,岳阳市,',',24148,25007,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25201','24148','常德市',',湖南省,常德市,',',24148,25201,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25428','24148','张家界市',',湖南省,张家界市,',',24148,25428,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25534','24148','益阳市',',湖南省,益阳市,',',24148,25534,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25635','24148','郴州市',',湖南省,郴州市,',',24148,25635,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('25904','24148','永州市',',湖南省,永州市,',',24148,25904,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26114','24148','怀化市',',湖南省,怀化市,',',24148,26114,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26423','24148','娄底市',',湖南省,娄底市,',',24148,26423,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26521','24148','湘西土家族苗族自治州',',湖南省,湘西土家族苗族自治州,',',24148,26521,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26696','26695','广州市',',广东省,广州市,',',26695,26696,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26874','26695','韶关市',',广东省,韶关市,',',26695,26874,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('26996','26695','深圳市',',广东省,深圳市,',',26695,26996,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27058','26695','珠海市',',广东省,珠海市,',',26695,27058,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27085','26695','汕头市',',广东省,汕头市,',',26695,27085,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27162','26695','佛山市',',广东省,佛山市,',',26695,27162,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27198','26695','江门市',',广东省,江门市,',',26695,27198,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27287','26695','湛江市',',广东省,湛江市,',',26695,27287,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27418','26695','茂名市',',广东省,茂名市,',',26695,27418,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27532','26695','肇庆市',',广东省,肇庆市,',',26695,27532,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27649','26695','惠州市',',广东省,惠州市,',',26695,27649,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27722','26695','梅州市',',广东省,梅州市,',',26695,27722,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27841','26695','汕尾市',',广东省,汕尾市,',',26695,27841,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('27898','26695','河源市',',广东省,河源市,',',26695,27898,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28007','26695','阳江市',',广东省,阳江市,',',26695,28007,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28062','26695','清远市',',广东省,清远市,',',26695,28062,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28156','26695','东莞市',',广东省,东莞市,',',26695,28156,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28190','26695','中山市',',广东省,中山市,',',26695,28190,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28216','26695','潮州市',',广东省,潮州市,',',26695,28216,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28270','26695','揭阳市',',广东省,揭阳市,',',26695,28270,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28359','26695','云浮市',',广东省,云浮市,',',26695,28359,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28431','28430','南宁市',',广西省,南宁市,',',28430,28431,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28567','28430','柳州市',',广西省,柳州市,',',28430,28567,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28695','28430','桂林市',',广西省,桂林市,',',28430,28695,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28858','28430','梧州市',',广西省,梧州市,',',28430,28858,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28937','28430','北海市',',广西省,北海市,',',28430,28937,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('28974','28430','防城港市',',广西省,防城港市,',',28430,28974,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29007','28430','钦州市',',广西省,钦州市,',',28430,29007,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29077','28430','贵港市',',广西省,贵港市,',',28430,29077,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29169','28430','玉林市',',广西省,玉林市,',',28430,29169,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29286','28430','百色市',',广西省,百色市,',',28430,29286,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29470','28430','贺州市',',广西省,贺州市,',',28430,29470,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29537','28430','河池市',',广西省,河池市,',',28430,29537,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29709','28430','来宾市',',广西省,来宾市,',',28430,29709,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29788','28430','崇左市',',广西省,崇左市,',',28430,29788,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29875','29874','海口市',',海南省,海口市,',',29874,29875,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29921','29874','三亚市',',海南省,三亚市,',',29874,29921,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29930','29874','五指山市',',海南省,五指山市,',',29874,29930,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29939','29874','琼海市',',海南省,琼海市,',',29874,29939,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29953','29874','儋州市',',海南省,儋州市,',',29874,29953,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29972','29874','文昌市',',海南省,文昌市,',',29874,29972,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('29990','29874','万宁市',',海南省,万宁市,',',29874,29990,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30004','29874','东方市',',海南省,东方市,',',29874,30004,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30016','29874','定安县',',海南省,定安县,',',29874,30016,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30028','29874','屯昌县',',海南省,屯昌县,',',29874,30028,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30038','29874','澄迈县',',海南省,澄迈县,',',29874,30038,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30050','29874','临高县',',海南省,临高县,',',29874,30050,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30063','29874','白沙黎族自治县',',海南省,白沙黎族自治县,',',29874,30063,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30076','29874','昌江黎族自治县',',海南省,昌江黎族自治县,',',29874,30076,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30085','29874','乐东黎族自治县',',海南省,乐东黎族自治县,',',29874,30085,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30098','29874','陵水黎族自治县',',海南省,陵水黎族自治县,',',29874,30098,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30111','29874','保亭黎族苗族自治县',',海南省,保亭黎族苗族自治县,',',29874,30111,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30122','29874','琼中黎族苗族自治县',',海南省,琼中黎族苗族自治县,',',29874,30122,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30134','29874','西沙群岛',',海南省,西沙群岛,',',29874,30134,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30135','29874','南沙群岛',',海南省,南沙群岛,',',29874,30135,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30136','29874','中沙群岛的岛礁及其海域',',海南省,中沙群岛的岛礁及其海域,',',29874,30136,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30138','30137','万州区',',重庆市,万州区,',',30137,30138,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30191','30137','涪陵区',',重庆市,涪陵区,',',30137,30191,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30237','30137','渝中区',',重庆市,渝中区,',',30137,30237,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30250','30137','大渡口区',',重庆市,大渡口区,',',30137,30250,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30259','30137','江北区',',重庆市,江北区,',',30137,30259,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30272','30137','沙坪坝区',',重庆市,沙坪坝区,',',30137,30272,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30298','30137','九龙坡区',',重庆市,九龙坡区,',',30137,30298,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30317','30137','南岸区',',重庆市,南岸区,',',30137,30317,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30332','30137','北碚区',',重庆市,北碚区,',',30137,30332,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30350','30137','双桥区',',重庆市,双桥区,',',30137,30350,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30354','30137','万盛区',',重庆市,万盛区,',',30137,30354,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30365','30137','渝北区',',重庆市,渝北区,',',30137,30365,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30398','30137','巴南区',',重庆市,巴南区,',',30137,30398,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30420','30137','黔江区',',重庆市,黔江区,',',30137,30420,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30451','30137','长寿区',',重庆市,长寿区,',',30137,30451,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30470','30137','綦江县',',重庆市,綦江县,',',30137,30470,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30490','30137','潼南县',',重庆市,潼南县,',',30137,30490,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30513','30137','铜梁县',',重庆市,铜梁县,',',30137,30513,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30542','30137','大足县',',重庆市,大足县,',',30137,30542,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30567','30137','荣昌县',',重庆市,荣昌县,',',30137,30567,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30588','30137','璧山县',',重庆市,璧山县,',',30137,30588,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30602','30137','梁平县',',重庆市,梁平县,',',30137,30602,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30636','30137','城口县',',重庆市,城口县,',',30137,30636,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30661','30137','丰都县',',重庆市,丰都县,',',30137,30661,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30693','30137','垫江县',',重庆市,垫江县,',',30137,30693,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30719','30137','武隆县',',重庆市,武隆县,',',30137,30719,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30746','30137','忠县',',重庆市,忠县,',',30137,30746,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30775','30137','开县',',重庆市,开县,',',30137,30775,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30814','30137','云阳县',',重庆市,云阳县,',',30137,30814,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30859','30137','奉节县',',重庆市,奉节县,',',30137,30859,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30890','30137','巫山县',',重庆市,巫山县,',',30137,30890,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30917','30137','巫溪县',',重庆市,巫溪县,',',30137,30917,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30948','30137','石柱土家族自治县',',重庆市,石柱土家族自治县,',',30137,30948,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('30981','30137','秀山土家族苗族自治县',',重庆市,秀山土家族苗族自治县,',',30137,30981,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31014','30137','酉阳土家族苗族自治县',',重庆市,酉阳土家族苗族自治县,',',30137,31014,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31054','30137','彭水苗族土家族自治县',',重庆市,彭水苗族土家族自治县,',',30137,31054,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31094','30137','江津市',',重庆市,江津市,',',30137,31094,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31095','30137','合川市',',重庆市,合川市,',',30137,31095,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31096','30137','永川市',',重庆市,永川市,',',30137,31096,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31097','30137','南川市',',重庆市,南川市,',',30137,31097,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31099','31098','成都市',',四川省,成都市,',',31098,31099,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31435','31098','自贡市',',四川省,自贡市,',',31098,31435,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31549','31098','攀枝花市',',四川省,攀枝花市,',',31098,31549,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31615','31098','泸州市',',四川省,泸州市,',',31098,31615,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31763','31098','德阳市',',四川省,德阳市,',',31098,31763,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('31897','31098','绵阳市',',四川省,绵阳市,',',31098,31897,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('32202','31098','广元市',',四川省,广元市,',',31098,32202,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('32455','31098','遂宁市',',四川省,遂宁市,',',31098,32455,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('32586','31098','内江市',',四川省,内江市,',',31098,32586,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('32712','31098','乐山市',',四川省,乐山市,',',31098,32712,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('32941','31098','南充市',',四川省,南充市,',',31098,32941,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('33377','31098','眉山市',',四川省,眉山市,',',31098,33377,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('33515','31098','宜宾市',',四川省,宜宾市,',',31098,33515,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('33712','31098','广安市',',四川省,广安市,',',31098,33712,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('33899','31098','达州市',',四川省,达州市,',',31098,33899,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('34220','31098','雅安市',',四川省,雅安市,',',31098,34220,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('34382','31098','巴中市',',四川省,巴中市,',',31098,34382,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('34563','31098','资阳市',',四川省,资阳市,',',31098,34563,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('34743','31098','阿坝藏族羌族自治州',',四川省,阿坝藏族羌族自治州,',',31098,34743,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('34982','31098','甘孜藏族自治州',',四川省,甘孜藏族自治州,',',31098,34982,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('35307','31098','凉山彝族自治州',',四川省,凉山彝族自治州,',',31098,35307,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('35947','35946','贵阳市',',贵州省,贵阳市,',',35946,35947,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36077','35946','六盘水市',',贵州省,六盘水市,',',35946,36077,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36180','35946','遵义市',',贵州省,遵义市,',',35946,36180,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36435','35946','安顺市',',贵州省,安顺市,',',35946,36435,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36528','35946','铜仁地区',',贵州省,铜仁地区,',',35946,36528,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36707','35946','黔西南布依族苗族自治州',',贵州省,黔西南布依族苗族自治州,',',35946,36707,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('36846','35946','毕节地区',',贵州省,毕节地区,',',35946,36846,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37105','35946','黔东南苗族侗族自治州',',贵州省,黔东南苗族侗族自治州,',',35946,37105,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37333','35946','黔南布依族苗族自治州',',贵州省,黔南布依族苗族自治州,',',35946,37333,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37587','37586','昆明市',',云南省,昆明市,',',37586,37587,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37737','37586','曲靖市',',云南省,曲靖市,',',37586,37737,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37863','37586','玉溪市',',云南省,玉溪市,',',37586,37863,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('37953','37586','保山市',',云南省,保山市,',',37586,37953,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38035','37586','昭通市',',云南省,昭通市,',',37586,38035,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38189','37586','丽江市',',云南省,丽江市,',',37586,38189,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38258','37586','思茅市',',云南省,思茅市,',',37586,38258,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38259','37586','临沧市',',云南省,临沧市,',',37586,38259,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38351','37586','楚雄彝族自治州',',云南省,楚雄彝族自治州,',',37586,38351,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38465','37586','红河哈尼族彝族自治州',',云南省,红河哈尼族彝族自治州,',',37586,38465,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38615','37586','文山壮族苗族自治州',',云南省,文山壮族苗族自治州,',',37586,38615,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38732','37586','西双版纳傣族自治州',',云南省,西双版纳傣族自治州,',',37586,38732,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38777','37586','大理白族自治州',',云南省,大理白族自治州,',',37586,38777,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38909','37586','德宏傣族景颇族自治州',',云南省,德宏傣族景颇族自治州,',',37586,38909,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38968','37586','怒江傈僳族自治州',',云南省,怒江傈僳族自治州,',',37586,38968,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('38969','37586','迪庆藏族自治州',',云南省,迪庆藏族自治州,',',37586,38969,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39003','39002','拉萨市',',西藏,拉萨市,',',39002,39003,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39076','39002','昌都地区',',西藏,昌都地区,',',39002,39076,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39226','39002','山南地区',',西藏,山南地区,',',39002,39226,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39321','39002','日喀则地区',',西藏,日喀则地区,',',39002,39321,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39542','39002','那曲地区',',西藏,那曲地区,',',39002,39542,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39660','39002','阿里地区',',西藏,阿里地区,',',39002,39660,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39704','39002','林芝地区',',西藏,林芝地区,',',39002,39704,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39768','39767','西安市',',陕西省,西安市,',',39767,39768,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('39958','39767','铜川市',',陕西省,铜川市,',',39767,39958,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('40006','39767','宝鸡市',',陕西省,宝鸡市,',',39767,40006,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('40169','39767','咸阳市',',陕西省,咸阳市,',',39767,40169,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('40371','39767','渭南市',',陕西省,渭南市,',',39767,40371,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('40579','39767','延安市',',陕西省,延安市,',',39767,40579,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('40761','39767','汉中市',',陕西省,汉中市,',',39767,40761,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41007','39767','榆林市',',陕西省,榆林市,',',39767,41007,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41246','39767','安康市',',陕西省,安康市,',',39767,41246,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41457','39767','商洛市',',陕西省,商洛市,',',39767,41457,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41629','41628','兰州市',',甘肃省,兰州市,',',41628,41629,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41748','41628','嘉峪关市',',甘肃省,嘉峪关市,',',41628,41748,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41759','41628','金昌市',',甘肃省,金昌市,',',41628,41759,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41780','41628','白银市',',甘肃省,白银市,',',41628,41780,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41864','41628','天水市',',甘肃省,天水市,',',41628,41864,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('41995','41628','武威市',',甘肃省,武威市,',',41628,41995,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42101','41628','张掖市',',甘肃省,张掖市,',',41628,42101,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42176','41628','平凉市',',甘肃省,平凉市,',',41628,42176,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42295','41628','酒泉市',',甘肃省,酒泉市,',',41628,42295,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42387','41628','庆阳市',',甘肃省,庆阳市,',',41628,42387,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42530','41628','定西市',',甘肃省,定西市,',',41628,42530,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42659','41628','陇南市',',甘肃省,陇南市,',',41628,42659,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('42865','41628','临夏回族自治州',',甘肃省,临夏回族自治州,',',41628,42865,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43013','41628','甘南藏族自治州',',甘肃省,甘南藏族自治州,',',41628,43013,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43133','43132','西宁市',',青海省,西宁市,',',43132,43133,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43213','43132','海东地区',',青海省,海东地区,',',43132,43213,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43316','43132','海北藏族自治州',',青海省,海北藏族自治州,',',43132,43316,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43351','43132','黄南藏族自治州',',青海省,黄南藏族自治州,',',43132,43351,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43388','43132','海南藏族自治州',',青海省,海南藏族自治州,',',43132,43388,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43430','43132','果洛藏族自治州',',青海省,果洛藏族自治州,',',43132,43430,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43481','43132','玉树藏族自治州',',青海省,玉树藏族自治州,',',43132,43481,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43533','43132','海西蒙古族藏族自治州',',青海省,海西蒙古族藏族自治州,',',43132,43533,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43586','43585','银川市',',宁夏,银川市,',',43585,43586,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43649','43585','石嘴山市',',宁夏,石嘴山市,',',43585,43649,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43690','43585','吴忠市',',宁夏,吴忠市,',',43585,43690,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43736','43585','固原市',',宁夏,固原市,',',43585,43736,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43808','43585','中卫市',',宁夏,中卫市,',',43585,43808,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43854','43853','乌鲁木齐市',',新疆,乌鲁木齐市,',',43853,43854,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43937','43853','克拉玛依市',',新疆,克拉玛依市,',',43853,43937,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43956','43853','吐鲁番地区',',新疆,吐鲁番地区,',',43853,43956,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('43988','43853','哈密地区',',新疆,哈密地区,',',43853,43988,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44035','43853','昌吉回族自治州',',新疆,昌吉回族自治州,',',43853,44035,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44133','43853','博尔塔拉蒙古自治州',',新疆,博尔塔拉蒙古自治州,',',43853,44133,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44156','43853','巴音郭楞蒙古自治州',',新疆,巴音郭楞蒙古自治州,',',43853,44156,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44243','43853','阿克苏地区',',新疆,阿克苏地区,',',43853,44243,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44342','43853','克孜勒苏柯尔克孜自治州',',新疆,克孜勒苏柯尔克孜自治州,',',43853,44342,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44386','43853','喀什地区',',新疆,喀什地区,',',43853,44386,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44570','43853','和田地区',',新疆,和田地区,',',43853,44570,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44666','43853','伊犁哈萨克自治州',',新疆,伊犁哈萨克自治州,',',43853,44666,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44788','43853','塔城地区',',新疆,塔城地区,',',43853,44788,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44871','43853','阿勒泰地区',',新疆,阿勒泰地区,',',43853,44871,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44936','43853','石河子市',',新疆,石河子市,',',43853,44936,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44945','43853','阿拉尔市',',新疆,阿拉尔市,',',43853,44945,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44958','43853','图木舒克市',',新疆,图木舒克市,',',43853,44958,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44966','43853','五家渠市',',新疆,五家渠市,',',43853,44966,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44974','44973','台北市',',台湾,台北市,',',44973,44974,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('44987','44973','新北市',',台湾,新北市,',',44973,44987,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45017','44973','台中市',',台湾,台中市,',',44973,45017,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45047','44973','台南市',',台湾,台南市,',',44973,45047,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45085','44973','高雄市',',台湾,高雄市,',',44973,45085,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45124','44973','基隆市',',台湾,基隆市,',',44973,45124,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45132','44973','新竹市',',台湾,新竹市,',',44973,45132,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45136','44973','嘉义市',',台湾,嘉义市,',',44973,45136,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45139','44973','桃园县',',台湾,桃园县,',',44973,45139,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45153','44973','新竹县',',台湾,新竹县,',',44973,45153,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45167','44973','苗栗县',',台湾,苗栗县,',',44973,45167,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45186','44973','彰化县',',台湾,彰化县,',',44973,45186,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45213','44973','南投县',',台湾,南投县,',',44973,45213,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45227','44973','云林县',',台湾,云林县,',',44973,45227,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45248','44973','嘉义县',',台湾,嘉义县,',',44973,45248,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45267','44973','屏东县',',台湾,屏东县,',',44973,45267,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45301','44973','宜兰县',',台湾,宜兰县,',',44973,45301,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45314','44973','花莲县',',台湾,花莲县,',',44973,45314,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45328','44973','台东县',',台湾,台东县,',',44973,45328,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45345','44973','澎湖县',',台湾,澎湖县,',',44973,45345,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45352','44973','金门县',',台湾,金门县,',',44973,45352,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45359','44973','连江县',',台湾,连江县,',',44973,45359,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45365','45364','中西区',',香港,中西区,',',45364,45365,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45366','45364','东区',',香港,东区,',',45364,45366,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45367','45364','九龙城区',',香港,九龙城区,',',45364,45367,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45368','45364','观塘区',',香港,观塘区,',',45364,45368,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45369','45364','南区',',香港,南区,',',45364,45369,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45370','45364','深水埗区',',香港,深水埗区,',',45364,45370,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45371','45364','黄大仙区',',香港,黄大仙区,',',45364,45371,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45372','45364','湾仔区',',香港,湾仔区,',',45364,45372,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45373','45364','油尖旺区',',香港,油尖旺区,',',45364,45373,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45374','45364','离岛区',',香港,离岛区,',',45364,45374,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45375','45364','葵青区',',香港,葵青区,',',45364,45375,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45376','45364','北区',',香港,北区,',',45364,45376,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45377','45364','西贡区',',香港,西贡区,',',45364,45377,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45378','45364','沙田区',',香港,沙田区,',',45364,45378,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45379','45364','屯门区',',香港,屯门区,',',45364,45379,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45380','45364','大埔区',',香港,大埔区,',',45364,45380,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45381','45364','荃湾区',',香港,荃湾区,',',45364,45381,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45382','45364','元朗区',',香港,元朗区,',',45364,45382,','2','1');
insert into `fh_base_area` (`id`, `parent_id`, `name`, `name_path`, `path`, `level`, `status`) values('45384','45383','澳门特别行政区',',澳门,澳门特别行政区,',',45383,45384,','2','1');
