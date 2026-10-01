-- Total de registros por década
SELECT (anio / 10) * 10 AS decada, SUM(registros) AS total_registros
FROM registros_por_anio
GROUP BY decada
ORDER BY decada;
