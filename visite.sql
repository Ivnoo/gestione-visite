-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2023 at 06:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visite`
--
CREATE DATABASE IF NOT EXISTS `visite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `visite`;

-- --------------------------------------------------------

--
-- Table structure for table `classi`
--

CREATE TABLE `classi` (
  `id` int(255) NOT NULL,
  `classe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classi`
--

INSERT INTO `classi` (`id`, `classe`) VALUES
(5, '1EN'),
(3, '1MB'),
(2, '4EC'),
(4, '4TA'),
(1, '5IB');

-- --------------------------------------------------------

--
-- Table structure for table `pacchetti`
--

CREATE TABLE `pacchetti` (
  `id` int(255) NOT NULL,
  `destinazione` varchar(255) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `prezzo_totale` float NOT NULL,
  `anticipo` float NOT NULL,
  `documenti` varchar(255) NOT NULL,
  `mezzo` varchar(255) NOT NULL,
  `sistemazione` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pacchetti`
--

INSERT INTO `pacchetti` (`id`, `destinazione`, `data_inizio`, `data_fine`, `prezzo_totale`, `anticipo`, `documenti`, `mezzo`, `sistemazione`) VALUES
(2, 'Napoli Centrale', '2023-04-14', '2023-04-17', 275.54, 165, 'carta identità, passaporto, patente', 'treno, pullman', 'B&B Napoli Centrale'),
(3, 'Roma Capitale', '2023-02-02', '2023-02-23', 543, 250, 'carta identità, patente', 'aereo, pullman', 'Albergo BellaRoma'),
(4, 'Canada, America', '2023-05-01', '2023-05-27', 1398, 500, 'passaporto, carta identità, documento vaccinale', 'aereo, pullman privato', 'Albergo CentralStreet');

-- --------------------------------------------------------

--
-- Table structure for table `pagamenti`
--

CREATE TABLE `pagamenti` (
  `id` int(255) NOT NULL,
  `id_studente` int(255) DEFAULT NULL,
  `id_gita` int(255) DEFAULT NULL,
  `stato_anticipo` enum('Pagato','Non Pagato') NOT NULL,
  `stato_saldo` enum('Pagato','Non Pagato') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pagamenti`
--

INSERT INTO `pagamenti` (`id`, `id_studente`, `id_gita`, `stato_anticipo`, `stato_saldo`) VALUES
(1, 1, 1, 'Pagato', 'Pagato'),
(2, 6, 2, 'Non Pagato', 'Non Pagato'),
(3, 5, 1, 'Pagato', 'Non Pagato');

-- --------------------------------------------------------

--
-- Table structure for table `studenti`
--

CREATE TABLE `studenti` (
  `id` int(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `stato_assicurazione` enum('Pagato','Non Pagato') NOT NULL,
  `id_classe` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studenti`
--

INSERT INTO `studenti` (`id`, `nome`, `cognome`, `email`, `telefono`, `stato_assicurazione`, `id_classe`) VALUES
(1, 'Ivan', 'Comi', 'comi.ivan.studente@itispaleocapa.it', '3349506807', 'Non Pagato', 1),
(5, 'Nicolò', 'Invernizzi', 'invernizzi.nicolo.studente@itispaleocapa.it', '324354353465', 'Pagato', 1),
(6, 'Mattia', 'Capelli', 'capelli.mattia.studente@itispaleocapa.it', '54634234535', 'Pagato', 1),
(7, 'Lorenzo', 'Verdi', 'verdi.lorenzo.studente@itispaleocapa.it', '2213542543', 'Non Pagato', 2),
(8, 'Giovanni', 'Rossi', 'rossi.giovanni.studente@itispaleocapa.it', '4235345435', 'Pagato', 2),
(9, 'Matteo', 'Arancioni', 'arancioni.matteo.studente@itispaleocapa.it', '2353454545', 'Non Pagato', 4),
(10, 'Giorgio', 'Blu', 'blu.giorgio.studente@itispaleocapa.it', '325463567', 'Non Pagato', 5),
(11, 'Martina', 'Verde', 'verde.martina.studente@itispaleocapa.it', '2345456365', 'Pagato', 5),
(12, 'Lorenzo', 'Verdone', 'verdone.lorenzo.studente@itispaleocapa.it', '2736472648', 'Non Pagato', 3),
(13, 'Samir', 'Colombo', 'colombo.samir.studente@itispaleocapa.it', '45672325464', 'Non Pagato', 3);

-- --------------------------------------------------------

--
-- Table structure for table `visita`
--

CREATE TABLE `visita` (
  `id` int(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `stato` enum('Prenotata','Saldata','Attivata') NOT NULL,
  `id_classe` int(255) DEFAULT NULL,
  `id_pacchetto` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visita`
--

INSERT INTO `visita` (`id`, `nome`, `descrizione`, `stato`, `id_classe`, `id_pacchetto`) VALUES
(1, 'Gita a Napoli', 'Visita nei bellissimi posti che Napoli offre', 'Prenotata', 1, 2),
(2, 'Gita a Roma', '', 'Prenotata', 3, 3),
(4, 'Gita in Canada', '', 'Prenotata', 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classe_2` (`classe`),
  ADD KEY `classe` (`classe`);

--
-- Indexes for table `pacchetti`
--
ALTER TABLE `pacchetti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_studente` (`id_studente`,`id_gita`),
  ADD KEY `id_gita` (`id_gita`);

--
-- Indexes for table `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classe_id` (`id_classe`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Indexes for table `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_pacchetto` (`id_pacchetto`),
  ADD KEY `nome` (`nome`),
  ADD KEY `stato` (`stato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classi`
--
ALTER TABLE `classi`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pacchetti`
--
ALTER TABLE `pacchetti`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pagamenti`
--
ALTER TABLE `pagamenti`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studenti`
--
ALTER TABLE `studenti`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `visita`
--
ALTER TABLE `visita`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pagamenti`
--
ALTER TABLE `pagamenti`
  ADD CONSTRAINT `pagamenti_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamenti_ibfk_2` FOREIGN KEY (`id_gita`) REFERENCES `visita` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`id_pacchetto`) REFERENCES `pacchetti` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
