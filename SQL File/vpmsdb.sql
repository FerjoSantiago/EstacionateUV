-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2020 a las 21:15:17
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
-- Base de datos: `vpmsdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 7898799798, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2019-07-05 05:38:23'),
(2, 'Ferjo', 'ferjo117', 2283046394, 'ferjotulley@gmail.com', '12345', '2020-03-18 03:21:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategory`
--

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL,
  `VehicleCat` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblcategory`
--

INSERT INTO `tblcategory` (`ID`, `VehicleCat`, `CreationDate`) VALUES
(1, 'Four Wheeler Vehicle', '2019-07-05 11:06:50'),
(2, 'Two Wheeler Vehicle', '2019-07-05 11:07:09'),
(4, 'Bicycles', '2019-07-07 11:31:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblvehicle`
--

CREATE TABLE `tblvehicle` (
  `ID` int(10) NOT NULL,
  `ParkingNumber` varchar(120) DEFAULT NULL,
  `VehicleCategory` varchar(120) NOT NULL,
  `VehicleCompanyname` varchar(120) DEFAULT NULL,
  `RegistrationNumber` varchar(120) DEFAULT NULL,
  `OwnerName` varchar(120) DEFAULT NULL,
  `OwnerContactNumber` bigint(10) DEFAULT NULL,
  `InTime` timestamp NULL DEFAULT current_timestamp(),
  `OutTime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ParkingCharge` varchar(120) NOT NULL,
  `Remark` mediumtext NOT NULL,
  `Status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblvehicle`
--

INSERT INTO `tblvehicle` (`ID`, `ParkingNumber`, `VehicleCategory`, `VehicleCompanyname`, `RegistrationNumber`, `OwnerName`, `OwnerContactNumber`, `InTime`, `OutTime`, `ParkingCharge`, `Remark`, `Status`) VALUES
(1, '521796069', 'Two Wheeler Category', 'Hyundai', 'DEL-678787', 'Rakesh Chandra', 8956232528, '2019-07-05 05:58:38', '2019-07-07 11:09:36', '50 Rs', 'NA', 'Out'),
(2, '469052796', 'Two Wheeler Vehicle', 'Activa', 'DEL-895623', 'Pankaj', 8989898989, '2019-07-06 08:58:38', '2019-07-07 11:09:33', '35 Rs.', 'NA', 'Out'),
(3, '734465023', 'Four Wheeler Vehicle', 'Hondacity', 'DEL-562389', 'Avinash', 7845123697, '2019-07-06 08:58:38', '2019-07-06 08:59:36', '50 Rs.', 'Vehicle Out', 'Out'),
(4, '432190880', 'Two Wheeler Vehicle', 'Hero Honda', 'DEL-451236', 'Harish', 2132654447, '2019-07-06 08:58:38', '2019-07-06 09:53:35', '35 Rs.', 'Vehicle Out', 'Out'),
(5, '323009894', 'Two Wheeler Vehicle', 'Activa', 'DEL-55776', 'Abhi', 4654654654, '2019-07-06 08:58:38', '2019-07-06 08:59:24', '', '', ''),
(6, '522578915', 'Two Wheeler Vehicle', 'Hondacity', 'DEL-895623', 'Mahesh', 7978999879, '2019-07-06 08:58:38', NULL, '', '', ''),
(7, '917725207', 'Two Wheeler Vehicle', 'Honda', 'DL 1c RT2323', 'ABC', 1234567890, '2019-07-07 11:03:05', NULL, '', '', ''),
(8, '486258836', 'Two Wheeler Vehicle', 'Honda Activa', 'DL 1C TY2322', 'Test User', 1234567890, '2019-07-07 11:32:02', '2019-07-07 11:32:42', '40', 'Vehicle Out', 'Out');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tblvehicle`
--
ALTER TABLE `tblvehicle`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tblvehicle`
--
ALTER TABLE `tblvehicle`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
