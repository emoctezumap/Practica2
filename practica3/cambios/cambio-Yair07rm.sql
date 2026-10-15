
-- Practica 3 - Ejercicio 8
-- Propuesta: Estimacion del radio de afectacion sismica
-- Base de datos: sismos_ejercicio8

CREATE TABLE estimacion_afectacion (
    id_estimacion INTEGER GENERATED ALWAYS AS IDENTITY
        PRIMARY KEY,

    id_sismo INTEGER NOT NULL,

    radio_km DOUBLE PRECISION NOT NULL
        CHECK (radio_km >= 0),

    fecha_estimacion TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP,

    version_modelo VARCHAR(50) NOT NULL,

    metodo_estimacion VARCHAR(100) NOT NULL,

    CONSTRAINT fk_estimacion_sismo
        FOREIGN KEY (id_sismo)
        REFERENCES dim_sismos(id_sismo)
        ON DELETE CASCADE
);

CREATE INDEX idx_estimacion_sismo
    ON estimacion_afectacion(id_sismo);

