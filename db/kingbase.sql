-- "maku_generator"."gen_base_class" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_base_class";

CREATE TABLE "maku_generator"."gen_base_class" (
	"id" bigint AUTO_INCREMENT,
	"package_name" character varying(200 char) NULL,
	"code" character varying(200 char) NULL,
	"fields" character varying(500 char) NULL,
	"remark" character varying(200 char) NULL,
	"create_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_F0D2B8D4" PRIMARY KEY (id)
);
COMMENT ON TABLE "maku_generator"."gen_base_class" IS '基类管理';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_base_class"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_base_class"."package_name" IS '基类包名';
COMMENT ON COLUMN "maku_generator"."gen_base_class"."code" IS '基类编码';
COMMENT ON COLUMN "maku_generator"."gen_base_class"."fields" IS '基类字段，多个用英文逗号分隔';
COMMENT ON COLUMN "maku_generator"."gen_base_class"."remark" IS '备注';
COMMENT ON COLUMN "maku_generator"."gen_base_class"."create_time" IS '创建时间';


-- "maku_generator"."gen_datasource" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_datasource";

CREATE TABLE "maku_generator"."gen_datasource" (
	"id" bigint AUTO_INCREMENT,
	"db_type" character varying(200 char) NULL,
	"conn_name" character varying(200 char) NOT NULL,
	"conn_url" character varying(500 char) NULL,
	"username" character varying(200 char) NULL,
	"password" character varying(200 char) NULL,
	"create_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_FBF7608F" PRIMARY KEY (id)
);
COMMENT ON TABLE "maku_generator"."gen_datasource" IS '数据源管理';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_datasource"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."db_type" IS '数据库类型';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."conn_name" IS '连接名';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."conn_url" IS 'URL';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."username" IS '用户名';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."password" IS '密码';
COMMENT ON COLUMN "maku_generator"."gen_datasource"."create_time" IS '创建时间';


-- "maku_generator"."gen_field_type" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_field_type";

CREATE TABLE "maku_generator"."gen_field_type" (
	"id" bigint AUTO_INCREMENT,
	"column_type" character varying(200 char) NULL,
	"attr_type" character varying(200 char) NULL,
	"package_name" character varying(200 char) NULL,
	"create_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_9540AFA9" PRIMARY KEY (id),
	CONSTRAINT "column_type_9A7F2D39" UNIQUE (column_type)
);
COMMENT ON TABLE "maku_generator"."gen_field_type" IS '字段类型管理';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_field_type"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_field_type"."column_type" IS '字段类型';
COMMENT ON COLUMN "maku_generator"."gen_field_type"."attr_type" IS '属性类型';
COMMENT ON COLUMN "maku_generator"."gen_field_type"."package_name" IS '属性包名';
COMMENT ON COLUMN "maku_generator"."gen_field_type"."create_time" IS '创建时间';


-- "maku_generator"."gen_project_modify" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_project_modify";

CREATE TABLE "maku_generator"."gen_project_modify" (
	"id" bigint AUTO_INCREMENT,
	"project_name" character varying(100 char) NULL,
	"project_code" character varying(100 char) NULL,
	"project_package" character varying(100 char) NULL,
	"project_path" character varying(200 char) NULL,
	"modify_project_name" character varying(100 char) NULL,
	"modify_project_code" character varying(100 char) NULL,
	"modify_project_package" character varying(100 char) NULL,
	"exclusions" character varying(200 char) NULL,
	"modify_suffix" character varying(200 char) NULL,
	"modify_tmp_path" character varying(100 char) NULL,
	"create_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_545A476A" PRIMARY KEY (id)
);
COMMENT ON TABLE "maku_generator"."gen_project_modify" IS '项目名变更';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_project_modify"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."project_name" IS '项目名';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."project_code" IS '项目标识';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."project_package" IS '项目包名';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."project_path" IS '项目路径';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."modify_project_name" IS '变更项目名';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."modify_project_code" IS '变更标识';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."modify_project_package" IS '变更包名';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."exclusions" IS '排除文件';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."modify_suffix" IS '变更文件';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."modify_tmp_path" IS '变更临时路径';
COMMENT ON COLUMN "maku_generator"."gen_project_modify"."create_time" IS '创建时间';


