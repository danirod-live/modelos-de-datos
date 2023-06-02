BEGIN;


CREATE TABLE IF NOT EXISTS proveedores (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre CHARACTER VARYING(64),
    direccion CHARACTER VARYING(256),
    ciudad CHARACTER VARYING(64),
    -- Esto podría ser un codigo ISO... pero no lo es.
    pais CHARACTER VARYING(32),
    telefono CHARACTER VARYING(16),
    email CHARACTER VARYING(256)
);

CREATE TABLE IF NOT EXISTS categorias (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre CHARACTER VARYING(64)
);

CREATE TABLE IF NOT EXISTS productos (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    categoria BIGSERIAL REFERENCES categorias (id),
    nombre CHARACTER VARYING(64),
    marca CHARACTER VARYING(64),
    descripcion TEXT,
    sku CHARACTER VARYING(128),
    proveedor BIGSERIAL REFERENCES proveedores (id),
    precio BIGINT NOT NULL,
    impuesto FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS almacenes (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre CHARACTER VARYING(64),
    direccion CHARACTER VARYING(256),
    ciudad CHARACTER VARYING(64),
    -- Esto podría ser un codigo ISO... pero no lo es.
    pais CHARACTER VARYING(32),
    telefono CHARACTER VARYING(16),
    email CHARACTER VARYING(256)
);

CREATE TABLE IF NOT EXISTS inventarios (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    almacen BIGSERIAL REFERENCES almacenes (id),
    producto BIGSERIAL REFERENCES productos (id),
    stock BIGINT
);

CREATE TABLE IF NOT EXISTS clientes (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    nombre CHARACTER VARYING(64),
    direccion CHARACTER VARYING(256),
    ciudad CHARACTER VARYING(64),
    -- Esto podría ser un codigo ISO... pero no lo es.
    pais CHARACTER VARYING(32),
    telefono CHARACTER VARYING(16),
    email CHARACTER VARYING(256)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    cliente BIGSERIAL REFERENCES clientes (id),
    almacen BIGSERIAL REFERENCES almacenes (id),
    fecha_recepcion DATE,
    fecha_envio DATE,
    fecha_entregado DATE
);

CREATE TABLE IF NOT EXISTS pedido_items (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    pedido BIGSERIAL REFERENCES pedidos (id),
    producto BIGSERIAL REFERENCES productos (id),
    precio BIGINT NOT NULL,
    descuento BIGINT,
    impuesto FLOAT NOT NULL
);

END;
