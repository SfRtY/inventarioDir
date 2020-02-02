-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-02-2020 a las 07:47:00
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` varchar(2) NOT NULL,
  `nombre_area` varchar(62) DEFAULT NULL,
  `abr_area` varchar(19) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `nombre_area`, `abr_area`) VALUES
('01', 'DIRECCION GENERAL', 'DIR_GENERAL'),
('02', 'SUB-DIRECCION', 'SUB.DIR'),
('03', 'ORGANO DE CONTROL INSTITUCIONAL', 'OCI-CONTROL INTERNO'),
('04', 'CONSEJO REGIONAL DE SALUD', 'CRS'),
('05', 'OFICINA EJECUTIVA DE GESTION Y DESARROLLO DE RECURSOS HUMANOS.', 'OEGDRR.HH'),
('06', 'OFICINA EJECUTIVA DE ADMINISTRACION', 'OEA'),
('07', 'OFICINA DE ABASTECIMIENTO Y SERVICIOS AUXILIARES', 'OASA.'),
('08', 'OFICINA DE CONTABILIDAD Y TESORERIA', 'OCT'),
('09', 'OFICINA DE ASESORIA JURICA', 'OAJ'),
('10', 'OFICINA EJECUTIVA DE PLANIFICACION Y FINANZAS', 'OEPF'),
('11', 'OFICINA DE FINANZAS', 'OF'),
('12', 'OFICINA DE INFORMATICA ESTADISTICA Y TELECOMUNICACIONES', 'OIET'),
('13', 'OFICINA DE PLANEAMIENTO Y GESTION INSTITUCIONAL', 'OPGI'),
('14', 'DIRECCION EJECUTIVA DE SALUD COLECTIVA', 'DESC'),
('15', 'DIRECCION PROMOCION DE LA SALUD', 'DPS'),
('16', 'DIRECCION DE SALUD AMBIENTAL', 'DSA'),
('17', 'DIRECCION EJECUTIVA DE VIGILANCIA EN SALUD PUBLICA', 'DEVSP'),
('18', 'DIRECCION DE EPIDEMIOLOGIA EMERGENCIA Y DESASTRES', 'DEED'),
('19', 'DIRECCION DE EDUCACION E INVESTIGACION PARA LA SALUD', 'DEIS'),
('20', 'DIRECCION DE LABORATORIO REGIONAL', 'DLR'),
('21', 'DIRECCION EJECUTIVA DE SALUD DE LAS PERSONAS', 'DESP'),
('22', 'DIRECCION DE ATENCION INTEGRAL Y CALIDAD EN SALUD', 'DAIS'),
('23', 'DIRECCION DE MEDICAMENTOS INSUMOS Y DROGAS', 'DMID'),
('24', 'DIRECCION DE SERVICIOS EN SALUD', 'DSS'),
('25', 'DIRECCION DE ASEGURAMIENTO PUBLICO', 'DAP'),
('26', 'SISTEMA DE ATENCION MOVIL DE URGENCIAS Y EMERGENCIAS', 'SAMU'),
('99', 'SIN AREA', 'SN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('cc0177e25a74b276ac2cf7b56744fbd3b472464d', '2020-01-19 18:38:29.336571', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add area', 7, 'add_area'),
(26, 'Can change area', 7, 'change_area'),
(27, 'Can delete area', 7, 'delete_area'),
(28, 'Can view area', 7, 'view_area'),
(29, 'Can add empleado', 8, 'add_empleado'),
(30, 'Can change empleado', 8, 'change_empleado'),
(31, 'Can delete empleado', 8, 'delete_empleado'),
(32, 'Can view empleado', 8, 'view_empleado'),
(33, 'Can add software', 9, 'add_software'),
(34, 'Can change software', 9, 'change_software'),
(35, 'Can delete software', 9, 'delete_software'),
(36, 'Can view software', 9, 'view_software'),
(37, 'Can add equipo', 10, 'add_equipo'),
(38, 'Can change equipo', 10, 'change_equipo'),
(39, 'Can delete equipo', 10, 'delete_equipo'),
(40, 'Can view equipo', 10, 'view_equipo'),
(41, 'Can add estabilizador', 11, 'add_estabilizador'),
(42, 'Can change estabilizador', 11, 'change_estabilizador'),
(43, 'Can delete estabilizador', 11, 'delete_estabilizador'),
(44, 'Can view estabilizador', 11, 'view_estabilizador'),
(45, 'Can add pc', 12, 'add_pc'),
(46, 'Can change pc', 12, 'change_pc'),
(47, 'Can delete pc', 12, 'delete_pc'),
(48, 'Can view pc', 12, 'view_pc'),
(49, 'Can add Token', 13, 'add_token'),
(50, 'Can change Token', 13, 'change_token'),
(51, 'Can delete Token', 13, 'delete_token'),
(52, 'Can view Token', 13, 'view_token'),
(53, 'Can add marca', 14, 'add_marca'),
(54, 'Can change marca', 14, 'change_marca'),
(55, 'Can delete marca', 14, 'delete_marca'),
(56, 'Can view marca', 14, 'view_marca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$Sd5dPNNSzyCx$bzUcw8PinNb4SxN7468QCh6+qEZsTNEzhq0xzqQsPyk=', '2020-02-02 06:28:31.695283', 1, 'usforty', '', '', 'usfortydep@gmail.com', 1, 1, '2020-01-17 05:34:28.856663');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-01-17 05:36:09.898499', '0ccc59c38fdb737f5464c1d499a4f9c5282ffbb4', '0ccc59c38fdb737f5464c1d499a4f9c5282ffbb4', 1, '[{\"added\": {}}]', 13, 1),
(2, '2020-01-17 05:38:24.912612', '0ccc59c38fdb737f5464c1d499a4f9c5282ffbb4', '0ccc59c38fdb737f5464c1d499a4f9c5282ffbb4', 3, '', 13, 1),
(3, '2020-01-17 05:46:45.286905', '08165b9e3c155806fa59e7d18ae4d32dbbbfc6ec', '08165b9e3c155806fa59e7d18ae4d32dbbbfc6ec', 1, '[{\"added\": {}}]', 13, 1),
(4, '2020-01-17 06:06:17.989489', '08165b9e3c155806fa59e7d18ae4d32dbbbfc6ec', '08165b9e3c155806fa59e7d18ae4d32dbbbfc6ec', 3, '', 13, 1),
(5, '2020-01-17 06:24:13.844457', '03c22ea9dbfffcdf8c263bd508ddbefa114bc213', '03c22ea9dbfffcdf8c263bd508ddbefa114bc213', 1, '[{\"added\": {}}]', 13, 1),
(6, '2020-01-19 18:38:24.761635', '03c22ea9dbfffcdf8c263bd508ddbefa114bc213', '03c22ea9dbfffcdf8c263bd508ddbefa114bc213', 3, '', 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(13, 'authtoken', 'token'),
(5, 'contenttypes', 'contenttype'),
(7, 'inventario', 'area'),
(8, 'inventario', 'empleado'),
(10, 'inventario', 'equipo'),
(11, 'inventario', 'estabilizador'),
(14, 'inventario', 'marca'),
(12, 'inventario', 'pc'),
(9, 'inventario', 'software'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-01-17 04:58:58.463485'),
(2, 'auth', '0001_initial', '2020-01-17 04:58:58.511213'),
(3, 'admin', '0001_initial', '2020-01-17 04:58:58.593852'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-01-17 04:58:58.615202'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-01-17 04:58:58.625483'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-01-17 04:58:58.654217'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-01-17 04:58:58.673820'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-01-17 04:58:58.688008'),
(9, 'auth', '0004_alter_user_username_opts', '2020-01-17 04:58:58.696604'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-01-17 04:58:58.712057'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-01-17 04:58:58.713252'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-01-17 04:58:58.720460'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-01-17 04:58:58.732669'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-01-17 04:58:58.741912'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-01-17 04:58:58.752475'),
(16, 'auth', '0011_update_proxy_permissions', '2020-01-17 04:58:58.760302'),
(17, 'inventario', '0001_initial', '2020-01-17 04:58:58.764106'),
(18, 'inventario', '0002_area_empleado_software', '2020-01-17 04:58:58.768750'),
(19, 'inventario', '0003_auto_20200116_2358', '2020-01-17 04:58:58.777559'),
(20, 'sessions', '0001_initial', '2020-01-17 04:58:58.783948'),
(21, 'authtoken', '0001_initial', '2020-01-17 05:11:33.536673'),
(22, 'authtoken', '0002_auto_20160226_1747', '2020-01-17 05:11:33.588100'),
(23, 'inventario', '0004_marca', '2020-02-02 06:42:00.728688');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `dni_empleado` varchar(8) NOT NULL,
  `id_area` varchar(2) DEFAULT NULL,
  `nombre_empleado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`dni_empleado`, `id_area`, `nombre_empleado`) VALUES
