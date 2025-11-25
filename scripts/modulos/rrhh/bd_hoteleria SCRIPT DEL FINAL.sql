-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2025 a las 16:46:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_hoteleria13`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_activosfijos`
--

CREATE TABLE `tbl_activosfijos` (
  `Pk_Activo_ID` int(11) NOT NULL,
  `Cmp_Nombre_Activo` varchar(100) NOT NULL,
  `Cmp_Descripcion` varchar(200) DEFAULT NULL,
  `Cmp_Grupo_Activo` varchar(50) NOT NULL DEFAULT 'Otros',
  `Cmp_Fecha_Adquisicion` date NOT NULL,
  `Cmp_Costo_Adquisicion` decimal(15,2) NOT NULL,
  `Cmp_Valor_Residual` decimal(15,2) NOT NULL,
  `Cmp_Vida_Util` int(11) NOT NULL,
  `Cmp_Estado` bit(1) NOT NULL DEFAULT b'1',
  `Cmp_CtaActivo` varchar(20) DEFAULT NULL,
  `Cmp_CtaDepreciacion` varchar(20) DEFAULT NULL,
  `Cmp_CtaGastoDepreciacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_anticipos`
--

CREATE TABLE `tbl_anticipos` (
  `Cmp_iId_Anticipo` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_deMonto_Anticipo` decimal(10,2) DEFAULT NULL,
  `Cmp_dFecha_Anticipo` datetime DEFAULT NULL,
  `Cmp_sMotivo_Anticipo` varchar(255) DEFAULT NULL,
  `Cmp_deSaldoPendiente_Anticipo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_anticipos`
--

INSERT INTO `tbl_anticipos` (`Cmp_iId_Anticipo`, `Cmp_iId_Empleado`, `Cmp_deMonto_Anticipo`, `Cmp_dFecha_Anticipo`, `Cmp_sMotivo_Anticipo`, `Cmp_deSaldoPendiente_Anticipo`) VALUES
(1, 1, 100.00, '2025-11-09 15:36:35', 'anticipo', 100.00),
(3, 1, 100.00, '2025-11-11 08:03:35', 'test', 100.00),
(4, 1, 100.00, '2023-01-01 22:03:30', 'hola', 100.00),
(5, 1, 50.00, '2023-11-15 08:16:58', 'pruebas', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aplicacion`
--

CREATE TABLE `tbl_aplicacion` (
  `Pk_Id_Aplicacion` int(11) NOT NULL,
  `Fk_Id_Reporte_Aplicacion` int(11) DEFAULT NULL,
  `Cmp_Nombre_Aplicacion` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Aplicacion` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Aplicacion` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_aplicacion`
--

INSERT INTO `tbl_aplicacion` (`Pk_Id_Aplicacion`, `Fk_Id_Reporte_Aplicacion`, `Cmp_Nombre_Aplicacion`, `Cmp_Descripcion_Aplicacion`, `Cmp_Estado_Aplicacion`) VALUES
(1, NULL, 'Registros', 'Registro de acciones', b'1'),
(301, NULL, 'Empleados', 'Control empleados', b'1'),
(302, NULL, 'Usuarios', 'Control usuarios', b'1'),
(303, NULL, 'Perfiles', 'Perfiles', b'1'),
(304, NULL, 'Modulos', 'Módulos', b'1'),
(305, NULL, 'Aplicacion', 'Aplicaciones', b'1'),
(306, NULL, 'Asig Aplicacion Usuario', 'Permisos', b'1'),
(307, NULL, 'Asig aplicacion Perfil', 'Permisos perfil', b'1'),
(308, NULL, 'Asig Perfiles', 'Perfiles usuarios', b'1'),
(309, NULL, 'Bitacora', 'Accesos', b'1'),
(405, 1, 'paciente', 'pacientes hoy', b'1'),
(999, NULL, 'Navegador', 'test', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignacion_modulo_aplicacion`
--

CREATE TABLE `tbl_asignacion_modulo_aplicacion` (
  `Fk_Id_Modulo` int(11) NOT NULL,
  `Fk_Id_Aplicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_asignacion_modulo_aplicacion`
--

INSERT INTO `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`) VALUES
(4, 301),
(4, 302),
(4, 303),
(4, 304),
(4, 305),
(4, 306),
(4, 307),
(4, 308),
(4, 309),
(9, 405),
(100, 999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asistencias`
--

CREATE TABLE `tbl_asistencias` (
  `Cmp_iId_Asistencia` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_dFecha_Asistencia` datetime DEFAULT NULL,
  `Cmp_tHoraEntrada_Asistencia` time DEFAULT NULL,
  `Cmp_tHoraSalida_Asistencia` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_asistencias`
--

INSERT INTO `tbl_asistencias` (`Cmp_iId_Asistencia`, `Cmp_iId_Empleado`, `Cmp_dFecha_Asistencia`, `Cmp_tHoraEntrada_Asistencia`, `Cmp_tHoraSalida_Asistencia`) VALUES
(1, 1, '2024-11-11 08:00:41', '08:00:00', '17:00:00'),
(2, 1, '2024-11-01 08:00:41', '08:00:00', '17:00:00'),
(3, 1, '2023-11-01 00:00:00', '08:00:00', '17:00:00'),
(4, 1, '2023-11-02 00:00:00', '08:00:00', '17:00:00'),
(5, 1, '2023-11-03 00:00:00', '08:00:00', '17:00:00'),
(6, 1, '2023-11-04 00:00:00', '08:00:00', '17:00:00'),
(7, 1, '2023-11-05 00:00:00', '08:00:00', '17:00:00'),
(8, 1, '2023-11-06 00:00:00', '08:00:00', '17:00:00'),
(9, 1, '2023-11-07 00:00:00', '08:00:00', '17:00:00'),
(10, 1, '2023-11-08 00:00:00', '08:00:00', '17:00:00'),
(11, 1, '2023-11-09 00:00:00', '08:00:00', '17:00:00'),
(12, 1, '2023-11-10 00:00:00', '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ausenciaspermisos`
--

CREATE TABLE `tbl_ausenciaspermisos` (
  `Cmp_iId_AusenciaPermiso` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_dFecha_AusenciaPermiso` datetime DEFAULT NULL,
  `Cmp_sTipo_AusenciaPermiso` varchar(50) DEFAULT NULL,
  `Cmp_bJustificada_AusenciaPermiso` bit(1) DEFAULT NULL,
  `Cmp_sMotivo_AusenciaPermiso` varchar(255) DEFAULT NULL,
  `Cmp_sObservacion_AusenciaPermiso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_balance_general`
--

CREATE TABLE `tbl_balance_general` (
  `Pk_Id_BalanceGeneral` int(11) NOT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_balance_saldos`
--

CREATE TABLE `tbl_balance_saldos` (
  `Pk_Id_Balance` int(11) NOT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Debe` decimal(15,2) DEFAULT 0.00,
  `Cmp_Haber` decimal(15,2) DEFAULT 0.00,
  `Cmp_Saldo` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bitacora`
--

CREATE TABLE `tbl_bitacora` (
  `Pk_Id_Bitacora` int(11) NOT NULL,
  `Fk_Id_Usuario` int(11) DEFAULT NULL,
  `Fk_Id_Aplicacion` int(11) DEFAULT NULL,
  `Cmp_Fecha` datetime DEFAULT NULL,
  `Cmp_Accion` varchar(255) DEFAULT NULL,
  `Cmp_Ip` varchar(50) DEFAULT NULL,
  `Cmp_Nombre_Pc` varchar(50) DEFAULT NULL,
  `Cmp_Login_Estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_bitacora`
--

INSERT INTO `tbl_bitacora` (`Pk_Id_Bitacora`, `Fk_Id_Usuario`, `Fk_Id_Aplicacion`, `Cmp_Fecha`, `Cmp_Accion`, `Cmp_Ip`, `Cmp_Nombre_Pc`, `Cmp_Login_Estado`) VALUES
(1, 23, NULL, '2025-10-31 16:37:46', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(2, 23, NULL, '2025-10-31 16:40:24', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(3, 23, NULL, '2025-10-31 16:44:32', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(4, 23, NULL, '2025-10-31 16:48:27', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(5, 23, NULL, '2025-10-31 16:49:30', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(6, 23, NULL, '2025-10-31 21:21:14', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(7, 23, NULL, '2025-10-31 21:21:17', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(8, 23, NULL, '2025-10-31 21:23:41', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(9, 23, NULL, '2025-10-31 21:23:45', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(10, 23, NULL, '2025-10-31 21:31:21', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(11, 23, NULL, '2025-10-31 21:31:34', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(12, 23, NULL, '2025-10-31 21:40:11', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(13, 23, NULL, '2025-10-31 21:40:16', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(14, 23, NULL, '2025-11-02 15:44:33', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(15, 23, NULL, '2025-11-02 15:44:43', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(16, 23, NULL, '2025-11-02 15:59:41', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(17, 23, NULL, '2025-11-02 15:59:50', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(18, 23, NULL, '2025-11-02 16:01:01', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(19, 23, NULL, '2025-11-02 16:01:14', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(20, 23, NULL, '2025-11-02 16:34:04', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(21, 23, NULL, '2025-11-02 16:34:30', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(22, 23, NULL, '2025-11-02 16:39:48', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(23, 23, NULL, '2025-11-02 16:42:06', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(24, 23, NULL, '2025-11-02 16:46:59', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(25, 23, NULL, '2025-11-02 17:07:25', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(26, 23, NULL, '2025-11-02 17:07:33', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(27, 23, NULL, '2025-11-02 17:08:13', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(28, 23, NULL, '2025-11-02 17:08:50', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(29, 23, NULL, '2025-11-02 18:28:19', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(30, 23, NULL, '2025-11-02 18:28:40', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(31, 23, NULL, '2025-11-02 18:34:15', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(32, 23, NULL, '2025-11-02 18:35:16', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(33, 23, NULL, '2025-11-02 18:37:09', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(34, 23, NULL, '2025-11-02 18:37:43', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(35, 23, NULL, '2025-11-02 18:40:11', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(36, 23, NULL, '2025-11-02 18:40:47', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(37, 23, NULL, '2025-11-02 18:46:18', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(38, 23, 1, '2025-11-02 18:48:23', 'Guardó el módulo: Navegador', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(39, 23, 1, '2025-11-02 18:49:21', 'Guardó aplicación: Navegador', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(40, 23, NULL, '2025-11-02 18:50:21', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(41, 23, NULL, '2025-11-02 18:53:56', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(42, 23, NULL, '2025-11-02 18:56:03', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(43, 23, NULL, '2025-11-02 18:56:18', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(44, 23, NULL, '2025-11-02 19:22:59', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(45, 23, NULL, '2025-11-02 19:25:10', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(46, 23, NULL, '2025-11-02 19:30:46', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(47, 23, NULL, '2025-11-02 19:33:25', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(48, 23, NULL, '2025-11-02 19:35:29', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(49, 23, NULL, '2025-11-02 19:36:32', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(50, 23, NULL, '2025-11-02 19:37:51', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(51, 23, NULL, '2025-11-02 19:40:36', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(52, 23, NULL, '2025-11-02 19:46:02', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(53, 23, NULL, '2025-11-02 19:49:18', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(54, 23, NULL, '2025-11-02 20:10:33', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(55, 23, NULL, '2025-11-02 20:11:52', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(56, 23, NULL, '2025-11-02 20:15:19', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(57, 23, NULL, '2025-11-02 20:17:51', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(58, 23, NULL, '2025-11-02 20:20:49', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(59, 23, NULL, '2025-11-02 20:27:52', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(60, 23, NULL, '2025-11-02 20:31:31', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(61, 23, NULL, '2025-11-02 20:35:19', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(62, 23, NULL, '2025-11-02 20:36:46', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(63, 23, NULL, '2025-11-02 20:39:38', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(64, 23, NULL, '2025-11-02 20:39:50', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(65, 23, NULL, '2025-11-02 20:40:58', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(66, 23, NULL, '2025-11-02 20:44:35', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(67, 23, NULL, '2025-11-02 20:46:58', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(68, 23, NULL, '2025-11-02 20:52:04', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(69, 23, NULL, '2025-11-02 21:00:04', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(70, 23, NULL, '2025-11-02 21:00:29', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(71, 23, NULL, '2025-11-02 21:02:51', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(72, 23, NULL, '2025-11-02 21:03:09', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(73, 23, NULL, '2025-11-02 21:05:59', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(74, 23, NULL, '2025-11-02 21:06:41', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(75, 23, NULL, '2025-11-02 21:12:35', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(76, 23, NULL, '2025-11-02 21:13:13', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(77, 23, NULL, '2025-11-02 21:20:38', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(78, 23, NULL, '2025-11-02 21:20:42', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(79, 23, NULL, '2025-11-02 21:23:08', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(80, 23, NULL, '2025-11-02 21:23:20', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(81, 23, NULL, '2025-11-02 21:25:15', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(82, 23, NULL, '2025-11-02 21:25:40', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(83, 23, NULL, '2025-11-02 21:37:11', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(84, 23, NULL, '2025-11-02 21:37:31', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(85, 23, NULL, '2025-11-02 21:40:25', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(86, 23, NULL, '2025-11-02 21:40:37', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(87, 23, NULL, '2025-11-02 21:42:12', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(88, 23, NULL, '2025-11-02 21:42:21', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(89, 23, NULL, '2025-11-02 21:43:27', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(90, 23, NULL, '2025-11-02 21:47:18', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(91, 23, NULL, '2025-11-02 22:26:14', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(92, 23, NULL, '2025-11-02 22:30:34', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(93, 23, NULL, '2025-11-02 22:31:00', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(94, 23, NULL, '2025-11-02 22:31:36', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(95, 23, NULL, '2025-11-02 22:31:49', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(96, 23, NULL, '2025-11-02 22:31:56', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(97, 23, NULL, '2025-11-02 22:54:08', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(98, 23, NULL, '2025-11-02 22:54:56', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(99, 23, NULL, '2025-11-02 23:00:37', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(100, 23, NULL, '2025-11-02 23:04:29', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(101, 23, NULL, '2025-11-03 22:03:54', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(102, 23, NULL, '2025-11-03 22:04:07', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(103, 23, NULL, '2025-11-03 22:11:41', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(104, 23, NULL, '2025-11-03 22:14:36', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(105, 23, NULL, '2025-11-03 22:16:48', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(106, 23, NULL, '2025-11-03 22:17:06', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(107, 23, NULL, '2025-11-03 22:31:01', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(108, 23, NULL, '2025-11-03 22:31:24', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(109, 23, NULL, '2025-11-03 22:50:09', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(110, 23, NULL, '2025-11-03 22:51:16', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(111, 23, NULL, '2025-11-03 22:51:57', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(112, 23, NULL, '2025-11-03 22:52:19', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(113, 23, NULL, '2025-11-03 22:53:09', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(114, 23, NULL, '2025-11-03 22:53:27', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(115, 23, NULL, '2025-11-03 23:01:20', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(116, 23, NULL, '2025-11-03 23:01:35', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(117, 23, NULL, '2025-11-03 23:02:43', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(118, 23, NULL, '2025-11-03 23:03:31', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(119, 23, NULL, '2025-11-03 23:05:12', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(120, 23, NULL, '2025-11-03 23:05:33', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(121, 23, NULL, '2025-11-04 17:02:18', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(122, 23, NULL, '2025-11-04 17:05:25', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(123, 23, NULL, '2025-11-04 17:06:47', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(124, 23, NULL, '2025-11-04 17:19:43', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(125, 23, NULL, '2025-11-04 17:20:56', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(126, 23, NULL, '2025-11-04 17:31:45', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(127, 23, NULL, '2025-11-04 17:32:14', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(128, 23, NULL, '2025-11-04 17:36:28', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(129, 23, NULL, '2025-11-04 17:36:53', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(130, 23, NULL, '2025-11-04 18:03:29', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(131, 23, NULL, '2025-11-04 18:14:32', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(132, 23, NULL, '2025-11-04 18:15:52', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(133, 23, NULL, '2025-11-04 18:16:31', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(134, 23, NULL, '2025-11-04 18:17:29', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(135, 23, NULL, '2025-11-04 18:21:01', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(136, 23, NULL, '2025-11-04 18:29:17', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(137, 23, NULL, '2025-11-04 18:32:15', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(138, 23, NULL, '2025-11-04 18:34:49', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(139, 23, NULL, '2025-11-04 18:38:38', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(140, 23, NULL, '2025-11-04 18:39:09', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(141, 23, NULL, '2025-11-04 18:42:43', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(142, 23, NULL, '2025-11-04 18:43:45', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(143, 23, NULL, '2025-11-04 18:46:24', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(144, 23, NULL, '2025-11-04 18:46:54', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(145, 23, NULL, '2025-11-04 18:54:05', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(146, 23, NULL, '2025-11-04 18:55:04', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(147, 23, NULL, '2025-11-04 18:58:52', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(148, 23, NULL, '2025-11-04 18:59:16', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(149, 23, NULL, '2025-11-04 19:06:30', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(150, 23, NULL, '2025-11-04 19:08:14', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(151, 23, NULL, '2025-11-04 19:11:49', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(152, 23, NULL, '2025-11-04 19:12:48', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(153, 23, NULL, '2025-11-04 19:16:32', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(154, 23, NULL, '2025-11-04 19:21:44', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(155, 23, NULL, '2025-11-04 19:23:59', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(156, 23, NULL, '2025-11-04 19:27:16', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(157, 23, NULL, '2025-11-04 19:29:50', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(158, 23, NULL, '2025-11-04 19:31:56', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(159, 23, NULL, '2025-11-04 19:37:54', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(160, 23, NULL, '2025-11-04 19:39:31', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(161, 23, NULL, '2025-11-06 08:00:41', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(162, 23, NULL, '2025-11-06 08:01:16', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(163, 23, NULL, '2025-11-06 08:06:50', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(164, 23, NULL, '2025-11-06 08:08:34', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(165, 23, NULL, '2025-11-06 22:35:14', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(166, 23, NULL, '2025-11-06 22:35:47', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(167, 23, NULL, '2025-11-09 15:32:43', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(168, 23, NULL, '2025-11-09 15:32:45', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(169, 23, NULL, '2025-11-09 15:35:30', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(170, 23, NULL, '2025-11-09 15:36:49', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(171, 23, NULL, '2025-11-09 16:02:38', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(172, 23, NULL, '2025-11-09 16:02:45', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(173, 23, NULL, '2025-11-09 19:54:05', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(174, 23, NULL, '2025-11-09 19:54:22', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(175, 23, NULL, '2025-11-09 19:55:38', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(176, 23, NULL, '2025-11-09 19:57:08', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(177, 23, NULL, '2025-11-09 21:02:08', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(178, 23, NULL, '2025-11-09 21:04:13', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(179, 23, NULL, '2025-11-09 21:10:18', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(180, 23, NULL, '2025-11-09 21:17:39', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(181, 23, NULL, '2025-11-09 21:21:39', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(182, 23, NULL, '2025-11-09 21:23:52', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(183, 23, NULL, '2025-11-09 21:24:36', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(184, 23, NULL, '2025-11-09 21:24:55', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(185, 23, NULL, '2025-11-09 21:28:57', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(186, 23, NULL, '2025-11-09 21:30:01', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(187, 23, NULL, '2025-11-09 21:33:22', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(188, 23, NULL, '2025-11-09 21:33:44', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(189, 23, NULL, '2025-11-09 21:34:56', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(190, 23, NULL, '2025-11-09 21:37:13', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(191, 23, NULL, '2025-11-09 21:44:41', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(192, 23, NULL, '2025-11-09 21:45:59', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(193, 23, NULL, '2025-11-09 22:23:19', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(194, 23, NULL, '2025-11-09 22:32:40', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(195, 23, NULL, '2025-11-11 07:58:14', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(196, 23, NULL, '2025-11-11 08:05:47', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(197, 23, NULL, '2025-11-11 08:10:10', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(198, 23, NULL, '2025-11-11 08:39:11', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(199, 23, NULL, '2025-11-11 08:39:21', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(200, 23, NULL, '2025-11-11 08:39:35', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(201, 23, NULL, '2025-11-11 08:47:02', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(202, 23, NULL, '2025-11-11 08:47:54', 'Ingreso', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'1'),
(203, 23, NULL, '2025-11-11 08:48:20', 'Cierre de sesión', '192.168.142.164', 'DESKTOP-SMGJLAQ', b'0'),
(204, 23, NULL, '2025-11-12 19:24:00', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(205, 23, NULL, '2025-11-12 19:24:03', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(206, 23, NULL, '2025-11-12 19:47:04', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(207, 23, NULL, '2025-11-12 19:47:15', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(208, 23, NULL, '2025-11-12 19:48:19', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(209, 23, NULL, '2025-11-12 19:48:22', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(210, 23, NULL, '2025-11-12 19:54:34', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(211, 23, NULL, '2025-11-12 19:54:45', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(212, 23, NULL, '2025-11-12 20:23:42', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(213, 23, NULL, '2025-11-12 20:24:37', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(214, 23, NULL, '2025-11-12 20:24:43', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(215, 23, NULL, '2025-11-12 20:29:53', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(216, 23, NULL, '2025-11-12 20:30:43', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(217, 23, NULL, '2025-11-12 20:40:33', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(218, 23, NULL, '2025-11-12 20:41:04', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(219, 23, NULL, '2025-11-12 21:01:08', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(220, 23, NULL, '2025-11-12 21:01:33', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(221, 23, NULL, '2025-11-12 21:54:04', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(222, 23, NULL, '2025-11-12 21:54:32', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(223, 23, NULL, '2025-11-12 21:55:37', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(224, 23, NULL, '2025-11-12 21:56:03', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(225, 23, NULL, '2025-11-12 22:02:02', 'Ingreso', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'1'),
(226, 23, NULL, '2025-11-12 22:07:40', 'Cierre de sesión', '192.168.1.23', 'DESKTOP-SMGJLAQ', b'0'),
(227, 23, NULL, '2025-11-13 08:15:20', 'Cierre de sesión', '192.168.0.121', 'DESKTOP-SMGJLAQ', b'0'),
(228, 23, NULL, '2025-11-13 08:15:37', 'Ingreso', '192.168.0.121', 'DESKTOP-SMGJLAQ', b'1'),
(229, 23, NULL, '2025-11-13 08:18:06', 'Cierre de sesión', '192.168.0.121', 'DESKTOP-SMGJLAQ', b'0'),
(230, 23, NULL, '2025-11-25 08:23:41', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(231, 23, NULL, '2025-11-25 08:23:45', 'Cierre de sesión', '172.20.10.2', 'DESKTOP-6NR1HHG', b'0'),
(232, 23, NULL, '2025-11-25 08:36:14', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(233, 23, NULL, '2025-11-25 08:37:15', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(234, 23, NULL, '2025-11-25 08:38:11', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(235, 23, NULL, '2025-11-25 08:39:05', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(236, 23, 1, '2025-11-25 08:42:08', 'Guardó empleado/a: usuariofinal', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(237, 23, 1, '2025-11-25 08:42:39', 'Insertó un nuevo usuario: usuariofinal', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(238, 23, 309, '2025-11-25 08:44:09', 'Al usuario \'\'usuariofinal\'\' se le asignaron permisos en la aplicación \'\'Bitacora\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(239, 23, 1, '2025-11-25 08:44:42', 'Se asignó el perfil \'Administrador\' al usuario \'usuariofinal\'', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(240, 24, NULL, '2025-11-25 08:45:53', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(241, 23, NULL, '2025-11-25 08:53:49', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(242, 24, NULL, '2025-11-25 08:56:06', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(243, 23, NULL, '2025-11-25 08:57:47', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(244, 23, NULL, '2025-11-25 09:02:04', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(245, 23, 1, '2025-11-25 09:02:47', 'Guardó el módulo: paciente', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(246, 23, 1, '2025-11-25 09:03:58', 'Guardó aplicación: paciente', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(247, 23, NULL, '2025-11-25 09:04:27', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(248, 23, NULL, '2025-11-25 09:11:10', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(249, 23, NULL, '2025-11-25 09:12:45', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(250, 23, NULL, '2025-11-25 09:44:04', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(251, 23, NULL, '2025-11-25 09:44:55', 'Ingreso', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1'),
(252, 23, 999, '2025-11-25 09:45:32', 'Al usuario \'\'admin\'\' se le asignaron permisos en la aplicación \'\'Navegador\'\': Ingresar, Consultar, Modificar, Eliminar, Imprimir', '172.20.10.2', 'DESKTOP-6NR1HHG', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bloqueo_usuario`
--

CREATE TABLE `tbl_bloqueo_usuario` (
  `Pk_Id_Bloqueo` int(11) NOT NULL,
  `Fk_Id_Usuario` int(11) DEFAULT NULL,
  `Fk_Id_Bitacora` int(11) DEFAULT NULL,
  `Cmp_Fecha_Inicio_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Fecha_Fin_Bloqueo_Usuario` datetime DEFAULT NULL,
  `Cmp_Motivo_Bloqueo_Usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_catalogo_cuentas`
--

CREATE TABLE `tbl_catalogo_cuentas` (
  `Pk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_CtaNombre` varchar(100) NOT NULL,
  `Cmp_CtaMadre` varchar(20) DEFAULT NULL,
  `Cmp_CtaSaldoInicial` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaCargoMes` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaAbonoMes` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaSaldoActual` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaCargoActual` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaAbonoActual` decimal(15,2) DEFAULT 0.00,
  `Cmp_CtaTipo` bit(1) NOT NULL,
  `Cmp_CtaNaturaleza` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_catalogo_cuentas`
--

INSERT INTO `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`, `Cmp_CtaNombre`, `Cmp_CtaMadre`, `Cmp_CtaSaldoInicial`, `Cmp_CtaCargoMes`, `Cmp_CtaAbonoMes`, `Cmp_CtaSaldoActual`, `Cmp_CtaCargoActual`, `Cmp_CtaAbonoActual`, `Cmp_CtaTipo`, `Cmp_CtaNaturaleza`) VALUES
('1', 'ACTIVO', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.1', 'Activo disponible', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.1.1', 'Caja general', '1.1', 0.00, 0.00, 0.00, 600.00, 0.00, 0.00, b'1', b'1'),
('1.1.2', 'Caja chica', '1.1', 0.00, 0.00, 0.00, 400.00, 0.00, 0.00, b'1', b'1'),
('1.2', 'Bancos', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.2.1', 'Banco G&T', '1.2', 0.00, 0.00, 0.00, 700.00, 0.00, 0.00, b'1', b'1'),
('1.2.2', 'Banco BI', '1.2', 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, b'1', b'1'),
('1.3', 'Cuentas por cobrar', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.3.1', 'Clientes nacionales', '1.3', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, b'1', b'1'),
('1.3.2', 'Clientes extranjeros', '1.3', 0.00, 0.00, 0.00, 800.00, 0.00, 0.00, b'1', b'1'),
('1.4', 'Inventarios', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.4.1', 'Mercadería', '1.4', 0.00, 0.00, 0.00, 3000.00, 0.00, 0.00, b'1', b'1'),
('1.4.2', 'Materia prima', '1.4', 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, b'1', b'1'),
('1.5', 'Activos fijos', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('1.5.1', 'Mobiliario y equipo', '1.5', 0.00, 0.00, 0.00, 4000.00, 0.00, 0.00, b'1', b'1'),
('1.5.2', 'Equipo de cómputo', '1.5', 0.00, 0.00, 0.00, 2500.00, 0.00, 0.00, b'1', b'1'),
('1.5.3', 'Vehículos', '1.5', 0.00, 0.00, 0.00, 3500.00, 0.00, 0.00, b'1', b'1'),
('1.6', 'Depreciaciones acumuladas', '1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('1.6.1', 'Dep. acumulada mobiliario y equipo', '1.6', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'1', b'0'),
('1.6.2', 'Dep. acumulada equipo de cómputo', '1.6', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'1', b'0'),
('1.6.3', 'Dep. acumulada vehículos', '1.6', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'1', b'0'),
('2', 'PASIVO', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('2.1', 'Cuentas por pagar', '2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('2.1.1', 'Proveedores locales', '2.1', 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, b'1', b'0'),
('2.1.2', 'Proveedores extranjeros', '2.1', 0.00, 0.00, 0.00, 1000.00, 0.00, 0.00, b'1', b'0'),
('2.2', 'Obligaciones bancarias', '2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('2.2.1', 'Préstamo Banco G&T', '2.2', 0.00, 0.00, 0.00, 2000.00, 0.00, 0.00, b'1', b'0'),
('2.2.2', 'Préstamo Banco BI', '2.2', 0.00, 0.00, 0.00, 1500.00, 0.00, 0.00, b'1', b'0'),
('2.3', 'Impuestos por pagar', '2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('2.3.1', 'IVA por pagar', '2.3', 0.00, 0.00, 0.00, 800.00, 0.00, 0.00, b'1', b'0'),
('2.3.2', 'ISR por pagar', '2.3', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, b'1', b'0'),
('2.3.3', 'Retenciones por pagar', '2.3', 0.00, 0.00, 0.00, 300.00, 0.00, 0.00, b'1', b'0'),
('2.3.4', 'IGSS por pagar', '2.3', 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, b'1', b'0'),
('2.4', 'Otras obligaciones', '2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('2.4.1', 'Acreedores varios', '2.4', 0.00, 0.00, 0.00, 400.00, 0.00, 0.00, b'1', b'0'),
('3', 'CAPITAL', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('3.1', 'Capital social', '3', 0.00, 0.00, 0.00, 3000.00, 0.00, 0.00, b'1', b'0'),
('3.2', 'Utilidades retenidas', '3', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('3.2.1', 'Ejercicio anterior', '3.2', 0.00, 0.00, 0.00, 2000.00, 0.00, 0.00, b'1', b'0'),
('3.2.2', 'Ejercicio actual', '3.2', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'1', b'0'),
('4', 'INGRESOS', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('4.1', 'Ventas', '4', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('4.1.1', 'Ventas nacionales', '4.1', 0.00, 0.00, 0.00, 25000.00, 0.00, 0.00, b'1', b'0'),
('4.1.2', 'Ventas exportación', '4.1', 0.00, 0.00, 0.00, 8000.00, 0.00, 0.00, b'1', b'0'),
('4.2', 'Otros ingresos', '4', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'0'),
('4.2.1', 'Descuentos obtenidos', '4.2', 0.00, 0.00, 0.00, 500.00, 0.00, 0.00, b'1', b'0'),
('4.2.2', 'Intereses ganados', '4.2', 0.00, 0.00, 0.00, 300.00, 0.00, 0.00, b'1', b'0'),
('4.3', 'Devoluciones sobre compras', '4', 0.00, 0.00, 0.00, 200.00, 0.00, 0.00, b'1', b'0'),
('5', 'COSTOS', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('5.1', 'Costos operativos', '5', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('5.1.1', 'Costo de ventas', '5.1', 0.00, 0.00, 0.00, 18000.00, 0.00, 0.00, b'1', b'1'),
('5.1.2', 'Transporte de mercadería', '5.1', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, b'1', b'1'),
('5.2', 'Costos de producción', '5', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('5.2.1', 'Materia prima consumida', '5.2', 0.00, 0.00, 0.00, 2800.00, 0.00, 0.00, b'1', b'1'),
('5.2.2', 'Mano de obra directa', '5.2', 0.00, 0.00, 0.00, 4000.00, 0.00, 0.00, b'1', b'1'),
('6', 'GASTOS', NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('6.1', 'Gastos operativos', '6', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('6.1.1', 'Sueldos administrativos', '6.1', 0.00, 0.00, 0.00, 3000.00, 0.00, 0.00, b'1', b'1'),
('6.1.2', 'Energía eléctrica', '6.1', 0.00, 0.00, 0.00, 900.00, 0.00, 0.00, b'1', b'1'),
('6.1.3', 'Papelería y útiles', '6.1', 0.00, 0.00, 0.00, 600.00, 0.00, 0.00, b'1', b'1'),
('6.1.4', 'Publicidad', '6.1', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, b'1', b'1'),
('6.1.5', 'Gastos de depreciacion', '6.1', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'1', b'1'),
('6.2', 'Gastos financieros', '6', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, b'0', b'1'),
('6.2.1', 'Intereses bancarios', '6.2', 0.00, 0.00, 0.00, 800.00, 0.00, 0.00, b'1', b'1'),
('6.3', 'Gasto por impuesto ISR', '6', 0.00, 0.00, 0.00, 1200.00, 0.00, 0.00, b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `Pk_Id_Cliente` int(11) NOT NULL,
  `Cmp_Nombres_Cliente` varchar(50) DEFAULT NULL,
  `Cmp_Apellidos_Cliente` varchar(50) DEFAULT NULL,
  `Cmp_Dni_Cliente` bigint(20) DEFAULT NULL,
  `Cmp_Fecha_Registro_Cliente` datetime DEFAULT NULL,
  `Cmp_Estado_Cliente` bit(1) DEFAULT NULL,
  `Cmp_Nacionalidad_Cliente` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`Pk_Id_Cliente`, `Cmp_Nombres_Cliente`, `Cmp_Apellidos_Cliente`, `Cmp_Dni_Cliente`, `Cmp_Fecha_Registro_Cliente`, `Cmp_Estado_Cliente`, `Cmp_Nacionalidad_Cliente`) VALUES
(1, 'Cliente', 'Prueba', 9876543210101, '2025-09-21 23:00:51', b'1', 'Guatemalteco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_conceptosnomina`
--

CREATE TABLE `tbl_conceptosnomina` (
  `Cmp_iId_ConceptoNomina` int(11) NOT NULL,
  `Cmp_sNombre_ConceptoNomina` varchar(50) NOT NULL,
  `Cmp_sDescripcion_ConceptoNomina` varchar(255) DEFAULT NULL,
  `Cmp_sTipo_ConceptoNomina` varchar(50) DEFAULT NULL,
  `Cmp_sTipoCalculo_ConceptoNomina` varchar(50) DEFAULT 'Multiplicacion',
  `Cmp_deValor_ConceptoNomina` decimal(10,4) DEFAULT NULL,
  `Cmp_bAplicaAutomatico_ConceptoNomina` bit(1) DEFAULT b'0',
  `Fk_Codigo_Cuenta` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_conceptosnomina`
--

INSERT INTO `tbl_conceptosnomina` (`Cmp_iId_ConceptoNomina`, `Cmp_sNombre_ConceptoNomina`, `Cmp_sDescripcion_ConceptoNomina`, `Cmp_sTipo_ConceptoNomina`, `Cmp_sTipoCalculo_ConceptoNomina`, `Cmp_deValor_ConceptoNomina`, `Cmp_bAplicaAutomatico_ConceptoNomina`, `Fk_Codigo_Cuenta`) VALUES
(1, 'IVA', 'Iva del empleado', 'DEDUCCION', 'MULTIPLICACION', 1.1200, b'1', '1'),
(2, 'Prestamo Banrural', 'Prestamo Banrural', 'DEDUCCION', 'MULTIPLICACION', 1.1200, b'0', '1.5'),
(3, 'Prestamo BI', 'Prestamo BI', 'DEDUCCION', 'MULTIPLICACION', 1.1200, b'0', '1.5.1'),
(4, 'Bono Trimestral', 'Bono Trimestral', 'PERCEPCION', 'FIJO', 550.0000, b'0', '1'),
(5, 'Horas Extra', 'Monto de horas extra', 'PERCEPCION', 'MULTIPLICACION', 0.0000, b'1', '1'),
(6, 'Ausencias', 'Monto de ausencias', 'DEDUCCION', 'MULTIPLICACION', 0.0000, b'1', '1'),
(7, 'Anticipos', 'Monto de anticipos', 'DEDUCCION', 'FIJO', 0.0000, b'1', '1'),
(8, 'Vacaciones', 'Monto de vacaciones', 'PERCEPCION', 'MULTIPLICACION', 0.0000, b'1', '1'),
(9, 'Comisiones', 'Monto de comisiones', 'PERCEPCION', 'FIJO', 0.0000, b'0', '1'),
(10, 'IGSS', 'Monto de IGSS', 'DEDUCCION', 'MULTIPLICACION', 0.0483, b'1', '1'),
(11, 'ISR', 'Monto de ISR', 'DEDUCCION', 'MULTIPLICACION', 0.0500, b'1', '1'),
(12, 'Sueldo Base', 'Pago base mensual del empleado', 'PERCEPCION', 'FIJO', 0.0000, b'1', '1'),
(13, 'Prueba analisis', 'Pruebas ', 'PERCEPCION', 'FIJO', 0.0000, b'1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `Cmp_iId_Departamento` int(11) NOT NULL,
  `Cmp_sNombre_Departamento` varchar(50) NOT NULL,
  `Cmp_sDescripcion_Departamento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`Cmp_iId_Departamento`, `Cmp_sNombre_Departamento`, `Cmp_sDescripcion_Departamento`) VALUES
(1, 'Ventas', 'Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_depreciacionactivos`
--

CREATE TABLE `tbl_depreciacionactivos` (
  `Pk_Depreciacion_ID` int(11) NOT NULL,
  `Fk_Activo_ID` int(11) NOT NULL,
  `Cmp_Anio` int(11) NOT NULL,
  `Cmp_Valor_En_Libros` decimal(15,2) NOT NULL,
  `Cmp_Depreciacion_Anual` decimal(15,2) NOT NULL,
  `Cmp_Depreciacion_Acumulada` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detallepoliza`
--

CREATE TABLE `tbl_detallepoliza` (
  `PkFk_EncCodigo_Poliza` int(11) NOT NULL,
  `PkFk_Fecha_Poliza` date NOT NULL,
  `PkFk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Tipo_Poliza` bit(1) NOT NULL,
  `Cmp_Valor_Poliza` decimal(15,2) NOT NULL CHECK (`Cmp_Valor_Poliza` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_detallepoliza`
--

INSERT INTO `tbl_detallepoliza` (`PkFk_EncCodigo_Poliza`, `PkFk_Fecha_Poliza`, `PkFk_Codigo_Cuenta`, `Cmp_Tipo_Poliza`, `Cmp_Valor_Poliza`) VALUES
(1, '2025-11-12', '1', b'1', 3697.05),
(2, '2025-11-13', '1', b'1', 6758.63),
(2, '2025-11-13', '1.5.1', b'1', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detallesnomina`
--

CREATE TABLE `tbl_detallesnomina` (
  `Cmp_iId_DetalleNomina` int(11) NOT NULL,
  `Cmp_iId_Nomina` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_iAusencias_DetalleNomina` int(11) DEFAULT NULL,
  `Cmp_iDiasLaborados_DetalleNomina` int(11) DEFAULT NULL,
  `Cmp_dePercepciones_DetalleNomina` decimal(10,2) DEFAULT NULL,
  `Cmp_deDeducciones_DetalleNomina` decimal(10,2) DEFAULT NULL,
  `Cmp_deSueldoLiquido_DetalleNomina` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_detallesnomina`
--

INSERT INTO `tbl_detallesnomina` (`Cmp_iId_DetalleNomina`, `Cmp_iId_Nomina`, `Cmp_iId_Empleado`, `Cmp_iAusencias_DetalleNomina`, `Cmp_iDiasLaborados_DetalleNomina`, `Cmp_dePercepciones_DetalleNomina`, `Cmp_deDeducciones_DetalleNomina`, `Cmp_deSueldoLiquido_DetalleNomina`) VALUES
(1, 1, 1, 15, 0, 0.00, 3500.00, -3500.00),
(2, 2, 1, 15, 0, 0.00, 3500.00, -3500.00),
(3, 3, 1, 16, 0, 0.00, 3500.00, -3500.00),
(4, 4, 1, 15, 0, 300.00, 3500.00, -3200.00),
(5, 5, 1, 16, 0, 700.00, 3500.00, -2800.00),
(6, 6, 1, 15, 0, 700.00, 3500.00, -2800.00),
(7, 7, 1, 16, 0, 700.00, 3500.00, -2800.00),
(8, 8, 1, 15, 0, 700.00, 5920.81, -5220.81),
(9, 9, 1, 15, 0, 0.00, 3800.00, -3800.00),
(10, 10, 1, 7, 0, 0.00, 4409.00, -4409.00),
(11, 11, 1, 15, 0, 500.00, 5229.15, -4729.15),
(12, 12, 1, 30, 0, 300.00, 4587.49, -4287.49),
(13, 13, 1, 13, 2, 466.67, 8715.75, -8249.08),
(14, 13, 1, 30, 0, 466.67, 8715.75, -8249.08),
(15, 14, 1, 15, 0, 43.75, 3653.30, -3609.55),
(16, 15, 1, 5, 10, 2520.83, 4287.80, -1766.97);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleado`
--

CREATE TABLE `tbl_empleado` (
  `Pk_Id_Empleado` int(11) NOT NULL,
  `Cmp_Nombres_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Apellidos_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Dpi_Empleado` bigint(20) DEFAULT NULL,
  `Cmp_Nit_Empleado` bigint(20) DEFAULT NULL,
  `Cmp_Correo_Empleado` varchar(50) DEFAULT NULL,
  `Cmp_Telefono_Empleado` varchar(15) DEFAULT NULL,
  `Cmp_Genero_Empleado` bit(1) DEFAULT NULL,
  `Cmp_Fecha_Nacimiento_Empleado` date DEFAULT NULL,
  `Cmp_Fecha_Contratacion__Empleado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_empleado`
--

INSERT INTO `tbl_empleado` (`Pk_Id_Empleado`, `Cmp_Nombres_Empleado`, `Cmp_Apellidos_Empleado`, `Cmp_Dpi_Empleado`, `Cmp_Nit_Empleado`, `Cmp_Correo_Empleado`, `Cmp_Telefono_Empleado`, `Cmp_Genero_Empleado`, `Cmp_Fecha_Nacimiento_Empleado`, `Cmp_Fecha_Contratacion__Empleado`) VALUES
(2, 'Juan', 'Pérez López', 1234567890101, 9876542, 'juan.perez@example.com', '5555-1234', b'1', '1995-08-20', '2025-09-21'),
(3, 'Juan', 'pruebas', 1234, 123, '@pruebas', '1234', b'1', '2025-09-26', '2025-09-26'),
(80, 'usuariofinal', 'final', 1232434576890, 322445678, 'carlo@miumg.edu.gt', '32456789', b'1', '2002-10-30', '2025-10-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_sNombre_Empleado` varchar(50) NOT NULL,
  `Cmp_sApellido_Empleado` varchar(50) NOT NULL,
  `Cmp_sDpi_Empleado` varchar(20) DEFAULT NULL,
  `Cmp_dFechaIngreso_Empleado` datetime DEFAULT NULL,
  `Cmp_deSalario_Empleado` decimal(10,2) DEFAULT NULL,
  `Cmp_iId_Puesto` int(11) NOT NULL,
  `Cmp_bEstado_Empleado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`Cmp_iId_Empleado`, `Cmp_sNombre_Empleado`, `Cmp_sApellido_Empleado`, `Cmp_sDpi_Empleado`, `Cmp_dFechaIngreso_Empleado`, `Cmp_deSalario_Empleado`, `Cmp_iId_Puesto`, `Cmp_bEstado_Empleado`) VALUES
(1, 'Fredy', 'Reyes', '312222', '2025-10-29 22:13:40', 3500.00, 1, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_encabezadopoliza`
--

CREATE TABLE `tbl_encabezadopoliza` (
  `Pk_EncCodigo_Poliza` int(11) NOT NULL,
  `Pk_Fecha_Poliza` date NOT NULL,
  `Cmp_Concepto_Poliza` varchar(200) NOT NULL,
  `Cmp_Valor_Poliza` decimal(15,2) DEFAULT 0.00,
  `Cmp_Estado_Poliza` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_encabezadopoliza`
--

INSERT INTO `tbl_encabezadopoliza` (`Pk_EncCodigo_Poliza`, `Pk_Fecha_Poliza`, `Cmp_Concepto_Poliza`, `Cmp_Valor_Poliza`, `Cmp_Estado_Poliza`) VALUES
(1, '2025-11-12', 'Póliza de nómina del 2023-01-01 al 2023-01-15', 3697.05, 1),
(2, '2025-11-13', 'Póliza de nómina del 2023-11-01 al 2023-11-15', 6808.63, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estado_resultados`
--

CREATE TABLE `tbl_estado_resultados` (
  `Pk_Id_Estado` int(11) NOT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_flujo_efectivo`
--

CREATE TABLE `tbl_flujo_efectivo` (
  `Pk_Id_Flujo` int(11) NOT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Actividad` varchar(50) NOT NULL,
  `Cmp_Entrada` decimal(15,2) DEFAULT 0.00,
  `Cmp_Salida` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historico_catalogo_cuentas`
--

CREATE TABLE `tbl_historico_catalogo_cuentas` (
  `Cmp_Anio` int(11) NOT NULL,
  `Cmp_Mes` tinyint(4) NOT NULL,
  `Pk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_CtaNombre` varchar(100) NOT NULL,
  `Cmp_CtaMadre` varchar(20) DEFAULT NULL,
  `Cmp_CtaSaldoInicial` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaCargoMes` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaAbonoMes` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaSaldoActual` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaCargoActual` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaAbonoActual` decimal(15,2) NOT NULL DEFAULT 0.00,
  `Cmp_CtaTipo` bit(1) NOT NULL,
  `Cmp_CtaNaturaleza` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_horasextra`
--

CREATE TABLE `tbl_horasextra` (
  `Cmp_iId_HoraExtra` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_dFecha_HoraExtra` datetime DEFAULT NULL,
  `Cmp_iCantidad_HoraExtra` int(11) DEFAULT NULL,
  `Cmp_sMotivo_HoraExtra` varchar(255) DEFAULT NULL,
  `Cmp_bAprobado_HoraExtra` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_horasextra`
--

INSERT INTO `tbl_horasextra` (`Cmp_iId_HoraExtra`, `Cmp_iId_Empleado`, `Cmp_dFecha_HoraExtra`, `Cmp_iCantidad_HoraExtra`, `Cmp_sMotivo_HoraExtra`, `Cmp_bAprobado_HoraExtra`) VALUES
(3, 1, '2025-11-11 00:00:00', 5, 'Para navidad y cohetes', b'0'),
(4, 1, '2025-11-11 08:03:17', 5, 'test', b'1'),
(5, 1, '2023-01-01 22:03:04', 2, 'test', b'1'),
(6, 1, '2023-11-02 08:16:29', 4, 'vacaciones', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modulo`
--

CREATE TABLE `tbl_modulo` (
  `Pk_Id_Modulo` int(11) NOT NULL,
  `Cmp_Nombre_Modulo` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Modulo` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Modulo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_modulo`
--

INSERT INTO `tbl_modulo` (`Pk_Id_Modulo`, `Cmp_Nombre_Modulo`, `Cmp_Descripcion_Modulo`, `Cmp_Estado_Modulo`) VALUES
(4, 'Seguridad', 'Modulo de seguridad de la hoteleria', b'1'),
(9, 'paciente', 'pacientes de ahora', b'1'),
(100, 'Navegador', 'asdasd', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_movimientosnomina`
--

CREATE TABLE `tbl_movimientosnomina` (
  `Cmp_iId_MovimientoNomina` int(11) NOT NULL,
  `Cmp_iId_Nomina` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_iId_ConceptoNomina` int(11) NOT NULL,
  `Cmp_deMonto_MovimientoNomina` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_movimientosnomina`
--

INSERT INTO `tbl_movimientosnomina` (`Cmp_iId_MovimientoNomina`, `Cmp_iId_Nomina`, `Cmp_iId_Empleado`, `Cmp_iId_ConceptoNomina`, `Cmp_deMonto_MovimientoNomina`) VALUES
(1, 1, 1, 1, 0.00),
(2, 1, 1, 2, 0.00),
(3, 1, 1, 3, 0.00),
(4, 1, 1, 5, 0.00),
(5, 1, 1, 6, 3500.00),
(6, 1, 1, 7, 0.00),
(7, 1, 1, 8, 0.00),
(8, 1, 1, 10, 0.00),
(9, 1, 1, 11, 0.00),
(10, 1, 1, 12, 0.00),
(11, 1, 1, 2, 200.00),
(13, 2, 1, 9, 300.00),
(14, 2, 1, 1, 0.00),
(15, 2, 1, 2, 0.00),
(16, 2, 1, 3, 0.00),
(17, 2, 1, 5, 0.00),
(18, 2, 1, 6, 3500.00),
(19, 2, 1, 7, 0.00),
(20, 2, 1, 8, 0.00),
(21, 2, 1, 10, 0.00),
(22, 2, 1, 11, 0.00),
(23, 2, 1, 12, 0.00),
(24, 3, 1, 1, 0.00),
(25, 3, 1, 2, 0.00),
(26, 3, 1, 3, 0.00),
(27, 3, 1, 5, 0.00),
(28, 3, 1, 6, 3500.00),
(29, 3, 1, 7, 0.00),
(30, 3, 1, 8, 0.00),
(31, 3, 1, 10, 0.00),
(32, 3, 1, 11, 0.00),
(33, 3, 1, 12, 0.00),
(34, 4, 1, 9, 300.00),
(35, 4, 1, 1, 336.00),
(36, 4, 1, 2, 336.00),
(37, 4, 1, 3, 336.00),
(38, 4, 1, 5, 0.00),
(39, 4, 1, 6, 3500.00),
(40, 4, 1, 7, 0.00),
(41, 4, 1, 8, 0.00),
(42, 4, 1, 10, 14.49),
(43, 4, 1, 11, 15.00),
(44, 4, 1, 12, 0.00),
(45, 5, 1, 9, 300.00),
(46, 5, 1, 4, 400.00),
(47, 5, 1, 1, 0.00),
(48, 5, 1, 2, 0.00),
(49, 5, 1, 3, 0.00),
(50, 5, 1, 5, 0.00),
(51, 5, 1, 6, 3500.00),
(52, 5, 1, 7, 0.00),
(53, 5, 1, 8, 0.00),
(54, 5, 1, 10, 0.00),
(55, 5, 1, 11, 0.00),
(56, 5, 1, 12, 0.00),
(57, 6, 1, 9, 300.00),
(58, 6, 1, 4, 400.00),
(59, 6, 1, 1, 0.00),
(60, 6, 1, 2, 0.00),
(61, 6, 1, 3, 0.00),
(62, 6, 1, 5, 0.00),
(63, 6, 1, 6, 3500.00),
(64, 6, 1, 7, 0.00),
(65, 6, 1, 8, 0.00),
(66, 6, 1, 10, 0.00),
(67, 6, 1, 11, 0.00),
(68, 6, 1, 12, 0.00),
(69, 7, 1, 9, 300.00),
(70, 7, 1, 4, 400.00),
(71, 7, 1, 1, 784.00),
(72, 7, 1, 2, 784.00),
(73, 7, 1, 3, 784.00),
(74, 7, 1, 5, 0.00),
(75, 7, 1, 6, 3500.00),
(76, 7, 1, 7, 0.00),
(77, 7, 1, 8, 0.00),
(78, 7, 1, 10, 33.81),
(79, 7, 1, 11, 35.00),
(80, 7, 1, 12, 0.00),
(81, 8, 1, 9, 300.00),
(82, 8, 1, 4, 400.00),
(83, 8, 1, 1, 784.00),
(84, 8, 1, 2, 784.00),
(85, 8, 1, 3, 784.00),
(86, 8, 1, 5, 0.00),
(87, 8, 1, 6, 3500.00),
(88, 8, 1, 7, 0.00),
(89, 8, 1, 8, 0.00),
(90, 8, 1, 10, 33.81),
(91, 8, 1, 11, 35.00),
(92, 8, 1, 12, 0.00),
(95, 9, 1, 2, 100.00),
(96, 9, 1, 2, 200.00),
(97, 9, 1, 1, 0.00),
(98, 9, 1, 2, 0.00),
(99, 9, 1, 3, 0.00),
(100, 9, 1, 5, 0.00),
(101, 9, 1, 6, 3500.00),
(102, 9, 1, 7, 0.00),
(103, 9, 1, 8, 0.00),
(104, 9, 1, 10, 0.00),
(105, 9, 1, 11, 0.00),
(106, 9, 1, 12, 0.00),
(109, 10, 1, 2, 800.00),
(110, 10, 1, 7, 99.00),
(111, 10, 1, 6, 10.00),
(114, 10, 1, 1, 0.00),
(115, 10, 1, 2, 0.00),
(116, 10, 1, 3, 0.00),
(117, 10, 1, 5, 0.00),
(118, 10, 1, 6, 3500.00),
(119, 10, 1, 7, 0.00),
(120, 10, 1, 8, 0.00),
(121, 10, 1, 10, 0.00),
(122, 10, 1, 11, 0.00),
(123, 10, 1, 12, 0.00),
(124, 11, 1, 5, 200.00),
(125, 11, 1, 4, 300.00),
(126, 11, 1, 1, 560.00),
(127, 11, 1, 2, 560.00),
(128, 11, 1, 3, 560.00),
(129, 11, 1, 5, 0.00),
(130, 11, 1, 6, 3500.00),
(131, 11, 1, 7, 0.00),
(132, 11, 1, 8, 0.00),
(133, 11, 1, 10, 24.15),
(134, 11, 1, 11, 25.00),
(135, 11, 1, 12, 0.00),
(136, 12, 1, 4, 300.00),
(137, 12, 1, 2, 50.00),
(138, 12, 1, 1, 336.00),
(139, 12, 1, 2, 336.00),
(140, 12, 1, 3, 336.00),
(141, 12, 1, 5, 0.00),
(142, 12, 1, 6, 3500.00),
(143, 12, 1, 7, 0.00),
(144, 12, 1, 8, 0.00),
(145, 12, 1, 10, 14.49),
(146, 12, 1, 11, 15.00),
(147, 12, 1, 12, 0.00),
(148, 13, 1, 1, 522.67),
(149, 13, 1, 2, 522.67),
(150, 13, 1, 3, 522.67),
(151, 13, 1, 5, 0.00),
(152, 13, 1, 6, 3033.33),
(153, 13, 1, 7, 0.00),
(154, 13, 1, 8, 0.00),
(155, 13, 1, 10, 22.54),
(156, 13, 1, 11, 23.33),
(157, 13, 1, 12, 466.67),
(158, 13, 1, 1, 522.67),
(159, 13, 1, 5, 0.00),
(160, 13, 1, 6, 3500.00),
(161, 13, 1, 7, 0.00),
(162, 13, 1, 8, 0.00),
(163, 13, 1, 10, 22.54),
(164, 13, 1, 11, 23.33),
(165, 13, 1, 12, 0.00),
(166, 14, 1, 1, 49.00),
(167, 14, 1, 5, 43.75),
(168, 14, 1, 6, 3500.00),
(169, 14, 1, 7, 100.00),
(170, 14, 1, 8, 0.00),
(171, 14, 1, 10, 2.11),
(172, 14, 1, 11, 2.19),
(173, 14, 1, 12, 0.00),
(174, 15, 1, 13, 100.00),
(175, 15, 1, 3, 50.00),
(176, 15, 1, 1, 2823.33),
(177, 15, 1, 5, 87.50),
(178, 15, 1, 6, 1166.67),
(179, 15, 1, 7, 0.00),
(180, 15, 1, 8, 0.00),
(181, 15, 1, 10, 121.76),
(182, 15, 1, 11, 126.04),
(183, 15, 1, 12, 2333.33),
(184, 15, 1, 13, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_nomina`
--

CREATE TABLE `tbl_nomina` (
  `Cmp_iId_Nomina` int(11) NOT NULL,
  `Cmp_dPeriodoInicio_Nomina` datetime DEFAULT NULL,
  `Cmp_dPeriodoFin_Nomina` datetime DEFAULT NULL,
  `Cmp_dFechaGeneracion_Nomina` datetime DEFAULT NULL,
  `Cmp_sTipo_Nomina` varchar(50) DEFAULT NULL,
  `Cmp_sEstado_Nomina` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_nomina`
--

INSERT INTO `tbl_nomina` (`Cmp_iId_Nomina`, `Cmp_dPeriodoInicio_Nomina`, `Cmp_dPeriodoFin_Nomina`, `Cmp_dFechaGeneracion_Nomina`, `Cmp_sTipo_Nomina`, `Cmp_sEstado_Nomina`) VALUES
(1, '2025-11-01 18:46:30', '2025-11-15 18:46:30', '2025-11-04 18:46:42', 'Quincenal', 'GENERADA'),
(2, '2025-11-16 19:06:47', '2025-11-30 19:06:47', '2025-11-04 19:12:18', 'Quincenal', 'GENERADA'),
(3, '2026-01-01 19:16:37', '2026-01-16 19:16:37', '2025-11-04 19:16:55', 'Quincenal', 'GENERADA'),
(4, '2025-12-01 19:17:11', '2025-12-15 19:17:11', '2025-11-04 19:17:52', 'Quincenal', 'GENERADA'),
(5, '2025-12-16 19:24:07', '2025-12-31 19:24:07', '2025-11-04 19:25:05', 'Quincenal', 'GENERADA'),
(6, '2025-10-01 19:29:54', '2025-10-15 19:29:54', '2025-11-04 19:30:36', 'Quincenal', 'GENERADA'),
(7, '2025-10-16 19:32:01', '2025-10-31 19:32:01', '2025-11-04 19:32:50', 'Quincenal', 'GENERADA'),
(8, '2025-09-01 19:38:03', '2025-09-15 19:38:03', '2025-11-04 19:38:47', 'Quincenal', 'GENERADA'),
(9, '2026-02-01 21:10:56', '2026-02-15 21:10:56', '2025-11-09 21:13:15', 'Quincenal', 'GENERADA'),
(10, '2025-02-09 21:16:25', '2025-02-15 21:16:25', '2025-11-09 21:35:07', 'Quincenal', 'GENERADA'),
(11, '2025-01-01 21:35:56', '2025-01-15 21:35:56', '2025-11-09 21:36:52', 'Quincenal', 'GENERADA'),
(12, '2025-05-01 22:24:10', '2025-05-30 22:24:10', '2025-11-09 22:25:21', 'Mensual', 'GENERADA'),
(13, '2024-11-01 07:58:33', '2024-11-15 07:58:33', '2025-11-12 20:30:10', 'Quincenal', 'GENERADA'),
(14, '2023-01-01 20:27:30', '2023-01-15 20:27:30', '2025-11-12 22:03:53', 'Mensual', 'GENERADA'),
(15, '2023-11-01 20:30:26', '2023-11-15 20:30:26', '2025-11-13 08:22:32', 'Quincenal', 'GENERADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_paciente`
--

CREATE TABLE `tbl_paciente` (
  `pk_idPaciente` int(11) NOT NULL,
  `nombrePaciente` varchar(50) DEFAULT NULL,
  `apellidoPaciente` varchar(50) DEFAULT NULL,
  `fechaNacimientoPaciente` date DEFAULT NULL,
  `sexoPaciente` varchar(15) DEFAULT NULL,
  `direccionPaciente` varchar(30) DEFAULT NULL,
  `telefonoPaciente` varchar(20) DEFAULT NULL,
  `estadoPaciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil`
--

CREATE TABLE `tbl_perfil` (
  `Pk_Id_Perfil` int(11) NOT NULL,
  `Cmp_Puesto_Perfil` varchar(50) DEFAULT NULL,
  `Cmp_Descripcion_Perfil` varchar(50) DEFAULT NULL,
  `Cmp_Estado_Perfil` bit(1) NOT NULL,
  `Cmp_Tipo_Perfil` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_perfil`
--

INSERT INTO `tbl_perfil` (`Pk_Id_Perfil`, `Cmp_Puesto_Perfil`, `Cmp_Descripcion_Perfil`, `Cmp_Estado_Perfil`, `Cmp_Tipo_Perfil`) VALUES
(1, 'Administrador', 'Perfil con todos los permisos', b'1', 1),
(12, 'Probador', 'Persona que prueba código', b'1', 1),
(22, 'Pruebadef', 'pufa', b'1', 1),
(33, 'tester', 'provee', b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_periodoscontables`
--

CREATE TABLE `tbl_periodoscontables` (
  `Pk_Id_Periodo` int(11) NOT NULL,
  `Cmp_Anio` int(11) NOT NULL,
  `Cmp_Mes` tinyint(4) DEFAULT NULL,
  `Cmp_FechaInicio` date NOT NULL,
  `Cmp_FechaFin` date NOT NULL,
  `Cmp_Estado` tinyint(1) NOT NULL DEFAULT 1,
  `Cmp_ModoActualizacion` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_periodoscontables`
--

INSERT INTO `tbl_periodoscontables` (`Pk_Id_Periodo`, `Cmp_Anio`, `Cmp_Mes`, `Cmp_FechaInicio`, `Cmp_FechaFin`, `Cmp_Estado`, `Cmp_ModoActualizacion`) VALUES
(1, 2025, 7, '2025-07-01', '2025-07-31', 0, 0),
(2, 2025, 8, '2025-08-01', '2025-08-31', 0, 1),
(3, 2025, 9, '2025-09-01', '2025-09-30', 0, 0),
(4, 2025, 10, '2025-10-01', '2025-10-31', 0, 1),
(5, 2025, 11, '2025-11-01', '2025-11-30', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permiso_perfil_aplicacion`
--

CREATE TABLE `tbl_permiso_perfil_aplicacion` (
  `Fk_Id_Perfil` int(11) NOT NULL,
  `Fk_Id_Modulo` int(11) NOT NULL,
  `Fk_Id_Aplicacion` int(11) NOT NULL,
  `Cmp_Ingresar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permisos_Aplicacion_Perfil` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_permiso_perfil_aplicacion`
--

INSERT INTO `tbl_permiso_perfil_aplicacion` (`Fk_Id_Perfil`, `Fk_Id_Modulo`, `Fk_Id_Aplicacion`, `Cmp_Ingresar_Permisos_Aplicacion_Perfil`, `Cmp_Consultar_Permisos_Aplicacion_Perfil`, `Cmp_Modificar_Permisos_Aplicacion_Perfil`, `Cmp_Eliminar_Permisos_Aplicacion_Perfil`, `Cmp_Imprimir_Permisos_Aplicacion_Perfil`) VALUES
(1, 4, 301, b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_permiso_usuario_aplicacion`
--

CREATE TABLE `tbl_permiso_usuario_aplicacion` (
  `Fk_Id_Usuario` int(11) NOT NULL,
  `Fk_Id_Modulo` int(11) NOT NULL,
  `Fk_Id_Aplicacion` int(11) NOT NULL,
  `Cmp_Ingresar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Consultar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Modificar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Eliminar_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL,
  `Cmp_Imprimir_Permiso_Aplicacion_Usuario` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_permiso_usuario_aplicacion`
--

INSERT INTO `tbl_permiso_usuario_aplicacion` (`Fk_Id_Usuario`, `Fk_Id_Modulo`, `Fk_Id_Aplicacion`, `Cmp_Ingresar_Permiso_Aplicacion_Usuario`, `Cmp_Consultar_Permiso_Aplicacion_Usuario`, `Cmp_Modificar_Permiso_Aplicacion_Usuario`, `Cmp_Eliminar_Permiso_Aplicacion_Usuario`, `Cmp_Imprimir_Permiso_Aplicacion_Usuario`) VALUES
(23, 4, 301, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 302, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 303, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 304, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 305, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 306, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 307, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 308, b'1', b'1', b'1', b'1', b'1'),
(23, 4, 309, b'1', b'1', b'1', b'1', b'1'),
(23, 100, 999, b'1', b'1', b'1', b'1', b'1'),
(24, 4, 309, b'1', b'1', b'1', b'1', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prestamos`
--

CREATE TABLE `tbl_prestamos` (
  `Cmp_iId_Prestamo` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_deMonto_Prestamo` decimal(10,2) DEFAULT NULL,
  `Cmp_dFecha_Prestamo` datetime DEFAULT NULL,
  `Cmp_deSaldoPendiente_Prestamo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_puestos`
--

CREATE TABLE `tbl_puestos` (
  `Cmp_iId_Puesto` int(11) NOT NULL,
  `Cmp_sNombre_Puesto` varchar(50) NOT NULL,
  `Cmp_sDescripcion_Puesto` varchar(255) DEFAULT NULL,
  `Cmp_iId_Departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_puestos`
--

INSERT INTO `tbl_puestos` (`Cmp_iId_Puesto`, `Cmp_sNombre_Puesto`, `Cmp_sDescripcion_Puesto`, `Cmp_iId_Departamento`) VALUES
(1, 'Vendedor Normal', 'Vendedor Normal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reportes`
--

CREATE TABLE `tbl_reportes` (
  `Pk_Id_Reporte` int(11) NOT NULL,
  `Cmp_Titulo_Reporte` varchar(50) DEFAULT NULL,
  `Cmp_Ruta_Reporte` varchar(50) DEFAULT NULL,
  `Cmp_Fecha_Reporte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_reportes`
--

INSERT INTO `tbl_reportes` (`Pk_Id_Reporte`, `Cmp_Titulo_Reporte`, `Cmp_Ruta_Reporte`, `Cmp_Fecha_Reporte`) VALUES
(1, 'Reporte Inicial', 'ruta/reporte.pdf', '2025-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reporte_balance_general`
--

CREATE TABLE `tbl_reporte_balance_general` (
  `Pk_Id_Reporte` int(11) NOT NULL,
  `Fk_Id_BalanceGeneral` int(11) DEFAULT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT 0.00,
  `Cmp_Fecha_Reporte` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reporte_balance_saldos`
--

CREATE TABLE `tbl_reporte_balance_saldos` (
  `Pk_Id_Reporte` int(11) NOT NULL,
  `Fk_Id_Balance` int(11) DEFAULT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Debe` decimal(15,2) DEFAULT 0.00,
  `Cmp_Haber` decimal(15,2) DEFAULT 0.00,
  `Cmp_Saldo` decimal(15,2) DEFAULT 0.00,
  `Cmp_Fecha_Reporte` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reporte_estado_resultados`
--

CREATE TABLE `tbl_reporte_estado_resultados` (
  `Pk_Id_Reporte` int(11) NOT NULL,
  `Fk_Id_Estado` int(11) DEFAULT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Cuenta` varchar(50) NOT NULL,
  `Cmp_Valor` decimal(15,2) DEFAULT 0.00,
  `Cmp_Fecha_Reporte` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reporte_flujo_efectivo`
--

CREATE TABLE `tbl_reporte_flujo_efectivo` (
  `Pk_Id_Reporte` int(11) NOT NULL,
  `Fk_Id_Flujo` int(11) DEFAULT NULL,
  `Fk_Codigo_Cuenta` varchar(20) NOT NULL,
  `Cmp_Nombre_Cuenta` varchar(100) NOT NULL,
  `Cmp_Tipo_Actividad` varchar(50) NOT NULL,
  `Cmp_Entrada` decimal(15,2) DEFAULT 0.00,
  `Cmp_Salida` decimal(15,2) DEFAULT 0.00,
  `Cmp_Fecha_Reporte` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_salario_empleado`
--

CREATE TABLE `tbl_salario_empleado` (
  `Pk_Id_Salario` int(11) NOT NULL,
  `Fk_Id_Empleado` int(11) DEFAULT NULL,
  `Cmp_Monto_Salario_Empleado` float DEFAULT NULL,
  `Cmp_Fecha_Inicio_Salario_Empleado` datetime DEFAULT NULL,
  `Cmp_Fecha_Fin_Salario_Empleado` datetime DEFAULT NULL,
  `Cmp_Estado_Salario_Empleado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_token_restaurarcontrasena`
--

CREATE TABLE `tbl_token_restaurarcontrasena` (
  `Pk_Id_Token` int(11) NOT NULL,
  `Fk_Id_Usuario` int(11) DEFAULT NULL,
  `Cmp_Token` varchar(50) DEFAULT NULL,
  `Cmp_Fecha_Creacion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Expiracion_Restaurar_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Utilizado_Restaurar_Contrasenea` bit(1) DEFAULT NULL,
  `Cmp_Fecha_Uso_Restaurar_Contrasenea` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `Pk_Id_Usuario` int(11) NOT NULL,
  `Fk_Id_Empleado` int(11) DEFAULT NULL,
  `Cmp_Nombre_Usuario` varchar(50) DEFAULT NULL,
  `Cmp_Contrasena_Usuario` varchar(65) DEFAULT NULL,
  `Cmp_Intentos_Fallidos_Usuario` int(11) DEFAULT NULL,
  `Cmp_Estado_Usuario` bit(1) DEFAULT NULL,
  `Cmp_FechaCreacion_Usuario` datetime DEFAULT NULL,
  `Cmp_Ultimo_Cambio_Contrasenea` datetime DEFAULT NULL,
  `Cmp_Pidio_Cambio_Contrasenea` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`Pk_Id_Usuario`, `Fk_Id_Empleado`, `Cmp_Nombre_Usuario`, `Cmp_Contrasena_Usuario`, `Cmp_Intentos_Fallidos_Usuario`, `Cmp_Estado_Usuario`, `Cmp_FechaCreacion_Usuario`, `Cmp_Ultimo_Cambio_Contrasenea`, `Cmp_Pidio_Cambio_Contrasenea`) VALUES
(4, 2, 'brandon', '45297c633d331e6ac35169ebaaf75bc7fafd206ebb59ba4efd80566936e46eb0', 0, b'1', '2025-09-21 20:49:54', '2025-10-18 17:09:11', b'0'),
(23, 3, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 0, b'1', '2025-09-26 20:45:53', '2025-09-26 20:45:53', b'0'),
(24, 80, 'usuariofinal', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 0, b'1', '2025-11-25 08:42:39', '2025-11-25 08:42:39', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario_perfil`
--

CREATE TABLE `tbl_usuario_perfil` (
  `Fk_Id_Usuario` int(11) NOT NULL,
  `Fk_Id_Perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuario_perfil`
--

INSERT INTO `tbl_usuario_perfil` (`Fk_Id_Usuario`, `Fk_Id_Perfil`) VALUES
(4, 1),
(24, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_vacaciones`
--

CREATE TABLE `tbl_vacaciones` (
  `Cmp_iId_Vacacion` int(11) NOT NULL,
  `Cmp_iId_Empleado` int(11) NOT NULL,
  `Cmp_dFechaInicio_Vacacion` datetime DEFAULT NULL,
  `Cmp_dFechaFin_Vacacion` datetime DEFAULT NULL,
  `Cmp_iDias_Vacacion` int(11) DEFAULT NULL,
  `Cmp_bAprobada_Vacacion` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_vacaciones`
--

INSERT INTO `tbl_vacaciones` (`Cmp_iId_Vacacion`, `Cmp_iId_Empleado`, `Cmp_dFechaInicio_Vacacion`, `Cmp_dFechaFin_Vacacion`, `Cmp_iDias_Vacacion`, `Cmp_bAprobada_Vacacion`) VALUES
(1, 1, '2025-11-05 15:35:36', '2025-11-10 15:35:36', 6, b'0'),
(3, 1, '2024-11-09 08:02:41', '2024-11-10 08:02:41', 2, b'0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_activosfijos`
--
ALTER TABLE `tbl_activosfijos`
  ADD PRIMARY KEY (`Pk_Activo_ID`),
  ADD KEY `Cmp_CtaActivo` (`Cmp_CtaActivo`),
  ADD KEY `Cmp_CtaDepreciacion` (`Cmp_CtaDepreciacion`),
  ADD KEY `Cmp_CtaGastoDepreciacion` (`Cmp_CtaGastoDepreciacion`);

--
-- Indices de la tabla `tbl_anticipos`
--
ALTER TABLE `tbl_anticipos`
  ADD PRIMARY KEY (`Cmp_iId_Anticipo`),
  ADD KEY `Ix_Anticipos_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_aplicacion`
--
ALTER TABLE `tbl_aplicacion`
  ADD PRIMARY KEY (`Pk_Id_Aplicacion`),
  ADD KEY `Fk_Id_Reporte_Aplicacion` (`Fk_Id_Reporte_Aplicacion`);

--
-- Indices de la tabla `tbl_asignacion_modulo_aplicacion`
--
ALTER TABLE `tbl_asignacion_modulo_aplicacion`
  ADD PRIMARY KEY (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  ADD KEY `Fk_Id_Aplicacion` (`Fk_Id_Aplicacion`);

--
-- Indices de la tabla `tbl_asistencias`
--
ALTER TABLE `tbl_asistencias`
  ADD PRIMARY KEY (`Cmp_iId_Asistencia`),
  ADD KEY `Ix_Asistencias_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_ausenciaspermisos`
--
ALTER TABLE `tbl_ausenciaspermisos`
  ADD PRIMARY KEY (`Cmp_iId_AusenciaPermiso`),
  ADD KEY `Ix_AusenciasPermisos_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_balance_general`
--
ALTER TABLE `tbl_balance_general`
  ADD PRIMARY KEY (`Pk_Id_BalanceGeneral`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_balance_saldos`
--
ALTER TABLE `tbl_balance_saldos`
  ADD PRIMARY KEY (`Pk_Id_Balance`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD PRIMARY KEY (`Pk_Id_Bitacora`),
  ADD KEY `Fk_Id_Usuario` (`Fk_Id_Usuario`),
  ADD KEY `Fk_Id_Aplicacion` (`Fk_Id_Aplicacion`);

--
-- Indices de la tabla `tbl_bloqueo_usuario`
--
ALTER TABLE `tbl_bloqueo_usuario`
  ADD PRIMARY KEY (`Pk_Id_Bloqueo`),
  ADD KEY `Fk_Id_Usuario` (`Fk_Id_Usuario`),
  ADD KEY `Fk_Id_Bitacora` (`Fk_Id_Bitacora`);

--
-- Indices de la tabla `tbl_catalogo_cuentas`
--
ALTER TABLE `tbl_catalogo_cuentas`
  ADD PRIMARY KEY (`Pk_Codigo_Cuenta`),
  ADD KEY `Fk_CtaMadre` (`Cmp_CtaMadre`);

--
-- Indices de la tabla `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`Pk_Id_Cliente`);

--
-- Indices de la tabla `tbl_conceptosnomina`
--
ALTER TABLE `tbl_conceptosnomina`
  ADD PRIMARY KEY (`Cmp_iId_ConceptoNomina`),
  ADD KEY `Fk_ConceptosNomina_Cuenta` (`Fk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`Cmp_iId_Departamento`),
  ADD UNIQUE KEY `Cmp_sNombre_Departamento` (`Cmp_sNombre_Departamento`);

--
-- Indices de la tabla `tbl_depreciacionactivos`
--
ALTER TABLE `tbl_depreciacionactivos`
  ADD PRIMARY KEY (`Pk_Depreciacion_ID`),
  ADD KEY `Fk_Activo_ID` (`Fk_Activo_ID`);

--
-- Indices de la tabla `tbl_detallepoliza`
--
ALTER TABLE `tbl_detallepoliza`
  ADD PRIMARY KEY (`PkFk_EncCodigo_Poliza`,`PkFk_Fecha_Poliza`,`PkFk_Codigo_Cuenta`),
  ADD KEY `fk_detalle_poliza_cuenta` (`PkFk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_detallesnomina`
--
ALTER TABLE `tbl_detallesnomina`
  ADD PRIMARY KEY (`Cmp_iId_DetalleNomina`),
  ADD KEY `Fk_DetallesNomina_Nomina` (`Cmp_iId_Nomina`),
  ADD KEY `Ix_DetallesNomina_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD PRIMARY KEY (`Pk_Id_Empleado`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`Cmp_iId_Empleado`),
  ADD UNIQUE KEY `Cmp_sDpi_Empleado` (`Cmp_sDpi_Empleado`),
  ADD KEY `Ix_Empleados_IdPuesto` (`Cmp_iId_Puesto`);

--
-- Indices de la tabla `tbl_encabezadopoliza`
--
ALTER TABLE `tbl_encabezadopoliza`
  ADD PRIMARY KEY (`Pk_EncCodigo_Poliza`,`Pk_Fecha_Poliza`);

--
-- Indices de la tabla `tbl_estado_resultados`
--
ALTER TABLE `tbl_estado_resultados`
  ADD PRIMARY KEY (`Pk_Id_Estado`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_flujo_efectivo`
--
ALTER TABLE `tbl_flujo_efectivo`
  ADD PRIMARY KEY (`Pk_Id_Flujo`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`);

--
-- Indices de la tabla `tbl_historico_catalogo_cuentas`
--
ALTER TABLE `tbl_historico_catalogo_cuentas`
  ADD PRIMARY KEY (`Cmp_Anio`,`Cmp_Mes`,`Pk_Codigo_Cuenta`) USING BTREE,
  ADD KEY `Idx_Historico_Cuenta` (`Pk_Codigo_Cuenta`) USING BTREE;

--
-- Indices de la tabla `tbl_horasextra`
--
ALTER TABLE `tbl_horasextra`
  ADD PRIMARY KEY (`Cmp_iId_HoraExtra`),
  ADD KEY `Ix_HorasExtra_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_modulo`
--
ALTER TABLE `tbl_modulo`
  ADD PRIMARY KEY (`Pk_Id_Modulo`);

--
-- Indices de la tabla `tbl_movimientosnomina`
--
ALTER TABLE `tbl_movimientosnomina`
  ADD PRIMARY KEY (`Cmp_iId_MovimientoNomina`),
  ADD KEY `Fk_MovimientosNomina_Conceptos` (`Cmp_iId_ConceptoNomina`),
  ADD KEY `Ix_MovimientosNomina_IdNomina` (`Cmp_iId_Nomina`),
  ADD KEY `Fk_MovimientosNomina_Empleados` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_nomina`
--
ALTER TABLE `tbl_nomina`
  ADD PRIMARY KEY (`Cmp_iId_Nomina`);

--
-- Indices de la tabla `tbl_perfil`
--
ALTER TABLE `tbl_perfil`
  ADD PRIMARY KEY (`Pk_Id_Perfil`);

--
-- Indices de la tabla `tbl_periodoscontables`
--
ALTER TABLE `tbl_periodoscontables`
  ADD PRIMARY KEY (`Pk_Id_Periodo`),
  ADD UNIQUE KEY `Uk_Periodo` (`Cmp_Anio`,`Cmp_Mes`);

--
-- Indices de la tabla `tbl_permiso_perfil_aplicacion`
--
ALTER TABLE `tbl_permiso_perfil_aplicacion`
  ADD PRIMARY KEY (`Fk_Id_Perfil`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  ADD KEY `Fk_Id_Modulo` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`);

--
-- Indices de la tabla `tbl_permiso_usuario_aplicacion`
--
ALTER TABLE `tbl_permiso_usuario_aplicacion`
  ADD PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Modulo`,`Fk_Id_Aplicacion`),
  ADD KEY `Fk_Id_Modulo` (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`);

--
-- Indices de la tabla `tbl_prestamos`
--
ALTER TABLE `tbl_prestamos`
  ADD PRIMARY KEY (`Cmp_iId_Prestamo`),
  ADD KEY `Ix_Prestamos_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- Indices de la tabla `tbl_puestos`
--
ALTER TABLE `tbl_puestos`
  ADD PRIMARY KEY (`Cmp_iId_Puesto`),
  ADD KEY `Ix_Puestos_IdDepartamento` (`Cmp_iId_Departamento`);

--
-- Indices de la tabla `tbl_reportes`
--
ALTER TABLE `tbl_reportes`
  ADD PRIMARY KEY (`Pk_Id_Reporte`);

--
-- Indices de la tabla `tbl_reporte_balance_general`
--
ALTER TABLE `tbl_reporte_balance_general`
  ADD PRIMARY KEY (`Pk_Id_Reporte`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  ADD KEY `Fk_Id_BalanceGeneral` (`Fk_Id_BalanceGeneral`);

--
-- Indices de la tabla `tbl_reporte_balance_saldos`
--
ALTER TABLE `tbl_reporte_balance_saldos`
  ADD PRIMARY KEY (`Pk_Id_Reporte`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  ADD KEY `Fk_Id_Balance` (`Fk_Id_Balance`);

--
-- Indices de la tabla `tbl_reporte_estado_resultados`
--
ALTER TABLE `tbl_reporte_estado_resultados`
  ADD PRIMARY KEY (`Pk_Id_Reporte`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  ADD KEY `Fk_Id_Estado` (`Fk_Id_Estado`);

--
-- Indices de la tabla `tbl_reporte_flujo_efectivo`
--
ALTER TABLE `tbl_reporte_flujo_efectivo`
  ADD PRIMARY KEY (`Pk_Id_Reporte`),
  ADD KEY `Fk_Codigo_Cuenta` (`Fk_Codigo_Cuenta`),
  ADD KEY `Fk_Id_Flujo` (`Fk_Id_Flujo`);

--
-- Indices de la tabla `tbl_salario_empleado`
--
ALTER TABLE `tbl_salario_empleado`
  ADD PRIMARY KEY (`Pk_Id_Salario`),
  ADD KEY `Fk_Id_Empleado` (`Fk_Id_Empleado`);

--
-- Indices de la tabla `tbl_token_restaurarcontrasena`
--
ALTER TABLE `tbl_token_restaurarcontrasena`
  ADD PRIMARY KEY (`Pk_Id_Token`),
  ADD KEY `Fk_Id_Usuario` (`Fk_Id_Usuario`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`Pk_Id_Usuario`),
  ADD KEY `Fk_Id_Empleado` (`Fk_Id_Empleado`);

--
-- Indices de la tabla `tbl_usuario_perfil`
--
ALTER TABLE `tbl_usuario_perfil`
  ADD PRIMARY KEY (`Fk_Id_Usuario`,`Fk_Id_Perfil`),
  ADD KEY `Fk_Id_Perfil` (`Fk_Id_Perfil`);

--
-- Indices de la tabla `tbl_vacaciones`
--
ALTER TABLE `tbl_vacaciones`
  ADD PRIMARY KEY (`Cmp_iId_Vacacion`),
  ADD KEY `Ix_Vacaciones_IdEmpleado` (`Cmp_iId_Empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_activosfijos`
--
ALTER TABLE `tbl_activosfijos`
  MODIFY `Pk_Activo_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_anticipos`
--
ALTER TABLE `tbl_anticipos`
  MODIFY `Cmp_iId_Anticipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_asistencias`
--
ALTER TABLE `tbl_asistencias`
  MODIFY `Cmp_iId_Asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_ausenciaspermisos`
--
ALTER TABLE `tbl_ausenciaspermisos`
  MODIFY `Cmp_iId_AusenciaPermiso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_balance_general`
--
ALTER TABLE `tbl_balance_general`
  MODIFY `Pk_Id_BalanceGeneral` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_balance_saldos`
--
ALTER TABLE `tbl_balance_saldos`
  MODIFY `Pk_Id_Balance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  MODIFY `Pk_Id_Bitacora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT de la tabla `tbl_bloqueo_usuario`
--
ALTER TABLE `tbl_bloqueo_usuario`
  MODIFY `Pk_Id_Bloqueo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_conceptosnomina`
--
ALTER TABLE `tbl_conceptosnomina`
  MODIFY `Cmp_iId_ConceptoNomina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `Cmp_iId_Departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_depreciacionactivos`
--
ALTER TABLE `tbl_depreciacionactivos`
  MODIFY `Pk_Depreciacion_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_detallesnomina`
--
ALTER TABLE `tbl_detallesnomina`
  MODIFY `Cmp_iId_DetalleNomina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  MODIFY `Pk_Id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  MODIFY `Cmp_iId_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_estado_resultados`
--
ALTER TABLE `tbl_estado_resultados`
  MODIFY `Pk_Id_Estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_flujo_efectivo`
--
ALTER TABLE `tbl_flujo_efectivo`
  MODIFY `Pk_Id_Flujo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_horasextra`
--
ALTER TABLE `tbl_horasextra`
  MODIFY `Cmp_iId_HoraExtra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_movimientosnomina`
--
ALTER TABLE `tbl_movimientosnomina`
  MODIFY `Cmp_iId_MovimientoNomina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT de la tabla `tbl_nomina`
--
ALTER TABLE `tbl_nomina`
  MODIFY `Cmp_iId_Nomina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_perfil`
--
ALTER TABLE `tbl_perfil`
  MODIFY `Pk_Id_Perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tbl_periodoscontables`
--
ALTER TABLE `tbl_periodoscontables`
  MODIFY `Pk_Id_Periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_prestamos`
--
ALTER TABLE `tbl_prestamos`
  MODIFY `Cmp_iId_Prestamo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_puestos`
--
ALTER TABLE `tbl_puestos`
  MODIFY `Cmp_iId_Puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_reporte_balance_general`
--
ALTER TABLE `tbl_reporte_balance_general`
  MODIFY `Pk_Id_Reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_reporte_balance_saldos`
--
ALTER TABLE `tbl_reporte_balance_saldos`
  MODIFY `Pk_Id_Reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_reporte_estado_resultados`
--
ALTER TABLE `tbl_reporte_estado_resultados`
  MODIFY `Pk_Id_Reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_reporte_flujo_efectivo`
--
ALTER TABLE `tbl_reporte_flujo_efectivo`
  MODIFY `Pk_Id_Reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_token_restaurarcontrasena`
--
ALTER TABLE `tbl_token_restaurarcontrasena`
  MODIFY `Pk_Id_Token` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `Pk_Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tbl_vacaciones`
--
ALTER TABLE `tbl_vacaciones`
  MODIFY `Cmp_iId_Vacacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_activosfijos`
--
ALTER TABLE `tbl_activosfijos`
  ADD CONSTRAINT `tbl_activosfijos_ibfk_1` FOREIGN KEY (`Cmp_CtaActivo`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`),
  ADD CONSTRAINT `tbl_activosfijos_ibfk_2` FOREIGN KEY (`Cmp_CtaDepreciacion`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`),
  ADD CONSTRAINT `tbl_activosfijos_ibfk_3` FOREIGN KEY (`Cmp_CtaGastoDepreciacion`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`);

--
-- Filtros para la tabla `tbl_anticipos`
--
ALTER TABLE `tbl_anticipos`
  ADD CONSTRAINT `Fk_Anticipos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);

--
-- Filtros para la tabla `tbl_aplicacion`
--
ALTER TABLE `tbl_aplicacion`
  ADD CONSTRAINT `tbl_aplicacion_ibfk_1` FOREIGN KEY (`Fk_Id_Reporte_Aplicacion`) REFERENCES `tbl_reportes` (`Pk_Id_Reporte`);

--
-- Filtros para la tabla `tbl_asignacion_modulo_aplicacion`
--
ALTER TABLE `tbl_asignacion_modulo_aplicacion`
  ADD CONSTRAINT `tbl_asignacion_modulo_aplicacion_ibfk_1` FOREIGN KEY (`Fk_Id_Modulo`) REFERENCES `tbl_modulo` (`Pk_Id_Modulo`),
  ADD CONSTRAINT `tbl_asignacion_modulo_aplicacion_ibfk_2` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`);

--
-- Filtros para la tabla `tbl_asistencias`
--
ALTER TABLE `tbl_asistencias`
  ADD CONSTRAINT `Fk_Asistencias_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);

--
-- Filtros para la tabla `tbl_ausenciaspermisos`
--
ALTER TABLE `tbl_ausenciaspermisos`
  ADD CONSTRAINT `Fk_AusenciasPermisos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);

--
-- Filtros para la tabla `tbl_balance_general`
--
ALTER TABLE `tbl_balance_general`
  ADD CONSTRAINT `tbl_balance_general_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_balance_saldos`
--
ALTER TABLE `tbl_balance_saldos`
  ADD CONSTRAINT `tbl_balance_saldos_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_bitacora`
--
ALTER TABLE `tbl_bitacora`
  ADD CONSTRAINT `tbl_bitacora_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`),
  ADD CONSTRAINT `tbl_bitacora_ibfk_2` FOREIGN KEY (`Fk_Id_Aplicacion`) REFERENCES `tbl_aplicacion` (`Pk_Id_Aplicacion`);

--
-- Filtros para la tabla `tbl_bloqueo_usuario`
--
ALTER TABLE `tbl_bloqueo_usuario`
  ADD CONSTRAINT `tbl_bloqueo_usuario_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`),
  ADD CONSTRAINT `tbl_bloqueo_usuario_ibfk_2` FOREIGN KEY (`Fk_Id_Bitacora`) REFERENCES `tbl_bitacora` (`Pk_Id_Bitacora`);

--
-- Filtros para la tabla `tbl_catalogo_cuentas`
--
ALTER TABLE `tbl_catalogo_cuentas`
  ADD CONSTRAINT `Fk_CtaMadre` FOREIGN KEY (`Cmp_CtaMadre`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_conceptosnomina`
--
ALTER TABLE `tbl_conceptosnomina`
  ADD CONSTRAINT `Fk_ConceptosNomina_Cuenta` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`);

--
-- Filtros para la tabla `tbl_depreciacionactivos`
--
ALTER TABLE `tbl_depreciacionactivos`
  ADD CONSTRAINT `tbl_depreciacionactivos_ibfk_1` FOREIGN KEY (`Fk_Activo_ID`) REFERENCES `tbl_activosfijos` (`Pk_Activo_ID`);

--
-- Filtros para la tabla `tbl_detallepoliza`
--
ALTER TABLE `tbl_detallepoliza`
  ADD CONSTRAINT `fk_detalle_poliza_cuenta` FOREIGN KEY (`PkFk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_poliza_encabezado` FOREIGN KEY (`PkFk_EncCodigo_Poliza`,`PkFk_Fecha_Poliza`) REFERENCES `tbl_encabezadopoliza` (`Pk_EncCodigo_Poliza`, `Pk_Fecha_Poliza`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_detallesnomina`
--
ALTER TABLE `tbl_detallesnomina`
  ADD CONSTRAINT `Fk_DetallesNomina_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`),
  ADD CONSTRAINT `Fk_DetallesNomina_Nomina` FOREIGN KEY (`Cmp_iId_Nomina`) REFERENCES `tbl_nomina` (`Cmp_iId_Nomina`);

--
-- Filtros para la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD CONSTRAINT `Fk_Empleados_Puestos` FOREIGN KEY (`Cmp_iId_Puesto`) REFERENCES `tbl_puestos` (`Cmp_iId_Puesto`);

--
-- Filtros para la tabla `tbl_estado_resultados`
--
ALTER TABLE `tbl_estado_resultados`
  ADD CONSTRAINT `tbl_estado_resultados_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_flujo_efectivo`
--
ALTER TABLE `tbl_flujo_efectivo`
  ADD CONSTRAINT `tbl_flujo_efectivo_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_historico_catalogo_cuentas`
--
ALTER TABLE `tbl_historico_catalogo_cuentas`
  ADD CONSTRAINT `Fk_Historico_Cuenta` FOREIGN KEY (`Pk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Historico_Periodo` FOREIGN KEY (`Cmp_Anio`,`Cmp_Mes`) REFERENCES `tbl_periodoscontables` (`Cmp_Anio`, `Cmp_Mes`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_horasextra`
--
ALTER TABLE `tbl_horasextra`
  ADD CONSTRAINT `Fk_HorasExtra_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);

--
-- Filtros para la tabla `tbl_movimientosnomina`
--
ALTER TABLE `tbl_movimientosnomina`
  ADD CONSTRAINT `Fk_MovimientosNomina_Conceptos` FOREIGN KEY (`Cmp_iId_ConceptoNomina`) REFERENCES `tbl_conceptosnomina` (`Cmp_iId_ConceptoNomina`),
  ADD CONSTRAINT `Fk_MovimientosNomina_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`),
  ADD CONSTRAINT `Fk_MovimientosNomina_Nomina` FOREIGN KEY (`Cmp_iId_Nomina`) REFERENCES `tbl_nomina` (`Cmp_iId_Nomina`);

--
-- Filtros para la tabla `tbl_permiso_perfil_aplicacion`
--
ALTER TABLE `tbl_permiso_perfil_aplicacion`
  ADD CONSTRAINT `tbl_permiso_perfil_aplicacion_ibfk_1` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`),
  ADD CONSTRAINT `tbl_permiso_perfil_aplicacion_ibfk_2` FOREIGN KEY (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`);

--
-- Filtros para la tabla `tbl_permiso_usuario_aplicacion`
--
ALTER TABLE `tbl_permiso_usuario_aplicacion`
  ADD CONSTRAINT `tbl_permiso_usuario_aplicacion_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`),
  ADD CONSTRAINT `tbl_permiso_usuario_aplicacion_ibfk_2` FOREIGN KEY (`Fk_Id_Modulo`,`Fk_Id_Aplicacion`) REFERENCES `tbl_asignacion_modulo_aplicacion` (`Fk_Id_Modulo`, `Fk_Id_Aplicacion`);

--
-- Filtros para la tabla `tbl_prestamos`
--
ALTER TABLE `tbl_prestamos`
  ADD CONSTRAINT `Fk_Prestamos_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);

--
-- Filtros para la tabla `tbl_puestos`
--
ALTER TABLE `tbl_puestos`
  ADD CONSTRAINT `Fk_Puestos_Departamentos` FOREIGN KEY (`Cmp_iId_Departamento`) REFERENCES `tbl_departamentos` (`Cmp_iId_Departamento`);

--
-- Filtros para la tabla `tbl_reporte_balance_general`
--
ALTER TABLE `tbl_reporte_balance_general`
  ADD CONSTRAINT `tbl_reporte_balance_general_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reporte_balance_general_ibfk_2` FOREIGN KEY (`Fk_Id_BalanceGeneral`) REFERENCES `tbl_balance_general` (`Pk_Id_BalanceGeneral`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_reporte_balance_saldos`
--
ALTER TABLE `tbl_reporte_balance_saldos`
  ADD CONSTRAINT `tbl_reporte_balance_saldos_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reporte_balance_saldos_ibfk_2` FOREIGN KEY (`Fk_Id_Balance`) REFERENCES `tbl_balance_saldos` (`Pk_Id_Balance`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_reporte_estado_resultados`
--
ALTER TABLE `tbl_reporte_estado_resultados`
  ADD CONSTRAINT `tbl_reporte_estado_resultados_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reporte_estado_resultados_ibfk_2` FOREIGN KEY (`Fk_Id_Estado`) REFERENCES `tbl_estado_resultados` (`Pk_Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_reporte_flujo_efectivo`
--
ALTER TABLE `tbl_reporte_flujo_efectivo`
  ADD CONSTRAINT `tbl_reporte_flujo_efectivo_ibfk_1` FOREIGN KEY (`Fk_Codigo_Cuenta`) REFERENCES `tbl_catalogo_cuentas` (`Pk_Codigo_Cuenta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_reporte_flujo_efectivo_ibfk_2` FOREIGN KEY (`Fk_Id_Flujo`) REFERENCES `tbl_flujo_efectivo` (`Pk_Id_Flujo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_salario_empleado`
--
ALTER TABLE `tbl_salario_empleado`
  ADD CONSTRAINT `tbl_salario_empleado_ibfk_1` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`);

--
-- Filtros para la tabla `tbl_token_restaurarcontrasena`
--
ALTER TABLE `tbl_token_restaurarcontrasena`
  ADD CONSTRAINT `tbl_token_restaurarcontrasena_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `tbl_usuario_ibfk_1` FOREIGN KEY (`Fk_Id_Empleado`) REFERENCES `tbl_empleado` (`Pk_Id_Empleado`);

--
-- Filtros para la tabla `tbl_usuario_perfil`
--
ALTER TABLE `tbl_usuario_perfil`
  ADD CONSTRAINT `tbl_usuario_perfil_ibfk_1` FOREIGN KEY (`Fk_Id_Usuario`) REFERENCES `tbl_usuario` (`Pk_Id_Usuario`),
  ADD CONSTRAINT `tbl_usuario_perfil_ibfk_2` FOREIGN KEY (`Fk_Id_Perfil`) REFERENCES `tbl_perfil` (`Pk_Id_Perfil`);

--
-- Filtros para la tabla `tbl_vacaciones`
--
ALTER TABLE `tbl_vacaciones`
  ADD CONSTRAINT `Fk_Vacaciones_Empleados` FOREIGN KEY (`Cmp_iId_Empleado`) REFERENCES `tbl_empleados` (`Cmp_iId_Empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
