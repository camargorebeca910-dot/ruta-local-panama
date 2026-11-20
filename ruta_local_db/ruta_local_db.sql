CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) UNIQUE NOT NULL,
    rol VARCHAR(30) NOT NULL
);

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    descripcion TEXT
);

CREATE TABLE destinos (
    id_destino SERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    region VARCHAR(80) NOT NULL,
    id_categoria INT REFERENCES categorias(id_categoria),
    estado VARCHAR(20) DEFAULT 'activo'
);

CREATE TABLE fichas_destino (
    id_ficha SERIAL PRIMARY KEY,
    id_destino INT UNIQUE REFERENCES destinos(id_destino),
    horario VARCHAR(100),
    costo_aprox DECIMAL(10,2),
    recomendaciones TEXT
);

CREATE TABLE fotografias (
    id_foto SERIAL PRIMARY KEY,
    id_destino INT REFERENCES destinos(id_destino),
    url_imagen TEXT NOT NULL,
    descripcion VARCHAR(150)
);

CREATE TABLE rutas (
    id_ruta SERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    duracion_horas INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE ruta_paradas (
    id_parada SERIAL PRIMARY KEY,
    id_ruta INT REFERENCES rutas(id_ruta),
    id_destino INT REFERENCES destinos(id_destino),
    orden INT NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id_usuario),
    id_ruta INT REFERENCES rutas(id_ruta),
    fecha_paseo DATE NOT NULL,
    estado VARCHAR(30) DEFAULT 'pendiente'
);

CREATE TABLE favoritos (
    id_favorito SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuarios(id_usuario),
    id_ruta INT REFERENCES rutas(id_ruta)
);
