CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono_whatsapp VARCHAR(20)
);

CREATE TABLE ESTUDIANTE (
    id_cliente INT PRIMARY KEY,
    boleta VARCHAR(20) UNIQUE NOT NULL,
    carrera VARCHAR(100) NOT NULL,
    CONSTRAINT fk_est_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE
);

CREATE TABLE DOCENTE_ADMINISTRATIVO (
    id_cliente INT PRIMARY KEY,
    num_empleado VARCHAR(20) UNIQUE NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    CONSTRAINT fk_doc_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE
);

CREATE TABLE PRODUCTO (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio_costo DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    stock_disponible INT NOT NULL,
    CONSTRAINT chk_precio CHECK (precio_venta >= precio_costo),
    CONSTRAINT chk_stock CHECK (stock_disponible >= 0)
);

CREATE TABLE COMPRA (
    id_compra INT PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    estado_pago VARCHAR(50) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente) ON DELETE RESTRICT
);

CREATE TABLE FACTURA (
    folio_fiscal VARCHAR(50) PRIMARY KEY,
    rfc VARCHAR(15) NOT NULL,
    id_compra INT UNIQUE NOT NULL,
    CONSTRAINT fk_factura_compra FOREIGN KEY (id_compra) 
        REFERENCES COMPRA(id_compra) ON DELETE CASCADE
);

CREATE TABLE DETALLE_COMPRA (
    id_compra INT NOT NULL,
    num_renglon INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_producto INT NOT NULL,
    PRIMARY KEY (id_compra, num_renglon),
    CONSTRAINT fk_detalle_compra FOREIGN KEY (id_compra) 
        REFERENCES COMPRA(id_compra) ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) 
        REFERENCES PRODUCTO(id_producto) ON DELETE RESTRICT,
    CONSTRAINT chk_cantidad CHECK (cantidad > 0)
);
