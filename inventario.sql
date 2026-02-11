-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2026 a las 20:20:46
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
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` bigint(20) NOT NULL,
  `nombre_admin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`id_admin`, `nombre_admin`) VALUES
(1234567895, 'estefania'),
(5419674141, 'albaro'),
(5689745632, 'tomas'),
(5698741237, 'sergio'),
(6162746125, 'daniel'),
(6196756149, 'esteban'),
(6419764164, 'johan'),
(6451659386, 'diego'),
(7894561235, 'juan'),
(8529637415, 'johnny'),
(9156791464, 'sebastian'),
(9619475465, 'andres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

CREATE TABLE `herramientas` (
  `id_herr` varchar(4) NOT NULL,
  `ids_herr` int(11) DEFAULT NULL,
  `nombre_herr` varchar(30) DEFAULT NULL,
  `tipo_herr` varchar(20) DEFAULT NULL,
  `disponibilidad` enum('SI','NO') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`id_herr`, `ids_herr`, `nombre_herr`, `tipo_herr`, `disponibilidad`) VALUES
('A001', 1, 'destornillador', 'de mano', 'SI'),
('A002', 2, 'martillo', 'de mano', 'SI'),
('A003', 3, 'lijadora', 'estatica', 'SI'),
('B005', 5, 'Tornillos', 'de mano', 'SI'),
('C001', 6, 'Cintas', 'de mano', 'SI'),
('C002', 7, 'Cuter', 'de mano', 'SI'),
('D003', 8, 'J.Llaves', 'de mano', 'NO'),
('D004', 9, 'P.Hidraulica', 'estatico', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_sistema`
--

CREATE TABLE `info_sistema` (
  `id_sistemas` int(11) NOT NULL,
  `id_herr` varchar(4) DEFAULT NULL,
  `id_admin` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `info_sistema`
--

INSERT INTO `info_sistema` (`id_sistemas`, `id_herr`, `id_admin`, `id_usuario`) VALUES
(1, 'A001', 7894561235, 1028784596),
(2, 'A003', 8529637415, 5964785215),
(3, 'C001', 5698741237, 1000554488),
(4, 'C002', 5689745632, 4587963214),
(5, 'D003', 1234567895, 8754213698);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `nombre_usuario` varchar(20) DEFAULT NULL,
  `apellido_usuario` varchar(20) DEFAULT NULL,
  `cargo_usuario` varchar(20) DEFAULT NULL,
  `fecha_apartado` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellido_usuario`, `cargo_usuario`, `fecha_apartado`, `fecha_entrega`) VALUES
(1000554488, 'naomi', 'clavijo', 'profesora', '2021-05-14', '2022-02-28'),
(1028784596, 'kevin', 'melo', 'docente', '2025-05-05', '2025-06-05'),
(4587963214, 'camila', 'rodriguez', 'estudiante', '2024-03-10', '2024-04-01'),
(5964785215, 'johan', 'ruiz', 'coordinador', '2024-09-15', '2027-12-20'),
(8754213698, 'andres', 'torres', 'ingeniero', '2023-08-15', '2023-09-15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `herramientas`
--
ALTER TABLE `herramientas`
  ADD PRIMARY KEY (`id_herr`),
  ADD UNIQUE KEY `ids_herr` (`ids_herr`);

--
-- Indices de la tabla `info_sistema`
--
ALTER TABLE `info_sistema`
  ADD PRIMARY KEY (`id_sistemas`),
  ADD KEY `id_herr` (`id_herr`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `info_sistema`
--
ALTER TABLE `info_sistema`
  ADD CONSTRAINT `info_sistema_ibfk_1` FOREIGN KEY (`id_herr`) REFERENCES `herramientas` (`id_herr`),
  ADD CONSTRAINT `info_sistema_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `administradores` (`id_admin`),
  ADD CONSTRAINT `info_sistema_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
