-- 1. Nueva tabla para almacenar los resultados del modelo de IA (Visión Computacional)
CREATE TABLE fact_prediccion_danos_ia (
    id_prediccion SERIAL PRIMARY KEY,
    id_sismo INT,
    id_zonas INT,
    clasificacion_dano VARCHAR(50) NOT NULL, -- Resultado de la IA: 'Leve', 'Moderado', 'Grave'
    nivel_confianza DOUBLE PRECISION NOT NULL, -- Probabilidad de acierto del modelo (Ej. 0.95)
    version_modelo VARCHAR(50) NOT NULL, -- Ej. 'ResNet50-v1.2'
    marca_de_tiempo TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Cuándo se generó la predicción
    CONSTRAINT fk_pred_sismo FOREIGN KEY (id_sismo) REFERENCES dim_sismos(id_sismo),
    CONSTRAINT fk_pred_zona FOREIGN KEY (id_zonas) REFERENCES dim_zonas(id_zonas)
);

-- 2. Insertamos un dato de prueba generado por la IA para probar la consulta
INSERT INTO fact_prediccion_danos_ia (id_sismo, id_zonas, clasificacion_dano, nivel_confianza, version_modelo)
VALUES (1, 1, 'Grave', 0.89, 'Vision-Earthquake-v2.0');

-- 3. Consulta obligatoria (Punto 3 del Ejercicio 8): 
-- Muestra las zonas con daño grave detectadas por la IA y la confianza de la predicción.
SELECT 
    s.magnitud, 
    z.nom_ent, 
    ia.clasificacion_dano, 
    ia.nivel_confianza, 
    ia.version_modelo, 
    ia.marca_de_tiempo
FROM fact_prediccion_danos_ia ia
JOIN dim_sismos s ON ia.id_sismo = s.id_sismo
JOIN dim_zonas z ON ia.id_zonas = z.id_zonas
WHERE ia.clasificacion_dano = 'Grave';