-- "maku_generator"."gen_table" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_table";

CREATE TABLE "maku_generator"."gen_table" (
	"id" bigint AUTO_INCREMENT,
	"table_name" character varying(200 char) NULL,
	"class_name" character varying(200 char) NULL,
	"table_comment" character varying(200 char) NULL,
	"author" character varying(200 char) NULL,
	"email" character varying(200 char) NULL,
	"package_name" character varying(200 char) NULL,
	"version" character varying(200 char) NULL,
	"generator_type" tinyint NULL,
	"backend_path" character varying(500 char) NULL,
	"frontend_path" character varying(500 char) NULL,
	"module_name" character varying(200 char) NULL,
	"function_name" character varying(200 char) NULL,
	"form_layout" tinyint NULL,
	"datasource_id" bigint NULL,
	"baseclass_id" bigint NULL,
	"create_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_BE1DD81A" PRIMARY KEY (id),
	CONSTRAINT "table_name_9AD49A10" UNIQUE (table_name)
);
COMMENT ON TABLE "maku_generator"."gen_table" IS '代码生成表';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_table"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_table"."table_name" IS '表名';
COMMENT ON COLUMN "maku_generator"."gen_table"."class_name" IS '类名';
COMMENT ON COLUMN "maku_generator"."gen_table"."table_comment" IS '说明';
COMMENT ON COLUMN "maku_generator"."gen_table"."author" IS '作者';
COMMENT ON COLUMN "maku_generator"."gen_table"."email" IS '邮箱';
COMMENT ON COLUMN "maku_generator"."gen_table"."package_name" IS '项目包名';
COMMENT ON COLUMN "maku_generator"."gen_table"."version" IS '项目版本号';
COMMENT ON COLUMN "maku_generator"."gen_table"."generator_type" IS '生成方式  0：zip压缩包   1：自定义目录';
COMMENT ON COLUMN "maku_generator"."gen_table"."backend_path" IS '后端生成路径';
COMMENT ON COLUMN "maku_generator"."gen_table"."frontend_path" IS '前端生成路径';
COMMENT ON COLUMN "maku_generator"."gen_table"."module_name" IS '模块名';
COMMENT ON COLUMN "maku_generator"."gen_table"."function_name" IS '功能名';
COMMENT ON COLUMN "maku_generator"."gen_table"."form_layout" IS '表单布局  1：一列   2：两列';
COMMENT ON COLUMN "maku_generator"."gen_table"."datasource_id" IS '数据源ID';
COMMENT ON COLUMN "maku_generator"."gen_table"."baseclass_id" IS '基类ID';
COMMENT ON COLUMN "maku_generator"."gen_table"."create_time" IS '创建时间';


-- "maku_generator"."gen_table_field" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_table_field";

CREATE TABLE "maku_generator"."gen_table_field" (
	"id" bigint AUTO_INCREMENT,
	"table_id" bigint NULL,
	"field_name" character varying(200 char) NULL,
	"field_type" character varying(200 char) NULL,
	"field_comment" character varying(200 char) NULL,
	"attr_name" character varying(200 char) NULL,
	"attr_type" character varying(200 char) NULL,
	"package_name" character varying(200 char) NULL,
	"sort" integer NULL,
	"auto_fill" character varying(20 char) NULL,
	"primary_pk" tinyint NULL,
	"base_field" tinyint NULL,
	"form_item" tinyint NULL,
	"form_required" tinyint NULL,
	"form_type" character varying(200 char) NULL,
	"form_dict" character varying(200 char) NULL,
	"form_validator" character varying(200 char) NULL,
	"grid_item" tinyint NULL,
	"grid_sort" tinyint NULL,
	"query_item" tinyint NULL,
	"query_type" character varying(200 char) NULL,
	"query_form_type" character varying(200 char) NULL,
	CONSTRAINT "PRIMARY_8E41B2D5" PRIMARY KEY (id)
);
COMMENT ON TABLE "maku_generator"."gen_table_field" IS '代码生成表字段';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_table_field"."id" IS 'id';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."table_id" IS '表ID';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."field_name" IS '字段名称';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."field_type" IS '字段类型';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."field_comment" IS '字段说明';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."attr_name" IS '属性名';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."attr_type" IS '属性类型';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."package_name" IS '属性包名';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."sort" IS '排序';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."auto_fill" IS '自动填充  DEFAULT、INSERT、UPDATE、INSERT_UPDATE';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."primary_pk" IS '主键 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."base_field" IS '基类字段 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."form_item" IS '表单项 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."form_required" IS '表单必填 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."form_type" IS '表单类型';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."form_dict" IS '表单字典类型';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."form_validator" IS '表单效验';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."grid_item" IS '列表项 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."grid_sort" IS '列表排序 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."query_item" IS '查询项 0：否  1：是';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."query_type" IS '查询方式';
COMMENT ON COLUMN "maku_generator"."gen_table_field"."query_form_type" IS '查询表单类型';


