CREATE TABLE dept (
    deptno NUMBER PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);

CREATE TABLE emps (
    empno NUMBER(4,0) PRIMARY KEY,
    ename VARCHAR2(10),
    job VARCHAR2(25),
    sal NUMBER(7,0),
    deptno NUMBER,
    CONSTRAINT fk_deptno FOREIGN KEY (deptno)
    REFERENCES dept (deptno)
);

INSERT INTO dept(deptno, dname, loc) VALUES (1, 'IT', 'Mumbai');
INSERT INTO dept(deptno, dname, loc) VALUES (2, 'HR', 'Pune');
INSERT INTO dept(deptno, dname, loc) VALUES (3, 'Ops', 'Hyderabad');
INSERT INTO dept(deptno, dname, loc) VALUES (4, 'Sales', 'Bangalore');



INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (100, 'Alice', 'Developer', 66000, 1);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (101, 'Mita', 'Tester', 42000, 1);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (102, 'Sesha', 'Lead', 78000, 1);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (103, 'Breta', 'Assistant', 50000, 3);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (104, 'Fanny', 'Recruiter', 66000, 2);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (105, 'Amna', 'Assosiate', 45000, 4);
INSERT INTO emps (empno, ename, job, sal, deptno) VALUES (106, 'Samay', 'Lead', 78000, 1);

COMMIT;

--1
SELECT e.ename, d.dname FROM emps e, dept d
WHERE e.deptno = d.deptno;

--2
SELECT e.ename, e.job, d.loc FROM emps e JOIN dept d
ON e.deptno = d.deptno;

--3
SELECT e.ename, d.dname FROM emps e JOIN dept d
ON e.deptno = d.deptno
WHERE d.dname= 'Sales';

--4
SELECT e.ename, d.dname, d.loc FROM emps e JOIN dept d
ON e.deptno = d.deptno;

--5
SELECT e.ename, d.dname FROM emps e, dept d
WHERE e.deptno = d.deptno;

--6
SELECT deptno, SUM(sal) FROM emps 
GROUP BY deptno;

--7
SELECT d.dname, d.deptno FROM dept d JOIN emps e
ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname
HAVING COUNT(e.empno)>3;

--8
SELECT e.ename from emps e JOIN dept d ON e.deptno = d.deptno
where d.loc IN ( SELECT loc from dept
where dname = 'Accounting');

--9
SELECT d.deptno, e.ename, e.sal from emps e JOIN dept d ON e.deptno = d.deptno

WHERE e.sal = (SELECT MAX(sal) from emps where deptno = e.deptno);

--10
SELECT d.deptno, e.ename, e.sal from emps e JOIN dept d ON e.deptno = d.deptno
WHERE e.sal > (SELECT AVG(sal) from emps where deptno = e.deptno);










