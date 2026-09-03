CREATE TABLE rol (
    id_rol SERIAL CONSTRAINT PK_rol PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL CONSTRAINT UQ_rol_nombre UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE usuario (
    id_usuario SERIAL CONSTRAINT PK_usuario PRIMARY KEY,
    documento VARCHAR(20) NOT NULL CONSTRAINT UQ_usuario_documento UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL CONSTRAINT UQ_usuario_correo UNIQUE,
    clave_bcrypt VARCHAR(100) NOT NULL,
    fk_id_rol INT NOT NULL,
    CONSTRAINT FK_usuario_rol FOREIGN KEY (fk_id_rol) REFERENCES rol(id_rol)
);

CREATE TABLE cliente (
    id_cliente SERIAL CONSTRAINT PK_cliente PRIMARY KEY,
    documento VARCHAR(20) NOT NULL CONSTRAINT UQ_cliente_documento UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(100) NOT NULL
);

CREATE TABLE vehiculo (
    id_vehiculo SERIAL CONSTRAINT PK_vehiculo PRIMARY KEY,
    placa VARCHAR(10) NOT NULL CONSTRAINT UQ_vehiculo_placa UNIQUE,
    capacidad_kg NUMERIC(8,2) NOT NULL CONSTRAINT CHK_capacidad_positiva CHECK (capacidad_kg > 0),
    estado VARCHAR(20) DEFAULT 'DISPONIBLE' NOT NULL
);

CREATE TABLE paquete (
    id_paquete SERIAL CONSTRAINT PK_paquete PRIMARY KEY,
    codigo_hash VARCHAR(64) NOT NULL CONSTRAINT UQ_paquete_hash UNIQUE,
    peso_kg NUMERIC(6,2) NOT NULL CONSTRAINT CHK_peso_positivo CHECK (peso_kg > 0),
    direccion_destino VARCHAR(200) NOT NULL,
    estado VARCHAR(20) DEFAULT 'REGISTRADO' NOT NULL,
    fk_id_remitente INT NOT NULL,
    fk_id_destinatario INT NOT NULL,
    CONSTRAINT FK_paquete_remitente FOREIGN KEY (fk_id_remitente) REFERENCES cliente(id_cliente),
    CONSTRAINT FK_paquete_destinatario FOREIGN KEY (fk_id_destinatario) REFERENCES cliente(id_cliente)
);

CREATE TABLE hoja_ruta (
    id_hoja_ruta SERIAL CONSTRAINT PK_hoja_ruta PRIMARY KEY,
    fecha_despacho TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado VARCHAR(20) DEFAULT 'PLANIFICADA' NOT NULL,
    fk_id_conductor INT NOT NULL,
    fk_id_vehiculo INT NOT NULL,
    CONSTRAINT FK_hoja_ruta_conductor FOREIGN KEY (fk_id_conductor) REFERENCES usuario(id_usuario),
    CONSTRAINT FK_hoja_ruta_vehiculo FOREIGN KEY (fk_id_vehiculo) REFERENCES vehiculo(id_vehiculo)
);

CREATE TABLE detalle_hoja_ruta (
    id_detalle SERIAL CONSTRAINT PK_detalle_hoja_ruta PRIMARY KEY,
    orden_visita INT NOT NULL,
    fk_id_hoja_ruta INT NOT NULL,
    fk_id_paquete INT NOT NULL,
    CONSTRAINT FK_detalle_hoja_ruta FOREIGN KEY (fk_id_hoja_ruta) REFERENCES hoja_ruta(id_hoja_ruta),
    CONSTRAINT FK_detalle_paquete FOREIGN KEY (fk_id_paquete) REFERENCES paquete(id_paquete),
    CONSTRAINT UQ_paquete_en_ruta UNIQUE (fk_id_paquete)
);

CREATE TABLE evidencia_entrega (
    id_evidencia SERIAL CONSTRAINT PK_evidencia_entrega PRIMARY KEY,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    url_foto VARCHAR(255) NOT NULL,
    url_firma VARCHAR(255) NOT NULL,
    latitud NUMERIC(10,8) NOT NULL,
    longitud NUMERIC(11,8) NOT NULL,
    fk_id_paquete INT NOT NULL CONSTRAINT UQ_evidencia_paquete UNIQUE,
    CONSTRAINT FK_evidencia_paquete FOREIGN KEY (fk_id_paquete) REFERENCES paquete(id_paquete)
);

CREATE TABLE log_auditoria (
    id_log SERIAL CONSTRAINT PK_log_auditoria PRIMARY KEY,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado_anterior VARCHAR(20),
    estado_nuevo VARCHAR(20) NOT NULL,
    observacion VARCHAR(255),
    fk_id_paquete INT NOT NULL,
    fk_id_usuario INT NOT NULL,
    CONSTRAINT FK_log_paquete FOREIGN KEY (fk_id_paquete) REFERENCES paquete(id_paquete),
    CONSTRAINT FK_log_usuario FOREIGN KEY (fk_id_usuario) REFERENCES usuario(id_usuario)
);

CREATE INDEX IX_usuario_correo ON usuario(correo);
CREATE INDEX IX_paquete_hash ON paquete(codigo_hash);
CREATE INDEX IX_log_paquete ON log_auditoria(fk_id_paquete);