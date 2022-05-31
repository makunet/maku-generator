CREATE TABLE gen_datasource (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    db_type varchar(200) COMMENT '数据库类型 MySQL、Oracle、PostgreSQL',
    conn_name varchar(200) NOT NULL COMMENT '连接名',
    conn_url varchar(500) COMMENT 'URL',
    username varchar(200) COMMENT '用户名',
    password varchar(200) COMMENT '密码',
    create_time datetime COMMENT '创建时间',
    primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据源管理';

CREATE TABLE gen_field_type (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    column_type varchar(200) COMMENT '字段类型',
    attr_type varchar(200) COMMENT '属性类型',
    package_name varchar(200) COMMENT '属性包名',
    create_time datetime COMMENT '创建时间',
    primary key (id),
    unique key (column_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字段类型管理';

CREATE TABLE gen_base_class (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    package_name varchar(200) COMMENT '基类包名',
    code varchar(200) COMMENT '基类编码',
    fields varchar(500) COMMENT '基类字段，多个用英文逗号分隔',
    remark varchar(200) COMMENT '备注',
    create_time datetime COMMENT '创建时间',
    primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基类管理';

CREATE TABLE gen_table_info (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    table_name varchar(200) COMMENT '表名',
    class_name varchar(200) COMMENT '类名',
    table_comment varchar(200) COMMENT '功能名',
    author varchar(200) COMMENT '作者',
    email varchar(200) COMMENT '邮箱',
    package_name varchar(200) COMMENT '项目包名',
    version varchar(200) COMMENT '项目版本号',
    backend_path varchar(500) COMMENT '后端生成路径',
    frontend_path varchar(500) COMMENT '前端生成路径',
    module_name varchar(200) COMMENT '模块名',
    sub_module_name varchar(200) COMMENT '子模块名',
    datasource_id bigint COMMENT '数据源ID',
    baseclass_id bigint COMMENT '基类ID',
    create_time datetime COMMENT '创建时间',
    primary key (id),
    unique key (table_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';

CREATE TABLE gen_table_field (
    id bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    table_id bigint COMMENT '表ID',
    table_name varchar(200) COMMENT '表名',
    column_name varchar(200) COMMENT '列名',
    column_type varchar(200) COMMENT '类型',
    column_comment varchar(200) COMMENT '列说明',
    attr_name varchar(200) COMMENT '属性名',
    attr_type varchar(200) COMMENT '属性类型',
    package_name varchar(200) COMMENT '属性包名',
    is_pk tinyint COMMENT '是否主键 0：否  1：是',
    is_required tinyint COMMENT '是否必填 0：否  1：是',
    is_form tinyint COMMENT '是否表单字段 0：否  1：是',
    is_list tinyint COMMENT '是否列表字段 0：否  1：是',
    is_query tinyint COMMENT '是否查询字段 0：否  1：是',
    query_type varchar(200) COMMENT '查询方式',
    form_type varchar(200) COMMENT '表单类型',
    dict_name varchar(200) COMMENT '字典名称',
    validator_type varchar(200) COMMENT '效验方式',
    sort int COMMENT '排序',
    create_time datetime COMMENT '创建时间',
    primary key (id),
    key (table_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表列';






-- 用于测试代码生成器的表结构 --
CREATE TABLE gen_test_member (
    member_id bigint NOT NULL AUTO_INCREMENT COMMENT '会员ID',
    name varchar(50) COMMENT '姓名',
    gender tinyint COMMENT '性别',
    age int COMMENT '年龄',
    occupation varchar(100) COMMENT '职业',
    create_time datetime COMMENT '创建时间',
    PRIMARY KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试1';

CREATE TABLE gen_test_student (
    id bigint NOT NULL AUTO_INCREMENT COMMENT '学生ID',
    name varchar(50) COMMENT '姓名',
    gender tinyint COMMENT '性别',
    age int COMMENT '年龄',
    class_name varchar(50) COMMENT '班级',
    version int COMMENT '版本号',
    deleted tinyint COMMENT '删除标识',
    creator bigint COMMENT '创建者',
    create_time datetime COMMENT '创建时间',
    updater bigint COMMENT '更新者',
    update_time datetime COMMENT '更新时间',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试2';



INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (1, 'datetime', 'Date', 'java.util.Date', now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (2, 'date', 'Date', 'java.util.Date', now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (3, 'tinyint', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (4, 'smallint', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (5, 'mediumint', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (6, 'int', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (7, 'integer', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (8, 'bigint', 'Long', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (9, 'float', 'Float', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (10, 'double', 'Double', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (11, 'decimal', 'BigDecimal', 'java.math.BigDecimal', now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (12, 'bit', 'Boolean', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (13, 'char', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (14, 'varchar', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (15, 'tinytext', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (16, 'text', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (17, 'mediumtext', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (18, 'longtext', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (19, 'timestamp', 'Date', 'java.util.Date', now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (20, 'NUMBER', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (21, 'BINARY_INTEGER', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (22, 'BINARY_FLOAT', 'Float', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (23, 'BINARY_DOUBLE', 'Double', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (24, 'VARCHAR2', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (25, 'NVARCHAR', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (26, 'NVARCHAR2', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (27, 'CLOB', 'String', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (28, 'int8', 'Long', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (29, 'int4', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (30, 'int2', 'Integer', NULL, now());
INSERT INTO gen_field_type (id, column_type, attr_type, package_name, create_time) VALUES (31, 'numeric', 'BigDecimal', 'java.math.BigDecimal', now());
