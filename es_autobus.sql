-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-03-2020 a las 14:41:01
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `es_autobus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `email`, `clave`) VALUES
(1, 'jefe@autobus.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `dni`, `clave`, `nombre`, `apellidos`, `telefono`, `email`) VALUES
(1, '123456789U', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Prueba', 'Test', 123456789, 'prueba@gmail.com'),
(2, 'Y1550464W', 'juan', 'Juan', 'PÃ©rez', 632434353, 'juan@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `importe` double NOT NULL,
  `viajeros` int(11) NOT NULL,
  `localizador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id`, `id_viaje`, `id_tarjeta`, `fecha`, `importe`, `viajeros`, `localizador`) VALUES
(9, 1, 9, '2020-02-20 10:12:57', 41, 2, 'NMPBaBrB'),
(10, 1, 11, '2020-02-20 19:51:28', 20.5, 1, 'Dlcs2WKi'),
(11, 1, 9, '2020-02-20 20:17:17', 20.5, 1, 'oORmKSw6'),
(15, 1, 11, '2020-02-21 12:19:35', 20.5, 1, 'gjkyHl6P'),
(16, 1, 9, '2020-03-03 10:04:08', 20.5, 1, '0g9wuZAV'),
(17, 4, 9, '2020-03-03 14:09:57', 16, 1, '8tMpEDy3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_backup`
--

