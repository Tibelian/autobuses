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

-- Volcando datos para la tabla bd_autobus_tid.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`id`, `email`, `clave`) VALUES
	(1, 'jefe@autobus.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.cliente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `dni`, `clave`, `nombre`, `apellidos`, `telefono`, `email`) VALUES
	(1, '123456789U', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Prueba', 'Test', '123456789', 'prueba@gmail.com'),
	(2, 'Y1550464W', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Juan', 'PÃ©rez', '632434353', 'juan@gmail.com'),
	(4, '23435323K', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pedro', 'García', '643344324', 'perdo@hotmail.com'),
	(5, '60440858D', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Pablo', 'Pablo', '642353523', 'pablo@yahoo.es'),
	(6, '76575277C', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Maria', 'Rueda', '642353423', 'maria'),
	(7, '70191568F', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Marco', 'Polo', '653532353', 'marco@outlook.com'),
	(8, '31816710M', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Sara', 'Santiago', '632432434', 'sara@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.compra: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` (`id`, `id_viaje`, `id_tarjeta`, `fecha`, `importe`, `viajeros`, `localizador`) VALUES
	(9, 1, 9, '2020-02-20 10:12:57', 41, 2, 'NMPBaBrB'),
	(10, 1, 11, '2020-02-20 19:51:28', 20.5, 1, 'Dlcs2WKi'),
	(11, 1, 9, '2020-02-20 20:17:17', 20.5, 1, 'oORmKSw6'),
	(15, 1, 11, '2020-02-21 12:19:35', 20.5, 1, 'gjkyHl6P'),
	(16, 1, 9, '2020-03-03 10:04:08', 20.5, 1, '0g9wuZAV'),
	(17, 4, 9, '2020-03-03 14:09:57', 16, 1, '8tMpEDy3'),
	(18, 4, 9, '2020-03-07 21:29:11', 16, 1, '4CULGoza'),
	(21, 4, 9, '2020-03-07 22:11:32', 16, 1, 'T8fnjJyU');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.compra_backup: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `compra_backup` DISABLE KEYS */;
INSERT INTO `compra_backup` (`id`, `id_viaje`, `id_tarjeta`, `importe`, `viajeros`, `localizador`) VALUES
	(2, 2, 11, 41, 2, 'CkXjivrU'),
	(3, 2, 9, 61.5, 3, 'lDFXjq10'),
	(4, 2, 9, 20.5, 1, 'fORPceJR');
/*!40000 ALTER TABLE `compra_backup` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.estacion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` (`id`, `nombre`, `direccion`, `localidad`) VALUES
	(1, 'Albacete', 'Fuente Alamo', 'Albacete'),
	(2, 'Madrid', 'Estación Sur', 'Madrid'),
	(3, 'Barcelona', 'Aeropuerto Prat T1', 'Barcelona'),
	(4, 'Murcia', 'Alhama de Murcia', 'Murcia');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;

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

-- Volcando datos para la tabla bd_autobus_tid.ocupacion: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `ocupacion` DISABLE KEYS */;
INSERT INTO `ocupacion` (`id`, `id_viajero`, `id_compra`, `asiento`, `importe`) VALUES
	(1, 2, 9, 2, 20.5),
	(2, 3, 9, 1, 20.5),
	(3, 4, 10, 4, 20.5),
	(4, 5, 11, 3, 20.5),
	(11, 12, 15, 10, 20.5),
	(12, 13, 16, 6, 20.5),
	(13, 14, 17, 1, 16),
	(14, 15, 18, 2, 16),
	(15, 2, 21, 4, 16);
/*!40000 ALTER TABLE `ocupacion` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.ocupacion_backup: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `ocupacion_backup` DISABLE KEYS */;
INSERT INTO `ocupacion_backup` (`id`, `id_viajero`, `id_compra`, `asiento`, `importe`) VALUES
	(2, 3, 2, 1, 20.5),
	(3, 4, 2, 4, 20.5),
	(4, 5, 3, 3, 20.5),
	(5, 6, 3, 5, 20.5),
	(6, 7, 3, 6, 20.5),
	(7, 8, 4, 2, 20.5);
/*!40000 ALTER TABLE `ocupacion_backup` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.ruta: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` (`id`, `id_origen`, `id_destino`, `duracion`, `kilometros`, `precio`) VALUES
	(1, 1, 2, '02:40:00', 257, 20.5),
	(2, 2, 3, '06:05:00', 650, 34),
	(3, 3, 4, '05:55:00', 588, 54),
	(4, 4, 1, '01:40:00', 152, 15),
	(6, 2, 1, '02:40:00', 257, 16);
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.tarjeta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
INSERT INTO `tarjeta` (`id`, `id_cliente`, `tipo`, `numero`, `caducidad`, `cvv`) VALUES
	(9, 1, 'mastercard', _binary 0xAE023D5F753415D6CD129B6CB81682F7D72F6B302BD79A4193898E43CA88BA7D, '2020-11-01', 234),
	(11, 1, 'discover', _binary 0x6A3988AF5B974FD97BEE24FA4E48E97AD72F6B302BD79A4193898E43CA88BA7D, '2020-11-01', 245);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.viaje: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` (`id`, `id_horario`, `fecha`, `plazas`, `plazas_disponibles`) VALUES
	(1, 2, '2020-01-28', 10, 4),
	(4, 13, '2020-03-03', 12, 9);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.viajero: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `viajero` DISABLE KEYS */;
INSERT INTO `viajero` (`id`, `dni`, `nombre`, `apellidos`) VALUES
	(2, '67551298E', 'Marco', 'Martínez'),
	(3, 'Y1230464W', 'Marco', 'Polo'),
	(4, 'Y5345044W', 'Daniel', 'JimÃ©nez'),
	(5, 'Y1532464W', 'Gabriel', 'MartÃ­nez'),
	(6, 'Y1550523D', 'Daniel', 'Pardo'),
	(7, 'Y1552345F', 'Carlos', 'GarcÃ­a'),
	(8, 'Y1550345G', 'Pedro', 'LÃ³pez'),
	(9, 'Y1550464G', 'Alan', 'Sifre'),
	(10, 'Y1234464W', 'RaÃºl', 'Zamora'),
	(11, 'Y15504865V', 'Carlos', 'Motos'),
	(12, 'Y1552356F', 'Juan', 'López'),
	(13, '06290230v', 'Juan', 'Pérez'),
	(14, '06290540V', 'Anabel', 'Morales Núñez'),
	(15, '67551292D', 'Juan', 'Pérez');
/*!40000 ALTER TABLE `viajero` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.viajero_backup: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `viajero_backup` DISABLE KEYS */;
INSERT INTO `viajero_backup` (`id`, `dni`, `nombre`, `apellidos`) VALUES
	(3, 'Y1550345G', 'Pedro', 'LÃ³pez'),
	(4, 'Y1552345F', 'Carlos', 'GarcÃ­a'),
	(5, 'Y15504865V', 'Carlos', 'Motos'),
	(6, 'Y1234464W', 'RaÃºl', 'Zamora'),
	(7, 'Y1550464G', 'Alan', 'Sifre'),
	(8, 'Y1550523D', 'Daniel', 'Pardo');
/*!40000 ALTER TABLE `viajero_backup` ENABLE KEYS */;

-- Volcando datos para la tabla bd_autobus_tid.viaje_backup: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `viaje_backup` DISABLE KEYS */;
INSERT INTO `viaje_backup` (`id`, `id_horario`, `fecha`, `plazas`) VALUES
	(2, 1, '2020-01-28', 6);
/*!40000 ALTER TABLE `viaje_backup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
