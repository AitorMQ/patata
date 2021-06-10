-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2021 a las 15:59:02
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `covid`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_recuDatosRegCentros` (IN `p_codCentro` SMALLINT)  NO SQL
BEGIN
   IF NOT EXISTS(SELECT * FROM registroCentros WHERE codigoCentro=p_codCentro) THEN
       SELECT -1 as codigoCentro;
   ELSE
       SELECT codigoCentro,nombreContacto,apellido1Contacto,apellido2Contacto,movil,email,contrasena FROM registroCentros WHERE codigoCentro=p_codCentro;
   END IF;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartavacunacion`
--

CREATE TABLE `cartavacunacion` (
  `codigoPersona` int(11) NOT NULL,
  `numVacuna` tinyint(4) NOT NULL,
  `codigoVacuna` tinyint(4) NOT NULL,
  `codigoCentro` smallint(6) DEFAULT NULL,
  `fechaDosis1` date DEFAULT NULL,
  `fechaDosis2` date DEFAULT NULL,
  `retrasoLimiteDosis` tinyint(4) DEFAULT NULL,
  `completada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `codigoCentro` smallint(6) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `codigoCiudad` smallint(6) DEFAULT NULL,
  `sabadoVacuna` tinyint(1) DEFAULT NULL,
  `domingoVacuna` tinyint(1) DEFAULT NULL,
  `numVacunadosIntervalo` tinyint(4) DEFAULT NULL,
  `horaComienzo` time DEFAULT NULL,
  `horaFinal` time DEFAULT NULL,
  `intervaloMinutos` tinyint(4) DEFAULT NULL,
  `descansoComienzo` time DEFAULT NULL,
  `descansoFinal` time DEFAULT NULL,
  `vacunacionActiva` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`codigoCentro`, `nombre`, `codigoCiudad`, `sabadoVacuna`, `domingoVacuna`, `numVacunadosIntervalo`, `horaComienzo`, `horaFinal`, `intervaloMinutos`, `descansoComienzo`, `descansoFinal`, `vacunacionActiva`) VALUES
(1, 'Hospital Público Bellevue', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Hospital Público Berlin', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Hospital Público Bordeaux', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Hospital Público Bothell', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Hospital Público Calgary', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Hospital Público Cambridge', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Hospital Público Carnation', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Hospital Público Detroit', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Hospital Público Duluth', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Hospital Público Duvall', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Hospital Público Edmonds', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Hospital Público Everett', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Hospital Público Gold Bar', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Hospital Público Index', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Hospital Público Issaquah', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Hospital Público Kenmore', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Hospital Público Kent', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Hospital Público Melbourne', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Hospital Público Memphis', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Hospital Público Minneapolis', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Hospital Público Monroe', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Hospital Público Nevada', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Hospital Público Newport Hills', 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Hospital Público Ottawa', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Hospital Público Portland', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Hospital Público Redmond', 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Hospital Público Renton', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Hospital Público Sammamish', 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Hospital Público San Francisco', 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Hospital Público Seattle', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Hospital Público Snohomish', 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Abbott Northwestern Hospital', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'Northern Nevada Medical Center', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Saint Francis Hospital ', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Hospital Henry Ford', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Hospital Saint-André Chu', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'William Harvey ', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'The Ottawa Hospital Civic Campus', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'EvergreenHealth Primary Care', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Kentfield Hospital', 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Providence Portland', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Peter Lougheed Centre', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Regency Minneapolis', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Hospital Center University De Bordeaux', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'St. Mary\'s Medical Center', 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'The Royal Melbourne Hospital', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Martin Luther Hospital', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'County Everett-Central Clinic', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'The Ottawa Hospital Riverside Campus', 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Coronation Hospital', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Coronation Hospital', 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'Pitlochry Community Hospital', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'Nuffield Health Cambridge Hospital', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'St. Francis Medical Center', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citasvacunacion`
--

CREATE TABLE `citasvacunacion` (
  `codigoCentro` smallint(6) NOT NULL,
  `codigoVacuna` tinyint(4) NOT NULL,
  `codigoPersona` int(11) NOT NULL,
  `fechaDosis1` date DEFAULT NULL,
  `horaDosis1` time DEFAULT NULL,
  `fechaDosis2` date DEFAULT NULL,
  `horaDosis2` time DEFAULT NULL,
  `numCancelaciones` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `codigoCiudad` smallint(6) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`codigoCiudad`, `ciudad`) VALUES
(1, 'Bellevue'),
(2, 'Berlin'),
(3, 'Bordeaux'),
(4, 'Bothell'),
(5, 'Calgary'),
(6, 'Cambridge'),
(7, 'Carnation'),
(8, 'Detroit'),
(9, 'Duluth'),
(10, 'Duvall'),
(11, 'Edmonds'),
(12, 'Everett'),
(13, 'Gold Bar'),
(14, 'Index'),
(15, 'Issaquah'),
(16, 'Kenmore'),
(17, 'Kent'),
(18, 'Melbourne'),
(19, 'Memphis'),
(20, 'Minneapolis'),
(21, 'Monroe'),
(22, 'Nevada'),
(23, 'Newport Hills'),
(24, 'Ottawa'),
(25, 'Portland'),
(26, 'Redmond'),
(27, 'Renton'),
(28, 'Sammamish'),
(29, 'San Francisco'),
(30, 'Seattle'),
(31, 'Snohomish');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `codigo` tinyint(4) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`codigo`, `nombre`, `pais`) VALUES
(1, 'Pfizer, Inc., y BioNTech', 'USA - Alemania'),
(2, 'ModernaTX, Inc.', 'USA'),
(3, 'AstraZeneca y Universidad de Oxford', 'Suecia - Inglaterra'),
(4, 'Janssen', 'USA - Belgica'),
(5, 'Instituto Gamaleya', 'Rusia'),
(6, 'Sinopharm', 'China'),
(7, 'Instituto Biológico de Wuhan', 'China');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivoscentros`
--

CREATE TABLE `festivoscentros` (
  `centro` smallint(6) NOT NULL,
  `fecha` date NOT NULL,
  `festivo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `codigoCiudad` smallint(6) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaRenuncia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`codigo`, `nombre`, `apellido`, `email`, `telefono`, `codigoCiudad`, `fechaNacimiento`, `fechaRenuncia`) VALUES
