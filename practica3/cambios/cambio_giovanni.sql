
CREATE TABLE Enjambre_Sismico (
    id_enjambre SERIAL,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NOT NULL,
    region VARCHAR(100) NOT NULL,
    CONSTRAINT pk_enjambre PRIMARY KEY (id_enjambre)
);


ALTER TABLE Sismo
ADD COLUMN id_enjambre INT;


ALTER TABLE Sismo
ADD CONSTRAINT fk_sismo_enjambre
FOREIGN KEY (id_enjambre) REFERENCES Enjambre_Sismico(id_enjambre)
ON DELETE SET NULL 
ON UPDATE CASCADE;


-- Mostrar cuántos sismos componen cada enjambre sísmico registrado 
-- y cuál fue la magnitud máxima alcanzada dentro de ese enjambre.

SELECT 
    e.region, 
    e.fecha_inicio, 
    e.fecha_fin,
    COUNT(s.id_sismo) AS total_sismos, 
    MAX(s.magnitud) AS magnitud_maxima_del_enjambre
FROM Enjambre_Sismico e
JOIN Sismo s ON e.id_enjambre = s.id_enjambre
GROUP BY e.id_enjambre, e.region, e.fecha_inicio, e.fecha_fin
ORDER BY total_sismos DESC;