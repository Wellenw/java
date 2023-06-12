CREATE DATABASE IF NOT EXISTS db1;
#创建数据库db2并设置编码GBK（国标码）
CREATE DATABASE IF NOT EXISTS db2 CHAR SET gbk;
#创建db1的建库语句
SHOW CREATE DATABASE db1;
SHOW CREATE DATABASE db2;

#删除db2库
DROP DATABASE IF EXISTS db2;

#进入库
USE db1;
-- 查看idea的console界面的右上角显示的库名

#查看db1库中所有的表
SHOW TABLES ;

#创建person表，有name和age字段，编码为UTF-8
CREATE TABLE person
(
    name VARCHAR(32), -- 创建表中字段name，类型为字符串
    age  INT          -- 创建表中字段age，类型为整数
) CHAR SET = GBK;


SHOW TABLES;


CREATE TABLE student
(
    name    VARCHAR(32),
    chinese INT,
    english INT
);



SHOW CREATE TABLE student;



DESC student;



#使用*号查询的缺点：1、性能差；2、安全性
SELECT id,
       name,
       age,
       gender,
       job,
       birth,
       location_id,
       team_leader,
       class_id
FROM tedu.student;



SELECT ID,
       NAME,
       AGE,
       GENDER
FROM tedu.student
WHERE ID = 110;



SELECT ID,
       NAME,
       AGE,
       GENDER
FROM tedu.student
WHERE id BETWEEN 300 AND 400; -- BETWEEN X AND Y 是包含边界值的


