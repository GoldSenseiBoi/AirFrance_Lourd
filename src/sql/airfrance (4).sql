-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 avr. 2024 à 11:39
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `airfrance`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` int(11) NOT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MotDePasse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `Prenom`, `Email`, `MotDePasse`) VALUES
(1, 'Arnaud', 'a@gmail.com', '123');

-- --------------------------------------------------------

--
-- Structure de la table `aeroports`
--

CREATE TABLE `aeroports` (
  `ID_Aeroport` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Localisation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `aeroports`
--

INSERT INTO `aeroports` (`ID_Aeroport`, `Nom`, `Localisation`) VALUES
(1, 'Aéroport de Paris-Charles de Gaulle (CDG)', 'FRANCE'),
(2, 'Aéroport de Paris-Orly (ORY)', 'FRANCE'),
(3, 'Aéroport de Lyon-Saint Exupéry (LYS)', 'FRANCE'),
(4, 'Aéroport de Nice-Côte dAzur (NCE)', 'FRANCE'),
(5, 'Aéroport de Toulouse-Blagnac (TLS)', 'FRANCE'),
(6, 'Aéroport de Marseille-Provence (MRS)', 'FRANCE'),
(7, 'Aéroport de Bordeaux-Mérignac (BOD)', 'FRANCE'),
(8, 'Aéroport de Nantes Atlantique (NTE)', 'FRANCE'),
(9, 'Aéroport de Strasbourg-Entzheim (SXB)', 'FRANCE'),
(10, 'Aéroport de Genève (GVA)', 'SUISSE'),
(11, 'Aéroport de Amsterdam-Schiphol (AMS)', 'Pays-Bas'),
(12, 'Aéroport de New York-JFK (JFK)', 'États-Unis'),
(13, 'Aéroport de Los Angeles International (LAX)', 'États-Unis'),
(14, 'Aéroport de Londres-Heathrow (LHR)', 'Royaume-Uni'),
(15, 'Aéroport de Tokyo-Narita (NRT)', 'Japon');

-- --------------------------------------------------------

--
-- Structure de la table `avions`
--

CREATE TABLE `avions` (
  `ID_Avion` int(11) NOT NULL,
  `Modele` varchar(255) DEFAULT NULL,
  `NombrePlaces` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `avions`
--

INSERT INTO `avions` (`ID_Avion`, `Modele`, `NombrePlaces`) VALUES
(1, 'Airbus A380-1000 \"SkyGiant\"', 600),
(2, 'Boeing 797 \"DreamBird\"', 550),
(3, 'Embraer E999 \"SkyCruiser\"', 200),
(4, 'Bombardier B1000 \"StarJet\"', 300),
(5, 'Cessna C888 \"SkyHawk\"', 10),
(6, 'Gulfstream G7000 \"StarLux\"', 20),
(7, 'Airbus A550 \"SkyWing\"', 400),
(8, 'Boeing 899X \"SuperEagle\"', 500),
(9, 'Lockheed Martin L1000 \"SkyMaster\"', 450),
(10, 'Bombardier BD1000 \"DreamStar\"', 350),
(11, 'AIRIBRA', 5);

-- --------------------------------------------------------

--
-- Structure de la table `membresequipage`
--

CREATE TABLE `membresequipage` (
  `ID_MembreEquipage` int(11) NOT NULL,
  `ID_Personne` int(11) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `ID_Vol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membresequipage`
--

INSERT INTO `membresequipage` (`ID_MembreEquipage`, `ID_Personne`, `Role`, `DateEmbauche`, `ID_Vol`) VALUES
(6, 11, 'Pilote de chasse', '2023-01-15', 2),
(7, 12, 'Copilote', '2023-01-20', 2),
(8, 13, 'Hôtesse de lair', '2023-02-10', 2),
(9, 14, 'Steward', '2023-02-10', 2),
(11, 60, 'aa', '1990-01-01', 4);

-- --------------------------------------------------------

--
-- Structure de la table `passagers`
--

CREATE TABLE `passagers` (
  `ID_Passager` int(11) NOT NULL,
  `ID_Personne` int(11) DEFAULT NULL,
  `NumPasseport` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `passagers`
--

INSERT INTO `passagers` (`ID_Passager`, `ID_Personne`, `NumPasseport`) VALUES
(1, 1, 'AB123456'),
(4, 4, 'GH901234'),
(5, 5, 'IJ567890'),
(6, 6, 'KL123456'),
(7, 7, 'MN789012'),
(8, 8, 'OP345678'),
(9, 9, 'QR901234'),
(10, 10, 'ST567890'),
(17, 36, 'FG652378'),
(18, 37, 'AZ123456'),
(19, 38, 'KZ120987'),
(20, 39, 'HG123456'),
(21, 40, 'G2R23323'),
(22, 41, 'KQ543625'),
(24, 43, 'WQ567890'),
(25, 44, 'AQ678901'),
(26, 45, 'FFA55'),
(27, 46, 'AG5788788'),
(28, 47, 'AQ12443'),
(29, 48, 'AS876543'),
(30, 49, 'AYFF7676'),
(32, 51, 'AQ123456'),
(33, 52, 'AZ123456'),
(35, 54, 'AAAA'),
(36, 55, 'BBBB'),
(37, 56, 'CCC'),
(38, 57, 'DDDD');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `ID_Personne` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`ID_Personne`, `Nom`, `Prenom`, `DateNaissance`, `adresse`, `email`, `telephone`) VALUES
(1, 'Dupont', 'Jean', '1990-01-01', '123 Rue Example, Ville, Pays', 'jean.dupont@example.com', '0612345678'),
(4, 'Leroy', 'Isabella', '1978-03-20', '321 Rue Demo, Ville, Pays', 'isabelle.leroy@example.com', '0612345680'),
(5, 'Roux', 'Antoine', '1989-11-05', '654 Avenue Exemple, Ville, Pays', 'antoine.roux@example.com', '0712345681'),
(6, 'Fournier', 'Marie', '1983-07-12', '987 Boulevard Test, Ville, Pays', 'marie.fournier@example.com', '0612345682'),
(7, 'Moreau', 'Thomas', '1980-09-18', '741 Rue Échantillon, Ville, Pays', 'thomas.moreau@example.com', '0712345683'),
(8, 'Girard', 'Laura', '1975-12-25', '159 Avenue Démo, Ville, Pays', 'laura.girard@example.com', '0612345684'),
(9, 'Bonnet', 'Julien', '1992-08-08', '852 Boulevard Exemple, Ville, Pays', 'julien.bonnet@example.com', '0712345685'),
(10, 'Lambert', 'Camille', '1987-04-14', '369 Rue Test, Ville, Pays', 'camille.lambert@example.com', '0612345686'),
(11, 'Rousselle', 'Nicolas', '1981-06-30', '258 Avenue Échantillon, Ville, Pays', 'nicolas.rousseau@example.com', '0712345687'),
(12, 'Clement', 'Manon', '1979-02-28', '147 Boulevard Démo, Ville, Pays', 'manon.clement@example.com', '0612345688'),
(13, 'Guerin', 'Alexandre', '1984-10-10', '963 Rue Exemple, Ville, Pays', 'alexandre.guerin@example.com', '0712345689'),
(14, 'Garnier', 'Chloé', '1986-12-03', '852 Avenue Test, Ville, Pays', 'chloe.garnier@example.com', '0612345690'),
(15, 'Chevalier', 'Emma', '1988-07-19', '741 Boulevard Échantillon, Ville, Pays', 'emma.chevalier@example.com', '0712345691'),
(16, 'Boyer', 'Lucas', '1976-05-06', '369 Rue Démo, Ville, Pays', 'lucas.boyer@example.com', '0612345692'),
(17, 'Andre', 'Julie', '1983-09-23', '258 Avenue Exemple, Ville, Pays', 'julie.andre@example.com', '0712345693'),
(18, 'Caron', 'Paul', '1989-03-15', '147 Boulevard Test, Ville, Pays', 'paul.caron@example.com', '0612345694'),
(19, 'Marchand', 'Inès', '1977-11-11', '963 Rue Échantillon, Ville, Pays', 'ines.marchand@example.com', '0712345695'),
(20, 'Leclerc', 'Hugo', '1982-01-09', '852 Boulevard Démo, Ville, Pays', 'hugo.leclerc@example.com', '0612345696'),
(21, 'Sanchez', 'Louise', '1985-04-27', '741 Avenue Exemple, Ville, Pays', 'louise.sanchez@example.com', '0712345697'),
(22, 'Hubert', 'Maxime', '1978-06-13', '369 Rue Test, Ville, Pays', 'maxime.hubert@example.com', '0612345698'),
(23, 'Leclercq', 'Juliette', '1991-02-20', '258 Avenue Démo, Ville, Pays', 'juliette.leclercq@example.com', '0712345699'),
(24, 'Guillaume', 'Arthur', '1980-08-18', '147 Boulevard Exemple, Ville, Pays', 'arthur.guillaume@example.com', '0612345700'),
(25, 'Meunier', 'Clara', '1986-10-05', '963 Rue Test, Ville, Pays', 'clara.meunier@example.com', '0712345701'),
(26, 'Henry', 'Louis', '1979-12-28', '852 Boulevard Échantillon, Ville, Pays', 'louis.henry@example.com', '0612345702'),
(27, 'Renard', 'Eva', '1984-02-14', '741 Avenue Démo, Ville, Pays', 'eva.renard@example.com', '0712345703'),
(28, 'Duval', 'Mathis', '1981-05-31', '369 Rue Exemple, Ville, Pays', 'mathis.duval@example.com', '0612345704'),
(29, 'Lopez', 'Charlotte', '1976-09-17', '258 Avenue Test, Ville, Pays', 'charlotte.lopez@example.com', '0712345705'),
(36, 'Raveloson', 'Axel', '2003-01-01', '47 rue des Lilas, Paris', 'axel@gmail.com', '0625673254'),
(37, 'Jinwoo', 'Sung', '1997-09-01', '12 rue du coco, Paris, France', 'a@gmail.com', '0754678721'),
(38, 'Zoldick', 'Kirua', '2012-07-12', '12 rue du chateau, Paris, France', 'zoldickkirua@gmail.com', '0643215612'),
(39, 'zachary', 'charles', '1990-01-01', '65 rue des petites, Paris', 'f@gmail.com', '0654122222'),
(40, 'zdfisd', 'sdfsdf', '1981-01-01', '23 rue de deter', 'gf@gmail.com', '01272228721'),
(41, 'Bristol', 'Joe', '1990-01-01', '21 rue armin, Mantes', 'ff@gmail.com', '0782828762'),
(43, 'dz', 'ds', '1990-01-01', '12 rue des chiots', 'a@gmail.com', '0657452356'),
(44, 'blabla', 'car', '1990-01-01', '57 rue des ptis', 'a@gmail.com', '0167676767'),
(45, 'df', 'dfds', '1990-01-01', '12 rue acacia', 'zaaze', '9008089'),
(46, 'Lin', 'Franckuuuu', '1990-01-01', '12 rue des chinois', 'linfranck@gmail.com', '0621271827'),
(47, 'hgg', 'ghjg', '1990-01-01', '23 rue des ptits', 'a@mail.com', '0654372887'),
(48, 'sfsdf', 'CHinois de la cailler', '1990-01-01', '12 rue des cer', 'a@gmail.com', '0765465478'),
(49, 'dsqdsq', 'suddd', '1990-01-01', 'ssdsdsq', 'sqdsqdsq', '9070700'),
(51, 'zdfsdf', 'sdfsdf', '1990-01-01', '12 rue de', 'a@gmail.com', '0675767577'),
(52, 'zeze', 'zaezae', '1990-01-01', '12 rue des cocotiers', 'A@gmail.com', '0615267823'),
(54, 'qsq', 'qsq', '1990-01-01', 'AAAA', 'AAAA', 'AAAA'),
(55, 'BBBB', 'BBBB', '1990-01-01', 'BBBB', 'BBBB', 'BBBB'),
(56, 'CCC', 'CCC', '1990-01-01', 'CCC', 'CCC', 'CCC'),
(57, 'DDDD', 'DDDD', '1990-01-01', 'DDD', 'DDDD', 'DDD'),
(60, 'QA', 'QA', '1990-01-01', '23 rue des brr', 'aa', 'aa');

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `ID_Reservation` int(11) NOT NULL,
  `ID_Passager` int(11) DEFAULT NULL,
  `ID_Vol` int(11) DEFAULT NULL,
  `DateReservation` date DEFAULT NULL,
  `SiegeAttribue` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`ID_Reservation`, `ID_Passager`, `ID_Vol`, `DateReservation`, `SiegeAttribue`) VALUES
(7, 1, 2, '2024-03-07', 'A1'),
(10, 6, 2, '2024-03-05', 'K3'),
(11, 17, 4, '2024-03-07', 'J6'),
(27, 4, 4, '2024-04-04', 'H1'),
(28, 7, 9, '2024-01-03', 'H2');

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

CREATE TABLE `vols` (
  `ID_Vol` int(11) NOT NULL,
  `NumeroVol` varchar(10) DEFAULT NULL,
  `DateDepart` date DEFAULT NULL,
  `HeureDepart` time DEFAULT NULL,
  `AeroportDepart` int(11) DEFAULT NULL,
  `DateArrivee` date DEFAULT NULL,
  `HeureArrivee` time DEFAULT NULL,
  `AeroportArrivee` int(11) DEFAULT NULL,
  `Avion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vols`
--

INSERT INTO `vols` (`ID_Vol`, `NumeroVol`, `DateDepart`, `HeureDepart`, `AeroportDepart`, `DateArrivee`, `HeureArrivee`, `AeroportArrivee`, `Avion`) VALUES
(2, 'AF123', '2024-03-10', '08:00:00', 1, '2024-03-10', '10:00:00', 1, 1),
(3, 'BA456', '2024-03-11', '09:35:00', 1, '2024-03-11', '11:00:00', 1, 1),
(4, 'LH789', '2024-03-12', '10:00:00', 3, '2024-03-12', '12:00:00', 3, 3),
(5, 'EK012', '2024-03-13', '11:00:00', 1, '2024-03-13', '13:00:00', 2, 4),
(7, 'JJ123', '2024-03-10', '10:30:00', 1, '2024-03-10', '09:00:00', 1, 1),
(8, 'GH675', '2024-03-01', '09:00:00', 7, '2024-03-01', '14:00:00', 13, 8),
(9, 'SQ789', '2024-01-01', '08:00:00', 6, '2024-01-01', '09:17:00', 9, 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Index pour la table `aeroports`
--
ALTER TABLE `aeroports`
  ADD PRIMARY KEY (`ID_Aeroport`);

--
-- Index pour la table `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`ID_Avion`);

