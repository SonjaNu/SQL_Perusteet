SELECT *
FROM staff;


SELECT branchNO AS toimipiste, COUNT(staffNo) AS "ty�ntekij�iden lkm", SUM(salary) AS "toimipisteen palkkojen summa"
FROM staff
GROUP BY branchNo;