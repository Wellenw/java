DROP TABLE tb5;
CREATE TABLE tb5(
                    id INT PRIMARY KEY AUTO_INCREMENT, -- 主键是一行数据的唯一标识,要求非空且唯一
                    name VARCHAR(20) NOT NULL , -- 保证列中所有的数值不能有null值
                    tel VARCHAR(20) UNIQUE ,-- 保证列中所有数据各不相同
                    score INT,
                    gender CHAR,
                    CHECK ( score >= 0 and score <=100 ), -- 保证列中的值满足某一条件
                    CHECK ( gender = 'm' or gender = 'f')
)CHAR SET UTF8;

SELECT * FROM tb5;
SHOW CREATE TABLE tb5;
TRUNCATE tb5 ;-- 删除表数据的同时，还原表结构

/*外键约束*/
USE db2;
CREATE TABLE banji(
                      id   INT PRIMARY KEY AUTO_INCREMENT,
                      name VARCHAR(20)
) CHARSET = utf8;
-- -------------------------------------------------------------------
CREATE TABLE xuesheng(
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         name VARCHAR(20),
                         ban_id INT,
    -- 将xuesheng表中的ban_id列设置为外键,且只能录入banji表中的id列的值
                         FOREIGN KEY (ban_id) REFERENCES banji (id)
) CHARSET = utf8;
-- -------------------------------------------------------------------
INSERT INTO banji(name) VALUES('A班'),('B班');
INSERT INTO xuesheng(name,ban_id)VALUES('张三',1),('李四',2),('王五',1);
-- 班级id被外键约束,只允许录入banji表中的id列已存在的值,不存在则不允许录入
INSERT INTO xuesheng(name,ban_id)VALUES('赵六',99);
SELECT * FROM banji;
SELECT * FROM xuesheng;
SELECT * FROM xuesheng;