-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 14 sep. 2024 à 03:50
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `recettes`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `recipe_id_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `user_id_id`, `recipe_id_id`, `content`) VALUES
(3, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(4, 1, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(5, 3, 7, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(6, 3, 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.'),
(7, 2, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240912144629', '2024-09-12 14:46:40', 6469),
('DoctrineMigrations\\Version20240913140528', '2024-09-13 14:05:46', 1396),
('DoctrineMigrations\\Version20240913230559', '2024-09-13 23:06:07', 1581);

-- --------------------------------------------------------

--
-- Structure de la table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `image_path` varchar(255) DEFAULT NULL,
  `username_user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id_id`, `title`, `content`, `created_at`, `image_path`, `username_user`) VALUES
(2, 3, '10 Quick and Easy Recipes for Weekday Meals', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\n\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-14 00:30:00', '66e4dd8d3b03d.jpg', 'Test1'),
(3, 3, 'The Best Smoothie Recipes for a Morning Energy Boost', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-27 01:11:00', '66e4ddeeb166e.jpg', 'Test1'),
(4, 2, 'Recipes for Balanced and Tasty Vegetarian Dishes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-13 01:13:00', '66e4de7e558b7.png', 'Test'),
(5, 2, 'The Secrets of a Perfect Homemade Pizza: Recipes and Tips', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-08 01:14:00', '66e4ded268a24.jpg', 'Test'),
(6, 1, 'Discover How to Make a Fondant Chocolate Cake in 5 Steps', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-14 01:15:00', '66e4df455f73c.jpg', 'Nesrine Amdouni'),
(7, 1, 'The Best Healthy Breakfast Ideas to Start the Day Right', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ultricies felis, et tempor nisi. Proin vestibulum ex id nisl luctus, id tempus odio consequat. Phasellus tempus quis nibh id tempus. Cras dapibus condimentum blandit. Donec vestibulum eros risus, eget ornare libero gravida quis. Phasellus sed vestibulum ex. Nam vitae molestie lacus. Phasellus dignissim rutrum felis, quis ultrices risus elementum at. Maecenas sit amet sem sem. In malesuada interdum volutpat. Etiam mollis viverra justo at sagittis. Aliquam erat volutpat.\r\n\r\nNunc consequat nibh elit, quis scelerisque eros congue in. Nam consectetur pellentesque nibh in hendrerit. In a nisl suscipit, pulvinar urna id, fringilla massa. Sed elit nibh, malesuada ornare metus nec, porta laoreet massa. Nulla efficitur, felis ut fermentum condimentum, purus lorem varius libero, vestibulum malesuada eros sapien ullamcorper neque. Sed sit amet ipsum bibendum sem lacinia lobortis. Nam fringilla tellus ac sem hendrerit porttitor. Quisque eu quam tincidunt, egestas dolor vel, facilisis risus. Vivamus nec risus ac metus sollicitudin eleifend in sit amet velit.', '2024-09-07 01:16:00', '66e4e08063105.avif', 'Nesrine Amdouni');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(1, 'nesrine@gmail.com', '[]', '$2y$13$zO6VUP77hy23svebZjrCC.TT95TeDeHb.QHbN96PcfzuxS6597LbK', 'Nesrine Amdouni'),
(2, 'test@gmail.com', '[]', '$2y$13$Ez7yjo2Q3vvIHuWfJTqH5uiTaXeypyCr7Ae8lI4T73pRiEzqDPLWy', 'Test'),
(3, 'test1@gmail.com', '[]', '$2y$13$nO/cAFAJe2Mnr51MQrVwe.6Ecbz8E5uYVSjeKiXutxG/jETq5LrUa', 'Test1'),
(4, 'test2@gmail.com', '[]', '$2y$13$28EekQIHjey3rvZvUZzVvu43O3nAifjI.Vhc9qfFft4Fck.narGWa', 'Test2'),
(5, 'sarra@gmail.com', '[]', '$2y$13$jS2Y4S35xrcWCak/ZXFBNeOIVU5JMM8zKwPt3dodbi0b8a.zx4/yq', 'sarra'),
(6, 'sirine@gmail.com', '[]', '$2y$13$CdFKkMkMr/iar0fWJOwMB.5vGW/ad4NIhNEwgOJ9CcUpSd1PeMeVm', 'sirine');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5F9E962A9D86650F` (`user_id_id`),
  ADD KEY `IDX_5F9E962A69574A48` (`recipe_id_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A369E2B59D86650F` (`user_id_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_5F9E962A69574A48` FOREIGN KEY (`recipe_id_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `FK_5F9E962A9D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `FK_A369E2B59D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
