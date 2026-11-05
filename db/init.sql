-- ============================================================
--  Script de inicialización de la base de datos "inventario"
--  MySQL lo ejecuta automáticamente SOLO la primera vez,
--  cuando el volumen datos_mysql está vacío.
-- ============================================================

SET NAMES utf8mb4;
USE inventario;

CREATE TABLE IF NOT EXISTS equipos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    tipo            ENUM(
                        'Mesa de exploración veterinaria',
                        'Báscula veterinaria',
                        'Equipo de rayos X digital',
                        'Equipo de ultrasonido',
                        'Electrocardiógrafo',
                        'Máquina de anestesia veterinaria',
                        'Mesa quirúrgica',
                        'Monitor multiparamétrico',
                        'Bomba de infusión',
                        'Microscopio',
                        'Centrífuga',
                        'Analizador hematológico',
                        'Autoclave',
                        'Computadora de escritorio',
                        'Impresora multifuncional'
                    ) NOT NULL,
    marca           VARCHAR(50)  NOT NULL,
    numero_serie    VARCHAR(50)  NOT NULL UNIQUE,
    ubicacion       VARCHAR(100) NOT NULL,
    estado          ENUM('Disponible','En uso','En mantenimiento','Fuera de servicio') NOT NULL DEFAULT 'Disponible',
    fecha_registro  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Registros de ejemplo (datos ficticios - Veterinaura)
INSERT INTO equipos (nombre, tipo, marca, numero_serie, ubicacion, estado) VALUES
('Mesa de exploración 01',   'Mesa de exploración veterinaria', 'Welch Allyn', 'VET-MEX-001', 'Consulta',         'Disponible'),
('Rayos X 01',               'Equipo de rayos X digital',       'Fujifilm',    'VET-RX-001',  'Diagnóstico',     'En uso'),
('Monitor quirúrgico 01',    'Monitor multiparamétrico',        'Mindray',     'VET-MON-001', 'Cirugía',          'En mantenimiento'),
('Microscopio 01',           'Microscopio',                     'Olympus',     'VET-MIC-001', 'Laboratorio',      'Disponible'),
('Autoclave 01',             'Autoclave',                       'Tuttnauer',   'VET-AUT-001', 'Esterilización',   'Disponible'),
('Computadora recepción 01', 'Computadora de escritorio',       'HP',          'VET-PC-001',  'Administración',   'En uso');
