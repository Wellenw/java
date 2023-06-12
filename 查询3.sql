SELECT id, name, salary
FROM teacher
WHERE salary <= (SELECT avg(salary) FROM teacher);


SELECT id, name, title
FROM teacher
where title in (
    SELECT title
    FROM teacher
    GROUP BY title
    HAVING count(*) = 4);

SELECT id,
       name,
       salary,
       title
FROM teacher
WHERE (title,salary) IN (
    SELECT title,MIN(salary)
    FROM teacher
    GROUP BY title
)
ORDER BY salary DESC ;

#查询student表中前10行记录
/* 公式  SELECT * FROM 表 LIMIT (page-1) * size , size*/
SELECT id,
       name,
       job
FROM student
         LIMIT 20,10;

#查询老师信息，并附带显示所教课程名称
SELECT t.name,
       t.subject_id,
       s.id,
       s.name
FROM teacher t,
     subject s
WHERE s.id = t.subject_id;

#查询班级信息以及班级负责老师
SELECT c.name,c.teacher_id,t.name
FROM class c ,
     teacher t
WHERE c.teacher_id = t.id;

#查询学生信息以及学生所在城市
SELECT s.name,l.name
FROM student s,
     location l
WHERE s.location_id = l.id;

#查询老师信息，并附带显示所教课程名称如果没有所教课程,则不显示
SELECT t.name,
       t.subject_id,
       s.id,
       s.name
FROM teacher t
         INNER JOIN subject s ON s.id = t.subject_id;

#查询学生信息以及学生所在城市,有城市显示城市,没有城市显示NULL
SELECT s.name,s.id,l.name
FROM student s left join location l on s.location_id = l.id;

#查询班级的负责老师，以及老师教授的科目
SELECT c.name,t.name,s.name
FROM class c left join teacher t on c.teacher_id = t.id
             left join subject s on t.subject_id = s.id;
