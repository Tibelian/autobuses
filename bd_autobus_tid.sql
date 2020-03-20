-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_autobus_tid
CREATE DATABASE IF NOT EXISTS `bd_autobus_tid` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_autobus_tid`;

-- Volcando estructura para tabla bd_autobus_tid.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `clave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`id`, `email`, `clave`) VALUES
	(1, 'jefe@autobus.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.compra
CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `importe` double NOT NULL,
  `viajeros` int(11) NOT NULL,
  `localizador` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_viaje` (`id_viaje`),
  KEY `id_tarjeta` (`id_tarjeta`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.compra: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.compra_backup
CREATE TABLE IF NOT EXISTS `compra_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viaje` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `importe` double NOT NULL,
  `viajeros` int(11) NOT NULL,
  `localizador` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `localizador` (`localizador`),
  KEY `id_tarjeta` (`id_tarjeta`),
  KEY `id_viaje` (`id_viaje`),
  CONSTRAINT `compra_backup_ibfk_1` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id`),
  CONSTRAINT `compra_backup_ibfk_2` FOREIGN KEY (`id_viaje`) REFERENCES `viaje_backup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.compra_backup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_backup` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.estacion
CREATE TABLE IF NOT EXISTS `estacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.estacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` (`id`, `nombre`, `direccion`, `localidad`) VALUES
	(1, 'Albacete', 'Fuente Alamo', 'Albacete'),
	(2, 'Madrid', 'Estación Sur', 'Madrid'),
	(3, 'Barcelona', 'Aeropuerto Prat T1', 'Barcelona'),
	(4, 'Murcia', 'Alhama de Murcia', 'Murcia');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ruta` int(11) NOT NULL,
  `hora` time NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.horario: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.ocupacion
CREATE TABLE IF NOT EXISTS `ocupacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viajero` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `asiento` int(3) NOT NULL,
  `importe` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_viajero` (`id_viajero`),
  CONSTRAINT `ocupacion_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  CONSTRAINT `ocupacion_ibfk_2` FOREIGN KEY (`id_viajero`) REFERENCES `viajero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.ocupacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.ocupacion_backup
CREATE TABLE IF NOT EXISTS `ocupacion_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_viajero` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `asiento` int(11) NOT NULL,
  `importe` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_viajero` (`id_viajero`,`id_compra`,`asiento`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `ocupacion_backup_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra_backup` (`id`),
  CONSTRAINT `ocupacion_backup_ibfk_2` FOREIGN KEY (`id_viajero`) REFERENCES `viajero_backup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.ocupacion_backup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ocupacion_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocupacion_backup` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.ruta
CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_origen` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `duracion` time NOT NULL,
  `kilometros` int(5) NOT NULL,
  `precio` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_origen_2` (`id_origen`,`id_destino`),
  KEY `id_destino` (`id_destino`),
  KEY `id_origen` (`id_origen`),
  CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `estacion` (`id`),
  CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`id_origen`) REFERENCES `estacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.ruta: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` (`id`, `id_origen`, `id_destino`, `duracion`, `kilometros`, `precio`) VALUES
	(1, 1, 2, '02:40:00', 257, 20.5),
	(2, 2, 3, '06:05:00', 650, 34),
	(3, 3, 4, '05:55:00', 588, 54),
	(4, 4, 1, '01:40:00', 152, 15),
	(6, 2, 1, '02:40:00', 257, 16);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `numero` varbinary(100) NOT NULL,
  `caducidad` date NOT NULL,
  `cvv` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.viaje
CREATE TABLE IF NOT EXISTS `viaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_horario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plazas` int(11) NOT NULL,
  `plazas_disponibles` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_horario` (`id_horario`),
  CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.viaje: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` (`id`, `id_horario`, `fecha`, `plazas`, `plazas_disponibles`) VALUES
	(4, 13, '2020-03-03', 10, 10),
	(5, 1, '2020-01-28', 6, 6);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.viajero
CREATE TABLE IF NOT EXISTS `viajero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.viajero: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viajero` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajero` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.viajero_backup
CREATE TABLE IF NOT EXISTS `viajero_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.viajero_backup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viajero_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajero_backup` ENABLE KEYS */;

-- Volcando estructura para tabla bd_autobus_tid.viaje_backup
CREATE TABLE IF NOT EXISTS `viaje_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_horario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plazas` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_horario` (`id_horario`),
  CONSTRAINT `viaje_backup_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bd_autobus_tid.viaje_backup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viaje_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje_backup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
