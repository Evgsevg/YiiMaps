-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 06 2016 г., 04:10
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `personalmaps`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authassignment`
--

CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authassignment`
--

INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', '1', NULL, 'N;'),
('user', '2', NULL, 'N;'),
('user', '3', NULL, 'N;'),
('user', '4', NULL, 'N;'),
('user', '5', NULL, 'N;'),
('user', '6', NULL, 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `authitem`
--

CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authitem`
--

INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('addPlace', 0, 'create place', NULL, 'N;'),
('addUser', 0, 'create user', NULL, 'N;'),
('admin', 2, '', NULL, 'N;'),
('deleteOwnPlace', 1, 'delete own place', 'return Yii::app()->user->id==$params["place"]->p_user_id;', 'N;'),
('deletePlace', 0, 'delete place', NULL, 'N;'),
('deleteUser', 0, 'delete user', NULL, 'N;'),
('updateOwnPlace', 1, 'edit own place', 'return Yii::app()->user->id==$params["place"]->p_user_id;', 'N;'),
('updatePlace', 0, 'update place', NULL, 'N;'),
('updateUser', 0, 'update user', NULL, 'N;'),
('user', 2, '', NULL, 'N;'),
('viewOwnPlace', 1, 'view own place', 'return Yii::app()->user->id==$params["place"]->p_user_id;', 'N;'),
('viewPlace', 0, 'view place', NULL, 'N;'),
('viewPlaces', 0, 'view places', NULL, 'N;'),
('viewUser', 0, 'view user', NULL, 'N;'),
('viewUsers', 0, 'view users', NULL, 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `authitemchild`
--

CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authitemchild`
--

INSERT INTO `authitemchild` (`parent`, `child`) VALUES
('user', 'addPlace'),
('admin', 'addUser'),
('user', 'deleteOwnPlace'),
('deleteOwnPlace', 'deletePlace'),
('admin', 'deleteUser'),
('user', 'updateOwnPlace'),
('updateOwnPlace', 'updatePlace'),
('admin', 'updateUser'),
('admin', 'user'),
('user', 'viewOwnPlace'),
('viewOwnPlace', 'viewPlace'),
('user', 'viewPlaces'),
('admin', 'viewUser'),
('admin', 'viewUsers');

-- --------------------------------------------------------

--
-- Структура таблицы `pm_places`
--

CREATE TABLE IF NOT EXISTS `pm_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(255) NOT NULL,
  `p_description` varchar(255) NOT NULL,
  `p_lng` float NOT NULL,
  `p_lat` float NOT NULL,
  `p_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`p_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `pm_places`
--

INSERT INTO `pm_places` (`id`, `p_title`, `p_description`, `p_lng`, `p_lat`, `p_user_id`) VALUES
(1, 'Алжир', 'Страна в Африке', 2.81, 27.84, 1),
(2, 'Киев', 'Столица Украины', 30.54, 50.43, 1),
(4, 'Таллин', 'Столица Эстонии', 24.72, 59.43, 4),
(5, 'Рига', 'Столица Латвии', 24.13, 56.94, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `pm_users`
--

CREATE TABLE IF NOT EXISTS `pm_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_pass` varchar(255) NOT NULL,
  `u_role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `pm_users`
--

INSERT INTO `pm_users` (`id`, `u_name`, `u_email`, `u_pass`, `u_role`) VALUES
(1, 'admin', 'admin@site.loc', '$2a$13$t2w8Lv.sUcr6IhStIeQX3.tn6wbJbKzaKEKIlZqyHUpB0mVI9BGUO', 'admin'),
(4, 'user1', 'user1@mail.ru', '$2a$13$K/ktUm8qbO8Z9glPoD/OK.qj90cH7nFUxthh29MdL/9YbQB/G35rK', 'user'),
(5, 'user2', 'user2@mail.ru', '$2a$13$pfEUym8fSiYMLy/mirjXVOB0GKjyuiPcp8xAMiq40.AB9Dh06Ocxu', 'user'),
(6, 'user3', 'user3@mail.ru', '$2a$13$JdTIszORsNqK8PbzZwXDA.RDNCRfkki4Hlnvnxz/GD9InC9KP3iIi', 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1375549110),
('m130713_190802_create_users_table', 1375549113),
('m130713_193329_create_places_table', 1375549114);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `authassignment`
--
ALTER TABLE `authassignment`
  ADD CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `authitemchild`
--
ALTER TABLE `authitemchild`
  ADD CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `pm_places`
--
ALTER TABLE `pm_places`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`p_user_id`) REFERENCES `pm_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
