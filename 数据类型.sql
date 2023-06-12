#删除库，创建库
DROP DATABASE IF EXISTS db2;
CREATE DATABASE db2 CHAR SET UTF8;

SHOW CREATE DATABASE db2;

CREATE TABLE person
(
    name VARCHAR(50),
    age  INT
);

#向person表中插入一条记录
INSERT INTO person VALUES ('tom',18);
SELECT * FROM person;

#向person表中插入一条记录
INSERT INTO person(name) VALUES ('jerry');

/*全表插入多条记录*/
#向person表插入三条记录
INSERT INTO person VALUES ('大娃',20),('二娃',20),('三娃',20);
INSERT INTO person(name) VALUES ('四娃'),('五娃'),('六娃');

#创建一个user表，用于记录用户的用户名和密码
CREATE TABLE user(
                     username VARCHAR(50),
                     password VARCHAR(50)
) CHARSET UTF8;

INSERT INTO user(username, password)
VALUES ('yangxuan',123456),
       ('liyouxin',654321),
       ('cailianlong',111111);

SELECT * FROM user;

#上述通过录入特殊的字符串,将原有的SQL的语义改变,就是SQL注入攻击
#防止SQL注入攻击,就是将单引号替换为两个单引号
SELECT * FROM user WHERE username = 'xxxx' AND password = '1'' OR ''1''=''1';
SELECT * FROM user;

#修改person表中的记录
UPDATE person SET age = 33 WHERE name= 'tom';
SELECT * FROM person;

#删除记录
DELETE FROM person WHERE name = 'jerry';

#数字类型
CREATE TABLE tb1(
                    a tinyint,
                    b smallint,
                    c int,
                    d BIGINT,
                    e FLOAT,
                    f DOUBLE,
                    g DECIMAL(6,4)
) CHAR SET UTF8;

INSERT INTO tb1(a, b, c, d, e, f, g) VALUES (1,2,3,4,5,6,7);
SELECT * FROM tb1;

#文字类型
CREATE TABLE tb2(
                    a char ,
                    b VARCHAR(6),
                    c text
)CHAR SET UTF8;

INSERT INTO tb2(a) VALUES ('a');
INSERT INTO tb2(b) VALUES ('ab');
INSERT INTO tb2(c) VALUES ('abc');
SELECT * FROM tb2;

#时间类型
CREATE TABLE tb3(
                    a time,
                    b date,
                    c datetime,
                    d timestamp
);

-- 录入日期时，将日期值用单引号引起来
INSERT INTO tb3(a) VALUES ('21:51:00');
SELECT * FROM tb3;
