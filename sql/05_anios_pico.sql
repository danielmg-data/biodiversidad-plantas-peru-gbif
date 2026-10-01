-- Los 5 años con más registros (desde 1950) y su peso relativo
SELECT anio, registros,
       ROUND(100.0 * registros / (SELECT SUM(registros) FROM registros_por_anio WHERE anio >= 1950), 2) AS pct_del_total_1950_2026
FROM registros_por_anio
WHERE anio >= 1950
ORDER BY registros DESC
LIMIT 5;
