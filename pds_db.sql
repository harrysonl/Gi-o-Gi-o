-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2019 at 05:45 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pds_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `competencia`
--

CREATE TABLE `competencia` (
  `Id_Competencia` int(11) NOT NULL,
  `Cod_Competencia` varchar(20) NOT NULL,
  `Nom_Competencia` varchar(70) NOT NULL,
  `Vers_Competencia` int(11) NOT NULL,
  `Denomi_Competencia` varchar(100) NOT NULL,
  `Estado_Competencia` varchar(15) NOT NULL,
  `Id_Programa_Formacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `competencia`
--

INSERT INTO `competencia` (`Id_Competencia`, `Cod_Competencia`, `Nom_Competencia`, `Vers_Competencia`, `Denomi_Competencia`, `Estado_Competencia`, `Id_Programa_Formacion`) VALUES
(1, 'a1a2', 'Crea', 2, '45', '1', 1),
(2, '2983', 'Juan', 2, '232', '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `desercion`
--

CREATE TABLE `desercion` (
  `Id_Desercion` int(11) NOT NULL,
  `Motivo_Desercion` varchar(100) NOT NULL,
  `Fecha_Desercion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_falla_1` date NOT NULL,
  `fecha_falla_2` date NOT NULL,
  `fecha_falla_3` date NOT NULL,
  `Id_Usuario_Aprendiz` int(11) NOT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `desercion`
--

INSERT INTO `desercion` (`Id_Desercion`, `Motivo_Desercion`, `Fecha_Desercion`, `fecha_falla_1`, `fecha_falla_2`, `fecha_falla_3`, `Id_Usuario_Aprendiz`, `Id_Ficha_Caracterizacion`) VALUES
(7, 'Desertar.', '2019-03-20 09:39:09', '2019-03-21', '2019-03-21', '2019-03-21', 9, 1),
(8, 'pro,.', '2019-03-20 11:30:56', '2019-03-21', '2019-03-22', '2019-03-21', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `Id_Estado` int(11) NOT NULL,
  `Estado` varchar(22) NOT NULL,
  `Sigla_Estado` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`Id_Estado`, `Estado`, `Sigla_Estado`) VALUES
(1, 'Activo', 'A'),
(2, 'Inactivo', 'I');

-- --------------------------------------------------------

--
-- Table structure for table `estado_aprendiz`
--

CREATE TABLE `estado_aprendiz` (
  `Id_Estado_Aprendiz` int(11) NOT NULL,
  `Estado_Aprendiz` varchar(20) NOT NULL,
  `Sigla_Estado_Aprendiz` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estado_aprendiz`
--

INSERT INTO `estado_aprendiz` (`Id_Estado_Aprendiz`, `Estado_Aprendiz`, `Sigla_Estado_Aprendiz`) VALUES
(1, 'En Formación', 'F'),
(2, 'Proceso Deserción', 'PD');

-- --------------------------------------------------------

--
-- Table structure for table `estado_inasistencia`
--

CREATE TABLE `estado_inasistencia` (
  `Id_Estado_Inasistencia` int(11) NOT NULL,
  `Estado_Inasistencia` varchar(40) NOT NULL,
  `Sigla_Estado_Inasistencia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ficha_aprendiz`
--

CREATE TABLE `ficha_aprendiz` (
  `Id_Ficha_Aprendiz` int(11) NOT NULL,
  `Id_Usuario_Aprendiz` int(11) NOT NULL,
  `Id_Ficha_Caracterizacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ficha_aprendiz`
--

INSERT INTO `ficha_aprendiz` (`Id_Ficha_Aprendiz`, `Id_Usuario_Aprendiz`, `Id_Ficha_Caracterizacion`) VALUES
(1, 1, 1),
(3, 6, 3),
(4, 8, 1),
(5, 9, 1),
(6, 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ficha_caracterizacion`
--

CREATE TABLE `ficha_caracterizacion` (
  `Id_Ficha_Caracterizacion` int(11) NOT NULL,
  `Num_Ficha_Caracterizacion` int(15) NOT NULL,
  `Estado_Ficha_Caracterizacion` varchar(15) NOT NULL,
  `Id_Programa_Formacion` int(11) NOT NULL,
  `Id_Jornada` int(11) NOT NULL,
  `Id_Usuario_Instructor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ficha_caracterizacion`
--

INSERT INTO `ficha_caracterizacion` (`Id_Ficha_Caracterizacion`, `Num_Ficha_Caracterizacion`, `Estado_Ficha_Caracterizacion`, `Id_Programa_Formacion`, `Id_Jornada`, `Id_Usuario_Instructor`) VALUES
(1, 1503799, 'En Formación', 1, 1, 3),
(2, 1111, '111', 1, 1, 3),
(3, 2222, 'En Formación', 2, 1, 3),
(4, 123123, 'En Formacíon', 6, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `inasistencia`
--

CREATE TABLE `inasistencia` (
  `Id_Inasistencia` int(11) NOT NULL,
  `Inasistencia` binary(1) NOT NULL,
  `Fecha_Inasistencia` datetime NOT NULL,
  `Id_Usuario_Aprendiz` int(11) NOT NULL,
  `Id_Estado_Inasistencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jornada`
--

CREATE TABLE `jornada` (
  `Id_Jornada` int(11) NOT NULL,
  `Nom_Jornada` varchar(45) NOT NULL,
  `Sigla_Jornada` varchar(8) NOT NULL,
  `Estado_Jornada` varchar(15) NOT NULL,
  `Id_Trimestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jornada`
--

INSERT INTO `jornada` (`Id_Jornada`, `Nom_Jornada`, `Sigla_Jornada`, `Estado_Jornada`, `Id_Trimestre`) VALUES
(1, 'Mañana2', 'Ma2', '1', 1),
(2, 'Tarde3', 'Ta3', '1', 2),
(3, 'sabado', 's', '2', 2),
(4, 'Diurna', 'Di2', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `justificar_inasistencia`
--

CREATE TABLE `justificar_inasistencia` (
  `Id_Justificar_Inasistencia` int(11) NOT NULL,
  `Archivo_Justificacion` longblob,
  `Fecha_Validada_Justificacion` datetime DEFAULT NULL,
  `Comentario_Validacion` varchar(400) DEFAULT NULL,
  `Id_Inasistencia` int(11) NOT NULL,
  `Id_Estado_Inasistencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `programa_formacion`
--

CREATE TABLE `programa_formacion` (
  `Id_Programa_Formacion` int(11) NOT NULL,
  `Cod_Programa_Formacion` int(20) NOT NULL,
  `Nom_Programa_Formacion` varchar(70) NOT NULL,
  `Vers_Programa_Formacion` int(15) NOT NULL,
  `Denomi_Programa_Formacion` varchar(100) NOT NULL,
  `Estado_Programa_Formacion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programa_formacion`
--

INSERT INTO `programa_formacion` (`Id_Programa_Formacion`, `Cod_Programa_Formacion`, `Nom_Programa_Formacion`, `Vers_Programa_Formacion`, `Denomi_Programa_Formacion`, `Estado_Programa_Formacion`) VALUES
(1, 123, 'Analisis y Desarrollo 4', 1, '2', '1'),
(2, 2232, 'TPM', 212, 'sdsdds', '1'),
(3, 3421, 'adsis', 2, 'x', '1'),
(4, 12312, 'pela2', 32, 'xq2', '2'),
(5, 12312, 'prueba', 0, 's', '2'),
(6, 1, 'programaprro2', 1, 'PRO3', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(11) NOT NULL,
  `Rol` varchar(25) NOT NULL,
  `Sigla_Rol` varchar(8) NOT NULL,
  `Id_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Rol`, `Sigla_Rol`, `Id_Estado`) VALUES
(1, 'Aprendiz2', 'Ap', 1),
(2, 'Instructor', 'In', 1),
(3, 'Salud', 'Sa', 1),
(4, 'Líder de Área', 'La', 1),
(5, 'Coordinador', 'Co', 1),
(6, 'as3', 'as3', 2),
(7, 'as2', 'saas', 2),
(8, 'as2s', 'adas', 2),
(9, 'sad', 'sa', 2),
(10, 'sda', 'd', 2),
(11, 'das', 'sad', 1),
(12, 'xxx', 'xxx', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Tipo_Documento` varchar(20) NOT NULL,
  `Sigla_Tipo_Documento` varchar(6) NOT NULL,
  `Id_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`Id_Tipo_Documento`, `Tipo_Documento`, `Sigla_Tipo_Documento`, `Id_Estado`) VALUES
(1, 'Ciudadanía', 'C.C.', 1),
(2, 'Tarjeta de Identidad', 'T.I.', 1),
(6, 'Extrantajeria', 'E.', 1),
(7, 'sas', 'dsa', 2),
(8, 'P', 'P', 2),
(9, 'ñp', 'ñp', 1),
(10, 're', 're', 1),
(11, 'zzz', 'zzz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trimestre`
--

CREATE TABLE `trimestre` (
  `Id_Trimestre` int(11) NOT NULL,
  `Num_Trimestre` int(11) NOT NULL,
  `Sigla_Trimestre` varchar(15) NOT NULL,
  `Estado_Trimestre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trimestre`
--

INSERT INTO `trimestre` (`Id_Trimestre`, `Num_Trimestre`, `Sigla_Trimestre`, `Estado_Trimestre`) VALUES
(1, 1, 'I', '1'),
(2, 3, 'III', '1'),
(3, 2, 'IIII', '2');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Num_Documento` varchar(25) NOT NULL,
  `Prm_Nombre` varchar(20) NOT NULL,
  `Sgd_Nombre` varchar(20) NOT NULL,
  `Prm_Apellido` varchar(20) NOT NULL,
  `Sgd_Apellido` varchar(20) NOT NULL,
  `Correo_Electronico` varchar(70) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Fec_Nacimiento` date NOT NULL,
  `Telefono` int(13) NOT NULL,
  `Contrasena` varchar(300) NOT NULL,
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Id_Rol` int(11) NOT NULL,
  `Id_Estado` int(11) NOT NULL,
  `Id_Estado_Aprendiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Num_Documento`, `Prm_Nombre`, `Sgd_Nombre`, `Prm_Apellido`, `Sgd_Apellido`, `Correo_Electronico`, `Direccion`, `Fec_Nacimiento`, `Telefono`, `Contrasena`, `Id_Tipo_Documento`, `Id_Rol`, `Id_Estado`, `Id_Estado_Aprendiz`) VALUES
(1, '1026596859', 'Juan2', 'Diego2', 'Diaz2', 'Aragonez2', 'jddiaz462@misena.edu.co', 'Calle 45', '1999-01-09', 123456, '$2y$10$0/D5zkxtvo0EhGf9rcIEDe5lp7EBxKRjdpV.FmrPxVvSC7orujaNa', 1, 1, 1, 1),
(2, '1234', 'Carlos', 'Carlos', 'Cruz', 'Cruz', 'dscastillo30@misena.edu.co', 'Direccion', '2018-11-07', 123456, '$2y$10$0/D5zkxtvo0EhGf9rcIEDe5lp7EBxKRjdpV.FmrPxVvSC7orujaNa', 1, 5, 1, NULL),
(3, '12345', 'Carla', 'Carla2', 'Diaz', 'Diaz', 'juandiaz9923@gmail.com', 'direccion 5', '2018-11-01', 111111, '$2y$10$0/D5zkxtvo0EhGf9rcIEDe5lp7EBxKRjdpV.FmrPxVvSC7orujaNa', 1, 2, 1, NULL),
(4, '123', 'Harry', 'Harry2', 'Lopez', 'Lopez', 'Lopez@misena.edu.co', 'XXXXX', '2018-11-01', 1111, '$2y$10$0/D5zkxtvo0EhGf9rcIEDe5lp7EBxKRjdpV.FmrPxVvSC7orujaNa', 1, 4, 1, NULL),
(5, '1122', 'Br', 'Br', 'Cr', 'Cr', 'BRCR@misena.edu.co', 'Direccion ', '2018-11-07', 55555555, '$2y$10$0/D5zkxtvo0EhGf9rcIEDe5lp7EBxKRjdpV.FmrPxVvSC7orujaNa', 2, 3, 1, NULL),
(6, '22334455', 'Juan ', 'Diego ', 'Diaz', 'Aragonez', 'prueba@gmail.com', 'direcion', '1999-01-09', 5506298, '$2y$10$QqyakRxoYJQByXlXngDQP.IKOZ3TeoHe/7spqozEeeEYfutH4JdoS', 1, 1, 1, 1),
(7, '55555', 'Juan x3', 'Diego x3', 'Diaz x5', 'Aragonez x5', 'prueba99@gmail.com', 'direcion99', '1999-01-09', 99999, '$2y$10$n2O8NINcnXcDtELoaEp61OMb1JK5rlujZeuOJW9sv3pd2J8z59pUG', 1, 1, 1, 1),
(8, '9999999999', 'pedro', 'pedro', 'pedro', 'pedro', 'pedro@pedro.com', 'pedropedro', '2019-02-28', 32412, '$2y$10$kw5R1x7AUHS.pyceHqMGAO/mHBrb3Kz6OyVHC98LXXZ7XHen8X1m6', 1, 1, 1, 1),
(9, '1076824030', 'javison', 'Prueba', 'asprilla', 'Rivas', 'jasprilla03@misena.edu.co', 'calle 45', '1998-09-10', 2147483647, '$2y$10$tCqbm8nUfA.pXnsaR3doLOTyaQmcM1GU1OmPvEFfl1PrAkIdPyDfO', 1, 1, 1, 2),
(10, '1111', 'xxx', 'xxx', 'xx', 'xxx', '1111@gmai.com', '1111', '2019-03-13', 222, '$2y$10$GxRKQVGz37rABjeluIhwf.6PDaQqEob6vbcAeVhnGqt3FQYJoAebO', 1, 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `competencia`
--
ALTER TABLE `competencia`
  ADD PRIMARY KEY (`Id_Competencia`,`Cod_Competencia`),
  ADD KEY `Id_Programa_Formacion` (`Id_Programa_Formacion`);

--
-- Indexes for table `desercion`
--
ALTER TABLE `desercion`
  ADD PRIMARY KEY (`Id_Desercion`),
  ADD KEY `Id_Usuario_Aprendiz` (`Id_Usuario_Aprendiz`),
  ADD KEY `Id_Ficha_Caracterizacion` (`Id_Ficha_Caracterizacion`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `estado_aprendiz`
--
ALTER TABLE `estado_aprendiz`
  ADD PRIMARY KEY (`Id_Estado_Aprendiz`);

--
-- Indexes for table `estado_inasistencia`
--
ALTER TABLE `estado_inasistencia`
  ADD PRIMARY KEY (`Id_Estado_Inasistencia`);

--
-- Indexes for table `ficha_aprendiz`
--
ALTER TABLE `ficha_aprendiz`
  ADD PRIMARY KEY (`Id_Ficha_Aprendiz`),
  ADD KEY `Id_Usuario_Aprendiz` (`Id_Usuario_Aprendiz`),
  ADD KEY `Id_Ficha_Caracterizacion` (`Id_Ficha_Caracterizacion`);

--
-- Indexes for table `ficha_caracterizacion`
--
ALTER TABLE `ficha_caracterizacion`
  ADD PRIMARY KEY (`Id_Ficha_Caracterizacion`,`Num_Ficha_Caracterizacion`),
  ADD KEY `Id_Programa_Formacion` (`Id_Programa_Formacion`),
  ADD KEY `Id_Jornada` (`Id_Jornada`),
  ADD KEY `Id_Usuario_Instructor` (`Id_Usuario_Instructor`);

--
-- Indexes for table `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD PRIMARY KEY (`Id_Inasistencia`),
  ADD KEY `Id_Usuario_Aprendiz` (`Id_Usuario_Aprendiz`),
  ADD KEY `Id_Estado_Inasistencia` (`Id_Estado_Inasistencia`);

--
-- Indexes for table `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`Id_Jornada`),
  ADD KEY `Id_Trimestre` (`Id_Trimestre`);

--
-- Indexes for table `justificar_inasistencia`
--
ALTER TABLE `justificar_inasistencia`
  ADD PRIMARY KEY (`Id_Justificar_Inasistencia`),
  ADD KEY `Id_Inasistencia` (`Id_Inasistencia`),
  ADD KEY `Id_Estado_Inasistencia` (`Id_Estado_Inasistencia`);

--
-- Indexes for table `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD PRIMARY KEY (`Id_Programa_Formacion`,`Cod_Programa_Formacion`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`),
  ADD KEY `Id_Estado` (`Id_Estado`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Id_Tipo_Documento`),
  ADD KEY `Id_Estado` (`Id_Estado`);

--
-- Indexes for table `trimestre`
--
ALTER TABLE `trimestre`
  ADD PRIMARY KEY (`Id_Trimestre`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`,`Num_Documento`,`Correo_Electronico`),
  ADD KEY `Id_Tipo_Documento` (`Id_Tipo_Documento`),
  ADD KEY `Id_Rol` (`Id_Rol`),
  ADD KEY `Id_Estado` (`Id_Estado`),
  ADD KEY `Id_Estado_Aprendiz` (`Id_Estado_Aprendiz`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `competencia`
--
ALTER TABLE `competencia`
  MODIFY `Id_Competencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `desercion`
--
ALTER TABLE `desercion`
  MODIFY `Id_Desercion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estado_aprendiz`
--
ALTER TABLE `estado_aprendiz`
  MODIFY `Id_Estado_Aprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `estado_inasistencia`
--
ALTER TABLE `estado_inasistencia`
  MODIFY `Id_Estado_Inasistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ficha_aprendiz`
--
ALTER TABLE `ficha_aprendiz`
  MODIFY `Id_Ficha_Aprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ficha_caracterizacion`
--
ALTER TABLE `ficha_caracterizacion`
  MODIFY `Id_Ficha_Caracterizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inasistencia`
--
ALTER TABLE `inasistencia`
  MODIFY `Id_Inasistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jornada`
--
ALTER TABLE `jornada`
  MODIFY `Id_Jornada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `justificar_inasistencia`
--
ALTER TABLE `justificar_inasistencia`
  MODIFY `Id_Justificar_Inasistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programa_formacion`
--
ALTER TABLE `programa_formacion`
  MODIFY `Id_Programa_Formacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Id_Tipo_Documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trimestre`
--
ALTER TABLE `trimestre`
  MODIFY `Id_Trimestre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competencia`
--
ALTER TABLE `competencia`
  ADD CONSTRAINT `competencia_ibfk_1` FOREIGN KEY (`Id_Programa_Formacion`) REFERENCES `programa_formacion` (`Id_Programa_Formacion`);

--
-- Constraints for table `desercion`
--
ALTER TABLE `desercion`
  ADD CONSTRAINT `desercion_ibfk_1` FOREIGN KEY (`Id_Usuario_Aprendiz`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `desercion_ibfk_2` FOREIGN KEY (`Id_Ficha_Caracterizacion`) REFERENCES `ficha_caracterizacion` (`Id_Ficha_Caracterizacion`);

--
-- Constraints for table `ficha_aprendiz`
--
ALTER TABLE `ficha_aprendiz`
  ADD CONSTRAINT `ficha_aprendiz_ibfk_1` FOREIGN KEY (`Id_Usuario_Aprendiz`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `ficha_aprendiz_ibfk_2` FOREIGN KEY (`Id_Ficha_Caracterizacion`) REFERENCES `ficha_caracterizacion` (`Id_Ficha_Caracterizacion`);

--
-- Constraints for table `ficha_caracterizacion`
--
ALTER TABLE `ficha_caracterizacion`
  ADD CONSTRAINT `ficha_caracterizacion_ibfk_1` FOREIGN KEY (`Id_Programa_Formacion`) REFERENCES `programa_formacion` (`Id_Programa_Formacion`),
  ADD CONSTRAINT `ficha_caracterizacion_ibfk_2` FOREIGN KEY (`Id_Jornada`) REFERENCES `jornada` (`Id_Jornada`),
  ADD CONSTRAINT `ficha_caracterizacion_ibfk_3` FOREIGN KEY (`Id_Usuario_Instructor`) REFERENCES `usuario` (`Id_Usuario`);

--
-- Constraints for table `inasistencia`
--
ALTER TABLE `inasistencia`
  ADD CONSTRAINT `inasistencia_ibfk_1` FOREIGN KEY (`Id_Usuario_Aprendiz`) REFERENCES `usuario` (`Id_Usuario`),
  ADD CONSTRAINT `inasistencia_ibfk_2` FOREIGN KEY (`Id_Estado_Inasistencia`) REFERENCES `estado_inasistencia` (`Id_Estado_Inasistencia`);

--
-- Constraints for table `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`Id_Trimestre`) REFERENCES `trimestre` (`Id_Trimestre`);

--
-- Constraints for table `justificar_inasistencia`
--
ALTER TABLE `justificar_inasistencia`
  ADD CONSTRAINT `justificar_inasistencia_ibfk_1` FOREIGN KEY (`Id_Inasistencia`) REFERENCES `inasistencia` (`Id_Inasistencia`),
  ADD CONSTRAINT `justificar_inasistencia_ibfk_2` FOREIGN KEY (`Id_Estado_Inasistencia`) REFERENCES `estado_inasistencia` (`Id_Estado_Inasistencia`);

--
-- Constraints for table `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_Estado`);

--
-- Constraints for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD CONSTRAINT `tipo_documento_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_Estado`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_Tipo_Documento`) REFERENCES `tipo_documento` (`Id_Tipo_Documento`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`Id_Estado`) REFERENCES `estado` (`Id_Estado`),
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`Id_Estado_Aprendiz`) REFERENCES `estado_aprendiz` (`Id_Estado_Aprendiz`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