('10019717', '08', 'ALARCON CARDENAS ABIMAEL PAVEL'),
('10152979', '23', 'PACHECO CARDENAS MARIA JESUS'),
('10644407', '18', 'GONZALES VEGA WALTER ZOSIMO'),
('10653706', '22', 'HUAMANI GOMEZ OMAR LUIS'),
('15412090', '16', 'HUAMAN ORE ANA CRISTINA'),
('16013582', '12', 'SIFUENTES MENDOZA RAUL HUGO'),
('20072659', '06', 'RAZABAL CUPE ELMER'),
('20650771', '07', 'CAMARENA FERNANDEZ GALINDO PABLO'),
('20670830', '16', 'BACILIO MEZA ROSALUZ MARIA'),
('21403015', '22', 'SALCEDO MARTINEZ JORGE PAULINO'),
('21445498', '03', 'CHOQUE ESCRIBA JACINTO DIOMEDES'),
('21446602', '05', 'SEGOVIA MEZA LUIS FRANCISCO'),
('21450004', '23', 'TENORIO CACERES NELIDA TOMASA'),
('21493320', '21', 'ANICAMA BARRIOS YENI ARACELI'),
('21526553', '23', 'PEÑA CASTILLO GLORIA ISABEL'),
('21527645', '23', 'TOMAIRO LOPEZ EVA EDITH'),
('21537687', '08', 'GARCIA AMAYA MANUEL JESUS'),
('21553427', '23', 'SULCARAYMI CAYAMPI YULY'),
('21555205', '22', 'MEDINA SULCA VLADIMIR'),
('21565973', '01', 'BEDRIÑANA CARRASCO WALTER'),
('21574797', '12', 'JURADO LEVANO CARMEN ANGELICA'),
('21576767', '06', 'KISICH QUISPE RAUL'),
('21782563', '13', 'ROJAS ORMEÑO JUAN ARTURO'),
('21784725', '16', 'PALOMINO AYBAR MAXIMO'),
('21814525', '23', 'ORELLANA GIRON MARIA LUISA'),
('21871552', '21', 'YEREN VALENCIA CARMEN LUISA'),
('21874448', '16', 'AQUIJE ALVAREZ SANDRA MARIELA'),
('23980090', '20', 'SERNAQUE GUTIERREZ WALTER WILBER'),
('24002917', '23', 'HUARCAYA PIZARRO VLADIMIR FERNANDO'),
('2416486', '22', 'ESCOBEDO APAZA PRISCILA LAURA'),
('25811479', '21', 'GUTIERREZ PEREZ VILMA AURORA'),
('28200418', '24', 'CUENTAS ROBLES MISAEL'),
('28201962', '15', 'BAUTISTA DE ARGUMEDO LUISA'),
('28202550', '18', 'CORONEL CORNEJO DOLORES SOCORRO'),
('28202553', '10', 'APARICIO MEJIA DORA RINA'),
('28202726', '05', 'USCATA MALDONADO CIRIA ZENAIDA'),
('28202729', '22', 'LESCANO MORALES FABIAN'),
('28202789', '22', 'HUAMAN CARDENAS ODILON'),
('28203154', '07', 'MENDIETA AMAO MARIA JESUS'),
('28203155', '08', 'PRADO CISNEROS LEANDRO'),
('28203176', '12', 'YUPANQUI FLORES JUBELIO'),
('28203624', '05', 'MORANTE TRIGOSO CARMEN DIONISIA'),
('28203635', '22', 'SOLORZANO MENDOZA JOSE GIL'),
('28203642', '12', 'RIVERA ACOSTA EDY'),
('28203647', '20', 'VEGA SALAS JOSE ARMANDO'),
('28203648', '06', 'CASAVERDE DE VEGA ROSA AURORA'),
('28203649', '13', 'CARRASCO BELLOTA MARIO WALTER'),
('28203661', '05', 'LOPEZ CORDOVA JULIO'),
('28203675', '05', 'NINAPAYTAN COSTA DE RUIZ SILVIA YULY'),
('28203692', '02', 'SANCHEZ MEDINA OLGA CLEMENTINA'),
('28203703', '07', 'SANTIAGO PEÑA JULIO'),
('28203721', '18', 'HINOSTROZA TINEO TEOFANES'),
('28203725', '05', 'ALVAREZ TUPIA CESAR ALFREDO'),
('28203797', '05', 'SACCATOMA HUAMANI MARINO'),
('28204565', '08', 'BEJAR PAUCAR SOFIA'),
('28204587', '10', 'GIL GUILLEN TULIO DANTE'),
('28204665', '07', 'MOLERO AÑAÑOS VILMA MARGOT'),
('28204700', '22', 'CAMARENA LINO DEDA'),
('28204719', '07', 'TACURI CONDE WALTER'),
('28204803', '08', 'SILVA SANTIAGO MANUEL'),
('28204844', '22', 'RODRIGUEZ CALDERON ELIAS'),
('28204957', '08', 'PRADO LLALLAHUI JESUS MARTINA'),
('28205210', '05', 'CORDOVA OCHOA JULIO DANTE'),
('28205254', '05', 'GUTIERREZ ZAPATA MISAEL'),
('28205804', '22', 'ARONE HUAMANI GAUDENCIO'),
('28206743', '12', 'FUENTES CORAS MARGTH'),
('28208889', '22', 'VALLEJO CORAS ZOZIMA NATALI'),
('28209865', '20', 'MENESES MENESES MYRIAM SOLEDAD'),
('28211011', '12', 'MELENDEZ MONTOYA ASENCIONA ALICIA'),
('28211841', '05', 'BENITES MENDEZ EDGAR'),
('28212629', '03', 'CAVERO GONZALES FRIDA BEATRIZ'),
('28213078', '06', 'GOMEZ PRADO JORGE'),
('28213331', '09', 'RIVAS CERVANTES LUCERO DANTE'),
('28215223', '05', 'YAURI FERNANDEZ HIPOLITO'),
('28215881', '24', 'CUNTO ARONE MAGDALENA'),
('28216000', '18', 'GARCIA HUAYTA VICTOR RUBEN'),
('28217399', '10', 'HUAYANAY QUISPE ANDRES MOISES'),
('28218442', '05', 'OLARTE SULCA VICENTE PAUL'),
('28219376', '20', 'LOPEZ AURIS JESUS'),
('28219741', '08', 'TREJO ESPINOZA LUCIN EUGEN'),
('28221196', '05', 'VILLACRESIS ESPINOZA ALEJANDRO'),
('28221273', '16', 'HERRERA CHENET CARMEN ORFELINDA'),
('28221563', '22', 'ARBAYZA RAMIREZ MAURA'),
('28223199', '05', 'JANAMPA PRETELL JUSTO'),
('28223467', '20', 'GUERRERO QUINCHO SILVIA'),
('28224112', '99', 'JAUREGUI ALARCON DANTE WILFREDO'),
('28224553', '05', 'MEDRANO SAUÑE JULIO'),
('28224826', '16', 'BEINGOLEA CORDOVA VICTOR ROMULO'),
('28225090', '99', 'AGUILAR PAREDES MOISES ROLANDO'),
('28225779', '22', 'CARDENAS CORAS MARIA CLEOFE'),
('28226332', '07', 'ROMANI A EMILIO'),
('28227057', '22', 'GUERRA VALENCIA VIRGILIA JESUS'),
('28227412', '99', 'SANTOS CARPIO FIDEL'),
('28227697', '99', 'CHIPANA HINOSTROZA HERNAN'),
('28227762', '22', 'ALCARRAZ CURI RICARDO'),
('28228003', '16', 'BERROCAL AVILES JUAN FELIX'),
('28228190', '08', 'MEDRANO SAUÑE FELIPE'),
('28228528', '07', 'CISNEROS NINA SONIA CAROLA'),
('28237019', '07', 'SAAVEDRA SILVERA ORLANDO SOCRATES'),
('28237033', '12', 'CHOQUE PARCO ALBERTA'),
('28237498', '23', 'ORIUNDO GUILLEN GLICERIO'),
('28243011', '22', 'QUINTANILLA CHAVEZ NOIME'),
('28243203', '13', 'CUCHUÑAUPA CARDENAS RAUL'),
('28243408', '22', 'FLORES RODRIGUEZ HILDA'),
('28243812', '16', 'DE LA CRUZ QUISPE WILER HUGO'),
('28247957', '22', 'CORDERO CONDORI AVELINO'),
('28248255', '05', 'MALDONADO QUISPE GRACIELA'),
('28248472', '22', 'RAMIREZ LAGOS MIGUEL ANGEL'),
('28250837', '18', 'BONILLA GARCIA IVAN'),
('28251050', '23', 'GODOY YUPANQUI PETRONILA'),
('28259327', '07', 'YAURI BAUTISTA SATURNINO'),
('28260001', '08', 'PRADO AMBAS NICOLAS'),
('28260040', '09', 'DELGADILLO NINA DIOGENES'),
('28260200', '07', 'URBINA DE FLORES GABRIELA'),
('28260542', '22', 'LUZA OGOSE MARIA'),
('28260746', '08', 'RIVAS CERVANTES JESUS MARIA'),
('28261128', '09', 'MARISCAL MARTINEZ MIGUEL DANIEL'),
('28261694', '08', 'FLORES CONTRERAS RUBEN'),
('28261926', '07', 'YUPANQUI QUISPE BONIFACIO'),
('28263464', '22', 'SALCEDO MORALES REYNALDO'),
('28263927', '08', 'MALDONADO NUÑEZ FILOMENA'),
('28264142', '07', 'CHAVEZ YUPANQUI ALEJANDRO'),
('28265432', '23', 'ALFARO ASTORIMA RUDY MARCIAL'),
('28267871', '18', 'MACHACA REJAS HERMOGENES ZOSIMO'),
('28268119', '18', 'SANTOS ARENAS NANCY'),
('28268169', '15', 'CARDENAS GARCIA LUDY MARIEL'),
('28269063', '05', 'JUAREZ CABEZAS ARMANDO'),
('28269123', '20', 'BARRIENTOS SERNA TEOFILA'),
('28269298', '22', 'CARRASCO ARONES MILAGRITOS'),
('28269401', '07', 'HURTADO GARCIA CESAR'),
('28269805', '99', 'QUINTANILLA BETALLELUZ JORGE'),
('28269867', '23', 'ORE MALMACEDA FREDY'),
('28269923', '22', 'MEDINA PEREZ JANETH YESILA'),
('28270448', '07', 'QUISPE GALVEZ TEODORO'),
('28271183', '18', 'FLORES ALFARO JAVIER'),
('28271464', '18', 'HUAMANI PALOMINO AMADEA'),
('28271674', '22', 'LOZANO REVOLLAR CARMEN ROSA'),
('28271787', '07', 'CONDORI CASAFRANCA MARCELINO'),
('28271791', '22', 'ESCOBAR AGUILAR ZENON TARCISIO'),
('28271934', '25', 'CUBA GOMEZ JOSE ALFREDO'),
('28272122', '13', 'MENESES MENESES YURI AGAPITO'),
('28272377', '07', 'LLACTAHUAMAN SACSARA PEDRO'),
('28273447', '05', 'PALOMINO MENESES VICTOR MANUEL'),
('28273591', '22', 'PANIAGUA SEGOVIA MARIA FELICITAS'),
('28273757', '22', 'HUAMANI QUICAÑO ZENON'),
('28275498', '08', 'JERI ROJAS JUDY CELSA'),
('28275866', '22', 'OCHOA RAMOS LIDIA'),
('28275920', '08', 'HUAYHUALLA SAUÑE JUDIT'),
('28275948', '22', 'ALARCON VILA TANIA MERCEDES'),
('28281771', '16', 'ORE OZEJO JUAN CARLOS'),
('28284273', '05', 'TOLEDO CISNEROS GLADYS'),
('28285512', '20', 'CANGANA HUAJE JUAN'),
('28286660', '10', 'VARGAS CUBA FELIX HERNAN'),
('28287461', '99', 'LOPEZ BONILLA GLADIS DINA'),
('28288170', '01', 'TINCO BAUTISTA JOHN ROBERT'),
('28289183', '24', 'TENORIO LAGOS RUBEN'),
('28289447', '16', 'PEREZ LAURENTE JOHN PERCY'),
('28289507', '09', 'CARDENAS PALOMINO LILIAN ANNETTE'),
('28289699', '23', 'GODOY MARTINEZ ELVIO'),
('28289808', '20', 'HUAMANCUSI MAURICIO HECTOR EVELARDO'),
('28289964', '24', 'ARCE HERNANDEZ YANETH'),
('28290277', '07', 'REQUEJO YANCE LUIS ANTONIO'),
('28290691', '15', 'HUAMANCHAO PAQUIYAURI MARITZA'),
('28291641', '22', 'FIGUEROA GUEVARA MIGUEL FABRIZIO'),
('28291879', '18', 'GARCIA APAICO VANESSA'),
('28291882', '24', 'OLIVARES TINEO DANA MILUSKA'),
('28292417', '18', 'CORAS CRUZ BEATRIZ CECILIA'),
('28292585', '22', 'PALOMINO HUAYANAY MARTHA TERESA'),
('28293177', '07', 'ROJAS PRADO EDER'),
('28293750', '22', 'GUILLEN ALCA RAYDA'),
('28294059', '22', 'GONZALES ROJAS MARTHA'),
('28294772', '16', 'CONDORPUSA YUPANQUI JACKELINE MIRLA'),
('28294874', '11', 'LAPA BERROCAL WILLIAM'),
('28295184', '08', 'OGOSI CUSICAHUA JANET DORIS'),
('28295261', '24', 'PASTOR SALCEDO MARIO ANDRES'),
('28295830', '21', 'BAUTISTA PRADO CLEYMER'),
('28296592', '08', 'GALVEZ MENDOZA CARMEN'),
('28298552', '10', 'POMA RODRIGUEZ VICTORIA'),
('28298556', '03', 'OBREGON PANTIGOSO CESAR AUGUSTO'),
('28298586', '07', 'YUPANQUI JAUREGUI NOEMI ALBINA'),
('28298769', '24', 'ACORI TINOCO ADSEL'),
('28299459', '09', 'PROAÑO CHUCHON LOURDES DEL PILAR'),
('28300540', '22', 'LAURA ROCA DONATO'),
('28302957', '08', 'JANAMPA AUQUI ANGEL ALEJANDRO'),
('28303223', '20', 'CHUMBE HUAUYA HUMBERTO'),
('28303824', '09', 'MARTINEZ AYALA NOELIA'),
('28305513', '07', 'TINEO MOROTE CONSTANTINA'),
('28306318', '08', 'GONZALEZ HINOSTROZA URSULA'),
('28307201', '22', 'ALEMAN MUÑINCO ROSARIO'),
('28307323', '15', 'YUPANQUI PILLIHUAMAN EDUAR'),
('28307555', '19', 'PAUCCA JAULES FAUSTINO'),
('28308609', '23', 'BONILLA JERI WILLIAMS'),
('28308611', '23', 'UNTIVEROS BONILLA MARIA ROXANA'),
('28309199', '22', 'MELGAR SALCEDO FLOR DE MARIA'),
('28309508', '20', 'QUISPE LLANTOY EDITH'),
('28310314', '03', 'AROTINCO PALOMINO PERCY VICTOR'),
('28310443', '07', 'BAUTISTA GOMEZ PERCY'),
('28310978', '22', 'QUISPE GUILLEN YANETT MARLENE'),
('28311173', '13', 'LLALLAHUI HUAMANI WILLIAM'),
('28311181', '11', 'COLONIO GARCIA MARGOT'),
('28311911', '05', 'UBILLUZ MEJIA ALEJANDRINO'),
('28312410', '16', 'INFANZON ESCOBAR HUGO'),
('28313184', '18', 'QUISPE QUINTANA EDGAR AMERICO'),
('28313673', '22', 'PALOMINO ATAUQUI VIDAL ARTURO'),
('28314036', '01', 'SALVATIERRA LAPA ARMANDO WILBER'),
('28314624', '05', 'QUISPE DELGADILLO RAFAEL'),
('28315068', '15', 'ORE ABENDAÑO BRUNEL'),
('28315137', '23', 'CARRION DOMINGUEZ KRISTIAN'),
('28315285', '08', 'ASTORAY PEÑA YOVANA'),
('28315518', '18', 'SARMIENTO CASAVILCA ZAYDA GISELA'),
('28315540', '23', 'CALDERON NAVARRO RUBEN ABILIO'),
('28316020', '24', 'QUISPE FLORES SONIA'),
('28316161', '07', 'SERNA JORGE JAIME'),
('28441793', '23', 'HUALLANCA AYALA JORGE ANDRES'),
('28444980', '23', 'GANZALES YUYALI YANY LUZ'),
('28445067', '10', 'CARDENAS GUTIERREZ RAY EMERSON'),
('28590743', '08', 'ORE DE CHUCHON GENOVEBA'),
('28590785', '15', 'HUAMAN SOLDEVILLA OBDULIA'),
('28591097', '20', 'QUISPE FLORES SONIA'),
('28591426', '20', 'BAUTISTA ESQUIVEL ZENAIDA'),
('28591531', '13', 'AUCCAPUCLLA TAPAHUASCO YANET'),
('28600692', '24', 'REYES ARAUJO WALTER VICTOR'),
('28605229', '22', 'JAIME MALDONADO EFRAIN'),
('28854605', '05', 'LAVY LEON CARLOS ARTURO'),
('28965010', '22', 'CASTAÑEDA RODRIGUEZ JUAN LINO'),
('28981490', '24', 'GARCIA ALATA HERNAN BONIFACIO'),
('31169958', '20', 'GUILLEN MORENO MARIA JESUS'),
('31183153', '15', 'LARA ROMANI EDGARD'),
('40035392', '23', 'ROJAS GARAY ALFREDO'),
('40091473', '09', 'ARONES JARA SANDRA'),
('40125714', '07', 'VALENCIA RIOS MARIO WILLIAM'),
('40128521', '22', 'REVOLLAR OCHATOMA ELIZABETH PELAGIA'),
('40138401', '06', 'VENANCINO MORALES MANUEL'),
('40142958', '10', 'PALOMINO IPURRE ANA MARIA'),
('40259547', '05', 'GUZMAN PALOMINO OBED LEONARDO'),
('40312743', '23', 'JERI CANCHARI YENY MARIBEL'),
('40361949', '15', 'ZUÑIGA MEDINA KLARIS'),
('40441330', '07', 'LOZANO TUPIA EDILBERTO'),
('40464262', '23', 'ESPINOZA MARMOLEJO ANGEL'),
('40471675', '22', 'HUAMAN BARZOLA JUDITH'),
('40537600', '22', 'FERNANDEZ ASTECKER JORGE LUIS'),
('40538412', '11', 'BORDA ALVIZURI ENVER'),
('40603449', '16', 'LLAMOCCA MACHUCA EDGAR'),
('40615801', '01', 'CCAICURI YUPANQUI GLADYS DESIDERIA'),
('40631812', '25', 'MENESES PEÑA NADIUSKA'),
('40692627', '07', 'RODRIGUEZ GOMEZ MIRTHA BEATRIZ'),
('40755730', '22', 'GONZALEZ HUAUYA LIZ RAQUEL'),
('40760481', '08', 'HUAMANI HUALLANCA DENISSE KARINA'),
('40790918', '24', 'DEL PINO VERAN SONIA AMPARO'),
('40804904', '24', 'TIPE DE LA CRUZ GISELA'),
('40843376', '22', 'LEON CORZO CARLOS ALONSO'),
('40849401', '22', 'DAMIAN ANAYA LILIANA'),
('40938567', '23', 'TORRES CALLE YAKELIN'),
('40975746', '22', 'PACHAS GRADOS JESSICA'),
('41029508', '25', 'PAYANO ROJAS JUDITH ROSARIO'),
('41050905', '22', 'ALTAMIRANO CHACCHI ROCIO JANET'),
('41063423', '16', 'SALVATIERRA LIVIA JEANNE'),
('41153367', '20', 'AGUILAR IGNACIO NELSON'),
('41223671', '16', 'GONZALES ARONES OTTO OSWALDO'),
('41231752', '99', 'LARA CABRERA YULIANA ESPERANZA'),
('41265283', '25', 'ANCHANTE FLORES SINTHIA ALACIEL'),
('41382470', '24', 'CAJO YAURI MILAGROS ISABEL'),
('41456878', '18', 'CONTRERAS VILLANUEVA NOEMI PILAR'),
('41543083', '22', 'MOROTE HUAYTALLA YOVANA'),
('41590518', '22', 'GUTIERREZ ESCOBAR RONALD JAIME'),
('41594518', '21', 'CISNEROS AYALA EDWIN'),
('41666505', '20', 'SOLORZANO GUERREROS MAX PEDRO'),
('41706196', '09', 'RODRIGUEZ ARIMANA JAIME'),
('41718862', '12', 'CONDORI JANAMPA CAYO'),
('41748153', '22', 'LOPEZ VERA LESLIE MAGALY'),
('41788186', '06', 'AGUIRRE RAMOS HILMER'),
('41808870', '18', 'ROCA QUISPE ROCIO LORENA'),
('41879471', '99', 'PRADO PALOMINO PABLO RINALDO'),
('41896255', '06', 'PRADO RAMOS RONALD'),
('41903636', '07', 'VARGAS ORIUNDO RICHAR'),
('41915252', '99', 'GUTIERREZ CAHUANA IVON'),
('41968413', '09', 'GOMEZ GUTIERREZ LOURDES'),
('41983226', '23', 'CAMPOS CARMEN GENARO LEONEL'),
('41993008', '12', 'SAUÑE RODRIGUEZ ROCKY ELEAZAR'),
('42062268', '22', 'QUISPE VALLEJO ELSE MAYU'),
('42062284', '07', 'GUILLEN MOORE JOHNY RANDY'),
('42097019', '01', 'VALLEJOS SALDAÑA SOLEDAD'),
('42180958', '23', 'MENDOZA PALOMINO IDEL GABRIEL'),
('42228731', '99', 'ALBITES VILLALOBOS JOSE LUIS'),
('42235864', '07', 'JAIME MALDONADO YOLANDA'),
('42252227', '18', 'RODRIGUEZ GOZME JESSENIA DEL PILAR'),
('42329069', '22', 'MENDOZA HUAMAN MELVIN JOEL'),
('42416589', '23', 'GOMEZ GAMARRA ROBERSSON VICTOR'),
('42445046', '20', 'QUISPE VEGA FREDY'),
('42454729', '20', 'CASTRO QUISPE MARCELINO'),
('42457440', '07', 'ALFARO SOVERO GIOVANA DEL PILAR'),
('42459539', '99', 'LEON LIZARBE MIGUEL ANGEL'),
('42556064', '16', 'MEDRANO RIVERA TONY'),
('42590460', '20', 'RIVAS QUISPE KARIM JULIANA'),
('42713007', '16', 'PEÑA ATAO EDER'),
('42796239', '23', 'SALAZAR POMA AUSBERTO'),
('42910203', '12', 'DURAND ARAUJO MIROSLAF JUMAR'),
('42913999', '24', 'ESPINOZA MORALES JUAN CARLOS'),
('42940805', '25', 'PARIONA AROTINCO LUZ MARIBEL'),
('42940906', '21', 'ALTAMIRANO CHACCHI KETY'),
('42957581', '09', 'ENCISO RONDINEL CARLOS RAUL'),
('43032465', '20', 'RODRIGUEZ PALOMINO DORILA'),
('43058353', '22', 'HUAMANI NAJARRO EDGARD WILSON'),
('43159238', '05', 'CAMPOS LAURA ELOY WASHINGTON'),
('43173990', '12', 'GUZMAN MANCILLA RUBEN WHATSON'),
('43189119', '05', 'SANTA MARIA MORAN DENNIS'),
('43238582', '99', 'RODRIGUEZ CARRASCO JHANINA'),
('43244588', '05', 'CURI CARRASCO MARIA LUZ'),
('43278853', '22', 'REYES SANTOS MARLON'),
('43332378', '05', 'HINOSTROZA DE LA CRUZ KATY CAROLINA'),
('43409286', '07', 'HUANCAHUARI MUÑOZ JOEL HENNER'),
('43495963', '09', 'LLANTOY BARBOZA ANGELO EDUARD'),
('43514961', '20', 'LAURA AYALA ROLY'),
('43650271', '12', 'GUTIERREZ GUISBERT JORGE ENRIQUE'),
('43660629', '07', 'LAURENTE CHIHUAN KAREN'),
('43737510', '25', 'CARDENAS CHAUCA ROMEL'),
('43855235', '20', 'HUARIPUMA MEDINA PAVEL FLORIAN'),
('43951057', '25', 'RUIZ RIVAS MIJAEL YESEL'),
('43975511', '05', 'CARDENAS CHAMORRO VILMA LUCIA'),
('43998496', '05', 'CHAVARRIA RIVEROS EDITH'),
('44080331', '09', 'PRADO ORTEGA ANGELA VANEZA'),
('44122100', '05', 'DE LAMA MORENO SOLANGE ROXANA'),
('44137098', '20', 'REMON TORRES MAX ALBERT'),
('44147253', '01', 'GUTIERREZ RAYME ABEL'),
('4416523', '18', 'QUISPE VICENTE MAXIMA ADELAYDA'),
('44193488', '99', 'ROBLES QUISPE EDSON ALE'),
('44209500', '09', 'VILCHEZ PAREDES SERGIO EMERSON'),
('44521636', '03', 'PALOMINO MUÑAQUI NATALI'),
('44750761', '18', 'SULCA JAYO GUISELA LUCY'),
('44770009', '20', 'LAGOS MENDIETA NOHELY TATIANA'),
('44770011', '99', 'GONZALES AYALA JANETT'),
('44856157', '08', 'GOMEZ HINOSTROZA DIOMEDIZ'),
('44887770', '05', 'LUYA CASTRO LUCY'),
('45061118', '12', 'QUICAÑO MARTINEZ MARLENY'),
('45094498', '09', 'CONZA PARI EDWIN'),
('45412933', '25', 'HUAMANI SUCAPUCA JEAN CARLOS'),
('45484306', '20', 'CHAVEZ MALLMA BANNY SHIRLEY'),
('45677185', '08', 'MAMANI BARRIENTOS ADERLYN'),
('45754738', '20', 'ARAMBURU VILLALTA IRVING'),
('45885045', '01', 'AMIQUERO ZOIQUI LOURDES'),
('45897351', '22', 'CUADROS SARMIENTO ELVIS ROBERTH'),
('46149969', '24', 'NAVARRO VALLEJOS LEYQUIUM RONIEE'),
('46154018', '12', 'CARPIO QUISPE SHEYLA CYNTHIA'),
('46307469', '09', 'DE LA CRUZ HUAMANI DEYSSY KATTHIANA'),
('47313957', '99', 'INGA QUISPE LUZ DORIS'),
('47727229', '24', 'QUISPE LAZO DIANA ORFA'),
('6728638', '07', 'ORE ESPINOZA VIDAL'),
('6884291', '13', 'CALDERON CHUMBILE MAXIMINO'),
('6960911', '21', 'BALTAZAR ACUÑA ANA MARGARITA'),
('70050623', '20', 'HINOSTROZA CHAUCA LIZETH PAOLA'),
('70499216', '12', 'JAYO CHOQUE ANDERSON ANTHONY'),
('7231944', '20', 'CHAVEZ ANAYA LIDIA'),
('7469395', '25', 'CHIVILCHEZ GOYZUETA PEDRO MARTIN'),
('7919137', '22', 'POZO CHAVEZ ENRIQUE'),
('7968300', '01', 'FERNANDEZ JIMENEZ CECILIA'),
('80024330', '24', 'MICHUE FERNANDEZ CARLOS'),
('80098857', '22', 'QUISPE SOTO WILFREDO'),
('80510397', '20', 'JOYO CASTRO IVAN'),
('80592720', '99', 'ESTEBAN SACIGA CARLOS ALBERTO'),
('80625434', '20', 'ROJAS PILLPE GOYO RAUL'),
('80683245', '20', 'CASTRO CUENCA BENEDICTO'),
('8343252', '11', 'JAYO COSEATADO MAXIMO'),
('8560133', '22', 'SALCEDO MARTINEZ LUZ BLANCA'),
('8804739', '22', 'HUAMANI BASILIO DE CISNEROS NELLY NIDIA'),
('8967299', '22', 'HUAMANI AGUERO MELQUIADES'),
('9121386', '23', 'PIZARRO MORALES DORIS'),
('9434222', '18', 'VARGAS OLIVARES VICTOR HUGO'),
('9548373', '07', 'DIAZ ALARCON AMADOR'),
('9566884', '22', 'ORIUNDO CARBAJAL KARIN'),
('9582481', '22', 'QUISPE MENDOZA MARISOL GABRIELA'),
('9599276', '10', 'DE LA CRUZ ORE ROBER'),
('9770924', '14', 'BRAVO BENAVIDES MARIA BEATRIZ'),
('9935497', '99', 'QUISPE YARUCURI RUBEN ROBERTO'),
('9964161', '12', 'CALDERON OROZCO GUIDO LINO'),
('9965814', '05', 'POZO RODRIGUEZ MELCHOR ELIAS'),
('﻿7148384', '25', 'GARCIA CUAREZ GRIMANESA RAQUEL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(9) NOT NULL,
  `nombre_equipo` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `marca_equipo` int(3) DEFAULT NULL,
  `modelo_equipo` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado_equipo` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `numero_serie` varchar(15) DEFAULT NULL,
  `codigo_activo` varchar(12) DEFAULT NULL,
  `dni_empleado` varchar(8) NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estabilizador`
--

CREATE TABLE `estabilizador` (
  `id_estabilizador` int(3) NOT NULL,
  `marca_estabilizador` int(3) NOT NULL,
  `potencia_watts` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `potencia_va` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_estabilizador` varchar(13) NOT NULL,
  `numero_serie` varchar(15) DEFAULT NULL,
  `codigo_activo` varchar(12) DEFAULT NULL,
  `estado_estabilizador` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `dni_empleado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(3) NOT NULL,
  `nombre_marca` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo_marca` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre_marca`, `tipo_marca`) VALUES
(1, 'Access Point', 0),
(2, 'Antena', 0),
(4, 'Camara fotografica', 0),
(5, 'Disco Duro Externo', 0),
(6, 'Escaner', 0),
(7, 'Filmadora', 0),
(8, 'Impresora', 0),
(10, 'Lectora', 0),
(11, 'Monitor', 0),
(12, 'Mouse', 0),
(13, 'Router', 0),
(14, 'Switch', 0),
(15, 'Teclado', 0),
(16, 'Telefono IP', 0),
(17, 'PC', 999),
(18, 'UPS', 999),
(19, 'Otro', 0),
(20, '3COM', 1),
(21, 'Alhua', 1),
(22, 'Altai', 1),
(23, 'Apple', 1),
(24, 'Aruba', 1),
(25, 'Asus', 1),
(26, 'AVM', 1),
(27, 'Buffalo', 1),
(28, 'Cambium Network', 1),
(29, 'Cisco', 1),
(30, 'D-link', 1),
(31, 'Dell', 1),
(32, 'Draytek', 1),
(33, 'Edimax', 1),
(34, 'EnGenius', 1),
(35, 'Google', 1),
(36, 'Hikvision', 1),
(37, 'Huawei', 1),
(38, 'Ligowave', 1),
(39, 'Linksys', 1),
(40, 'Mikrotik', 1),
(41, 'Mimosa', 1),
(42, 'Netgear', 1),
(43, 'NetPoint', 1),
(44, 'NuCom', 1),
(45, 'Provision', 1),
(46, 'RFElement', 1),
(47, 'SMC', 1),
(48, 'Speedtouch', 1),
(49, 'Synology', 1),
(50, 'Syscom', 1),
(51, 'Tenda', 1),
(52, 'Tp-link', 1),
(53, 'Trendnet', 1),
(54, 'TxPro', 1),
(55, 'Ubee', 1),
(56, 'Ubiquiti', 1),
(57, 'Westell', 1),
(58, 'Zyxel', 1),
(59, '3COM', 2),
(60, 'Alhua', 2),
(61, 'Altai', 2),
(62, 'Apple', 2),
(63, 'Aruba', 2),
(64, 'Asus', 2),
(65, 'AVM', 2),
(66, 'Buffalo', 2),
(67, 'Cambium Network', 2),
(68, 'Cisco', 2),
(69, 'D-link', 2),
(70, 'Dell', 2),
(71, 'Draytek', 2),
(72, 'Edimax', 2),
(73, 'EnGenius', 2),
(74, 'Google', 2),
(75, 'Hikvision', 2),
(76, 'Huawei', 2),
(77, 'Ligowave', 2),
(78, 'Linksys', 2),
(79, 'Mikrotik', 2),
(80, 'Mimosa', 2),
(81, 'Netgear', 2),
(82, 'NetPoint', 2),
(83, 'NuCom', 2),
(84, 'Provision', 2),
(85, 'RFElement', 2),
(86, 'SMC', 2),
(87, 'Speedtouch', 2),
(88, 'Synology', 2),
(89, 'Syscom', 2),
(90, 'Tenda', 2),
(91, 'Tp-link', 2),
(92, 'Trendnet', 2),
(93, 'TxPro', 2),
(94, 'Ubee', 2),
(95, 'Ubiquiti', 2),
(96, 'Westell', 2),
(97, 'Zyxel', 2),
(98, 'Aoleca', 3),
(99, 'Apeman', 3),
(100, 'Axis Comunication', 3),
(101, 'Bosch', 3),
(102, 'Canary', 3),
(103, 'Dahua', 3),
(104, 'Dahua', 3),
(105, 'Foscam', 3),
(106, 'Fredi', 3),
(107, 'HikVision', 3),
(108, 'IeGeek', 3),
(109, 'Inkerscoop', 3),
(110, 'Kkmoon', 3),
(111, 'Leshp', 3),
(112, 'Mibao', 3),
(113, 'Nexgadget', 3),
(114, 'Pecham', 3),
(115, 'Sannce', 3),
(116, 'Smonet', 3),
(117, 'Sricam', 3),
(118, 'Sricam', 3),
(119, 'Sv3c', 3),
(120, 'TP-link', 3),
(121, 'Vikcam', 3),
(122, 'VTA', 3),
(123, 'Yi', 3),
(124, 'Zosi', 3),
(125, 'Canon', 4),
(126, 'Fujifilm', 4),
(127, 'Hasselbland', 4),
(128, 'Kodak', 4),
(129, 'Konika minoita', 4),
(130, 'Leica', 4),
(131, 'Nikon', 4),
(132, 'Olympus', 4),
(133, 'Panasonic', 4),
(134, 'Pentax', 4),
(135, 'Phase One', 4),
(136, 'Sigma', 4),
(137, 'Sinar', 4),
(138, 'Sony', 4),
(139, 'Adata', 5),
(140, 'Buffalo', 5),
(141, 'LaCie', 5),
(142, 'Lenovo', 5),
(143, 'Samsung', 5),
(144, 'Seagate', 5),
(145, 'Toshiba', 5),
(146, 'Wester Digital', 5),
(147, 'Apple', 6),
(148, 'Brother', 6),
(149, 'Canon', 6),
(150, 'Dell', 6),
(151, 'Epson', 6),
(152, 'HP', 6),
(153, 'Kyocera', 6),
(154, 'Lexmark', 6),
(155, 'Panasonic', 6),
(156, 'Samsung', 6),
(157, 'Sharp', 6),
(158, 'Toshiba', 6),
(159, 'Xerox', 6),
(160, 'Canon', 7),
(161, 'Fujifilm', 7),
(162, 'Hasselbland', 7),
(163, 'Kodak', 7),
(164, 'Konika minoita', 7),
(165, 'Leica', 7),
(166, 'Nikon', 7),
(167, 'Olympus', 7),
(168, 'Panasonic', 7),
(169, 'Pentax', 7),
(170, 'Phase One', 7),
(171, 'Sigma', 7),
(172, 'Sinar', 7),
(173, 'Sony', 7),
(174, 'Apple', 8),
(175, 'Brother', 8),
(176, 'Canon', 8),
(177, 'Dell', 8),
(178, 'Epson', 8),
(179, 'HP', 8),
(180, 'Kyocera', 8),
(181, 'Lexmark', 8),
(182, 'Panasonic', 8),
(183, 'Samsung', 8),
(184, 'Sharp', 8),
(185, 'Toshiba', 8),
(186, 'Xerox', 8),
(187, 'Apple', 9),
(188, 'Brother', 9),
(189, 'Canon', 9),
(190, 'Dell', 9),
(191, 'Epson', 9),
(192, 'HP', 9),
(193, 'Kyocera', 9),
(194, 'Lexmark', 9),
(195, 'Panasonic', 9),
(196, 'Samsung', 9),
(197, 'Sharp', 9),
(198, 'Toshiba', 9),
(199, 'Xerox', 9),
(200, 'Asus', 10),
(201, 'Dell', 10),
(202, 'HP', 10),
(203, 'Lenovo', 10),
(204, 'LG', 10),
(205, 'Liteon', 10),
(206, 'Panasonic', 10),
(207, 'Plextor', 10),
(208, 'Samsung', 10),
(209, 'Toshiba', 10),
(210, 'Trancend', 10),
(211, 'Verbatim', 10),
(212, 'Acer', 11),
(213, 'Alhua', 11),
(214, 'AOC', 11),
(215, 'Asus', 11),
(216, 'BenQ', 11),
(217, 'Dell', 11),
(218, 'GameFactor', 11),
(219, 'HP', 11),
(220, 'Lenovo', 11),
(221, 'LG', 11),
(222, 'MSI', 11),
(223, 'Nacer', 11),
(224, 'Quian', 11),
(225, 'Samsung', 11),
(226, 'ViewSonic', 11),
(227, 'Vorago', 11),
(228, 'Yeyian', 11),
(229, 'Corsair', 12),
(230, 'Cougar', 12),
(231, 'Dell', 12),
(232, 'Eagle Warrior', 12),
(233, 'Gamdias', 12),
(234, 'GameFactor', 12),
(235, 'Genius', 12),
(236, 'Gigabyte', 12),
(237, 'Hiper X', 12),
(238, 'Hp', 12),
(239, 'Krom', 12),
(240, 'Lenovo', 12),
(241, 'Logitech', 12),
(242, 'Microsoft', 12),
(243, 'Naceb', 12),
(244, 'Razer', 12),
(245, 'Sharkoon', 12),
(246, 'SteelSeries Rival', 12),
(247, 'Thechzone', 12),
(248, 'Thermaltake', 12),
(249, 'Trust', 12),
(250, 'Xtech', 12),
(251, 'Yeyian', 12),
(252, '3COM', 13),
(253, 'Alhua', 13),
(254, 'Altai', 13),
(255, 'Apple', 13),
(256, 'Aruba', 13),
(257, 'Asus', 13),
(258, 'AVM', 13),
(259, 'Buffalo', 13),
(260, 'Cambium Network', 13),
(261, 'Cisco', 13),
(262, 'D-link', 13),
(263, 'Dell', 13),
(264, 'Draytek', 13),
(265, 'Edimax', 13),
(266, 'EnGenius', 13),
(267, 'Google', 13),
(268, 'Hikvision', 13),
(269, 'Huawei', 13),
(270, 'Ligowave', 13),
(271, 'Linksys', 13),
(272, 'Mikrotik', 13),
(273, 'Mimosa', 13),
(274, 'Netgear', 13),
(275, 'NetPoint', 13),
(276, 'NuCom', 13),
(277, 'Provision', 13),
(278, 'RFElement', 13),
(279, 'SMC', 13),
(280, 'Speedtouch', 13),
(281, 'Synology', 13),
(282, 'Syscom', 13),
(283, 'Tenda', 13),
(284, 'Tp-link', 13),
(285, 'Trendnet', 13),
(286, 'TxPro', 13),
(287, 'Ubee', 13),
(288, 'Ubiquiti', 13),
(289, 'Westell', 13),
(290, 'Zyxel', 13),
(291, '3COM', 14),
(292, 'Alhua', 14),
(293, 'Altai', 14),
(294, 'Apple', 14),
(295, 'Aruba', 14),
(296, 'Asus', 14),
(297, 'AVM', 14),
(298, 'Buffalo', 14),
(299, 'Cambium Network', 14),
(300, 'Cisco', 14),
(301, 'D-link', 14),
(302, 'Dell', 14),
(303, 'Draytek', 14),
(304, 'Edimax', 14),
(305, 'EnGenius', 14),
(306, 'Google', 14),
(307, 'Hikvision', 14),
(308, 'Huawei', 14),
(309, 'Ligowave', 14),
(310, 'Linksys', 14),
(311, 'Mikrotik', 14),
(312, 'Mimosa', 14),
(313, 'Netgear', 14),
(314, 'NetPoint', 14),
(315, 'NuCom', 14),
(316, 'Provision', 14),
(317, 'RFElement', 14),
(318, 'SMC', 14),
(319, 'Speedtouch', 14),
(320, 'Synology', 14),
(321, 'Syscom', 14),
(322, 'Tenda', 14),
(323, 'Tp-link', 14),
(324, 'Trendnet', 14),
(325, 'TxPro', 14),
(326, 'Ubee', 14),
(327, 'Ubiquiti', 14),
(328, 'Westell', 14),
(329, 'Zyxel', 14),
(330, 'Actek', 15),
(331, 'Adata', 15),
(332, 'Alianware', 15),
(333, 'Asus', 15),
(334, 'Azio', 15),
(335, 'BenQ', 15),
(336, 'Corsair', 15),
(337, 'Cougar', 15),
(338, 'Dell', 15),
(339, 'Genius', 15),
(340, 'Gigabyte', 15),
(341, 'HiperX', 15),
(342, 'Hp', 15),
(343, 'Lenovo', 15),
(344, 'Logear', 15),
(345, 'Logitech', 15),
(346, 'Microsoft', 15),
(347, 'Naceb', 15),
(348, 'Razer', 15),
(349, 'Techzone', 15),
(350, 'Thernaltake', 15),
(351, 'Vorago', 15),
(352, 'Xtech', 15),
(353, 'Yeyian', 15),
(354, 'Akuvox', 16),
(355, 'Cisco', 16),
(356, 'Fanvil', 16),
(357, 'GrandStream', 16),
(358, 'Mitel', 16),
(359, 'Panasonic', 16),
(360, 'PolyCom', 16),
(361, 'Snom', 16),
(362, 'SprectraLink', 16),
(363, 'YeaLink', 16),
(364, 'Acer', 17),
(365, 'Advance', 17),
(366, 'Alienware', 17),
(367, 'Apple', 17),
(368, 'Asus', 17),
(369, 'Compaq', 17),
(370, 'Dell', 17),
(371, 'Gateway', 17),
(372, 'HP', 17),
(373, 'Lenovo', 17),
(374, 'LG', 17),
(375, 'MSI', 17),
(376, 'Samsung', 17),
(377, 'Sony Vaio', 17),
(378, 'Toshiba', 17),
(379, 'APC', 18),
(380, 'Barracuda', 18),
(381, 'CDP', 18),
(382, 'Ciber Power', 18),
(383, 'Complet', 18),
(384, 'Eaton', 18),
(385, 'Forza', 18),
(386, 'ISB', 18),
(387, 'Koblenz', 18),
(388, 'Nacer', 18),
(389, 'Smartbitt', 18),
(390, 'Steren', 18),
(391, 'Tripp lite', 18),
(392, 'Vica', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pc`
--

CREATE TABLE `pc` (
  `id_pc` int(3) NOT NULL,
  `procesador_pc` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `velocidad_pc` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `memoria_ram` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `almacenamiento` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tarjeta_video` varchar(15) DEFAULT NULL,
  `marca` int(3) DEFAULT NULL,
  `tipo_equipo` varchar(8) NOT NULL,
  `numero_serie` varchar(15) DEFAULT NULL,
  `modelo` varchar(15) DEFAULT NULL,
  `codigo_activo` varchar(12) DEFAULT NULL,
  `sistema_operativo` varchar(11) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(7) DEFAULT NULL,
  `dni_empleado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE `software` (
  `id_software` int(3) NOT NULL,
  `nombre_software` varchar(25) NOT NULL,
  `version_software` varchar(10) DEFAULT NULL,
  `licencia_software` varchar(2) DEFAULT NULL,
  `tipo_equipo_s` varchar(6) NOT NULL,
  `codigo_bien_s` varchar(12) DEFAULT NULL,
  `sistema_operativo` varchar(11) NOT NULL,
  `dni_empleado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`dni_empleado`),
  ADD KEY `id_area_idx` (`id_area`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `dni_empleado_e_idx` (`dni_empleado`),
  ADD KEY `marca_equipo` (`marca_equipo`);

--
-- Indices de la tabla `estabilizador`
--
ALTER TABLE `estabilizador`
  ADD PRIMARY KEY (`id_estabilizador`),
  ADD KEY `dni_empleado_e_idx` (`dni_empleado`),
  ADD KEY `marca_estabilizador` (`marca_estabilizador`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `tipo_marca` (`tipo_marca`);

--
-- Indices de la tabla `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`id_pc`),
  ADD KEY `id_empleado_idx` (`dni_empleado`),
  ADD KEY `marca` (`marca`);

--
-- Indices de la tabla `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id_software`),
  ADD KEY `dni_empleado_s_idx` (`dni_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estabilizador`
--
ALTER TABLE `estabilizador`
  MODIFY `id_estabilizador` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT de la tabla `pc`
--
ALTER TABLE `pc`
  MODIFY `id_pc` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
  MODIFY `id_software` int(3) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_id_area_em` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`marca_equipo`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dni_empleado_eq` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estabilizador`
--
ALTER TABLE `estabilizador`
  ADD CONSTRAINT `estabilizador_ibfk_1` FOREIGN KEY (`marca_estabilizador`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dni_empleado_es` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `fk_dni_empleado_pc` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pc_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `fk_dni_empleado_sw` FOREIGN KEY (`dni_empleado`) REFERENCES `empleado` (`dni_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