--
-- Index pour la table `membresequipage`
--
ALTER TABLE `membresequipage`
  ADD PRIMARY KEY (`ID_MembreEquipage`),
  ADD KEY `ID_Personne` (`ID_Personne`),
  ADD KEY `fk_id_vol` (`ID_Vol`);

--
-- Index pour la table `passagers`
--
ALTER TABLE `passagers`
  ADD PRIMARY KEY (`ID_Passager`),
  ADD KEY `ID_Personne` (`ID_Personne`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`ID_Personne`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ID_Reservation`),
  ADD KEY `ID_Passager` (`ID_Passager`),
  ADD KEY `ID_Vol` (`ID_Vol`);

--
-- Index pour la table `vols`
--
ALTER TABLE `vols`
  ADD PRIMARY KEY (`ID_Vol`),
  ADD KEY `AeroportDepart` (`AeroportDepart`),
  ADD KEY `AeroportArrivee` (`AeroportArrivee`),
  ADD KEY `Avion` (`Avion`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_Admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `aeroports`
--
ALTER TABLE `aeroports`
  MODIFY `ID_Aeroport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `avions`
--
ALTER TABLE `avions`
  MODIFY `ID_Avion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `membresequipage`
--
ALTER TABLE `membresequipage`
  MODIFY `ID_MembreEquipage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `passagers`
--
ALTER TABLE `passagers`
  MODIFY `ID_Passager` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `ID_Personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ID_Reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `vols`
--
ALTER TABLE `vols`
  MODIFY `ID_Vol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `membresequipage`
--
ALTER TABLE `membresequipage`
  ADD CONSTRAINT `fk_id_vol` FOREIGN KEY (`ID_Vol`) REFERENCES `vols` (`ID_Vol`),
  ADD CONSTRAINT `membresequipage_ibfk_1` FOREIGN KEY (`ID_Personne`) REFERENCES `personne` (`ID_Personne`);

--
-- Contraintes pour la table `passagers`
--
ALTER TABLE `passagers`
  ADD CONSTRAINT `passagers_ibfk_1` FOREIGN KEY (`ID_Personne`) REFERENCES `personne` (`ID_Personne`);

--
-- Contraintes pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`ID_Passager`) REFERENCES `passagers` (`ID_Passager`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`ID_Vol`) REFERENCES `vols` (`ID_Vol`);

--
-- Contraintes pour la table `vols`
--
ALTER TABLE `vols`
  ADD CONSTRAINT `vols_ibfk_1` FOREIGN KEY (`AeroportDepart`) REFERENCES `aeroports` (`ID_Aeroport`),
  ADD CONSTRAINT `vols_ibfk_2` FOREIGN KEY (`AeroportArrivee`) REFERENCES `aeroports` (`ID_Aeroport`),
  ADD CONSTRAINT `vols_ibfk_3` FOREIGN KEY (`Avion`) REFERENCES `avions` (`ID_Avion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