(1, 'Guy', 'Gilbert', 'guy1@adventure-works.com', '320-555-0195', 21, '1972-05-15', NULL),
(2, 'Kevin', 'Brown', 'kevin0@adventure-works.com', '150-555-0189', 12, '1977-06-03', NULL),
(3, 'Roberto', 'Tamburello', 'roberto0@adventure-works.com', '212-555-0187', 26, '1964-12-13', NULL),
(4, 'Rob', 'Walters', 'rob0@adventure-works.com', '612-555-0100', 20, '1965-01-23', NULL),
(5, 'Thierry', 'D\'Hers', 'thierry0@adventure-works.com', '168-555-0183', 4, '1949-08-29', NULL),
(6, 'David', 'Bradley', 'david0@adventure-works.com', '913-555-0172', 26, '1965-04-19', NULL),
(7, 'JoLynn', 'Dobney', 'jolynn0@adventure-works.com', '903-555-0145', 30, '1946-02-16', NULL),
(8, 'Ruth', 'Ellerbrock', 'ruth0@adventure-works.com', '145-555-0130', 12, '1946-07-06', NULL),
(9, 'Gail', 'Erickson', 'gail0@adventure-works.com', '849-555-0139', 1, '1942-10-29', NULL),
(10, 'Barry', 'Johnson', 'barry0@adventure-works.com', '206-555-0180', 31, '1946-04-27', NULL),
(11, 'Jossef', 'Goldberg', 'jossef0@adventure-works.com', '122-555-0189', 27, '1949-04-11', NULL),
(12, 'Terri', 'Duffy', 'terri0@adventure-works.com', '819-555-0175', 27, '1961-09-01', NULL),
(13, 'Sidney', 'Higa', 'sidney0@adventure-works.com', '424-555-0189', 11, '1946-10-01', NULL),
(14, 'Taylor', 'Maxwell', 'taylor0@adventure-works.com', '508-555-0165', 11, '1946-05-03', NULL),
(15, 'Jeffrey', 'Ford', 'jeffrey0@adventure-works.com', '984-555-0185', 21, '1946-08-12', NULL),
(16, 'Jo', 'Brown', 'jo0@adventure-works.com', '632-555-0129', 10, '1946-11-09', NULL),
(17, 'Doris', 'Hartwig', 'doris0@adventure-works.com', '328-555-0150', 16, '1946-05-06', NULL),
(18, 'John', 'Campbell', 'john0@adventure-works.com', '435-555-0113', 30, '1946-09-08', NULL),
(19, 'Diane', 'Glimp', 'diane0@adventure-works.com', '202-555-0151', 26, '1946-04-30', NULL),
(20, 'Steven', 'Selikoff', 'steven0@adventure-works.com', '925-555-0114', 12, '1967-06-15', NULL),
(21, 'Peter', 'Krebs', 'peter0@adventure-works.com', '913-555-0196', 1, '1972-12-04', NULL),
(22, 'Stuart', 'Munson', 'stuart0@adventure-works.com', '413-555-0136', 1, '1952-10-14', NULL),
(23, 'Greg', 'Alderson', 'greg0@adventure-works.com', '332-555-0150', 1, '1960-11-18', NULL),
(24, 'David', 'Johnson', 'david1@adventure-works.com', '166-555-0162', 16, '1969-12-03', NULL),
(25, 'Zheng', 'Mu', 'zheng0@adventure-works.com', '113-555-0173', 30, '1973-11-26', NULL),
(26, 'Ivo', 'Salmre', 'ivo0@adventure-works.com', '115-555-0179', 21, '1972-02-04', NULL),
(27, 'Paul', 'Komosinski', 'paul0@adventure-works.com', '147-555-0160', 1, '1970-12-15', NULL),
(28, 'Ashvini', 'Sharma', 'ashvini0@adventure-works.com', '656-555-0119', 15, '1967-04-28', NULL),
(29, 'Kendall', 'Keil', 'kendall0@adventure-works.com', '138-555-0128', 30, '1976-06-30', NULL),
(30, 'Paula', 'Barreto de Mattos', 'paula0@adventure-works.com', '523-555-0175', 1, '1966-03-14', NULL),
(31, 'Alejandro', 'McGuel', 'alejandro0@adventure-works.com', '668-555-0130', 30, '1979-01-06', NULL),
(32, 'Garrett', 'Young', 'garrett0@adventure-works.com', '609-555-0179', 31, '1974-09-26', NULL),
(33, 'Jian Shuo', 'Wang', 'jianshuo0@adventure-works.com', '952-555-0178', 21, '1973-08-27', NULL),
(34, 'Susan', 'Eaton', 'susan0@adventure-works.com', '943-555-0196', 27, '1968-03-20', NULL),
(35, 'Vamsi', 'Kuppa', 'vamsi0@adventure-works.com', '937-555-0137', 4, '1967-04-19', NULL),
(36, 'Alice', 'Ciccu', 'alice0@adventure-works.com', '333-555-0173', 31, '1968-02-27', NULL),
(37, 'Simon', 'Rapier', 'simon0@adventure-works.com', '963-555-0134', 10, '1980-06-17', NULL),
(38, 'Jinghao', 'Liu', 'jinghao0@adventure-works.com', '794-555-0159', 7, '1979-03-09', NULL),
(39, 'Michael', 'Hines', 'michael0@adventure-works.com', '218-555-0126', 21, '1974-12-19', NULL),
(40, 'Yvonne', 'McKay', 'yvonne0@adventure-works.com', '286-555-0189', 12, '1979-05-17', NULL),
(41, 'Peng', 'Wu', 'peng0@adventure-works.com', '164-555-0164', 4, '1966-04-19', NULL),
(42, 'Jean', 'Trenary', 'jean0@adventure-works.com', '685-555-0120', 26, '1966-01-13', NULL),
(43, 'Russell', 'Hunter', 'russell0@adventure-works.com', '786-555-0144', 30, '1962-12-27', NULL),
(44, 'A. Scott', 'Wright', 'ascott0@adventure-works.com', '992-555-0194', 23, '1958-10-19', NULL),
(45, 'Fred', 'Northup', 'fred0@adventure-works.com', '818-555-0192', 31, '1979-07-27', NULL),
(46, 'Sariya', 'Harnpadoungsataya', 'sariya0@adventure-works.com', '399-555-0176', 12, '1977-06-21', NULL),
(47, 'Willis', 'Johnson', 'willis0@adventure-works.com', '778-555-0141', 12, '1968-08-18', NULL),
(48, 'Jun', 'Cao', 'jun0@adventure-works.com', '299-555-0113', 26, '1969-08-06', NULL),
(49, 'Christian', 'Kleinerman', 'christian0@adventure-works.com', '846-555-0157', 13, '1966-02-18', NULL),
(50, 'Susan', 'Metters', 'susan1@adventure-works.com', '639-555-0164', 28, '1973-05-03', NULL),
(51, 'Reuben', 'D\'sa', 'reuben0@adventure-works.com', '191-555-0112', 30, '1977-09-27', NULL),
(52, 'Kirk', 'Koenigsbauer', 'kirk0@adventure-works.com', '669-555-0150', 30, '1975-03-10', NULL),
(53, 'David', 'Ortiz', 'david2@adventure-works.com', '712-555-0119', 30, '1975-01-30', NULL),
(54, 'Tengiz', 'Kharatishvili', 'tengiz0@adventure-works.com', '910-555-0116', 15, '1980-05-29', NULL),
(55, 'Hanying', 'Feng', 'hanying0@adventure-works.com', '319-555-0139', 26, '1964-11-16', NULL),
(56, 'Kevin', 'Liu', 'kevin1@adventure-works.com', '714-555-0138', 30, '1976-01-26', NULL),
(57, 'Annik', 'Stahl', 'annik0@adventure-works.com', '499-555-0125', 30, '1967-01-27', NULL),
(58, 'Suroor', 'Fatima', 'suroor0@adventure-works.com', '932-555-0161', 11, '1968-03-28', NULL),
(59, 'Deborah', 'Poe', 'deborah0@adventure-works.com', '602-555-0194', 12, '1966-04-07', NULL),
(60, 'Jim', 'Scardelis', 'jim0@adventure-works.com', '679-555-0113', 11, '1976-10-09', NULL),
(61, 'Carole', 'Poland', 'carole0@adventure-works.com', '688-555-0192', 11, '1973-11-19', NULL),
(62, 'George', 'Li', 'george0@adventure-works.com', '518-555-0199', 7, '1967-05-18', NULL),
(63, 'Gary', 'Yukish', 'gary0@adventure-works.com', '901-555-0125', 11, '1978-06-17', NULL),
(64, 'Cristian', 'Petculescu', 'cristian0@adventure-works.com', '434-555-0133', 30, '1974-05-13', NULL),
(65, 'Raymond', 'Sam', 'raymond0@adventure-works.com', '226-555-0197', 11, '1957-04-02', NULL),
(66, 'Janaina', 'Bueno', 'janaina0@adventure-works.com', '623-555-0155', 15, '1975-03-03', NULL),
(67, 'Bob', 'Hohman', 'bob0@adventure-works.com', '611-555-0116', 4, '1969-09-16', NULL),
(68, 'Shammi', 'Mohamed', 'shammi0@adventure-works.com', '793-555-0179', 1, '1970-11-05', NULL),
(69, 'Linda', 'Moschell', 'linda0@adventure-works.com', '612-555-0171', 1, '1977-08-17', NULL),
(70, 'Mindy', 'Martin', 'mindy0@adventure-works.com', '522-555-0147', 23, '1974-12-22', NULL),
(71, 'Wendy', 'Kahn', 'wendy0@adventure-works.com', '248-555-0134', 28, '1974-11-12', NULL),
(72, 'Kim', 'Ralls', 'kim0@adventure-works.com', '309-555-0129', 4, '1974-06-01', NULL),
(73, 'Sandra', 'Reátegui Alayo', 'sandra0@adventure-works.com', '896-555-0168', 30, '1965-12-06', NULL),
(74, 'Kok-Ho', 'Loh', 'kok-ho0@adventure-works.com', '999-555-0155', 1, '1970-05-30', NULL),
(75, 'Douglas', 'Hite', 'douglas0@adventure-works.com', '808-555-0172', 7, '1975-12-26', NULL),
(76, 'James', 'Kramer', 'james0@adventure-works.com', '119-555-0117', 21, '1974-08-26', NULL),
(77, 'Sean', 'Alexander', 'sean0@adventure-works.com', '420-555-0173', 27, '1966-04-07', NULL),
(78, 'Nitin', 'Mirchandani', 'nitin0@adventure-works.com', '143-555-0173', 28, '1977-01-01', NULL),
(79, 'Diane', 'Margheim', 'diane1@adventure-works.com', '815-555-0138', 12, '1976-07-06', NULL),
(80, 'Rebecca', 'Laszlo', 'rebecca0@adventure-works.com', '314-555-0113', 1, '1967-08-11', NULL),
(81, 'Rajesh', 'Patel', 'rajesh0@adventure-works.com', '373-555-0137', 11, '1967-11-05', NULL),
(82, 'Vidur', 'Luthra', 'vidur0@adventure-works.com', '153-555-0186', 23, '1974-09-02', NULL),
(83, 'John', 'Evans', 'john1@adventure-works.com', '172-555-0130', 30, '1968-07-01', NULL),
(84, 'Nancy', 'Anderson', 'nancy0@adventure-works.com', '970-555-0118', 28, '1978-12-21', NULL),
(85, 'Pilar', 'Ackerman', 'pilar0@adventure-works.com', '577-555-0185', 30, '1962-10-11', NULL),
(86, 'David', 'Yalovsky', 'david3@adventure-works.com', '373-555-0142', 30, '1971-09-04', NULL),
(87, 'David', 'Hamilton', 'david4@adventure-works.com', '986-555-0177', 16, '1973-08-02', NULL),
(88, 'Laura', 'Steele', 'laura0@adventure-works.com', '777-555-0141', 10, '1971-01-26', NULL),
(89, 'Margie', 'Shoop', 'margie0@adventure-works.com', '818-555-0128', 11, '1976-06-20', NULL),
(90, 'Zainal', 'Arifin', 'zainal0@adventure-works.com', '204-555-0115', 15, '1966-03-02', NULL),
(91, 'Lorraine', 'Nay', 'lorraine0@adventure-works.com', '845-555-0184', 11, '1978-12-28', NULL),
(92, 'Fadi', 'Fakhouri', 'fadi0@adventure-works.com', '935-555-0116', 31, '1979-03-19', NULL),
(93, 'Ryan', 'Cornelsen', 'ryan0@adventure-works.com', '208-555-0114', 28, '1962-07-15', NULL),
(94, 'Candy', 'Spoon', 'candy0@adventure-works.com', '920-555-0177', 14, '1966-03-26', NULL),
(95, 'Nuan', 'Yu', 'nuan0@adventure-works.com', '913-555-0184', 1, '1969-04-29', NULL),
(96, 'William', 'Vong', 'william0@adventure-works.com', '148-555-0145', 1, '1971-12-08', NULL),
(97, 'Bjorn', 'Rettig', 'bjorn0@adventure-works.com', '199-555-0117', 30, '1979-12-08', NULL),
(98, 'Scott', 'Gode', 'scott0@adventure-works.com', '391-555-0138', 30, '1977-03-13', NULL),
(99, 'Michael', 'Rothkugel', 'michael1@adventure-works.com', '454-555-0119', 11, '1981-02-04', NULL),
(100, 'Lane', 'Sacksteder', 'lane0@adventure-works.com', '200-555-0117', 30, '1964-10-24', NULL),
(101, 'Pete', 'Male', 'pete0@adventure-works.com', '768-555-0123', 30, '1967-03-07', NULL),
(102, 'Dan', 'Bacon', 'dan0@adventure-works.com', '166-555-0159', 15, '1971-07-28', NULL),
(103, 'David', 'Barber', 'david5@adventure-works.com', '477-555-0132', 23, '1954-07-23', NULL),
(104, 'Lolan', 'Song', 'lolan0@adventure-works.com', '582-555-0178', 11, '1963-02-25', NULL),
(105, 'Paula', 'Nartker', 'paula1@adventure-works.com', '476-555-0119', 30, '1977-03-13', NULL),
(106, 'Mary', 'Gibson', 'mary0@adventure-works.com', '531-555-0183', 12, '1952-10-14', NULL),
(107, 'Mindaugas', 'Krapauskas', 'mindaugas0@adventure-works.com', '637-555-0120', 11, '1968-06-07', NULL),
(108, 'Eric', 'Gubbels', 'eric0@adventure-works.com', '260-555-0119', 11, '1975-02-20', NULL),
(109, 'Ken', 'Sánchez', 'ken0@adventure-works.com', '697-555-0142', 23, '1959-03-02', NULL),
(110, 'Jason', 'Watters', 'jason0@adventure-works.com', '571-555-0179', 1, '1979-01-08', NULL),
(111, 'Mark', 'Harrington', 'mark0@adventure-works.com', '147-555-0179', 15, '1976-05-31', NULL),
(112, 'Janeth', 'Esteves', 'janeth0@adventure-works.com', '540-555-0191', 21, '1962-08-25', NULL),
(113, 'Marc', 'Ingle', 'marc0@adventure-works.com', '234-555-0169', 28, '1976-11-24', NULL),
(114, 'Gigi', 'Matthew', 'gigi0@adventure-works.com', '185-555-0186', 1, '1969-02-21', NULL),
(115, 'Paul', 'Singh', 'paul1@adventure-works.com', '727-555-0112', 1, '1980-12-05', NULL),
(116, 'Frank', 'Lee', 'frank0@adventure-works.com', '158-555-0191', 30, '1977-10-07', NULL),
(117, 'François', 'Ajenstat', 'françois0@adventure-works.com', '785-555-0110', 15, '1965-06-17', NULL),
(118, 'Diane', 'Tibbott', 'diane2@adventure-works.com', '361-555-0180', 16, '1979-09-10', NULL),
(119, 'Jill', 'Williams', 'jill0@adventure-works.com', '510-555-0121', 12, '1969-07-19', NULL),
(120, 'Angela', 'Barbariol', 'angela0@adventure-works.com', '150-555-0194', 11, '1981-07-01', NULL),
(121, 'Matthias', 'Berndt', 'matthias0@adventure-works.com', '139-555-0120', 27, '1963-12-13', NULL),
(122, 'Bryan', 'Baker', 'bryan0@adventure-works.com', '712-555-0113', 21, '1963-09-28', NULL),
(123, 'Jeff', 'Hay', 'jeff0@adventure-works.com', '350-555-0167', 12, '1967-02-16', NULL),
(124, 'Eugene', 'Zabokritski', 'eugene0@adventure-works.com', '241-555-0191', 28, '1977-08-15', NULL),
(125, 'Barbara', 'Decker', 'barbara0@adventure-works.com', '119-555-0192', 28, '1969-08-02', NULL),
(126, 'Chris', 'Preston', 'chris0@adventure-works.com', '200-555-0112', 30, '1979-01-17', NULL),
(127, 'Sean', 'Chai', 'sean1@adventure-works.com', '205-555-0132', 15, '1977-04-12', NULL),
(128, 'Dan', 'Wilson', 'dan1@adventure-works.com', '653-555-0144', 1, '1966-02-06', NULL),
(129, 'Mark', 'McArthur', 'mark1@adventure-works.com', '417-555-0154', 26, '1969-10-26', NULL),
(130, 'Bryan', 'Walton', 'bryan1@adventure-works.com', '935-555-0199', 23, '1974-10-22', NULL),
(131, 'Houman', 'Pournasseh', 'houman0@adventure-works.com', '180-555-0136', 26, '1961-09-30', NULL),
(132, 'Sairaj', 'Uddin', 'sairaj0@adventure-works.com', '500-555-0159', 26, '1978-01-22', NULL),
(133, 'Michiko', 'Osada', 'michiko0@adventure-works.com', '984-555-0148', 28, '1972-07-28', NULL),
(134, 'Benjamin', 'Martin', 'benjamin0@adventure-works.com', '533-555-0111', 31, '1976-02-06', NULL),
(135, 'Cynthia', 'Randall', 'cynthia0@adventure-works.com', '352-555-0138', 16, '1971-09-19', NULL),
(136, 'Kathie', 'Flood', 'kathie0@adventure-works.com', '446-555-0118', 12, '1980-12-02', NULL),
(137, 'Britta', 'Simon', 'britta0@adventure-works.com', '955-555-0169', 11, '1979-10-30', NULL),
(138, 'Brian', 'Lloyd', 'brian0@adventure-works.com', '110-555-0182', 31, '1967-03-14', NULL),
(139, 'David', 'Liu', 'david6@adventure-works.com', '646-555-0185', 13, '1973-08-08', NULL),
(140, 'Laura', 'Norman', 'laura1@adventure-works.com', '615-555-0110', 27, '1966-02-06', NULL),
(141, 'Michael', 'Patten', 'michael2@adventure-works.com', '441-555-0195', 11, '1964-06-03', NULL),
(142, 'Andy', 'Ruth', 'andy0@adventure-works.com', '118-555-0110', 1, '1973-11-20', NULL),
(143, 'Yuhong', 'Li', 'yuhong0@adventure-works.com', '965-555-0155', 30, '1967-05-08', NULL),
(144, 'Robert', 'Rounthwaite', 'robert0@adventure-works.com', '589-555-0147', 30, '1975-04-01', NULL),
(145, 'Andreas', 'Berglund', 'andreas0@adventure-works.com', '181-555-0124', 27, '1979-04-29', NULL),
(146, 'Reed', 'Koch', 'reed0@adventure-works.com', '678-555-0110', 26, '1979-02-09', NULL),
(147, 'Linda', 'Randall', 'linda1@adventure-works.com', '696-555-0157', 30, '1967-11-06', NULL),
(148, 'James', 'Hamilton', 'james1@adventure-works.com', '870-555-0122', 21, '1973-02-07', NULL),
(149, 'Ramesh', 'Meyyappan', 'ramesh0@adventure-works.com', '182-555-0134', 15, '1978-04-14', NULL),
(150, 'Stephanie', 'Conroy', 'stephanie0@adventure-works.com', '594-555-0110', 15, '1974-04-26', NULL),
(151, 'Samantha', 'Smith', 'samantha0@adventure-works.com', '587-555-0114', 1, '1977-12-23', NULL),
(152, 'Tawana', 'Nusbaum', 'tawana0@adventure-works.com', '368-555-0113', 30, '1979-12-12', NULL),
(153, 'Denise', 'Smith', 'denise0@adventure-works.com', '869-555-0119', 16, '1978-08-07', NULL),
(154, 'Hao', 'Chen', 'hao0@adventure-works.com', '806-555-0136', 15, '1967-05-19', NULL),
(155, 'Alex', 'Nayberg', 'alex0@adventure-works.com', '819-555-0198', 23, '1980-05-14', NULL),
(156, 'Eugene', 'Kogan', 'eugene1@adventure-works.com', '173-555-0179', 10, '1966-03-13', NULL),
(157, 'Brandon', 'Heidepriem', 'brandon0@adventure-works.com', '429-555-0137', 26, '1967-02-11', NULL),
(158, 'Dylan', 'Miller', 'dylan0@adventure-works.com', '181-555-0156', 16, '1977-03-27', NULL),
(159, 'Shane', 'Kim', 'shane0@adventure-works.com', '810-555-0178', 1, '1980-06-24', NULL),
(160, 'John', 'Chen', 'john2@adventure-works.com', '201-555-0163', 10, '1976-05-06', NULL),
(161, 'Karen', 'Berge', 'karen0@adventure-works.com', '746-555-0164', 14, '1966-01-25', NULL),
(162, 'Jose', 'Lugo', 'jose0@adventure-works.com', '587-555-0115', 30, '1974-09-01', NULL),
(163, 'Mandar', 'Samant', 'mandar0@adventure-works.com', '140-555-0132', 10, '1976-04-21', NULL),
(164, 'Mikael', 'Sandberg', 'mikael0@adventure-works.com', '309-555-0170', 4, '1974-09-18', NULL),
(165, 'Sameer', 'Tejani', 'sameer0@adventure-works.com', '990-555-0172', 10, '1968-07-27', NULL),
(166, 'Dragan', 'Tomic', 'dragan0@adventure-works.com', '117-555-0185', 13, '1967-03-18', NULL),
(167, 'Carol', 'Philips', 'carol0@adventure-works.com', '609-555-0153', 4, '1978-11-18', NULL),
(168, 'Rob', 'Caron', 'rob1@adventure-works.com', '238-555-0116', 21, '1963-09-05', NULL),
(169, 'Don', 'Hall', 'don0@adventure-works.com', '100-555-0174', 7, '1961-07-14', NULL),
(170, 'Alan', 'Brewer', 'alan0@adventure-works.com', '438-555-0172', 16, '1974-04-30', NULL),
(171, 'David', 'Lawrence', 'david7@adventure-works.com', '118-555-0177', 21, '1975-10-25', NULL),
(172, 'Baris', 'Cetinok', 'baris0@adventure-works.com', '164-555-0114', 30, '1980-11-07', NULL),
(173, 'Michael', 'Ray', 'michael3@adventure-works.com', '156-555-0199', 30, '1979-03-02', NULL),
(174, 'Steve', 'Masters', 'steve0@adventure-works.com', '712-555-0170', 30, '1981-05-07', NULL),
(175, 'Suchitra', 'Mohan', 'suchitra0@adventure-works.com', '753-555-0129', 1, '1977-07-11', NULL),
(176, 'Karen', 'Berg', 'karen1@adventure-works.com', '654-555-0177', 15, '1968-06-19', NULL),
(177, 'Terrence', 'Earls', 'terrence0@adventure-works.com', '110-555-0115', 1, '1975-01-09', NULL),
(178, 'Barbara', 'Moreland', 'barbara1@adventure-works.com', '822-555-0145', 30, '1966-02-04', NULL),
(179, 'Chad', 'Niswonger', 'chad0@adventure-works.com', '559-555-0175', 4, '1980-09-04', NULL),
(180, 'Rostislav', 'Shabalin', 'rostislav0@adventure-works.com', '751-555-0134', 1, '1967-10-15', NULL),
(181, 'Belinda', 'Newman', 'belinda0@adventure-works.com', '319-555-0126', 4, '1959-10-19', NULL),
(182, 'Katie', 'McAskill-White', 'katie0@adventure-works.com', '809-555-0133', 30, '1974-12-20', NULL),
(183, 'Russell', 'King', 'russell1@adventure-works.com', '517-555-0122', 1, '1972-03-14', NULL),
(184, 'Jack', 'Richins', 'jack0@adventure-works.com', '552-555-0111', 21, '1973-07-23', NULL),
(185, 'Andrew', 'Hill', 'andrew0@adventure-works.com', '908-555-0159', 12, '1978-10-08', NULL),
(186, 'Nicole', 'Holliday', 'nicole0@adventure-works.com', '508-555-0129', 30, '1976-05-10', NULL),
(187, 'Frank', 'Miller', 'frank1@adventure-works.com', '167-555-0139', 31, '1961-08-24', NULL),
(188, 'Peter', 'Connelly', 'peter1@adventure-works.com', '310-555-0133', 15, '1970-06-29', NULL),
(189, 'Anibal', 'Sousa', 'anibal0@adventure-works.com', '106-555-0120', 26, '1964-10-06', NULL),
(190, 'Ken', 'Myer', 'ken1@adventure-works.com', '949-555-0174', 12, '1971-06-29', NULL),
(191, 'Grant', 'Culbertson', 'grant0@adventure-works.com', '955-555-0131', 13, '1966-05-18', NULL),
(192, 'Michael', 'Entin', 'michael4@adventure-works.com', '817-555-0186', 26, '1979-07-17', NULL),
(193, 'Lionel', 'Penuchot', 'lionel0@adventure-works.com', '450-555-0152', 30, '1978-04-15', NULL),
(194, 'Thomas', 'Michaels', 'thomas0@adventure-works.com', '278-555-0118', 11, '1976-02-11', NULL),
(195, 'Jimmy', 'Bischoff', 'jimmy0@adventure-works.com', '927-555-0168', 27, '1975-06-05', NULL),
(196, 'Michael', 'Vanderhyde', 'michael5@adventure-works.com', '296-555-0121', 11, '1972-10-19', NULL),
(197, 'Lori', 'Kane', 'lori0@adventure-works.com', '289-555-0196', 26, '1970-08-19', NULL),
(198, 'Arvind', 'Rao', 'arvind0@adventure-works.com', '848-555-0163', 27, '1964-09-21', NULL),
(199, 'Stefen', 'Hesse', 'stefen0@adventure-works.com', '165-555-0113', 10, '1966-01-21', NULL),
(200, 'Hazem', 'Abolrous', 'hazem0@adventure-works.com', '869-555-0125', 16, '1967-11-27', NULL),
(201, 'Janet', 'Sheperdigian', 'janet0@adventure-works.com', '393-555-0186', 28, '1969-04-09', NULL),
(202, 'Elizabeth', 'Keyser', 'elizabeth0@adventure-works.com', '318-555-0137', 17, '1980-02-26', NULL),
(203, 'Terry', 'Eminhizer', 'terry0@adventure-works.com', '138-555-0118', 1, '1976-03-07', NULL),
(204, 'John', 'Frum', 'john3@adventure-works.com', '663-555-0172', 12, '1972-04-24', NULL),
(205, 'Merav', 'Netz', 'merav0@adventure-works.com', '224-555-0187', 30, '1973-06-13', NULL),
(206, 'Brian', 'LaMee', 'brian1@adventure-works.com', '313-555-0196', 12, '1974-09-12', NULL),
(207, 'Kitti', 'Lertpiriyasuwat', 'kitti0@adventure-works.com', '785-555-0132', 30, '1977-07-07', NULL),
(208, 'Jay', 'Adams', 'jay0@adventure-works.com', '407-555-0165', 21, '1966-03-14', NULL),
(209, 'Jan', 'Miksovsky', 'jan0@adventure-works.com', '139-555-0131', 12, '1964-12-16', NULL),
(210, 'Brenda', 'Diaz', 'brenda0@adventure-works.com', '142-555-0139', 30, '1973-03-31', NULL),
(211, 'Andrew', 'Cencini', 'andrew1@adventure-works.com', '207-555-0192', 28, '1978-10-26', NULL),
(212, 'Chris', 'Norred', 'chris1@adventure-works.com', '575-555-0126', 15, '1977-06-26', NULL),
(213, 'Chris', 'Okelberry', 'chris2@adventure-works.com', '315-555-0144', 26, '1976-09-07', NULL),
(214, 'Shelley', 'Dyck', 'shelley0@adventure-works.com', '991-555-0184', 21, '1977-01-08', NULL),
(215, 'Gabe', 'Mares', 'gabe0@adventure-works.com', '310-555-0117', 11, '1978-06-11', NULL),
(216, 'Mike', 'Seamans', 'mike0@adventure-works.com', '927-555-0150', 14, '1969-08-01', NULL),
(217, 'Michael', 'Raheem', 'michael6@adventure-works.com', '330-555-2568', 29, '1975-01-01', NULL),
(218, 'Gary', 'Altman', 'gary1@adventure-works.com', '110-555-0112', 27, '1961-03-21', NULL),
(219, 'Charles', 'Fitzgerald', 'charles0@adventure-works.com', '931-555-0118', 28, '1961-10-03', NULL),
(220, 'Ebru', 'Ersan', 'ebru0@adventure-works.com', '202-555-0187', 28, '1976-10-23', NULL),
(221, 'Sylvester', 'Valdez', 'sylvester0@adventure-works.com', '492-555-0174', 1, '1960-12-13', NULL),
(222, 'Brian', 'Goldstein', 'brian2@adventure-works.com', '730-555-0117', 4, '1961-01-23', NULL),
(223, 'Linda', 'Meisner', 'linda2@adventure-works.com', '916-555-0165', 1, '1960-12-31', NULL),
(224, 'Betsy', 'Stadick', 'betsy0@adventure-works.com', '405-555-0171', 4, '1957-01-17', NULL),
(225, 'Magnus', 'Hedlund', 'magnus0@adventure-works.com', '583-555-0182', 27, '1961-09-27', NULL),
(226, 'Karan', 'Khanna', 'karan0@adventure-works.com', '447-555-0186', 30, '1960-04-07', NULL),
(227, 'Mary', 'Baker', 'mary1@adventure-works.com', '283-555-0185', 30, '1976-10-20', NULL),
(228, 'Kevin', 'Homer', 'kevin2@adventure-works.com', '555-555-0113', 1, '1976-10-20', NULL),
(229, 'Mihail', 'Frintu', 'mihail0@adventure-works.com', '733-555-0128', 11, '1961-04-09', NULL),
(230, 'Bonnie', 'Kearney', 'bonnie0@adventure-works.com', '264-555-0150', 31, '1976-10-11', NULL),
(231, 'Fukiko', 'Ogisu', 'fukiko0@adventure-works.com', '520-555-0177', 1, '1960-12-25', NULL),
(232, 'Hung-Fu', 'Ting', 'hung-fu0@adventure-works.com', '497-555-0181', 28, '1961-11-23', NULL),
(233, 'Gordon', 'Hee', 'gordon0@adventure-works.com', '230-555-0144', 1, '1956-12-30', NULL),
(234, 'Kimberly', 'Zimmerman', 'kimberly0@adventure-works.com', '123-555-0167', 30, '1976-10-14', NULL),
(235, 'Kim', 'Abercrombie', 'kim1@adventure-works.com', '208-555-0114', 7, '1957-01-14', NULL),
(236, 'Sandeep', 'Kaliyath', 'sandeep0@adventure-works.com', '166-555-0156', 28, '1961-01-03', NULL),
(237, 'Prasanna', 'Samarawickrama', 'prasanna0@adventure-works.com', '129-555-0199', 26, '1943-06-01', NULL),
(238, 'Frank', 'Pellow', 'frank2@adventure-works.com', '163-555-0147', 27, '1942-06-13', NULL),
(239, 'Min', 'Su', 'min0@adventure-works.com', '590-555-0152', 1, '1964-10-11', NULL),
(240, 'Eric', 'Brown', 'eric1@adventure-works.com', '680-555-0118', 10, '1957-01-08', NULL),
(241, 'Eric', 'Kurjan', 'eric2@adventure-works.com', '265-555-0195', 27, '1962-10-19', NULL),
(242, 'Pat', 'Coleman', 'pat0@adventure-works.com', '720-555-0158', 13, '1961-01-03', NULL),
(243, 'Maciej', 'Dusza', 'maciej0@adventure-works.com', '237-555-0128', 11, '1945-03-02', NULL),
(244, 'Erin', 'Hagens', 'erin0@adventure-works.com', '842-555-0158', 1, '1961-02-04', NULL),
(245, 'Patrick', 'Wedge', 'patrick0@adventure-works.com', '413-555-0124', 1, '1976-10-11', NULL),
(246, 'Frank', 'Martinez', 'frank3@adventure-works.com', '203-555-0196', 31, '1942-04-03', NULL),
(247, 'Ed', 'Dudenhoefer', 'ed0@adventure-works.com', '919-555-0140', 30, '1961-10-12', NULL),
(248, 'Christopher', 'Hill', 'christopher0@adventure-works.com', '153-555-0166', 4, '1976-11-01', NULL),
(249, 'Patrick', 'Cook', 'patrick1@adventure-works.com', '425-555-0117', 30, '1964-01-24', NULL),
(250, 'Krishna', 'Sunkammurali', 'krishna0@adventure-works.com', '491-555-0183', 11, '1961-10-06', NULL),
(251, 'Lori', 'Penor', 'lori1@adventure-works.com', '295-555-0161', 14, '1960-08-31', NULL),
(252, 'Danielle', 'Tiedt', 'danielle0@adventure-works.com', '500-555-0172', 16, '1976-10-08', NULL),
(253, 'Sootha', 'Charncherngkha', 'sootha0@adventure-works.com', '325-555-0137', 16, '1957-01-05', NULL),
(254, 'Michael', 'Zwilling', 'michael7@adventure-works.com', '582-555-0148', 11, '1963-10-07', NULL),
(255, 'Randy', 'Reeves', 'randy0@adventure-works.com', '961-555-0122', 11, '1960-05-29', NULL),
(256, 'John', 'Kane', 'john4@adventure-works.com', '254-555-0114', 10, '1976-10-29', NULL),
(257, 'Jack', 'Creasey', 'jack1@adventure-works.com', '521-555-0113', 30, '1963-09-30', NULL),
(258, 'Olinda', 'Turner', 'olinda0@adventure-works.com', '306-555-0186', 1, '1960-05-05', NULL),
(259, 'Stuart', 'Macrae', 'stuart1@adventure-works.com', '539-555-0149', 27, '1962-01-17', NULL),
(260, 'Jo', 'Berry', 'jo1@adventure-works.com', '228-555-0159', 14, '1944-05-25', NULL),
(261, 'Ben', 'Miller', 'ben0@adventure-works.com', '151-555-0113', 26, '1963-07-05', NULL),
(262, 'Tom', 'Vande Velde', 'tom0@adventure-works.com', '295-555-0161', 12, '1976-11-01', NULL),
(263, 'Ovidiu', 'Cracium', 'ovidiu0@adventure-works.com', '719-555-0181', 16, '1968-02-18', NULL),
(264, 'Annette', 'Hill', 'annette0@adventure-works.com', '125-555-0196', 26, '1968-03-01', NULL),
(265, 'Janice', 'Galvin', 'janice0@adventure-works.com', '473-555-0117', 26, '1979-06-29', NULL),
(266, 'Reinout', 'Hillmann', 'reinout0@adventure-works.com', '370-555-0163', 1, '1968-02-18', NULL),
(267, 'Michael', 'Sullivan', 'michael8@adventure-works.com', '465-555-0156', 27, '1969-07-17', NULL),
(268, 'Stephen', 'Jiang', 'stephen0@adventure-works.com', '238-555-0197', 26, '1941-11-17', NULL),
(269, 'Wanida', 'Benshoof', 'wanida0@adventure-works.com', '708-555-0141', 28, '1965-04-17', NULL),
(270, 'Sharon', 'Salavaria', 'sharon0@adventure-works.com', '970-555-0138', 27, '1951-06-03', NULL),
(271, 'John', 'Wood', 'john5@adventure-works.com', '486-555-0150', 26, '1968-04-06', NULL),
(272, 'Mary', 'Dempsey', 'mary2@adventure-works.com', '124-555-0114', 1, '1968-03-01', NULL),
(273, 'Brian', 'Welcker', 'brian3@adventure-works.com', '716-555-0127', 15, '1967-07-08', NULL),
(274, 'Sheela', 'Word', 'sheela0@adventure-works.com', '210-555-0193', 28, '1968-03-13', NULL),
(275, 'Michael', 'Blythe', 'michael9@adventure-works.com', '257-555-0154', 8, '1959-01-26', NULL),
(276, 'Linda', 'Mitchell', 'linda3@adventure-works.com', '883-555-0116', 22, '1970-03-30', NULL),
(277, 'Jillian', 'Carson', 'jillian0@adventure-works.com', '517-555-0117', 9, '1952-09-29', NULL),
(278, 'Garrett', 'Vargas', 'garrett1@adventure-works.com', '922-555-0165', 5, '1965-03-07', NULL),
(279, 'Tsvi', 'Reiter', 'tsvi0@adventure-works.com', '664-555-0112', 19, '1964-02-19', NULL),
(280, 'Pamela', 'Ansman-Wolfe', 'pamela0@adventure-works.com', '340-555-0193', 25, '1965-01-06', NULL),
(281, 'Shu', 'Ito', 'shu0@adventure-works.com', '330-555-0120', 29, '1958-04-10', NULL),
(282, 'José', 'Saraiva', 'josé1@adventure-works.com', '185-555-0169', 24, '1954-01-11', NULL),
(283, 'David', 'Campbell', 'david8@adventure-works.com', '740-555-0182', 1, '1964-03-14', NULL),
(284, 'Amy', 'Alberts', 'amy0@adventure-works.com', '775-555-0164', 27, '1947-10-22', NULL),
(285, 'Jae', 'Pak', 'jae0@adventure-works.com', '1 (11) 500 555-0145', 6, '1958-04-18', NULL),
(286, 'Ranjit', 'Varkey Chudukatil', 'ranjit0@adventure-works.com', '1 (11) 500 555-0117', 3, '1965-10-31', NULL),
(287, 'Tete', 'Mensa-Annan', 'tete0@adventure-works.com', '615-555-0153', 6, '1968-02-06', NULL),
(288, 'Syed', 'Abbas', 'syed0@adventure-works.com', '926-555-0182', 4, '1965-02-11', NULL),
(289, 'Rachel', 'Valdez', 'rachel0@adventure-works.com', '1 (11) 500 555-0140', 2, '1965-08-09', NULL),
(290, 'Lynn', 'Tsoflias', 'lynn0@adventure-works.com', '1 (11) 500 555-0190', 18, '1961-04-18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrocentros`
--

CREATE TABLE `registrocentros` (
  `codigoCentro` smallint(6) NOT NULL,
  `nombreContacto` varchar(20) NOT NULL,
  `apellido1Contacto` varchar(25) NOT NULL,
  `apellido2Contacto` varchar(25) NOT NULL,
  `email` varchar(80) NOT NULL,
  `movil` char(9) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fechaModifContrasena` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registrocentros`
--

INSERT INTO `registrocentros` (`codigoCentro`, `nombreContacto`, `apellido1Contacto`, `apellido2Contacto`, `email`, `movil`, `contrasena`, `fechaModifContrasena`) VALUES
(1, 'Bernadette', 'Lafont', 'Macron', 'bernamac@gmail.com', '211111111', 'Contrasena1', '2021-04-04'),
(2, 'Alexander', 'Kross', 'Kirtz', 'alexkross@gmail.com', '222222222', 'contrasena2', '0000-00-00'),
(3, 'Marlene', 'Favier', 'Rouge', 'marlene@gmail.com', '333333333', 'contrasena3', '0000-00-00'),
(4, 'John', 'Ingwell', 'Burton', 'ingwell@gmail.com', '444444444', 'contrasena4', '0000-00-00'),
(5, 'Jill', 'Rock', 'Mansfield', 'rock@gmail.com', '555555555', 'contrasena5', '0000-00-00'),
(6, 'Michael', 'Douglas', 'York', 'michael@gmail.com', '666666666', 'contrasena6', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registropersonas`
--

CREATE TABLE `registropersonas` (
  `codigo` int(11) NOT NULL,
  `contrasena` varchar(20) NOT NULL,
  `fechaModifContrasena` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `codigo` tinyint(4) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `fehaAprobacion` date DEFAULT NULL,
  `suspendida` tinyint(1) DEFAULT NULL,
  `codEmpresa` tinyint(4) DEFAULT NULL,
  `numeroDeDosis` tinyint(4) DEFAULT NULL,
  `limiteMinimoDias` tinyint(4) DEFAULT NULL,
  `limiteMaximoDias` tinyint(4) DEFAULT NULL,
  `efectosSecundarios` varchar(1000) DEFAULT NULL,
  `tipoVacuna` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`codigo`, `nombre`, `fehaAprobacion`, `suspendida`, `codEmpresa`, `numeroDeDosis`, `limiteMinimoDias`, `limiteMaximoDias`, `efectosSecundarios`, `tipoVacuna`) VALUES
(3, 'AZD1222', '2021-01-29', NULL, 3, 2, 42, NULL, 'dolor de cabeza, náuseas, escalofríos, cansancio, dolores musculares y malestar', 'Vector viral no replicante'),
(4, 'NJ-78436735', '2021-03-11', NULL, 4, 1, NULL, NULL, 'cansancio, dolor de cabeza, dolor muscular, escalofríos, fiebre y náuseas.', 'Vector viral no replicante'),
(5, 'Gam-Covid-Vac', NULL, NULL, 5, 2, 21, NULL, 'enrojecimiento, hinchazón o dolor alrededor del pinchazo, fatiga, fiebre, dolor de cabeza y musculares', 'Vector viral no replicante'),
(6, 'BBIBP-CorV', '2021-12-21', 1, 6, NULL, NULL, NULL, 'brazo, cansancio y síntomas de gripe', NULL),
(7, 'Vero', '2021-02-26', 1, 7, NULL, NULL, NULL, 'brazo, cansancio y síntomas de gripe', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartavacunacion`
--
ALTER TABLE `cartavacunacion`
  ADD PRIMARY KEY (`codigoPersona`,`numVacuna`),
  ADD KEY `FK_cartaVacunacion_Centros` (`codigoCentro`),
  ADD KEY `FK_cartaVacunacion_Vacunas` (`codigoVacuna`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`codigoCentro`),
  ADD KEY `FK_ciudad` (`codigoCiudad`);

--
-- Indices de la tabla `citasvacunacion`
--
ALTER TABLE `citasvacunacion`
  ADD PRIMARY KEY (`codigoCentro`,`codigoVacuna`,`codigoPersona`),
  ADD KEY `FK_citasPersonas` (`codigoPersona`),
  ADD KEY `FK_citasVacunas` (`codigoVacuna`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`codigoCiudad`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `festivoscentros`
--
ALTER TABLE `festivoscentros`
  ADD PRIMARY KEY (`centro`,`fecha`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_vacunasCiudad` (`codigoCiudad`);

--
-- Indices de la tabla `registrocentros`
--
ALTER TABLE `registrocentros`
  ADD PRIMARY KEY (`codigoCentro`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `registropersonas`
--
ALTER TABLE `registropersonas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `FK_vacunasEmpresas` (`codEmpresa`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cartavacunacion`
--
ALTER TABLE `cartavacunacion`
  ADD CONSTRAINT `FK_cartaVacunacion_Centros` FOREIGN KEY (`codigoCentro`) REFERENCES `centros` (`codigoCentro`),
  ADD CONSTRAINT `FK_cartaVacunacion_Personas` FOREIGN KEY (`codigoPersona`) REFERENCES `personas` (`codigo`),
  ADD CONSTRAINT `FK_cartaVacunacion_Vacunas` FOREIGN KEY (`codigoVacuna`) REFERENCES `vacunas` (`codigo`);

--
-- Filtros para la tabla `centros`
--
ALTER TABLE `centros`
  ADD CONSTRAINT `FK_ciudad` FOREIGN KEY (`codigoCiudad`) REFERENCES `ciudades` (`codigoCiudad`);

--
-- Filtros para la tabla `citasvacunacion`
--
ALTER TABLE `citasvacunacion`
  ADD CONSTRAINT `FK_citasCentro` FOREIGN KEY (`codigoCentro`) REFERENCES `centros` (`codigoCentro`),
  ADD CONSTRAINT `FK_citasPersonas` FOREIGN KEY (`codigoPersona`) REFERENCES `personas` (`codigo`),
  ADD CONSTRAINT `FK_citasVacunas` FOREIGN KEY (`codigoVacuna`) REFERENCES `vacunas` (`codigo`);

--
-- Filtros para la tabla `festivoscentros`
--
ALTER TABLE `festivoscentros`
  ADD CONSTRAINT `FK_festivosCentros` FOREIGN KEY (`centro`) REFERENCES `centros` (`codigoCentro`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `FK_vacunasCiudad` FOREIGN KEY (`codigoCiudad`) REFERENCES `ciudades` (`codigoCiudad`);

--
-- Filtros para la tabla `registrocentros`
--
ALTER TABLE `registrocentros`
  ADD CONSTRAINT `FK_registroCentros` FOREIGN KEY (`codigoCentro`) REFERENCES `centros` (`codigoCentro`);

--
-- Filtros para la tabla `registropersonas`
--
ALTER TABLE `registropersonas`
  ADD CONSTRAINT `FK_registroPersonas` FOREIGN KEY (`codigo`) REFERENCES `personas` (`codigo`);

--
-- Filtros para la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD CONSTRAINT `FK_vacunasEmpresas` FOREIGN KEY (`codEmpresa`) REFERENCES `empresas` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
