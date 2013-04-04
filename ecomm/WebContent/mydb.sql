-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 04 Avril 2013 à 23:15
-- Version du serveur: 5.5.8
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(254) DEFAULT NULL,
  `prenom_admin` varchar(254) DEFAULT NULL,
  `login_admin` varchar(254) DEFAULT NULL,
  `password_admin` varchar(254) DEFAULT NULL,
  `adress_admin` varchar(254) DEFAULT NULL,
  `eMail_admin` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `administrateur`
--


-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `refArticle` varchar(254) NOT NULL,
  `prix` float DEFAULT NULL,
  `quantiteStock` int(11) DEFAULT NULL,
  `courteDesc` varchar(254) DEFAULT NULL,
  `longDesc` varchar(254) DEFAULT NULL,
  `Categorie_idCategorie` varchar(45) NOT NULL,
  PRIMARY KEY (`refArticle`),
  KEY `fk_Article_Categorie1` (`Categorie_idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`refArticle`, `prix`, `quantiteStock`, `courteDesc`, `longDesc`, `Categorie_idCategorie`) VALUES
('1', 120, 10, 'veste', 'veste noire', '2'),
('2', 200, 3, 'ROBE ', 'ROBE ROBE SS', '1'),
('3', 130, 3, 'TUNIQUE', 'BELLE TUNIQUE', '4'),
('4', 140, 5, 'CHEMISE', 'BELLE CHEMISE', '5'),
('5', 200, 10, 'veste', 'veste blanche', '1'),
('6', 2000, 12, 'ROBE', 'ROOOOBE', '2'),
('7', 350, 100, 'ROOOBE', 'NBNBBNBB', '1'),
('8', 400, 120, 'NOIIIRE', 'ghghghg', '1');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` varchar(45) NOT NULL,
  `nomCategorie` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
('1', 'Robes'),
('2', 'Vestes'),
('3', 'Monteaux'),
('4', 'Tuniques'),
('5', 'chemises');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `numCommande` int(11) DEFAULT NULL,
  `etatCommande` varchar(254) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `montant` decimal(8,0) DEFAULT NULL,
  `idCommande` varchar(45) NOT NULL,
  `utilisateur_id_user` int(11) NOT NULL,
  PRIMARY KEY (`idCommande`),
  KEY `fk_Commande_utilisateur1` (`utilisateur_id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--


-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `urlPhoto` varchar(250) DEFAULT NULL,
  `idPhoto` varchar(250) NOT NULL,
  `Article_refArticle` varchar(254) NOT NULL,
  `representative` int(1) NOT NULL,
  PRIMARY KEY (`idPhoto`),
  KEY `fk_Image_Article` (`Article_refArticle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `image`
--

INSERT INTO `image` (`urlPhoto`, `idPhoto`, `Article_refArticle`, `representative`) VALUES
('veste.jpg', '1', '1', 1),
('vet2.jpg', '10', '5', 1),
('robe6.jpg', '11', '8', 1),
('robe1.jpg', '2', '2', 1),
('robe2.jpg', '3', '2', 0),
('chemise1.jpg', '4', '4', 1),
('chemise2.jpg', '5', '4', 0),
('robe4.jpg', '6', '3', 1),
('robe5.jpg', '7', '7', 1),
('vvvv.jpg', '8', '6', 1);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE IF NOT EXISTS `lignecommande` (
  `quantiteCom` int(11) DEFAULT NULL,
  `quantiteLivre` int(11) DEFAULT NULL,
  `Article_refArticle` varchar(254) NOT NULL,
  `Commande_idCommande` varchar(45) NOT NULL,
  KEY `fk_LigneCommande_Article1` (`Article_refArticle`),
  KEY `fk_LigneCommande_Commande1` (`Commande_idCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lignecommande`
--


-- --------------------------------------------------------

--
-- Structure de la table `paiment`
--

CREATE TABLE IF NOT EXISTS `paiment` (
  `numCB` varchar(254) DEFAULT NULL,
  `dateValidite` datetime DEFAULT NULL,
  `numAutorisation` int(11) DEFAULT NULL,
  `Commande_idCommande` varchar(45) NOT NULL,
  KEY `fk_Paiment_Commande1` (`Commande_idCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `paiment`
--


-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom_user` varchar(254) DEFAULT NULL,
  `prenom_user` varchar(254) DEFAULT NULL,
  `login_user` varchar(254) DEFAULT NULL,
  `password_user` varchar(254) DEFAULT NULL,
  `adress_user` varchar(254) DEFAULT NULL,
  `eMail_user` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `nom_user`, `prenom_user`, `login_user`, `password_user`, `adress_user`, `eMail_user`) VALUES
(1, 'BEN LAMALEM', 'Saida', 'BEN LAMALEM Saida', 'saida$', 'rue zouhour fes', 'saida.benlamalem@gmail.com');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_Article_Categorie1` FOREIGN KEY (`Categorie_idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_utilisateur1` FOREIGN KEY (`utilisateur_id_user`) REFERENCES `utilisateur` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_Image_Article` FOREIGN KEY (`Article_refArticle`) REFERENCES `article` (`refArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `fk_LigneCommande_Article1` FOREIGN KEY (`Article_refArticle`) REFERENCES `article` (`refArticle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LigneCommande_Commande1` FOREIGN KEY (`Commande_idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `paiment`
--
ALTER TABLE `paiment`
  ADD CONSTRAINT `fk_Paiment_Commande1` FOREIGN KEY (`Commande_idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE NO ACTION ON UPDATE NO ACTION;
