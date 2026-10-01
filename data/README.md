# Datos

| Archivo | Contenido | Origen |
|---|---|---|
| `year_clean.csv` | 100 filas. Registros de plantas de Perú por año (1778-2026). | API de GBIF, agregado por año (`facet=year`). |
| `family_clean.csv` | 10 filas. Las 10 familias botánicas con más registros, ya resueltas a su nombre. | API de GBIF (`facet=familyKey`), resuelto manualmente vía `/v1/species/{key}`. |
| `region_clean.csv` | 25 filas. Registros por región, ya sin duplicados. | API de GBIF (`facet=stateProvince`), limpiado. |
| `raw/*.json` | Las respuestas originales de la API, sin procesar. | GBIF, `https://api.gbif.org/v1/occurrence/search` con `country=PE&kingdomKey=6`. |

## Cómo se obtuvieron (sin necesidad de clave ni registro)

```
https://api.gbif.org/v1/occurrence/search?country=PE&kingdomKey=6&limit=0&facet=year&facetLimit=100
https://api.gbif.org/v1/occurrence/search?country=PE&kingdomKey=6&limit=0&facet=familyKey&facetLimit=20
https://api.gbif.org/v1/occurrence/search?country=PE&kingdomKey=6&limit=0&facet=stateProvince&facetLimit=30
```

`limit=0` pide solo los conteos agregados (facets), no los registros individuales — son más de 1.8 millones y no se necesitan uno por uno para este análisis.

## Limpieza aplicada

- **Familias:** la consulta trae el código numérico (`familyKey`), no el nombre. Se resolvieron manualmente las 10 familias con más registros vía `/v1/species/{key}` → campo `canonicalName`. Las otras 10 que devolvió la consulta original (hasta completar el top 20) no se resolvieron y se excluyeron del análisis.
- **Regiones:** GBIF trae el mismo nombre escrito de formas distintas. Se normalizó (sin tildes, minúsculas) y se fusionaron:

| Normalizado | Variantes originales |
|---|---|
| cusco | Cusco, Cuzco |
| madre de dios | Madre de Dios (×2, mismo nombre exacto) |
| san martin | San Martín, San Martin |
| junin | Junín, Junin |
| apurimac | Apurimac, Apurímac |

## Lo que este dataset NO mide

- No es un conteo de especies ni de especies nuevas descubiertas — es actividad de **registro/digitalización** (cuántas veces se documentó una observación o espécimen).
- 22.5% de los registros no tiene región (`stateProvince`) especificada.
- El pico de 2006-2008 puede reflejar un proyecto puntual de digitalización de un herbario, no un aumento real de exploración de campo ese año — pendiente de investigar.
