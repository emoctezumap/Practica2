# Levantamiento de Requerimientos y Análisis del Dominio

## 1. Introducción y Objetivos
El presente proyecto tiene como objetivo analizar el impacto socioeconómico generado por eventos sísmicos en México. Para ello, se requiere integrar información proveniente de múltiples fuentes heterogéneas (geofísicas, demográficas y macroeconómicas) en una estructura OLAP/Data Warehouse.

## 2. Fuentes de Información
1. **Servicio Sismológico Nacional (SSN):** Registros geofísicos de sismos (magnitud, profundidad, coordenadas y estampa de tiempo UTC).
2. **INEGI - Censo de Población y Vivienda:** Indicadores demográficos de zonas geográficas (población total, desagregada por género).
3. **INEGI - Censos Económicos:** Indicadores macroeconómicos estatales (producción bruta total, insumos, valor agregado, formación de capital).

## 3. Reglas de Negocio y Restricciones
- **RN-01:** Un evento sísmico ocurre en una posición geográfica concreta y en un momento del tiempo específico.
- **RN-02:** Los eventos secundarios o réplicas dependen directamente del sismo principal que los desencadenó.
- **RN-03:** Cada zona geográfica cuenta con indicadores demográficos consolidados y métricas económicas anuales.
- **RN-04:** La afectación sísmica evalúa el cruce entre la severidad del sismo y la exposición de la zona (población y economía).

## 4. Métricas Imputadas y Derivadas
Para el análisis de riesgo en el Data Warehouse, se consideran métricas calculadas e imputadas estadísticamente:
- `poblacion_afectada`: Estimación de la población expuesta en la zona del epicentro.
- `impacto_economico`: Estimación de las pérdidas o valor económico expuesto.
- `indice_zscore`: Normalización estadística de la severidad del impacto para comparativas a nivel nacional.
