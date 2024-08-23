-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2023 a las 16:44:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `egresados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auxiliar`
--

CREATE TABLE `auxiliar` (
  `id` varchar(300) DEFAULT NULL,
  `MES` varchar(300) DEFAULT NULL,
  `NOMBRES` varchar(300) DEFAULT NULL,
  `TipoDocumentoID` varchar(300) DEFAULT NULL,
  `NumeroDocumento` varchar(300) DEFAULT NULL,
  `LugarResidenciaID` varchar(300) DEFAULT NULL,
  `DireccionResidencia` varchar(300) DEFAULT NULL,
  `CorreoElectronico` varchar(300) DEFAULT NULL,
  `TelefonoCelular` varchar(300) DEFAULT NULL,
  `OcupacionActual` varchar(300) DEFAULT NULL,
  `VinculacionPatrocinio` varchar(300) DEFAULT NULL,
  `CentroFormacion` varchar(300) DEFAULT NULL,
  `Ficha` varchar(300) DEFAULT NULL,
  `FechaCertificacion` varchar(300) DEFAULT NULL,
  `EstudiosAdicionales` varchar(300) DEFAULT NULL,
  `FechaUltimaLlamada` varchar(300) DEFAULT NULL,
  `NumeroFijo` varchar(300) DEFAULT NULL,
  `Genero` varchar(300) DEFAULT NULL,
  `OtroTelefonoContacto` varchar(300) DEFAULT NULL,
  `ProgramaFormacionSENAID` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresados`
--

CREATE TABLE `egresados` (
  `id` int(11) NOT NULL,
  `MES` varchar(255) DEFAULT NULL,
  `NOMBRES` varchar(255) NOT NULL,
  `TipoDocumentoID` enum('CC','TI','PASAPORTE') DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `LugarResidenciaID` int(11) DEFAULT NULL,
  `DireccionResidencia` varchar(255) DEFAULT NULL,
  `CorreoElectronico` varchar(255) DEFAULT NULL,
  `TelefonoCelular` varchar(20) DEFAULT NULL,
  `OcupacionActual` enum('Trabaja','Estudia','Otro') DEFAULT NULL,
  `VinculacionPatrocinio` enum('Si','No') DEFAULT NULL,
  `CentroFormacion` varchar(255) DEFAULT NULL,
  `Ficha` varchar(10) DEFAULT NULL,
  `FechaCertificacion` date DEFAULT NULL,
  `EstudiosAdicionales` varchar(255) DEFAULT NULL,
  `FechaUltimaLlamada` date DEFAULT NULL,
  `NumeroFijo` varchar(20) DEFAULT NULL,
  `Genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `OtroTelefonoContacto` varchar(20) DEFAULT NULL,
  `ProgramaFormacionSENAID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `egresados`
--

INSERT INTO `egresados` (`id`, `MES`, `NOMBRES`, `TipoDocumentoID`, `NumeroDocumento`, `LugarResidenciaID`, `DireccionResidencia`, `CorreoElectronico`, `TelefonoCelular`, `OcupacionActual`, `VinculacionPatrocinio`, `CentroFormacion`, `Ficha`, `FechaCertificacion`, `EstudiosAdicionales`, `FechaUltimaLlamada`, `NumeroFijo`, `Genero`, `OtroTelefonoContacto`, `ProgramaFormacionSENAID`) VALUES
(1, 'Julio', 'Javier López', 'CC', '999000111', 10, 'Carrera 234', 'javier@example.com', '3136543210', 'Trabaja', 'Si', 'Centro 10', '54321', '2022-12-20', 'Psicología', '2023-04-25', '987234567', 'Masculino', '222333666', NULL),
(2, 'Agosto', 'Isabel Ramírez', 'TI', '888999000', 11, 'Avenida 567', 'isabel@example.com', '3129876543', 'Estudia', 'No', 'Centro 11', '98765', '2022-11-15', 'Ingeniería Industrial', '2023-03-10', '987765432', 'Femenino', '333444555', NULL),
(3, 'Septiembre', 'Miguel González', 'TI', '555444333', 12, 'Calle 890', 'miguel@example.com', '3151234567', 'Trabaja', 'No', 'Centro 12', '45678', '2022-10-10', 'Administración de Negocios', '2023-02-15', '987098765', 'Masculino', '222555666', NULL),
(4, 'Octubre', 'Luisa Martínez', 'PASAPORTE', '444555666', 13, 'Carrera 123', 'luisa@example.com', '3166543210', 'Otro', 'Si', 'Centro 13', '34567', '2022-09-05', 'Derecho', '2023-01-20', '987234567', 'Femenino', '333666777', NULL),
(5, 'Noviembre', 'Carlos Gómez', 'PASAPORTE', '333444555', 14, 'Avenida 456', 'carlos@example.com', '3109876543', 'Estudia', 'Si', 'Centro 14', '23456', '2022-08-01', 'Medicina', '2022-12-05', '987765432', 'Masculino', '222444555', NULL),
(6, 'Diciembre', 'Ana Pérez', 'TI', '222333444', 15, 'Calle 789', 'ana@example.com', '3181234567', 'Trabaja', 'No', 'Centro 15', '12345', '2022-07-10', 'Contabilidad', '2022-11-15', '987098765', 'Femenino', '333777888', NULL),
(7, 'Enero', 'Sofía Vargas', 'PASAPORTE', '111222333', 16, 'Carrera 345', 'sofia@example.com', '3206543210', 'Estudia', 'Si', 'Centro 16', '87654', '2022-06-15', 'Diseño Industrial', '2022-10-20', '987765432', 'Femenino', '222333444', NULL),
(8, 'Febrero', 'Pedro González', 'TI', '000111222', 17, 'Calle 456', 'pedro@example.com', '3131234567', 'Otro', 'Si', 'Centro 17', '76543', '2022-05-20', 'Ingeniería Química', '2022-09-25', '987234567', 'Masculino', '222444666', NULL),
(9, 'Marzo', 'Luisa Martínez', 'CC', '777888999', 18, 'Avenida 567', 'luisa@example.com', '3156543210', 'Trabaja', 'No', 'Centro 18', '65432', '2022-04-15', 'Comunicación Social', '2022-08-30', '987098765', 'Femenino', '333777000', NULL),
(10, NULL, 'Juan Perez', 'PASAPORTE', '123456789', 1, 'Calle 123', 'juan@example.com', '1234567890', 'Trabaja', 'Si', 'Centro 1', '12345', '2023-10-30', 'Estudios 1', '2023-10-30', '987654321', 'Masculino', '9876543210', NULL),
(11, NULL, 'Maria Rodriguez', 'PASAPORTE', '987654321', 2, 'Avenida 456', 'maria@example.com', '9876543210', 'Estudia', 'No', 'Centro 2', '54321', '2023-10-29', 'Estudios 2', '2023-10-29', '123456789', 'Femenino', '1234567890', NULL),
(12, NULL, 'Carlos Gonzalez', 'TI', '456789123', 3, 'Plaza 789', 'carlos@example.com', '7891234560', 'Otro', 'Si', 'Centro 3', '67890', '2023-10-28', 'Estudios 3', '2023-10-28', '234567891', 'Masculino', '2345678910', NULL),
(43, 'Diciembre', 'Luisa Martínez', 'PASAPORTE', '555666777', 3, 'Calle de la Esperanza 789', 'luisa@email.com', '5556667770', 'Otro', 'Si', 'Centro C', 'F789', '2023-03-25', 'Arquitectura', '2023-08-12', '333444555', 'Femenino', '456789012', 3),
(44, 'Enero', 'Carlos Rodríguez', 'CC', '987654321', 1, 'Av. Libertad 101', 'carlos@email.com', '9876543201', 'Trabaja', 'No', 'Centro A', 'F101', '2023-04-30', 'Diseño Gráfico', '2023-07-05', '789012345', 'Masculino', '567890123', 1),
(45, 'Febrero', 'Laura González', 'CC', '2468101214', 2, 'Carrera 15 #25-30', 'laura@email.com', '3141592653', 'Estudia', 'No', 'Centro B', 'F314', '2023-05-10', 'Marketing', '2023-06-20', '1618033988', 'Femenino', '1123581321', 2),
(46, 'Marzo', 'Gabriel Pérez', 'TI', '1357911131', 3, 'Avenida Principal 789', 'gabriel@email.com', '2718281828', 'Trabaja', 'Si', 'Centro C', 'F271', '2023-06-18', 'Ingeniería Civil', '2023-05-15', '1414213562', 'Masculino', '2357111317', 3),
(47, 'Abril', 'María Sánchez', 'CC', '1012141618', 1, 'Calle 50 #60-70', 'maria@email.com', '1234876495', 'Estudia', 'No', 'Centro A', 'F1234', '2023-07-22', 'Biología', '2023-04-12', '9876543210', 'Femenino', '987654321', 1),
(48, 'Mayo', 'Andrés Ramírez', 'PASAPORTE', '1614121816', 2, 'Carrera 30 #40-50', 'andres@email.com', '9876543210', 'Otro', 'Si', 'Centro B', 'F987', '2023-08-05', 'Comunicación Social', '2023-03-30', '8765432109', 'Masculino', '876543210', 2),
(49, 'Junio', 'Sofía Hernández', 'CC', '1928374655', 3, 'Calle 80 #90-100', 'sofia@email.com', '5678901234', 'Trabaja', 'Si', 'Centro C', 'F567', '2023-09-10', 'Psicología', '2023-02-28', '7654321098', 'Femenino', '6543210987', 3),
(50, 'Julio', 'Diego Gómez', 'TI', '2837465566', 1, 'Avenida 10 #15-20', 'diego@email.com', '8765432109', 'Estudia', 'No', 'Centro A', 'F890', '2023-10-15', 'Medicina', '2023-01-25', '6543210987', 'Masculino', '5432109876', 1),
(51, 'Agosto', 'Valentina Castro', 'CC', '3746558899', 2, 'Carrera 25 #30-40', 'valentina@email.com', '9876543210', 'Otro', 'Si', 'Centro B', 'F901', '2023-11-20', 'Economía', '2022-12-20', '5432109876', 'Femenino', '4321098765', 2),
(52, 'Septiembre', 'Mateo Vargas', 'PASAPORTE', '4865533344', 3, 'Calle 70 #80-90', 'mateo@email.com', '6543210987', 'Trabaja', 'No', 'Centro C', 'F234', '2023-12-05', 'Derecho', '2022-11-15', '4321098765', 'Masculino', '3210987654', 3),
(53, 'Noviembre', 'Ana Martínez', 'CC', '5678901234', 2, 'Carrera 25 #35-45', 'ana.martinez@email.com', '9876543210', 'Estudia', 'No', 'Centro B', 'F5678', '2023-11-30', 'Diseño Industrial', '2023-01-20', '8765432109', 'Femenino', '2345678901', 2),
(54, 'Diciembre', 'Martín Herrera', 'PASAPORTE', '4321098765', 3, 'Avenida 20 #30-40', 'martin@email.com', '1234567890', 'Otro', 'Si', 'Centro C', 'F4321', '2023-12-18', 'Ingeniería Eléctrica', '2023-02-15', '9876543210', 'Masculino', '3456789012', 3),
(55, 'Enero', 'Alejandro Rodríguez', 'CC', '1234567890', 1, 'Calle Principal 123', 'alejandro@email.com', '1234567890', 'Trabaja', 'Si', 'Centro A', 'F123', '2023-01-01', 'Ingeniería', '2023-10-20', '987654321', 'Masculino', '567890123', 1),
(56, 'Febrero', 'María García', 'CC', '2345678901', 2, 'Avenida 456', 'maria@email.com', '2345678901', 'Estudia', 'No', 'Centro B', 'F234', '2023-02-02', 'Administración', '2023-09-18', '876543210', 'Femenino', '678901234', 2),
(57, 'Marzo', 'Javier Martínez', 'TI', '3456789012', 3, 'Carrera 789', 'javier@email.com', '3456789012', 'Otro', 'Si', 'Centro C', 'F345', '2023-03-03', 'Psicología', '2023-08-15', '765432109', 'Masculino', '789012345', 3),
(58, 'Junio', 'Luis Pérez', 'CC', '4567890123', 1, 'Calle 789', 'luis@email.com', '4567890123', 'Trabaja', 'No', 'Centro A', 'F456', '2023-06-06', 'Arquitectura', '2023-05-05', '654321098', 'Masculino', '901234567', 1),
(59, 'Julio', 'Carolina López', 'PASAPORTE', '5678901234', 2, 'Avenida Principal 987', 'carolina@email.com', '5678901234', 'Estudia', 'Si', 'Centro B', 'F567', '2023-07-07', 'Diseño Gráfico', '2023-04-15', '543210987', 'Femenino', '012345678', 2),
(60, 'Agosto', 'Diego Ramírez', 'CC', '6789012345', 3, 'Carrera 654', 'diego@email.com', '6789012345', 'Otro', 'No', 'Centro C', 'F678', '2023-08-08', 'Marketing', '2023-03-10', '432109876', 'Masculino', '123456789', 3),
(61, 'Septiembre', 'Isabel Gutiérrez', 'TI', '7890123456', 1, 'Calle 456', 'isabel@email.com', '7890123456', 'Estudia', 'Si', 'Centro A', 'F789', '2023-09-09', 'Ingeniería Industrial', '2023-02-28', '321098765', 'Femenino', '234567890', 1),
(62, 'Octubre', 'Andrés Hernández', 'CC', '8901234567', 2, 'Avenida 123', 'andres@email.com', '8901234567', 'Trabaja', 'No', 'Centro B', 'F890', '2023-10-10', 'Administración de Empresas', '2023-01-25', '210987654', 'Masculino', '345678901', 2),
(63, 'Noviembre', 'Daniela Díaz', 'CC', '9012345678', 3, 'Carrera 321', 'daniela@email.com', '9012345678', 'Otro', 'Si', 'Centro C', 'F901', '2023-11-11', 'Medicina', '2023-07-15', '109876543', 'Femenino', '456789012', 3),
(64, 'Marzo', 'Sofía Navarro', 'CC', '3456789012', 1, 'Calle 123', 'sofia@email.com', '3456789012', 'Trabaja', 'No', 'Centro A', 'F3456', '2024-03-03', 'Biología', '2023-12-20', '765432109', 'Femenino', '890123456', 1),
(65, 'Abril', 'Eduardo Medina', 'TI', '4567890123', 2, 'Avenida 456', 'eduardo@email.com', '4567890123', 'Estudia', 'Si', 'Centro B', 'F4567', '2024-04-04', 'Ingeniería Civil', '2023-11-15', '654321098', 'Masculino', '901234567', 2),
(66, 'Mayo', 'Carla Soto', 'CC', '5678901234', 3, 'Carrera 789', 'carla@email.com', '5678901234', 'Otro', 'Si', 'Centro C', 'F5678', '2024-05-05', 'Marketing', '2023-10-12', '543210987', 'Femenino', '012345678', 3),
(67, 'Diciembre', 'Roberto Silva', 'CC', '9123456789', 1, 'Calle 789', 'roberto@email.com', '9123456789', 'Trabaja', 'Si', 'Centro A', 'F912', '2023-12-12', 'Derecho', '2023-06-30', '098765432', 'Masculino', '567890123', 1),
(68, 'Enero', 'Laura Castro', 'PASAPORTE', '1234567890', 2, 'Avenida 456', 'laura@email.com', '1234567890', 'Estudia', 'No', 'Centro B', 'F1234', '2024-01-01', 'Psicología', '2023-08-05', '987654321', 'Femenino', '678901234', 2),
(69, 'Febrero', 'Ricardo Morales', 'CC', '2345678901', 3, 'Carrera 321', 'ricardo@email.com', '2345678901', 'Otro', 'Si', 'Centro C', 'F2345', '2024-02-02', 'Comunicación Social', '2023-10-10', '876543210', 'Masculino', '789012345', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `ID` int(11) NOT NULL,
  `HoraInicio` datetime DEFAULT NULL,
  `HoraFinalizacion` datetime DEFAULT NULL,
  `CorreoElectronico` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `HoraUltimaModificacion` datetime DEFAULT NULL,
  `AutorizacionDatosPersonales` varchar(255) DEFAULT NULL,
  `NombresApellidosCompletos` varchar(255) DEFAULT NULL,
  `TipoIdentificacion` varchar(50) DEFAULT NULL,
  `NumeroDocumentoIdentificacion` varchar(20) DEFAULT NULL,
  `CorreoElectronicoPersonal` varchar(255) DEFAULT NULL,
  `NumeroCelular` varchar(20) DEFAULT NULL,
  `NumeroFijo` varchar(20) DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL,
  `AnioCertificacion` int(11) DEFAULT NULL,
  `UltimoNivelFormacionSenacursado` varchar(255) DEFAULT NULL,
  `ProgramaFormacionCentroDiseño` varchar(255) DEFAULT NULL,
  `AlternativaEtapaProductiva` varchar(255) DEFAULT NULL,
  `NombreEmpresaEtapaProductiva` varchar(255) DEFAULT NULL,
  `ContinuaLaborandoEmpresaEtapaProductiva` varchar(3) DEFAULT NULL,
  `ReconocimientoFormacionAcademica` varchar(3) DEFAULT NULL,
  `ContinuacionFormacionComplementariaSenacursado` varchar(3) DEFAULT NULL,
  `NivelFormacionActual` varchar(255) DEFAULT NULL,
  `SeEncuentraActualmenteEstudiando` varchar(3) DEFAULT NULL,
  `UniversidadProgramaEstudia` varchar(255) DEFAULT NULL,
  `TituloSenaoportunidades` varchar(3) DEFAULT NULL,
  `PertinenciaProgramaFormacionCampoLaboral` varchar(255) DEFAULT NULL,
  `ValorAspectosProgramaFormacion` varchar(255) DEFAULT NULL,
  `MejorasProgramaFormacionSenacursado` varchar(255) DEFAULT NULL,
  `OcupacionActual` varchar(255) DEFAULT NULL,
  `SalarioMensual` varchar(255) DEFAULT NULL,
  `CanalBusquedaEmpleo` varchar(255) DEFAULT NULL,
  `CargoEmpresaTrabajo` varchar(255) DEFAULT NULL,
  `NombreEmpresaTrabajo` varchar(255) DEFAULT NULL,
  `ExperienciaLaboral` varchar(255) DEFAULT NULL,
  `ConocimientoServiciosPortafolioSenacursado` varchar(255) DEFAULT NULL,
  `ExpectativasOfrecimientoCentroDiseño` varchar(255) DEFAULT NULL,
  `ParticipacionActividadesSenadespuesCertificar` varchar(3) DEFAULT NULL,
  `ServiciosDeseaRecibirInformacion` varchar(255) DEFAULT NULL,
  `ComentariosSugerencias` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` varchar(300) DEFAULT NULL,
  `MES` varchar(300) DEFAULT NULL,
  `NOMBRES` varchar(300) DEFAULT NULL,
  `TipoDocumentoID` varchar(300) DEFAULT NULL,
  `NumeroDocumento` varchar(300) DEFAULT NULL,
  `LugarResidenciaID` varchar(300) DEFAULT NULL,
  `DireccionResidencia` varchar(300) DEFAULT NULL,
  `CorreoElectronico` varchar(300) DEFAULT NULL,
  `TelefonoCelular` varchar(300) DEFAULT NULL,
  `OcupacionActual` varchar(300) DEFAULT NULL,
  `VinculacionPatrocinio` varchar(300) DEFAULT NULL,
  `CentroFormacion` varchar(300) DEFAULT NULL,
  `Ficha` varchar(300) DEFAULT NULL,
  `FechaCertificacion` varchar(300) DEFAULT NULL,
  `EstudiosAdicionales` varchar(300) DEFAULT NULL,
  `FechaUltimaLlamada` varchar(300) DEFAULT NULL,
  `NumeroFijo` varchar(300) DEFAULT NULL,
  `Genero` varchar(300) DEFAULT NULL,
  `OtroTelefonoContacto` varchar(300) DEFAULT NULL,
  `ProgramaFormacionSENAID` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_sofia`
--

CREATE TABLE `info_sofia` (
  `Ficha` int(11) DEFAULT NULL,
  `DenominacionPrograma` varchar(255) DEFAULT NULL,
  `ConvenioMediaTecnica` varchar(3) DEFAULT NULL,
  `EntidadCertifica` varchar(255) DEFAULT NULL,
  `RegistroAcademico` varchar(20) DEFAULT NULL,
  `FechaCertificacion` date DEFAULT NULL,
  `EstadoCertificado` varchar(255) DEFAULT NULL,
  `TipoDocumento` varchar(10) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `NombreAprendiz` varchar(255) DEFAULT NULL,
  `LugarResidencia` varchar(255) DEFAULT NULL,
  `CorreoElectronico` varchar(255) DEFAULT NULL,
  `TelPrincipal` varchar(20) DEFAULT NULL,
  `TelAlterno` varchar(20) DEFAULT NULL,
  `TelCelular` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_sofia`
--

INSERT INTO `info_sofia` (`Ficha`, `DenominacionPrograma`, `ConvenioMediaTecnica`, `EntidadCertifica`, `RegistroAcademico`, `FechaCertificacion`, `EstadoCertificado`, `TipoDocumento`, `NumeroDocumento`, `NombreAprendiz`, `LugarResidencia`, `CorreoElectronico`, `TelPrincipal`, `TelAlterno`, `TelCelular`) VALUES
(1907299, 'DESARROLLO Y ADAPTACIÓN DE PROTESIS Y ORTESIS', 'NO', 'SENA', '61814000', '2023-09-05', 'Certificado en SOFIA Plus', 'CC', '109878690', 'LUIS FERNANDO RODRIGUEZ BARRAGAN', 'BOGOTÁ', 'luiskennyvolcom@gmail.com', '577175551', NULL, '3208680822');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugarresidencia`
--

CREATE TABLE `lugarresidencia` (
  `id` int(11) NOT NULL,
  `Ciudad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lugarresidencia`
--

INSERT INTO `lugarresidencia` (`id`, `Ciudad`) VALUES
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali'),
(4, 'Barranquilla'),
(5, 'Cartagena'),
(6, 'Bucaramanga'),
(7, 'Pereira'),
(8, 'Manizales'),
(9, 'Santa Marta'),
(10, 'Villavicencio'),
(11, 'Cúcuta'),
(12, 'Ibagué'),
(13, 'Pasto'),
(14, 'Neiva'),
(15, 'Valledupar'),
(16, 'Montería'),
(17, 'Popayán'),
(18, 'Armenia'),
(19, 'Tunja'),
(20, 'Sincelejo'),
(21, 'Palmira'),
(22, 'Buenaventura'),
(23, 'Soacha'),
(24, 'Itagüí'),
(25, 'Florencia'),
(26, 'Girardot'),
(27, 'Zipaquirá'),
(28, 'Rionegro'),
(29, 'Envigado'),
(30, 'Fusagasugá'),
(31, 'Tuluá'),
(32, 'Buga'),
(33, 'Tumaco'),
(34, 'Soledad'),
(35, 'Malambo'),
(36, 'Floridablanca'),
(37, 'Palmira'),
(38, 'Montería'),
(39, 'Santa Marta'),
(40, 'Valledupar'),
(41, 'Giron'),
(42, 'Caucasia'),
(43, 'Chía'),
(44, 'Pitalito'),
(45, 'La Dorada'),
(46, 'Turbo'),
(47, 'Magangué'),
(48, 'Quibdó'),
(49, 'Riohacha'),
(50, 'Ipiales'),
(51, 'Yopal'),
(52, 'Maicao'),
(53, 'Arauca'),
(54, 'Quindío (Departamento)'),
(55, 'Guaviare (Departamento)'),
(56, 'Guainía (Departamento)'),
(57, 'Vaupés (Departamento)'),
(58, 'Amazonas (Departamento)'),
(59, 'Vichada (Departamento)'),
(60, 'Guajira (Departamento)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaformacionsena`
--

CREATE TABLE `programaformacionsena` (
  `id` int(11) NOT NULL,
  `NombrePrograma` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programaformacionsena`
--

INSERT INTO `programaformacionsena` (`id`, `NombrePrograma`) VALUES
(1, 'Tecnología en Diseño de Productos Industriales'),
(2, 'Tecnología en Desarrollo Creativo de Productos para la Industria'),
(3, 'Tecnología en Diseño de Sistemas Mecánicos'),
(4, 'Tecnología en Diseño de Moldes para transformación de Plásticos'),
(5, 'Tecnología en Diseño de Troqueles'),
(6, 'Tecnología Diseño e Integración de Automatismos Mecatrónicos'),
(7, 'Tecnología  Análisis y Desarrollo de Sistemas de Información - Ahora - Tecnología  Análisis y Desarrollo de Software'),
(8, 'Tecnología  en Desarrollo y Adaptación de Prótesis y Ortesis'),
(9, 'Tecnología en Aseguramiento Metrológico Industrial'),
(10, 'Técnico en Sistemas'),
(11, 'Técnico en Programación de Software'),
(12, 'Técnico en Mantenimiento de Automatismos Industriales'),
(13, 'Técnico en Dibujo Mecánico'),
(14, 'Técnico en Control de la Seguridad Digital'),
(15, 'Técnico en Modelado Digital de Productos para la Industria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('Administrador','Editor','Visualizador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`, `rol`) VALUES
(1, 'PAUL', '123', 'Editor'),
(2, 'JHONATAN', '123', 'Visualizador'),
(3, 'ADMIN', '123', 'Administrador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresados`
--
ALTER TABLE `egresados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ProgramaFormacionSENAID` (`ProgramaFormacionSENAID`),
  ADD KEY `LugarResidenciaID` (`LugarResidenciaID`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `lugarresidencia`
--
ALTER TABLE `lugarresidencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programaformacionsena`
--
ALTER TABLE `programaformacionsena`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresados`
--
ALTER TABLE `egresados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lugarresidencia`
--
ALTER TABLE `lugarresidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `programaformacionsena`
--
ALTER TABLE `programaformacionsena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `egresados`
--
ALTER TABLE `egresados`
  ADD CONSTRAINT `egresados_ibfk_1` FOREIGN KEY (`ProgramaFormacionSENAID`) REFERENCES `programaformacionsena` (`id`),
  ADD CONSTRAINT `egresados_ibfk_4` FOREIGN KEY (`LugarResidenciaID`) REFERENCES `lugarresidencia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
