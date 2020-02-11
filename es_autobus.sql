-- phpMyAdmin SQL Dump
-- version 5.0.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 11, 2020 at 05:08 PM
-- Server version: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `es_autobus`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
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

-- --------------------------------------------------------

--
-- Table structure for table `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `id_viaje` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `importe` double NOT NULL,
  `viajeros` int(11) NOT NULL,
  `localizador` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `estacion`
--

CREATE TABLE `estacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `estacion`
--

INSERT INTO `estacion` (`id`, `nombre`, `direccion`, `localidad`) VALUES
(1, 'Albacete', 'Fuente Alamo', 'Albacete'),
(2, 'Madrid', 'Estación Sur', 'Madrid'),
(3, 'Barcelona', 'Aeropuerto Prat T1', 'Barcelona'),
(4, 'Murcia', 'Alhama de Murcia', 'Murcia');

-- --------------------------------------------------------

--
-- Table structure for table `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `id_ruta` int(11) NOT NULL,
  `hora` time NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `horario`
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
(12, 4, '14:20:00', 'FinDeSemana');

-- --------------------------------------------------------

--
-- Table structure for table `ocupacion`
--

CREATE TABLE `ocupacion` (
  `id` int(11) NOT NULL,
  `id_viajero` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `asiento` int(3) NOT NULL,
  `importe` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ruta`
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
-- Dumping data for table `ruta`
--

INSERT INTO `ruta` (`id`, `id_origen`, `id_destino`, `duracion`, `kilometros`, `precio`) VALUES
(1, 1, 2, '02:40:00', 257, 20.5),
(2, 2, 3, '06:05:00', 650, 34),
(3, 3, 4, '05:55:00', 588, 54),
(4, 4, 1, '01:40:00', 152, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `numero` int(17) NOT NULL,
  `caducidad` date NOT NULL,
  `cvv` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `viaje`
--

CREATE TABLE `viaje` (
  `id` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `plazas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viaje`
--

INSERT INTO `viaje` (`id`, `id_horario`, `fecha`, `plazas`) VALUES
(1, 1, '2020-01-28', 10),
(2, 2, '2020-01-29', 15),
(3, 1, '2020-01-28', 7);

-- --------------------------------------------------------

--
-- Table structure for table `viajero`
--

CREATE TABLE `viajero` (
  `id` int(11) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `asiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indexes for table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_viaje` (`id_viaje`);

--
-- Indexes for table `estacion`
--
ALTER TABLE `estacion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ruta` (`id_ruta`);

--
-- Indexes for table `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_viajero` (`id_viajero`);

--
-- Indexes for table `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_destino` (`id_destino`),
  ADD KEY `id_origen` (`id_origen`);

--
-- Indexes for table `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Indexes for table `viajero`
--
ALTER TABLE `viajero`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estacion`
--
ALTER TABLE `estacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ocupacion`
--
ALTER TABLE `ocupacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruta`
--
ALTER TABLE `ruta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `viaje`
--
ALTER TABLE `viaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `viajero`
--
ALTER TABLE `viajero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id`);

--
-- Constraints for table `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id`);

--
-- Constraints for table `ocupacion`
--
ALTER TABLE `ocupacion`
  ADD CONSTRAINT `ocupacion_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `ocupacion_ibfk_2` FOREIGN KEY (`id_viajero`) REFERENCES `viajero` (`id`);

--
-- Constraints for table `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `estacion` (`id`),
  ADD CONSTRAINT `ruta_ibfk_2` FOREIGN KEY (`id_origen`) REFERENCES `estacion` (`id`);

--
-- Constraints for table `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Constraints for table `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

