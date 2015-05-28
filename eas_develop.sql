/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : eas_develop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-05-28 10:07:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api_class_student
-- ----------------------------
DROP TABLE IF EXISTS `api_class_student`;
CREATE TABLE `api_class_student` (
  `class_student_id` int(11) NOT NULL,
  `class_code` varchar(12) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_exam_result
-- ----------------------------
DROP TABLE IF EXISTS `api_exam_result`;
CREATE TABLE `api_exam_result` (
  `exam_result_id` int(11) NOT NULL COMMENT '主键',
  `item_id` int(11) NOT NULL COMMENT '成绩统计项id',
  `api_id` int(11) NOT NULL COMMENT '评价ID',
  `range_code` varchar(12) NOT NULL COMMENT '区域code',
  `range_name` varchar(100) NOT NULL COMMENT '区域name',
  `result_name` varchar(50) NOT NULL COMMENT '结果名称',
  `result` float NOT NULL COMMENT '统计结果',
  `result_sort` int(11) DEFAULT NULL COMMENT '结果排序',
  `subject_code` char(2) DEFAULT NULL COMMENT '科目',
  PRIMARY KEY (`exam_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_exam_student_result
-- ----------------------------
DROP TABLE IF EXISTS `api_exam_student_result`;
CREATE TABLE `api_exam_student_result` (
  `student_exam_id` int(11) NOT NULL COMMENT '主键',
  `student_id_number` char(16) NOT NULL COMMENT '学籍号',
  `item_id` int(11) NOT NULL COMMENT '统计项ID',
  `api_id` int(11) NOT NULL COMMENT '评价ID',
  `result_name` varchar(50) NOT NULL COMMENT '结果名称',
  `result` float NOT NULL COMMENT '统计结果',
  `result_sort` int(11) DEFAULT NULL COMMENT '排序',
  `subject_code` char(2) DEFAULT NULL COMMENT '科目',
  PRIMARY KEY (`student_exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_indicator_result
-- ----------------------------
DROP TABLE IF EXISTS `api_indicator_result`;
CREATE TABLE `api_indicator_result` (
  `indicator_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `indicator_id` int(11) NOT NULL COMMENT '指标id',
  `api_id` int(11) NOT NULL,
  `range_code` varchar(12) NOT NULL,
  `range_name` varchar(50) DEFAULT NULL,
  `indicator_name` varchar(50) DEFAULT NULL,
  `indicator_sort` int(11) DEFAULT NULL,
  `indicator_result` float NOT NULL,
  PRIMARY KEY (`indicator_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_indicator_student_result
-- ----------------------------
DROP TABLE IF EXISTS `api_indicator_student_result`;
CREATE TABLE `api_indicator_student_result` (
  `student_indicator_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键(统计id）',
  `student_id_number` char(16) NOT NULL COMMENT '学籍号',
  `api_id` int(11) NOT NULL COMMENT '评测id',
  `indicator_id` int(11) NOT NULL COMMENT '指标id',
  `result` float NOT NULL COMMENT '指标结果',
  `result_sort` int(11) DEFAULT NULL COMMENT '结果排序',
  `questionnare_result` float NOT NULL,
  PRIMARY KEY (`student_indicator_id`),
  KEY `FK_Reference_indicator_student_result` (`indicator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='学生一、二级指标统计结果存放表';

-- ----------------------------
-- Table structure for api_questionnaire_result
-- ----------------------------
DROP TABLE IF EXISTS `api_questionnaire_result`;
CREATE TABLE `api_questionnaire_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `type` char(2) DEFAULT NULL,
  `range_code` varchar(12) NOT NULL,
  `range_name` varchar(50) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `question_name` varchar(50) DEFAULT NULL,
  `question_sort` int(11) DEFAULT NULL,
  `subquestion_id` int(11) DEFAULT NULL,
  `subquestion_name` varchar(50) DEFAULT NULL,
  `subquestion_sort` int(11) DEFAULT NULL,
  `result` float NOT NULL,
  `result_name` varchar(50) NOT NULL,
  `result_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3097 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for api_teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `api_teacher_class`;
CREATE TABLE `api_teacher_class` (
  `teach_class_id` int(11) NOT NULL,
  `class_code` varchar(12) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`teach_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for biz_comment
-- ----------------------------
DROP TABLE IF EXISTS `biz_comment`;
CREATE TABLE `biz_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  `chart_type` varchar(4) NOT NULL COMMENT '图例区分',
  `range_code` varchar(12) NOT NULL COMMENT '区域编号',
  `api_id` int(11) NOT NULL COMMENT '评测编号',
  `question_id` int(11) NOT NULL COMMENT '问题编号',
  `user_id` int(11) NOT NULL COMMENT '评论人',
  `user_name` varchar(30) NOT NULL,
  `level` int(4) NOT NULL COMMENT '分级',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `comment` varchar(500) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`comment_id`),
  KEY `biz_comment_biz_menu_fk_1` (`menu_id`),
  KEY `biz_comment_data_api_info_fk_2` (`api_id`),
  KEY `biz_comment_question_fk_3` (`question_id`),
  KEY `biz_comment_sys_user_4` (`user_id`),
  CONSTRAINT `biz_comment_biz_menu_fk_1` FOREIGN KEY (`menu_id`) REFERENCES `biz_menu` (`menu_id`),
  CONSTRAINT `biz_comment_data_api_info_fk_2` FOREIGN KEY (`api_id`) REFERENCES `data_api_info` (`api_id`),
  CONSTRAINT `biz_comment_question_fk_3` FOREIGN KEY (`question_id`) REFERENCES `data_questionnaire_question` (`question_id`),
  CONSTRAINT `biz_comment_sys_user_4` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户评论表';

-- ----------------------------
-- Table structure for biz_menu
-- ----------------------------
DROP TABLE IF EXISTS `biz_menu`;
CREATE TABLE `biz_menu` (
  `menu_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `content` varchar(50) NOT NULL,
  `level` int(4) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Table structure for biz_menu_item
-- ----------------------------
DROP TABLE IF EXISTS `biz_menu_item`;
CREATE TABLE `biz_menu_item` (
  `menu_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL COMMENT 'item_type 为I时，item_id--> indicator_id, 为其他时，item_id为data_item的Id',
  `item_type` char(2) DEFAULT NULL COMMENT 'itemType:I:代表indicator,S:考试成绩, P:体育成绩',
  PRIMARY KEY (`menu_item_id`),
  KEY `FK_PK_Reference_item` (`item_id`),
  KEY `FK_PK_Reference_menu_item` (`menu_id`),
  CONSTRAINT `FK_PK_Reference_menu_item` FOREIGN KEY (`menu_id`) REFERENCES `biz_menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='菜单和统计项关系表';

-- ----------------------------
-- Table structure for data_ability
-- ----------------------------
DROP TABLE IF EXISTS `data_ability`;
CREATE TABLE `data_ability` (
  `ability_code` char(2) NOT NULL,
  `ability_name` varchar(100) NOT NULL,
  `subject_code` char(2) NOT NULL,
  PRIMARY KEY (`ability_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_api_info
-- ----------------------------
DROP TABLE IF EXISTS `data_api_info`;
CREATE TABLE `data_api_info` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `grade_code` char(2) NOT NULL,
  `grade_name` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `count_code` char(2) NOT NULL,
  `count_name` varchar(50) NOT NULL,
  `school_count` int(11) DEFAULT NULL,
  `student_count` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='评价信息表';

-- ----------------------------
-- Table structure for data_api_range
-- ----------------------------
DROP TABLE IF EXISTS `data_api_range`;
CREATE TABLE `data_api_range` (
  `api_range_id` int(11) NOT NULL AUTO_INCREMENT,
  `range_code` varchar(12) DEFAULT NULL,
  `api_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`api_range_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='地区跟评测的关联表';

-- ----------------------------
-- Table structure for data_area_info
-- ----------------------------
DROP TABLE IF EXISTS `data_area_info`;
CREATE TABLE `data_area_info` (
  `area_code` char(4) NOT NULL COMMENT '主键，4位(市code2位+区code2位)',
  `area_name` varchar(50) NOT NULL COMMENT '区县名称',
  `area_type` char(2) NOT NULL COMMENT '区县类型',
  `city_code` char(2) NOT NULL COMMENT '城市code',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `image_path` varchar(200) DEFAULT NULL COMMENT '区县图片路径',
  PRIMARY KEY (`area_code`),
  KEY `area-refer-city` (`city_code`),
  CONSTRAINT `area-refer-city` FOREIGN KEY (`city_code`) REFERENCES `data_city_info` (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区县信息表';

-- ----------------------------
-- Table structure for data_book
-- ----------------------------
DROP TABLE IF EXISTS `data_book`;
CREATE TABLE `data_book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_code` char(2) NOT NULL COMMENT '书本code',
  `teaching_material_code` char(2) NOT NULL COMMENT '教材code',
  `term_type` char(2) NOT NULL COMMENT '学期类型',
  `book_name` varchar(50) NOT NULL COMMENT '书本名称',
  `grade` char(2) NOT NULL COMMENT '年级',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教科书';

-- ----------------------------
-- Table structure for data_city_info
-- ----------------------------
DROP TABLE IF EXISTS `data_city_info`;
CREATE TABLE `data_city_info` (
  `city_code` char(2) NOT NULL COMMENT '城市code',
  `city_name` varchar(100) NOT NULL COMMENT '城市名称',
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_class_info
-- ----------------------------
DROP TABLE IF EXISTS `data_class_info`;
CREATE TABLE `data_class_info` (
  `class_code` char(12) NOT NULL COMMENT '主键，12位(市code2位+区code2位+校code4位+班级code4位)',
  `class_name` varchar(100) NOT NULL COMMENT '班级名称',
  `school_code` char(8) NOT NULL COMMENT '父级，学校code',
  `grade` char(2) NOT NULL COMMENT '年级',
  `session` year(4) NOT NULL COMMENT '届(学生入学年份)',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `image_path` varchar(200) DEFAULT NULL COMMENT '班级图片',
  PRIMARY KEY (`class_code`),
  KEY `FK_PK_Reference_school_class` (`school_code`),
  CONSTRAINT `data_class_info_ibfk_1` FOREIGN KEY (`school_code`) REFERENCES `data_school_info` (`school_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_type` char(2) DEFAULT NULL COMMENT '字典表类型',
  `dict_name` varchar(50) DEFAULT NULL COMMENT '字典表类型描述',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Table structure for data_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary_data`;
CREATE TABLE `data_dictionary_data` (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典数据id',
  `dict_id` int(11) NOT NULL COMMENT '字典id',
  `dict_type` char(2) NOT NULL COMMENT '字典类型',
  `dict_data_type` char(2) NOT NULL COMMENT '字典数据',
  `dict_data_name` varchar(50) NOT NULL COMMENT '字典数据描述',
  PRIMARY KEY (`dict_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Table structure for data_difficulty
-- ----------------------------
DROP TABLE IF EXISTS `data_difficulty`;
CREATE TABLE `data_difficulty` (
  `difficulty_code` char(2) NOT NULL COMMENT '难度code',
  `subject_code` char(2) NOT NULL COMMENT '科目code',
  `difficulty_name` varchar(50) NOT NULL COMMENT '难度名称',
  `difficulty_sort` int(11) NOT NULL COMMENT '难度排序',
  PRIMARY KEY (`difficulty_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_exam_result
-- ----------------------------
DROP TABLE IF EXISTS `data_exam_result`;
CREATE TABLE `data_exam_result` (
  `exam_result_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id_no` char(16) NOT NULL COMMENT '学籍号',
  `subject` char(2) NOT NULL COMMENT '科目',
  `question_no` varchar(10) NOT NULL COMMENT '题号',
  `score` float NOT NULL COMMENT '分数',
  `score_type` char(1) NOT NULL COMMENT '分数类型(0:小题分，1:总分)',
  `tw_id` int(11) NOT NULL COMMENT '双向细目表id',
  PRIMARY KEY (`exam_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5483 DEFAULT CHARSET=utf8 COMMENT='学生原始成绩表';

-- ----------------------------
-- Table structure for data_indicator
-- ----------------------------
DROP TABLE IF EXISTS `data_indicator`;
CREATE TABLE `data_indicator` (
  `indicator_id` int(11) NOT NULL COMMENT '指标id',
  `pid` int(11) NOT NULL COMMENT '父指标id',
  `content` varchar(100) NOT NULL COMMENT '指标内容',
  `weight` int(11) NOT NULL COMMENT '权重',
  `level` int(11) NOT NULL COMMENT '指标等级',
  `type` char(2) NOT NULL COMMENT '指标类型',
  `resourse_type` char(2) DEFAULT NULL COMMENT '数据类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`indicator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='各种指标的存放。';

-- ----------------------------
-- Table structure for data_item
-- ----------------------------
DROP TABLE IF EXISTS `data_item`;
CREATE TABLE `data_item` (
  `item_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` char(2) DEFAULT NULL COMMENT 'S:成绩,P:体测',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='非指标的统计方式的统计项目表(此表没用了)';

-- ----------------------------
-- Table structure for data_knowledge_block
-- ----------------------------
DROP TABLE IF EXISTS `data_knowledge_block`;
CREATE TABLE `data_knowledge_block` (
  `knowledge_block_code` char(10) NOT NULL COMMENT '知识块code',
  `knowledge_block_name` varchar(50) NOT NULL COMMENT '知识块名称',
  `book_code` char(4) NOT NULL COMMENT '教材code',
  `subject_code` char(2) NOT NULL COMMENT '科目code',
  PRIMARY KEY (`knowledge_block_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识块';

-- ----------------------------
-- Table structure for data_knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `data_knowledge_point`;
CREATE TABLE `data_knowledge_point` (
  `knowledge_point_code` char(14) NOT NULL COMMENT '知识点code',
  `knowledge_point_name` varchar(50) NOT NULL COMMENT '知识点名称',
  `knowledge_block_code` char(10) DEFAULT NULL COMMENT '知识块code',
  `subject_code` char(2) NOT NULL COMMENT '科目',
  PRIMARY KEY (`knowledge_point_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识点';

-- ----------------------------
-- Table structure for data_origin_questionnaire_result
-- ----------------------------
DROP TABLE IF EXISTS `data_origin_questionnaire_result`;
CREATE TABLE `data_origin_questionnaire_result` (
  `id` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `answer1` varchar(100) DEFAULT NULL,
  `answer2` varchar(100) DEFAULT NULL,
  `answer3` varchar(100) DEFAULT NULL,
  `answer4` varchar(100) DEFAULT NULL,
  `qnno` varchar(100) NOT NULL,
  `factor` varchar(100) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `deptid` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `qnst` varchar(100) DEFAULT NULL,
  `selitem` varchar(100) DEFAULT NULL,
  `subitem` varchar(100) DEFAULT NULL,
  `indicator` varchar(100) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`qnno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_purpose
-- ----------------------------
DROP TABLE IF EXISTS `data_purpose`;
CREATE TABLE `data_purpose` (
  `purpose_code` char(4) NOT NULL COMMENT '目的性code',
  `purpose_name` varchar(50) NOT NULL COMMENT '目的性名称',
  `subject_code` char(2) NOT NULL COMMENT '科目code',
  PRIMARY KEY (`purpose_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考察知识内容的目的性';

-- ----------------------------
-- Table structure for data_questionnaire_answer
-- ----------------------------
DROP TABLE IF EXISTS `data_questionnaire_answer`;
CREATE TABLE `data_questionnaire_answer` (
  `question_id` int(11) NOT NULL COMMENT '题号',
  `answer_id` int(11) NOT NULL COMMENT '选项号',
  `answer_number` varchar(10) DEFAULT NULL COMMENT '选项(ABCD或1234等)',
  `answer_content` varchar(200) NOT NULL COMMENT '选项内容',
  `score` float DEFAULT NULL COMMENT '选项对应分数',
  PRIMARY KEY (`question_id`,`answer_id`),
  KEY `FK_Reference_question_answer` (`answer_id`),
  CONSTRAINT `FK_Reference_question_answer` FOREIGN KEY (`question_id`) REFERENCES `data_questionnaire_question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标准答案，答案分值';

-- ----------------------------
-- Table structure for data_questionnaire_question
-- ----------------------------
DROP TABLE IF EXISTS `data_questionnaire_question`;
CREATE TABLE `data_questionnaire_question` (
  `question_id` int(11) NOT NULL COMMENT '题号',
  `parent_id` int(11) DEFAULT NULL COMMENT '父题号',
  `questionnaire_no` int(11) NOT NULL COMMENT '问卷编号',
  `questionnaire_name` varchar(50) NOT NULL COMMENT '问卷名称',
  `api_id` int(11) NOT NULL COMMENT '评价ID',
  `title` varchar(100) NOT NULL COMMENT '问题标题',
  `indicator_id` int(11) DEFAULT NULL COMMENT '指标id',
  `question_type` char(2) DEFAULT NULL COMMENT '题目类型',
  `number` varchar(20) DEFAULT NULL COMMENT '题号',
  `score` float DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷题目， 分值类型（选项得分高低）';

-- ----------------------------
-- Table structure for data_questionnaire_result
-- ----------------------------
DROP TABLE IF EXISTS `data_questionnaire_result`;
CREATE TABLE `data_questionnaire_result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `student_id_number` char(16) NOT NULL COMMENT '学籍号',
  `student_name` varchar(50) NOT NULL COMMENT '学生姓名',
  `class_code` varchar(12) NOT NULL COMMENT '班级编号',
  `questionnaire_number` int(11) NOT NULL COMMENT '问卷编号',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_content` tinyint(4) NOT NULL COMMENT '所选答案',
  `answer_sort` int(11) DEFAULT NULL COMMENT '答案排序',
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生问卷答案';

-- ----------------------------
-- Table structure for data_question_type
-- ----------------------------
DROP TABLE IF EXISTS `data_question_type`;
CREATE TABLE `data_question_type` (
  `type_code` char(4) NOT NULL COMMENT '主键',
  `type_name` varchar(50) NOT NULL COMMENT '题型名称',
  `subject_id` int(11) NOT NULL COMMENT '科目',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='题型表';

-- ----------------------------
-- Table structure for data_school_info
-- ----------------------------
DROP TABLE IF EXISTS `data_school_info`;
CREATE TABLE `data_school_info` (
  `school_code` char(8) NOT NULL COMMENT '主键，8位(市code2位+区code2位+校code4位)',
  `area_code` char(4) DEFAULT NULL COMMENT '主键，4位(市code2位+区code2位)',
  `school_name` varchar(100) NOT NULL COMMENT '学校名称',
  `school_type` char(2) NOT NULL COMMENT '学校类型',
  `period_type` char(2) NOT NULL COMMENT '学段类型',
  `comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `image_path` varchar(200) DEFAULT NULL COMMENT '学校图片路径',
  PRIMARY KEY (`school_code`),
  KEY `FK_PK_Reference_area_school` (`area_code`),
  CONSTRAINT `FK_PK_Reference_area_school` FOREIGN KEY (`area_code`) REFERENCES `data_area_info` (`area_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校信息';

-- ----------------------------
-- Table structure for data_subitem
-- ----------------------------
DROP TABLE IF EXISTS `data_subitem`;
CREATE TABLE `data_subitem` (
  `subitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `subitem_name` varchar(50) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`subitem_id`),
  KEY `FK_PK_Reference_subitem` (`item_id`),
  CONSTRAINT `FK_PK_Reference_subitem` FOREIGN KEY (`item_id`) REFERENCES `data_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计子项表';

-- ----------------------------
-- Table structure for data_subject
-- ----------------------------
DROP TABLE IF EXISTS `data_subject`;
CREATE TABLE `data_subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subject_code` char(2) NOT NULL COMMENT '科目code',
  `subject_name` varchar(20) NOT NULL COMMENT '科目名称',
  `grade` char(2) NOT NULL COMMENT '年级',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_teaching_material
-- ----------------------------
DROP TABLE IF EXISTS `data_teaching_material`;
CREATE TABLE `data_teaching_material` (
  `teaching_material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teaching_material_code` char(2) NOT NULL COMMENT '教材版本',
  `teaching_material_name` varchar(50) NOT NULL COMMENT '教材版本名称',
  PRIMARY KEY (`teaching_material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教材版本';

-- ----------------------------
-- Table structure for data_two_way_checklist
-- ----------------------------
DROP TABLE IF EXISTS `data_two_way_checklist`;
CREATE TABLE `data_two_way_checklist` (
  `tw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '双向细目表ID',
  `tw_name` varchar(100) NOT NULL COMMENT '双向细目表名称',
  `tw_rate` float NOT NULL COMMENT '双向细目表达标率',
  `subject_code` char(2) NOT NULL COMMENT '科目',
  `api_id` int(11) NOT NULL COMMENT '评测ID',
  PRIMARY KEY (`tw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='双向细目表';

-- ----------------------------
-- Table structure for data_two_way_checklist_detail
-- ----------------------------
DROP TABLE IF EXISTS `data_two_way_checklist_detail`;
CREATE TABLE `data_two_way_checklist_detail` (
  `list_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tw_id` int(11) NOT NULL COMMENT '双向细目表id',
  `question_no` varchar(10) NOT NULL COMMENT '题号',
  `score` float NOT NULL COMMENT '分数',
  `question_type` char(2) DEFAULT NULL,
  `knowledge_block_code` char(10) DEFAULT NULL COMMENT '知识块code',
  `knowledge_point_code` char(14) DEFAULT NULL COMMENT '知识点code',
  `ability_code` char(2) DEFAULT NULL,
  `difficulty_code` char(2) DEFAULT NULL COMMENT '难度code',
  `purpose_code` char(4) DEFAULT NULL COMMENT '考察目的性code',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`list_id`),
  KEY `FK_question_type` (`question_type`),
  KEY `FK_knowledge_block` (`knowledge_block_code`),
  KEY `FK_knowledge_point` (`knowledge_point_code`),
  KEY `FK_ability` (`ability_code`),
  KEY `FK_difficulty` (`difficulty_code`),
  KEY `FK_purpose` (`purpose_code`),
  CONSTRAINT `FK_ability` FOREIGN KEY (`ability_code`) REFERENCES `data_ability` (`ability_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_difficulty` FOREIGN KEY (`difficulty_code`) REFERENCES `data_difficulty` (`difficulty_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_knowledge_block` FOREIGN KEY (`knowledge_block_code`) REFERENCES `data_knowledge_block` (`knowledge_block_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_knowledge_point` FOREIGN KEY (`knowledge_point_code`) REFERENCES `data_knowledge_point` (`knowledge_point_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_purpose` FOREIGN KEY (`purpose_code`) REFERENCES `data_purpose` (`purpose_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_question_type` FOREIGN KEY (`question_type`) REFERENCES `data_question_type` (`type_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='成长档案留言表';

-- ----------------------------
-- Table structure for doc_notice_info
-- ----------------------------
DROP TABLE IF EXISTS `doc_notice_info`;
CREATE TABLE `doc_notice_info` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `msg_content` varchar(2000) NOT NULL COMMENT '内容',
  `title` varchar(150) NOT NULL COMMENT '标题',
  `sub_title` varchar(150) DEFAULT NULL COMMENT '子标题',
  `status` int(1) NOT NULL COMMENT '发布状态',
  `author_id` int(11) NOT NULL COMMENT '发布者ID',
  `author_name` varchar(50) DEFAULT NULL COMMENT '发布者',
  `create_date` datetime DEFAULT NULL COMMENT '发布日',
  PRIMARY KEY (`msg_id`),
  KEY `FK_notice_info_sys_user` (`author_id`),
  CONSTRAINT `FK_notice_info_sys_user` FOREIGN KEY (`author_id`) REFERENCES `sys_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='发布信息一览表';

-- ----------------------------
-- Table structure for doc_report
-- ----------------------------
DROP TABLE IF EXISTS `doc_report`;
CREATE TABLE `doc_report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '报告ID',
  `api_id` int(11) NOT NULL COMMENT '评测ID',
  `area_code` char(4) DEFAULT NULL COMMENT '区域code可为空，为空时为全市报告，为空时学校code也应为空',
  `school_code` char(8) DEFAULT NULL COMMENT '学校code',
  `file_name` varchar(200) NOT NULL COMMENT '文件名',
  `file_type` char(4) NOT NULL COMMENT '文件类型(doc,pdf等)',
  `file_url` varchar(1024) NOT NULL COMMENT '文件地址',
  `report_type` char(2) NOT NULL COMMENT '报告/反馈',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `update_user` int(11) DEFAULT NULL COMMENT '上传者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`report_id`),
  KEY `IX_AN_ID` (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gd_honour
-- ----------------------------
DROP TABLE IF EXISTS `gd_honour`;
CREATE TABLE `gd_honour` (
  `honour_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `honour_title` varchar(100) NOT NULL COMMENT '荣誉标题',
  `honour_time` datetime NOT NULL COMMENT '获得荣誉时间',
  `honour_url` varchar(500) NOT NULL COMMENT '证书图片地址',
  `target_user_id` int(11) NOT NULL COMMENT '获奖者id',
  `target_username` varchar(30) NOT NULL COMMENT '获奖者',
  `upload_user` int(11) NOT NULL COMMENT '上传者ID',
  `upload_username` varchar(30) NOT NULL COMMENT '上传者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `school_code` char(8) NOT NULL COMMENT '学校编号，8位(市code2位+区code2位+校code4位)',
  `school_name` varchar(100) NOT NULL COMMENT '学校名称',
  `class_code` char(12) NOT NULL COMMENT '班级编号，12位(市code2位+区code2位+校code4位+班级code4位)',
  `class_name` varchar(100) NOT NULL COMMENT '班级名称',
  `del_flg` int(1) NOT NULL COMMENT '0:有效;1：无效；该表的数据只能进行逻辑删除。值为1时表示该数据删除。',
  PRIMARY KEY (`honour_id`),
  KEY `gd_honour_data_school_info` (`school_code`),
  KEY `gd_honour_data_class_info` (`class_code`),
  CONSTRAINT `gd_honour_data_class_info` FOREIGN KEY (`class_code`) REFERENCES `data_class_info` (`class_code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `gd_honour_data_school_info` FOREIGN KEY (`school_code`) REFERENCES `data_school_info` (`school_code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='成长档案荣誉墙表';

-- ----------------------------
-- Table structure for gd_message
-- ----------------------------
DROP TABLE IF EXISTS `gd_message`;
CREATE TABLE `gd_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_content` varchar(2000) NOT NULL COMMENT '留言内容',
  `from_user_id` int(11) NOT NULL COMMENT '留言者ID',
  `from_user_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `target_user_id` int(11) NOT NULL COMMENT '被留言者ID',
  `target_user_name` varchar(50) DEFAULT NULL COMMENT '被留言者姓名',
  `message_type` char(2) DEFAULT NULL COMMENT '留言类型',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成长档案留言表';

-- ----------------------------
-- Table structure for gd_notice
-- ----------------------------
DROP TABLE IF EXISTS `gd_notice`;
CREATE TABLE `gd_notice` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  `msg_content` varchar(2000) NOT NULL COMMENT '内容',
  `title` varchar(150) NOT NULL COMMENT '标题',
  `sub_title` varchar(150) DEFAULT NULL COMMENT '子标题',
  `status` int(1) NOT NULL COMMENT '发布状态',
  `author_id` int(11) NOT NULL COMMENT '发布者ID',
  `author_name` varchar(50) DEFAULT NULL COMMENT '发布者',
  `create_date` datetime DEFAULT NULL COMMENT '发布日',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布信息一览表';

-- ----------------------------
-- Table structure for gd_photo
-- ----------------------------
DROP TABLE IF EXISTS `gd_photo`;
CREATE TABLE `gd_photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `photo_title` varchar(100) NOT NULL COMMENT '照片标题',
  `photo_content` varchar(1000) NOT NULL COMMENT '照片描述',
  `photo_url` varchar(500) NOT NULL COMMENT '照片路径',
  `upload_user` int(11) NOT NULL COMMENT '上传者ID 	',
  `upload_username` varchar(30) NOT NULL COMMENT '上传者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成长相册表';

-- ----------------------------
-- Table structure for questionnaire_option
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire_option`;
CREATE TABLE `questionnaire_option` (
  `question_id` int(11) NOT NULL COMMENT '题号',
  `option_id` int(11) NOT NULL COMMENT '选项号',
  `option_number` varchar(10) DEFAULT NULL COMMENT '选项(ABCD或1234等)',
  `option_content` varchar(200) NOT NULL COMMENT '选项内容',
  `score` int(11) DEFAULT NULL COMMENT '选项对应分数',
  PRIMARY KEY (`question_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for questionnaire_question
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire_question`;
CREATE TABLE `questionnaire_question` (
  `question_id` int(11) NOT NULL COMMENT '题号',
  `parent_id` int(11) DEFAULT NULL COMMENT '父题号(对应题目组)',
  `question_type` char(2) DEFAULT NULL COMMENT '题目类型',
  `question_content` varchar(200) NOT NULL COMMENT '题目内容',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除(0否,1是)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷问题库';

-- ----------------------------
-- Table structure for sys_class_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_class_student`;
CREATE TABLE `sys_class_student` (
  `class_student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `class_code` char(12) DEFAULT NULL COMMENT '外键，12位(市code2位+区code2位+校code4位+班级code4位)',
  PRIMARY KEY (`class_student_id`),
  KEY `FK_Reference_class_student` (`class_code`),
  KEY `FK_Reference_student_class` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教师班级关系表';

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '权限名',
  `item` varchar(100) NOT NULL COMMENT '权限对应项目',
  `item_type` char(2) NOT NULL COMMENT '权限对应项目的类型(S:子系统,I:页面项目)',
  `item_description` varchar(200) DEFAULT NULL COMMENT '权限对应项目的描述',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  KEY `role_permission-permission` (`role_id`),
  KEY `role_permission-role` (`permission_id`),
  CONSTRAINT `role_permission-permission` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission-role` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-权限表';

-- ----------------------------
-- Table structure for sys_teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `sys_teacher_class`;
CREATE TABLE `sys_teacher_class` (
  `teach_class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_code` char(12) NOT NULL COMMENT '外键，班级编号，12位(市code2位+区code2位+校code4位+班级code4位)',
  `user_id` int(11) DEFAULT NULL COMMENT '外键，教师编号',
  `is_default_class` int(1) DEFAULT NULL COMMENT '是班主任还是任课教师(班主任有任课班级，任课教师没有任课班级)',
  PRIMARY KEY (`teach_class_id`),
  KEY `FK_Reference_class_teacher` (`class_code`),
  KEY `FK_Reference_teacher_class` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教师班级关系表';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `password` varchar(30) NOT NULL COMMENT '用户密码',
  `login_name` varchar(50) NOT NULL COMMENT '登录用户名',
  `user_type` char(1) NOT NULL COMMENT '用户类型（O:官方用户,S:学生,P:家长）',
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3421 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for sys_user_offical
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_offical`;
CREATE TABLE `sys_user_offical` (
  `user_id` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `range_code` varchar(12) DEFAULT NULL COMMENT '地区code(不能为空)',
  `grade_code` char(2) DEFAULT NULL COMMENT '年级Code',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  `address` varchar(200) DEFAULT NULL COMMENT '联系地址',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `area_code` varchar(12) DEFAULT NULL,
  `school_code` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='官方用户表(市级领导、区级领导、校长、教师)';

-- ----------------------------
-- Table structure for sys_user_parent
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_parent`;
CREATE TABLE `sys_user_parent` (
  `user_id` int(11) NOT NULL COMMENT '家长ID',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `name` varchar(50) NOT NULL COMMENT '家长姓名',
  `student_name` varchar(50) NOT NULL COMMENT '学生姓名',
  `id_card_number` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `sex` char(1) DEFAULT NULL COMMENT '性别(M:男,F:女)',
  `job` varchar(50) DEFAULT NULL COMMENT '职业',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`user_id`),
  KEY `FK_PK_Reference_student_parent` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家长表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  KEY `user_role-role` (`role_id`),
  KEY `user_role-user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色表';

-- ----------------------------
-- Table structure for sys_user_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_student`;
CREATE TABLE `sys_user_student` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `student_id_number` char(16) DEFAULT NULL COMMENT '学籍号',
  `name` varchar(50) NOT NULL COMMENT '学生姓名',
  `period` varchar(50) DEFAULT NULL COMMENT '学段',
  `session` year(4) NOT NULL COMMENT '届(入学年份)',
  `class_code` varchar(12) NOT NULL COMMENT '班级code',
  `sex` char(2) NOT NULL COMMENT '性别',
  `nation` varchar(50) DEFAULT NULL COMMENT '民族',
  PRIMARY KEY (`user_id`),
  KEY `class_code` (`class_code`),
  CONSTRAINT `sys_user_student_ibfk_1` FOREIGN KEY (`class_code`) REFERENCES `data_class_info` (`class_code`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';