CREATE TABLE `compra_backup` (
  `id` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `importe` double NOT NULL,
  `viajeros` int(11) NOT NULL,
  `localizador` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra_backup`
--

INSERT INTO `compra_backup` (`id`, `id_viaje`, `id_tarjeta`, `importe`, `viajeros`, `localizador`) VALUES
(2, 2, 11, 41, 2, 'CkXjivrU'),
(3, 2, 9, 61.5, 3, 'lDFXjq10'),
(4, 2, 9, 20.5, 1, 'fORPceJR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacion`
--

CREATE TABLE `estacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estacion`
--

INSERT INTO `estacion` (`id`, `nombre`, `direccion`, `localidad`) VALUES
(1, 'Albacete', 'Fuente Alamo', 'Albacete'),
(2, 'Madrid', 'Estación Sur', 'Madrid'),
(3, 'Barcelona', 'Aeropuerto Prat T1', 'Barcelona'),
(4, 'Murcia', 'Alhama de Murcia', 'Murcia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `hora` time NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `id_ruta`, `hora`, `tipo`) VALUES
(1, 1, '02:50:00', 'Semana'),
(2, 1, '16:30:00', 'Semana'),
(3, 2, '10:00:00', 'Semana'),
(4, 2, '19:45:00', 'Semana'),
(5, 3, '12:45:00', 'Semana'),
(6, 3, '06:30:00', 'Semana'),
(7, 4, '09:15:00', 'Semana'),
(8, 4, '18:00:00', 'Semana'),
(9, 1, '09:00:00', 'FinDeSemana'),
(10, 2, '11:30:00', 'FinDeSemana'),
(11, 3, '20:20:00', 'FinDeSemana'),
(12, 4, '14:20:00', 'FinDeSemana'),
(13, 6, '13:58:23', 'Semana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion`
--

CREATE TABLE `ocupacion` (
  `id` int(11) NOT NULL,
  `id_viajero` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `asiento` int(3) NOT NULL,
  `importe` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ocupacion`
--

INSERT INTO `ocupacion` (`id`, `id_viajero`, `id_compra`, `asiento`, `importe`) VALUES
(1, 2, 9, 2, 20.5),
(2, 3, 9, 1, 20.5),
(3, 4, 10, 4, 20.5),
(4, 5, 11, 3, 20.5),
(11, 12, 15, 10, 20.5),
(12, 13, 16, 6, 20.5),
(13, 14, 17, 1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion_backup`
--

CREATE TABLE `ocupacion_backup` (
  `id` int(11) NOT NULL,
  `id_viajero` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  `importe` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ocupacion_backup`
--

INSERT INTO `ocupacion_backup` (`id`, `id_viajero`, `id_compra`, `asiento`, `importe`) VALUES
(2, 3, 2, 1, 20.5),
(3, 4, 2, 4, 20.5),
(4, 5, 3, 3, 20.5),
(5, 6, 3, 5, 20.5),
(6, 7, 3, 6, 20.5),
(7, 8, 4, 2, 20.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `id` int(11) NOT NULL,
  `id_origen` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `duracion` time NOT NULL,
  `kilometros` int(5) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id`, `id_origen`, `id_destino`, `duracion`, `kilometros`, `precio`) VALUES
(1, 1, 2, '02:40:00', 257, 20.5),
(2, 2, 3, '06:05:00', 650, 34),
(3, 3, 4, '05:55:00', 588, 54),
(4, 4, 1, '01:40:00', 152, 15),
(6, 2, 1, '02:40:00', 257, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `numero` varbinary(100) NOT NULL,
  `caducidad` date NOT NULL,
  `cvv` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`id`, `id_cliente`, `tipo`, `numero`, `caducidad`, `cvv`) VALUES
(9, 1, 'mastercard', 0xae023d5f753415d6cd129b6cb81682f7d72f6b302bd79a4193898e43ca88ba7d, '2020-11-01', 234),
(11, 1, 'discover', 0x6a3988af5b974fd97bee24fa4e48e97ad72f6b302bd79a4193898e43ca88ba7d, '2020-11-01', 245);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plazas` int(11) NOT NULL,
  `plazas_disponibles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id`, `id_horario`, `fecha`, `plazas`, `plazas_disponibles`) VALUES
(1, 2, '2020-01-28', 10, 4),
(4, 13, '2020-03-03', 12, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajero`
--

CREATE TABLE `viajero` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `asiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viajero`
--

INSERT INTO `viajero` (`id`, `dni`, `nombre`, `apellidos`, `asiento`) VALUES
(2, '2323321a', 'Juan', 'PÃ©rez', 2),
(3, 'Y1230464W', 'Marco', 'Polo', 1),
(4, 'Y5345044W', 'Daniel', 'JimÃ©nez', 4),
(5, 'Y1532464W', 'Gabriel', 'MartÃ­nez', 3),
(6, 'Y1550523D', 'Daniel', 'Pardo', 2),
(7, 'Y1552345F', 'Carlos', 'GarcÃ­a', 4),
(8, 'Y1550345G', 'Pedro', 'LÃ³pez', 1),
(9, 'Y1550464G', 'Alan', 'Sifre', 6),
(10, 'Y1234464W', 'RaÃºl', 'Zamora', 5),
(11, 'Y15504865V', 'Carlos', 'Motos', 3),
(12, 'Y1552356F', 'Juan', 'López', 10),
(13, '06290230v', 'Juan', 'Pérez', 6),
(14, '06290540V', 'Anabel', 'Morales Núñez', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajero_backup`
--

CREATE TABLE `viajero_backup` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viajero_backup`
--

INSERT INTO `viajero_backup` (`id`, `dni`, `nombre`, `apellidos`) VALUES
(3, 'Y1550345G', 'Pedro', 'LÃ³pez'),
(4, 'Y1552345F', 'Carlos', 'GarcÃ­a'),
(5, 'Y15504865V', 'Carlos', 'Motos'),
(6, 'Y1234464W', 'RaÃºl', 'Zamora'),
(7, 'Y1550464G', 'Alan', 'Sifre'),
(8, 'Y1550523D', 'Daniel', 'Pardo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje_backup`
--

CREATE TABLE `viaje_backup` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plazas` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viaje_backup`
--

INSERT INTO `viaje_backup` (`id`, `id_horario`, `fecha`, `plazas`) VALUES
(2, 1, '2020-01-28', 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_tarjeta` (`id_tarjeta`);

--
-- Indices de la tabla `compra_backup`
--
ALTER TABLE `compra_backup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `localizador` (`localizador`),
  ADD KEY `id_tarjeta` (`id_tarjeta`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indices de la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indices de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_viajero` (`id_viajero`);

--
-- Indices de la tabla `ocupacion_backup`
--
ALTER TABLE `ocupacion_backup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_viajero` (`id_viajero`,`id_compra`,`asiento`),
  ADD KEY `id_compra` (`id_compra`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_origen_2` (`id_origen`,`id_destino`),
  ADD KEY `id_destino` (`id_destino`),
  ADD KEY `id_origen` (`id_origen`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Indices de la tabla `viajero`
--
ALTER TABLE `viajero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `viajero_backup`
--
ALTER TABLE `viajero_backup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `viaje_backup`
--
ALTER TABLE `viaje_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `compra_backup`
--
ALTER TABLE `compra_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estacion`
--
ALTER TABLE `estacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ocupacion_backup`
--
ALTER TABLE `ocupacion_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `viajero`
--
ALTER TABLE `viajero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `viajero_backup`
--
ALTER TABLE `viajero_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `viaje_backup`
--
ALTER TABLE `viaje_backup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id`);

--
-- Filtros para la tabla `compra_backup`
--
ALTER TABLE `compra_backup`
  ADD CONSTRAINT `compra_backup_ibfk_1` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id`),
  ADD CONSTRAINT `compra_backup_ibfk_2` FOREIGN KEY (`id_viaje`) REFERENCES `viaje_backup` (`id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`);

--
-- Filtros para la tabla `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD CONSTRAINT `ocupacion_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `ocupacion_ibfk_2` FOREIGN KEY (`id_viajero`) REFERENCES `viajero` (`id`);

--
-- Filtros para la tabla `ocupacion_backup`
--
ALTER TABLE `ocupacion_backup`
  ADD CONSTRAINT `ocupacion_backup_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra_backup` (`id`),
  ADD CONSTRAINT `ocupacion_backup_ibfk_2` FOREIGN KEY (`id_viajero`) REFERENCES `viajero_backup` (`id`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `estacion` (`id`),
  ADD CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`id_origen`) REFERENCES `estacion` (`id`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`);

--
-- Filtros para la tabla `viaje_backup`
--
ALTER TABLE `viaje_backup`
  ADD CONSTRAINT `viaje_backup_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
