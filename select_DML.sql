SELECT DISTINCT E.CODIGO_EST, E.NOMBRE_EST, E.NOMBRE_PROGRAMA, E.PROMEDIO_ACUMULADO, E.FECHA_NACIMIENTO
FROM ESTUDIANTE E, PROFESOR P, CURSO C, MATRICULA M
WHERE E.CODIGO_EST = M.CODIGO_EST
AND C.CODIGO_CUR = M.CODIGO_CUR
AND P.CODIGO_PROF = C.CODIGO_PROF
AND P.NOMBRE_PROF = 'Sandra Cespedes';

SELECT DISTINCT E.CODIGO_EST, E.NOMBRE_EST, E.PROMEDIO_ACUMULADO
FROM ESTUDIANTE E, PROFESOR P, CURSO C, MATRICULA M
WHERE E.CODIGO_EST = M.CODIGO_EST
AND C.CODIGO_CUR = M.CODIGO_CUR
AND P.CODIGO_PROF = C.CODIGO_PROF
AND P.DEPARTAMENTO = 20;

SELECT ROUND(AVG(E.PROMEDIO_ACUMULADO), 3) AS PROMEDIO_ACUMULADO_DPTO_TIC
FROM ESTUDIANTE E, PROFESOR P, CURSO C, MATRICULA M
WHERE E.CODIGO_EST = M.CODIGO_EST
AND C.CODIGO_CUR = M.CODIGO_CUR
AND P.CODIGO_PROF = C.CODIGO_PROF
AND P.DEPARTAMENTO = 20;

SELECT P.DEPARTAMENTO, P.NOMBRE_PROF AS NOMBRE, COUNT(*) AS NUMERO_ESTUDIANTES
FROM PROFESOR P, CURSO C, MATRICULA M
WHERE C.CODIGO_CUR = M.CODIGO_CUR
AND P.CODIGO_PROF = C.CODIGO_PROF
GROUP BY P.NOMBRE_PROF, P.DEPARTAMENTO;