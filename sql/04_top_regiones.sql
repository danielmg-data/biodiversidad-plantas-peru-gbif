-- Top 3 regiones y su participación sobre el total de registros CON región especificada
SELECT nombre, registros,
       ROUND(100.0 * registros / (SELECT SUM(registros) FROM registros_por_region), 1) AS pct_del_total
FROM registros_por_region
ORDER BY registros DESC
LIMIT 3;
