-- Pareto de familias: % individual y % acumulado (sobre el top 10, no sobre el total de 1.8M)
SELECT familia, registros,
       ROUND(100.0 * registros / (SELECT SUM(registros) FROM registros_por_familia), 1) AS pct,
       ROUND(100.0 * SUM(registros) OVER (ORDER BY registros DESC) /
             (SELECT SUM(registros) FROM registros_por_familia), 1) AS pct_acumulado
FROM registros_por_familia
ORDER BY registros DESC;
