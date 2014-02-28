-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 28 Février 2014 à 08:34
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pmf`
--

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `idEvaluation` int(11) NOT NULL AUTO_INCREMENT,
  `Utilisateur_idUtilisateurNoteur` int(11) NOT NULL,
  `Utilisateur_idUtilisateurNoté` int(11) DEFAULT NULL,
  `Formation_idFormation` int(11) DEFAULT NULL,
  `dateEvaluation` date DEFAULT NULL,
  `note` float DEFAULT NULL,
  `commentaire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEvaluation`),
  KEY `fk_Utilisateur_has_Formation_Formation2_idx` (`Formation_idFormation`),
  KEY `fk_Utilisateur_has_Formation_Utilisateur1_idx` (`Utilisateur_idUtilisateurNoteur`),
  KEY `fk_Evaluation_Utilisateur1_idx` (`Utilisateur_idUtilisateurNoté`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `idFormation` int(11) NOT NULL AUTO_INCREMENT,
  `nomFormation` varchar(45) DEFAULT NULL,
  `lieu` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `nbHeure` int(11) DEFAULT NULL,
  `preRequis` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFormation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE IF NOT EXISTS `inscription` (
  `idInscription` int(11) NOT NULL AUTO_INCREMENT,
  `Utilisateur_idUtilisateur` int(11) NOT NULL,
  `Formation_idFormation` int(11) NOT NULL,
  `dateInscription` date DEFAULT NULL,
  PRIMARY KEY (`idInscription`),
  KEY `fk_Utilisateur_has_Formation_Formation1_idx` (`Formation_idFormation`),
  KEY `fk_Utilisateur_has_Formation_Utilisateur_idx` (`Utilisateur_idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `typeUtilisateur` varchar(45) DEFAULT NULL,
  `adresseMail` varchar(45) DEFAULT NULL,
  `motDePasse` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `siret` varchar(45) DEFAULT NULL,
  `raisonSociale` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `typeUtilisateur`, `adresseMail`, `motDePasse`, `telephone`, `siret`, `raisonSociale`) VALUES
(1, 's', 'a@a.fr', 'toto', NULL, NULL, NULL),
(2, 's', 'b@b.fr', 'titi', NULL, NULL, NULL);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `fk_Evaluation_Formation` FOREIGN KEY (`Formation_idFormation`) REFERENCES `formation` (`idFormation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evaluation_UtilisateurNote` FOREIGN KEY (`Utilisateur_idUtilisateurNoté`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Evaluation_UtilisateurNoteur` FOREIGN KEY (`Utilisateur_idUtilisateurNoteur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `fk_Utilisateur_has_Formation_Formation1` FOREIGN KEY (`Formation_idFormation`) REFERENCES `formation` (`idFormation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Utilisateur_has_Formation_Utilisateur` FOREIGN KEY (`Utilisateur_idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
