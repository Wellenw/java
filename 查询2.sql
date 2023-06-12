#升序 排列
SELECT id, name, title, salary
FROM teacher
ORDER BY salary;

#降序 排列
SELECT subject_id, name, title, salary
FROM teacher
WHERE subject_id is not null
ORDER BY subject_id, salary DESC;

SELECT subject_id, name, title, salary
FROM teacher
WHERE subject_id = 2
ORDER BY salary DESC;

SELECT id,
       name,
       manager,
       salary
FROM teacher
ORDER BY manager, salary DESC;

#表别名不能加双引号，也不能加空格
SELECT t.id,
       t.name,
       t.age,
       t.title,
       t.manager,
       t.salary,
       t.comm,
       t.gender,
       t.subject_id
FROM teacher t;

#字段别名
SELECT id 老师id,
       name 姓名,
       age 年龄,
       title 职称,
       manager 领导id,
       salary 薪资,
       comm 奖金,
       salary*12+IFNULL(comm,0) 年薪,-- 判断a是否是null值，如果是则处理为b
       gender 性别,
       subject_id 所教科目
FROM teacher
WHERE salary*12 >= 120000 -- 字段别名不可以在where使用
ORDER BY 年薪 DESC; -- 字段别名可以在order by 使用

#count()函数，如果传入的是非列名（可以是数字，也可以是*，不可以是字母），返回表的行数
SELECT count(*) FROM teacher;


SELECT class_id, job, COUNT(*) c
FROM student
WHERE class_id IS NOT NULL AND job IS NOT NULL
GROUP BY class_id, job
ORDER BY class_id;