-- "maku_generator"."gen_test_student" definition

-- Drop table

-- DROP TABLE "maku_generator"."gen_test_student";

CREATE TABLE "maku_generator"."gen_test_student" (
	"id" bigint AUTO_INCREMENT,
	"name" character varying(50 char) NULL,
	"gender" tinyint NULL,
	"age" integer NULL,
	"class_name" character varying(50 char) NULL,
	"version" integer NULL,
	"deleted" tinyint NULL,
	"creator" bigint NULL,
	"create_time" timestamp without time zone NULL,
	"updater" bigint NULL,
	"update_time" timestamp without time zone NULL,
	CONSTRAINT "PRIMARY_B279A218" PRIMARY KEY (id)
);
COMMENT ON TABLE "maku_generator"."gen_test_student" IS '测试2';

-- Column comments

COMMENT ON COLUMN "maku_generator"."gen_test_student"."id" IS '学生ID';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."name" IS '姓名';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."gender" IS '性别';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."age" IS '年龄';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."class_name" IS '班级';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."version" IS '版本号';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."deleted" IS '删除标识';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."creator" IS '创建者';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."create_time" IS '创建时间';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."updater" IS '更新者';
COMMENT ON COLUMN "maku_generator"."gen_test_student"."update_time" IS '更新时间';


INSERT INTO "maku_generator"."gen_base_class"
("id", "package_name", "code", "fields", "remark", "create_time")
VALUES(1, 'net.maku.framework.mybatis.entity', 'BaseEntity', 'id,creator,create_time,updater,update_time,version,deleted', '使用该基类，则需要表里有这些字段', '''2024-01-08 18:23:23''');


INSERT INTO "maku_generator"."gen_datasource"
("id", "db_type", "conn_name", "conn_url", "username", "password", "create_time")
VALUES(1, 'MySQL', '12', 'jdbc:mysql://localhost:3306/maku_generator?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&nullCatalogMeansCurrent=true', 'root', '12345678', '''2024-01-08 18:41:15.799000''');


INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(1, 'datetime', 'Date', 'java.util.Date', '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(2, 'date', 'Date', 'java.util.Date', '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(3, 'tinyint', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(4, 'smallint', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(5, 'mediumint', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(6, 'int', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(7, 'integer', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(8, 'bigint', 'Long', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(9, 'float', 'Float', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(10, 'double', 'Double', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(11, 'decimal', 'BigDecimal', 'java.math.BigDecimal', '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(12, 'bit', 'Boolean', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(13, 'char', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(14, 'varchar', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(15, 'tinytext', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(16, 'text', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(17, 'mediumtext', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(18, 'longtext', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(19, 'timestamp', 'Date', 'java.util.Date', '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(20, 'NUMBER', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(21, 'BINARY_INTEGER', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(22, 'BINARY_FLOAT', 'Float', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(23, 'BINARY_DOUBLE', 'Double', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(24, 'VARCHAR2', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(25, 'NVARCHAR', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(26, 'NVARCHAR2', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(27, 'CLOB', 'String', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(28, 'int8', 'Long', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(29, 'int4', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(30, 'int2', 'Integer', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_field_type"
("id", "column_type", "attr_type", "package_name", "create_time")
VALUES(31, 'numeric', 'BigDecimal', 'java.math.BigDecimal', '''2024-01-08 18:23:23''');


INSERT INTO "maku_generator"."gen_project_modify"
("id", "project_name", "project_code", "project_package", "project_path", "modify_project_name", "modify_project_code", "modify_project_package", "exclusions", "modify_suffix", "modify_tmp_path", "create_time")
VALUES(1, 'maku-boot', 'maku', 'net.maku', 'D:/makunet/maku-boot', 'baba-boot', 'baba', 'com.baba', '.git,.idea,target,logs', 'java,xml,yml,txt', NULL, '''2024-01-08 18:23:23''');
INSERT INTO "maku_generator"."gen_project_modify"
("id", "project_name", "project_code", "project_package", "project_path", "modify_project_name", "modify_project_code", "modify_project_package", "exclusions", "modify_suffix", "modify_tmp_path", "create_time")
VALUES(2, 'maku-cloud', 'maku', 'net.maku', 'D:/makunet/maku-cloud', 'baba-cloud', 'baba', 'com.baba', '.git,.idea,target,logs', 'java,xml,yml,txt', NULL, '''2024-01-08 18:23:23''');


INSERT INTO "maku_generator"."gen_table"
("id", "table_name", "class_name", "table_comment", "author", "email", "package_name", "version", "generator_type", "backend_path", "frontend_path", "module_name", "function_name", "form_layout", "datasource_id", "baseclass_id", "create_time")
VALUES(1, 'gen_table', 'GenTable', '代码生成表', 'liyabing', 'histlyb@163.com', 'com.unicomdt.did.elderlycare', '1.0.0', 0, 'D:\generator\maku-boot\maku-server', 'D:\generator\maku-admin', 'elderlycare', 'gen_table', 1, 1, NULL, '''2024-01-08 18:41:27.355000''');


INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(1, 1, 'id', 'bigint', 'id', 'id', 'Long', NULL, 0, 'DEFAULT', 1, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(2, 1, 'table_name', 'varchar', '表名', 'tableName', 'String', NULL, 1, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(3, 1, 'class_name', 'varchar', '类名', 'className', 'String', NULL, 2, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(4, 1, 'table_comment', 'varchar', '说明', 'tableComment', 'String', NULL, 3, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(5, 1, 'author', 'varchar', '作者', 'author', 'String', NULL, 4, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(6, 1, 'email', 'varchar', '邮箱', 'email', 'String', NULL, 5, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(7, 1, 'package_name', 'varchar', '项目包名', 'packageName', 'String', NULL, 6, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(8, 1, 'version', 'varchar', '项目版本号', 'version', 'String', NULL, 7, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(9, 1, 'generator_type', 'tinyint', '生成方式  0：zip压缩包   1：自定义目录', 'generatorType', 'Integer', NULL, 8, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(10, 1, 'backend_path', 'varchar', '后端生成路径', 'backendPath', 'String', NULL, 9, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(11, 1, 'frontend_path', 'varchar', '前端生成路径', 'frontendPath', 'String', NULL, 10, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(12, 1, 'module_name', 'varchar', '模块名', 'moduleName', 'String', NULL, 11, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(13, 1, 'function_name', 'varchar', '功能名', 'functionName', 'String', NULL, 12, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(14, 1, 'form_layout', 'tinyint', '表单布局  1：一列   2：两列', 'formLayout', 'Integer', NULL, 13, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(15, 1, 'datasource_id', 'bigint', '数据源ID', 'datasourceId', 'Long', NULL, 14, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(16, 1, 'baseclass_id', 'bigint', '基类ID', 'baseclassId', 'Long', NULL, 15, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');
INSERT INTO "maku_generator"."gen_table_field"
("id", "table_id", "field_name", "field_type", "field_comment", "attr_name", "attr_type", "package_name", "sort", "auto_fill", "primary_pk", "base_field", "form_item", "form_required", "form_type", "form_dict", "form_validator", "grid_item", "grid_sort", "query_item", "query_type", "query_form_type")
VALUES(17, 1, 'create_time', 'datetime', '创建时间', 'createTime', 'Date', 'java.util.Date', 16, 'DEFAULT', 0, 0, 1, 0, 'text', NULL, NULL, 1, 0, 0, '=', 'text');



