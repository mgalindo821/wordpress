-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-01-2020 a las 05:18:57
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wordpress`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_artistas`
--

DROP TABLE IF EXISTS `wp_artistas`;
CREATE TABLE IF NOT EXISTS `wp_artistas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `evento_id` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artista_evento` (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wp_artistas`
--

INSERT INTO `wp_artistas` (`id`, `evento_id`, `nombre`) VALUES
(1, 1, 'Daddy Yankee'),
(2, 1, 'Nacho'),
(3, 1, 'Farruko'),
(4, 1, 'Eminem'),
(5, 5, 'Jorge Guerrero'),
(6, 5, 'Vitico Castillo'),
(7, 6, 'Reynaldo Armas'),
(8, 8, 'Fonseca'),
(9, 8, 'Luis Fonsi'),
(10, 8, 'Shakira'),
(11, 7, 'Snoop Dog '),
(12, 7, 'Dr Dree'),
(13, 2, 'Edgar Ramirez'),
(14, 2, 'Daniela Alvarado'),
(15, 9, 'Juan Silva'),
(16, 9, 'Paco Ramirez'),
(17, 12, 'Rodrigo Borjas '),
(18, 12, 'Alejandro Castaño'),
(19, 13, 'Iron Man'),
(20, 13, 'Thor'),
(21, 13, 'Spiderman'),
(22, 13, 'Superman'),
(23, 13, 'Batman'),
(24, 14, 'José Luis Perales'),
(25, 14, 'Leo Dan'),
(26, 14, 'Camilo Sesto'),
(27, 14, 'Leonardo Favio'),
(28, 15, 'Leonardo Di\'caprio'),
(29, 15, 'Mel Gibson'),
(30, 15, 'Will Smit');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_cte`
--

DROP TABLE IF EXISTS `wp_cte`;
CREATE TABLE IF NOT EXISTS `wp_cte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` int(12) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `two_email` varchar(100) DEFAULT NULL,
  `two_phone` int(12) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_email_log`
--

DROP TABLE IF EXISTS `wp_email_log`;
CREATE TABLE IF NOT EXISTS `wp_email_log` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `to_email` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `headers` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sent_date` timestamp NOT NULL,
  `attachment_name` varchar(1000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `ip_address` varchar(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `result` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_email_log`
--

INSERT INTO `wp_email_log` (`id`, `to_email`, `subject`, `message`, `headers`, `attachments`, `sent_date`, `attachment_name`, `ip_address`, `result`) VALUES
(1, 'admin@admin.com', 'Ejercicio WordPress \"ninguno\"', 'De: Marcos <marcos@marcos.com>\nAsunto: ninguno\n\nCuerpo del mensaje:\nHola mundo\n\n-- \nEste mensaje se ha enviado desde un formulario de contacto en Ejercicio WordPress (http://localhost/wordpress)', 'From: Ejercicio WordPress <admin@admin.com>\nX-WPCF7-Content-Type: text/plain\nReply-To: marcos@marcos.com\n', 'false', '2020-01-15 17:46:33', '', '::1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_eventos`
--

DROP TABLE IF EXISTS `wp_eventos`;
CREATE TABLE IF NOT EXISTS `wp_eventos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `festival_id` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  PRIMARY KEY (`id`),
  KEY `fk_evento_festival` (`festival_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wp_eventos`
--

INSERT INTO `wp_eventos` (`id`, `festival_id`, `nombre`, `descripcion`) VALUES
(1, 1, 'Reggaeton', 'jhvgasfdasjbdc'),
(2, 4, 'Cine Venezolano ', 'Cine Independiente Venezolano'),
(5, 7, 'Musica', 'Contrapunteo'),
(6, 7, 'Amanecer Llanero ', 'Musica'),
(7, 1, 'Rap', 'Batallas'),
(8, 2, 'Pop Festival', 'Festival de musica pop'),
(9, 3, 'Salsa Casino', 'Salsa casino profecional'),
(10, 3, 'Tango', 'Tango '),
(12, 5, 'Concurso de canto', 'Concurso de canto imitaciones'),
(13, 6, 'Comicon', 'Presentación de comics'),
(14, 2, 'Noche Romatica', 'Exponentes de música romántica'),
(15, 4, 'Oscars', 'Premiacion de los Oscars');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_festivales`
--

DROP TABLE IF EXISTS `wp_festivales`;
CREATE TABLE IF NOT EXISTS `wp_festivales` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wp_festivales`
--

INSERT INTO `wp_festivales` (`id`, `nombre`, `tipo`, `fecha`) VALUES
(1, 'Musica Urbana', 'Musica', '2020-01-01'),
(2, 'Musica', 'Musica', '2020-01-16'),
(3, 'Baile', 'Baile', '2020-01-09'),
(4, 'Cine ', 'Peliculas', '2020-01-08'),
(5, 'Canto', 'Musica', '2020-01-22'),
(6, 'Comics ', 'Arte', '2020-01-03'),
(7, 'Musica Llanera', 'Musica y Canto', '2020-01-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/wordpress', 'yes'),
(2, 'home', 'http://localhost/wordpress', 'yes'),
(3, 'blogname', 'Producciones Calacas', 'yes'),
(4, 'blogdescription', 'Producciones Calacas es una marca que produce conciertos y festivales. ', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'admin@admin.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'j F Y H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=35&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:0:{}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '-4', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:3:{i:0;s:74:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/wp-basic-crud/wp-basic-crud.php\";i:1;s:62:\"C:\\wamp64\\www\\wordpress/wp-content/plugins/akismet/akismet.php\";i:2;s:0:\"\";}', 'no'),
(40, 'template', 'twentyseventeen', 'yes'),
(41, 'stylesheet', 'twentyseventeen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '45805', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '35', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1594658591', 'yes'),
(94, 'initial_db_version', '45805', 'yes'),
(95, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:17:\"manage_email_logs\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'es_VE', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}s:13:\"array_version\";i:3;}', 'yes'),
(104, 'cron', 'a:7:{i:1579239793;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1579239993;a:1:{s:46:\"el_trigger_notify_email_when_log_threshold_met\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1579279392;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1579279393;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1579279410;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1579279411;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1579186563;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(116, 'recovery_keys', 'a:1:{s:22:\"Jjyt0LPXvl1ulMXhgXAKSX\";a:2:{s:10:\"hashed_key\";s:34:\"$P$BWvzvkTDYfXz3BlxrBNRaIOjEcu1iL0\";s:10:\"created_at\";i:1579134285;}}', 'yes'),
(255, '_site_transient_timeout_theme_roots', '1579239880', 'no'),
(256, '_site_transient_theme_roots', 'a:3:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}', 'no'),
(125, 'can_compress_scripts', '1', 'no'),
(138, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_VE/wordpress-5.3.2.zip\";s:6:\"locale\";s:5:\"es_VE\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_VE/wordpress-5.3.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.3.2\";s:7:\"version\";s:5:\"5.3.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1579238165;s:15:\"version_checked\";s:5:\"5.3.2\";s:12:\"translations\";a:0:{}}', 'no'),
(130, '_transient_timeout_plugin_slugs', '1579270741', 'no'),
(131, '_transient_plugin_slugs', 'a:2:{i:0;s:19:\"akismet/akismet.php\";i:1;s:9:\"hello.php\";}', 'no'),
(132, 'recently_activated', 'a:4:{s:36:\"plugins-festival/plugin-festival.php\";i:1579139471;s:31:\"wp-basic-crud/wp-basic-crud.php\";i:1579118715;s:23:\"email-log/email-log.php\";i:1579112421;s:36:\"contact-form-7/wp-contact-form-7.php\";i:1579112410;}', 'yes'),
(140, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1579238167;s:7:\"checked\";a:3:{s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:12:\"twentytwenty\";s:3:\"1.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(161, 'wpbc_db_version', '1.1.0', 'yes'),
(177, 'category_children', 'a:0:{}', 'yes'),
(178, 'recovery_mode_email_last_sent', '1579134285', 'yes'),
(148, 'email-log-db', '0.2', 'yes'),
(150, '_site_transient_timeout_browser_7e73968eca65e720d42d6244c575ab8b', '1579716455', 'no'),
(151, '_site_transient_browser_7e73968eca65e720d42d6244c575ab8b', 'a:10:{s:4:\"name\";s:5:\"Opera\";s:7:\"version\";s:12:\"65.0.3467.78\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:22:\"https://www.opera.com/\";s:7:\"img_src\";s:42:\"http://s.w.org/images/browsers/opera.png?1\";s:11:\"img_src_ssl\";s:43:\"https://s.w.org/images/browsers/opera.png?1\";s:15:\"current_version\";s:5:\"12.18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(152, '_site_transient_timeout_php_check_03bb19de23a7f39f237dfd15fa323af5', '1579716456', 'no'),
(153, '_site_transient_php_check_03bb19de23a7f39f237dfd15fa323af5', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(252, '_transient_is_multi_author', '0', 'yes'),
(257, '_site_transient_timeout_popular_importers_b7def661e5c554b6110dceb78a711176', '1579410940', 'no'),
(258, '_site_transient_popular_importers_b7def661e5c554b6110dceb78a711176', 'a:2:{s:9:\"importers\";a:7:{s:7:\"blogger\";a:4:{s:4:\"name\";s:7:\"Blogger\";s:11:\"description\";s:54:\"Import posts, comments, and users from a Blogger blog.\";s:11:\"plugin-slug\";s:16:\"blogger-importer\";s:11:\"importer-id\";s:7:\"blogger\";}s:9:\"wpcat2tag\";a:4:{s:4:\"name\";s:29:\"Categories and Tags Converter\";s:11:\"description\";s:71:\"Convert existing categories to tags or tags to categories, selectively.\";s:11:\"plugin-slug\";s:18:\"wpcat2tag-importer\";s:11:\"importer-id\";s:10:\"wp-cat2tag\";}s:11:\"livejournal\";a:4:{s:4:\"name\";s:11:\"LiveJournal\";s:11:\"description\";s:46:\"Import posts from LiveJournal using their API.\";s:11:\"plugin-slug\";s:20:\"livejournal-importer\";s:11:\"importer-id\";s:11:\"livejournal\";}s:11:\"movabletype\";a:4:{s:4:\"name\";s:24:\"Movable Type and TypePad\";s:11:\"description\";s:62:\"Import posts and comments from a Movable Type or TypePad blog.\";s:11:\"plugin-slug\";s:20:\"movabletype-importer\";s:11:\"importer-id\";s:2:\"mt\";}s:3:\"rss\";a:4:{s:4:\"name\";s:3:\"RSS\";s:11:\"description\";s:30:\"Import posts from an RSS feed.\";s:11:\"plugin-slug\";s:12:\"rss-importer\";s:11:\"importer-id\";s:3:\"rss\";}s:6:\"tumblr\";a:4:{s:4:\"name\";s:6:\"Tumblr\";s:11:\"description\";s:53:\"Import posts &amp; media from Tumblr using their API.\";s:11:\"plugin-slug\";s:15:\"tumblr-importer\";s:11:\"importer-id\";s:6:\"tumblr\";}s:9:\"wordpress\";a:4:{s:4:\"name\";s:9:\"WordPress\";s:11:\"description\";s:96:\"Import posts, pages, comments, custom fields, categories, and tags from a WordPress export file.\";s:11:\"plugin-slug\";s:18:\"wordpress-importer\";s:11:\"importer-id\";s:9:\"wordpress\";}}s:10:\"translated\";b:0;}', 'no'),
(243, '_transient_timeout_feed_mod_8de4ca513920c716a6877c5b746c1495', '1579275086', 'no'),
(244, '_transient_feed_mod_8de4ca513920c716a6877c5b746c1495', '1579231886', 'no'),
(245, '_transient_timeout_dash_v2_552322dd4badcfc6c46e921c5ef2a928', '1579275096', 'no'),
(246, '_transient_dash_v2_552322dd4badcfc6c46e921c5ef2a928', '<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://ve.wordpress.org/2018/05/19/wordpress-4-9-6-con-gestion-de-rgpd-incluida/\'>WordPress 4.9.6 con gestión de RGPD incluida</a></li></ul></div><div class=\"rss-widget\"><p><strong>Error de RSS:</strong> WP HTTP Error: cURL error 28: Operation timed out after 10000 milliseconds with 65233 bytes received</p></div>', 'no'),
(241, '_transient_timeout_feed_8de4ca513920c716a6877c5b746c1495', '1579275086', 'no'),
(242, '_transient_feed_8de4ca513920c716a6877c5b746c1495', 'a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n\n\n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:28:\"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:3:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"WordPress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"https://ve.wordpress.org\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:13:\"lastBuildDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 19 May 2018 20:39:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"es\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:40:\"https://wordpress.org/?v=5.4-alpha-47070\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:3:{i:0;a:6:{s:4:\"data\";s:61:\"\n		\n		\n				\n				\n		\n				\n\n		\n				\n								\n							\n		\n							\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:45:\"WordPress 4.9.6 con gestión de RGPD incluida\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://ve.wordpress.org/2018/05/19/wordpress-4-9-6-con-gestion-de-rgpd-incluida/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:89:\"https://ve.wordpress.org/2018/05/19/wordpress-4-9-6-con-gestion-de-rgpd-incluida/#respond\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 19 May 2018 20:39:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"Noticias\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"https://ve.wordpress.org/?p=572\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:366:\"Se ha liberado WordPress 4.9.6 como versión de mantenimiento para solucionar 18 problemas detectados en la anterior versión, aunque se puede decir que siendo una versión menor es como una versión atípica ya que incluye también ajustes de «privacidad». Hay que tener muy en cuenta que WordPress 4.9.6 con gestión de RGPD no es una versión menor, [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Santos R. Guerra Faro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:6753:\"<p>Se ha liberado WordPress 4.9.6 como versión de mantenimiento para solucionar 18 problemas detectados en la anterior versión, aunque se puede decir que siendo una versión menor es como una versión <q>atípica</q> ya que incluye también <strong>ajustes de «privacidad».</strong></p>\n<p>Hay que tener muy en cuenta que <strong>WordPress 4.9.6 con gestión de RGPD</strong> no es una versión menor, se corrigen cosas, como en todas las nuevas versiones, pero en esta se incorpora <strong>soporte al RGPD</strong>, por un lado para cumplir con esta norma entre WordPress.org y el usuario de WordPress (el que lo instala o gestiona) y por otro lado del propietario del sitio desarrollado con WordPress y el visitante.</p>\n<p>Antes de actualizar es importante no solo realizar copia de seguridad (si tu actualización no es automática) sino tener también claro que algunos cambios aplicados en esta nueva versión pueden afectar a determinados Temas no adaptados por parte de sus autores.</p>\n<h2><strong>Temas nativos de WordPress y child themes</strong></h2>\n<p>Si tras actualizar a esta nueva versión 4.9.6 detectas problemas con el Tema que utilizas, comprueba primero en la web del autor de tu tema si dispone de algún parche o actualización para compatibilizar el tema con los cambios aplicados al núcleo de WordPress.</p>\n<p>Los 8 últimos temas nativos de WordPress.org son compatibles y se han actualizado para admitir estos cambios. Los pies de página del sitio web mostrarán un enlace a la Política de Privacidad del sitio cuando se haya seleccionado uno, y el campo de «Aceptación de Cookies» de los comentarios ha sido rediseñado.</p>\n<p>Los temas hijo (child themes) deben comprobarse para ver si necesitan de algún ajuste para que el enlace a Política de Privacidad en el <q>footer</q> sea visible.</p>\n<h2><strong>Acerca de la RGPD en WordPress</strong></h2>\n<p>En todos los blogs, grups y comunidades de habla hispana solo habla del tema de la RGPD, hay mucha incertidumbre al respecto y aunque no estemos en la unión europea es importante que sepas que si cualquier usuario residente de la unión europea hace uso de tu sitio web, este ley te afecta.</p>\n<p>El nuevo <strong>Reglamento General de Protección de Datos (RGPD)</strong> en toda la Unión Europea y regula el tratamiento de datos entre usuarios de sitios web y los propietarios o administradores de los mismos y como estos últimos deben mostrar los avisos pertinentes para la aceptación de la «Política de Privacidad» y «Cookies» además de aplicar una gestión transparente sobre el uso que se da a la información de usuarios recopilada. Esto afecta también a los formularios de Contacto, Comentarios y cualquier otro (suscriptores, etc.) que se destine a recopilar u obtener datos del visitante.</p>\n<p>Para cumplir mejor con estos requisitos, WordPress 4.9.6 incluye nuevas herramientas para poder gestionar el RGPD mediante la adición de una pestaña de Privacidad en la pantalla posterior a la actualización.</p>\n<p>El mensaje informa a los usuarios que sus sitios pueden enviar datos a WordPress.org para actualizaciones de plugins y temas con un enlace a la política de privacidad de WordPress.org.</p>\n<p><img class=\"alignright size-full wp-image-573\" src=\"https://ve.wordpress.org/files/2018/05/4.9.6.png\" alt=\"Pestaña de política de Privacidad\" width=\"222\" height=\"246\" />También incorpora la posibilidad de crear una página de <strong>Política de Privacidad</strong> desde el dashboard, en Configuración, <strong>Privacidad </strong>seleccionando una página existente o creando una nueva donde se mostrará el texto de la política. Este tipo de páginas de política de privacidad serán tan ubicuas como las páginas <strong>Acerca de</strong> gracias al RGPD, pero la información que se muestre será única para los sitios individuales.</p>\n<p><strong>WordPress incluirá una plantilla con sugerencias sobre qué información mostrar</strong>.</p>\n<p>Para cumplir con el RGPD, los sitios web deben proporcionar una forma que permita a los usuarios obtener sus datos personales y solicitar que se eliminen.</p>\n<p>WordPress 4.9.6 no incluye un botón que permita a los usuarios realizar estas acciones. En cambio, la política de privacidad de un sitio debe incluir información sobre dónde enviar tales solicitudes (LOPD).</p>\n<p>Cuando un sitio WordPress con la versión 4.9.6 recibe una solicitud de exportación o eliminación de datos, el administrador del sitio pueden ir a Herramientas, Exportar datos personales, <strong>Eliminar datos personales</strong> y enviar a ese usuario una solicitud de verificación.</p>\n<p>Al insertar el nombre de usuario o dirección de correo electrónico en el campo de solicitud de envío, el afectado recibirá un correo electrónico con un enlace de confirmación.</p>\n<p>Una vez hecho clic, el sitio mostrará un aviso de <strong>Acción Confirmada</strong> y lo notificará al administrador del sitio y se cumplirá con la solicitud tan pronto como sea posible.</p>\n<p>Cuando WordPress (la web con 4.9.6) termina de crear el archivo zip, envía un enlace al usuario. Por motivos de seguridad, el archivo se elimina automáticamente después de 72 horas.</p>\n<p>De esta forma <strong>las instalaciones de WordPress que se actualicen a la versión 4.9.6 cumplirán con el RGPD sin necesidad de recurrir a plugins de terceros ni implementaciones manuales.</strong></p>\n<h2>Para despejar tus dudas al respecto, dejamos una lista de enlaces que puedes consultar:</h2>\n<blockquote class=\"wp-embedded-content\" data-secret=\"ZguxX8jcPV\"><p><a href=\"https://ayudawp.com/guia-rapida-para-cumplir-el-rgpd-con-wordpress/\">Guía rápida para cumplir el RGPD con WordPress</a></p></blockquote>\n<p><iframe class=\"wp-embedded-content\" sandbox=\"allow-scripts\" security=\"restricted\" src=\"https://ayudawp.com/guia-rapida-para-cumplir-el-rgpd-con-wordpress/embed/#?secret=ZguxX8jcPV\" data-secret=\"ZguxX8jcPV\" width=\"600\" height=\"338\" title=\"&#8220;Guía rápida para cumplir el RGPD con WordPress&#8221; &#8212; Ayuda WordPress\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe></p>\n<p>&nbsp;</p>\n<blockquote class=\"wp-embedded-content\" data-secret=\"ybZH3lopGD\"><p><a href=\"https://ayudawp.com/rgpd-woocommerce/\">Cómo cumplir el RGPD en WooCommerce</a></p></blockquote>\n<p><iframe class=\"wp-embedded-content\" sandbox=\"allow-scripts\" security=\"restricted\" src=\"https://ayudawp.com/rgpd-woocommerce/embed/#?secret=ybZH3lopGD\" data-secret=\"ybZH3lopGD\" width=\"600\" height=\"338\" title=\"&#8220;Cómo cumplir el RGPD en WooCommerce&#8221; &#8212; Ayuda WordPress\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\"></iframe></p>\n<p>&nbsp;</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:86:\"https://ve.wordpress.org/2018/05/19/wordpress-4-9-6-con-gestion-de-rgpd-incluida/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"0\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:61:\"\n		\n		\n				\n				\n		\n				\n\n		\n				\n								\n							\n		\n							\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:32:\"Traducciones Actualizada al 100%\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:68:\"https://ve.wordpress.org/2018/02/20/traducciones-actualizada-al-100/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://ve.wordpress.org/2018/02/20/traducciones-actualizada-al-100/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 20 Feb 2018 15:39:40 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"Noticias\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"https://ve.wordpress.org/?p=432\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:346:\"Algunos de los plugins mas utilizados fueron puestos al día, hoy en la madrugada: WooCommerce, MercadoPago para WooCommerce y Yoast SEO. Pedimos disculpas por no tener disponible aún la versión 4.9 para la descarga pero hay un problema con generador de la Herramienta que genera el paquete de la Versión. Tan pronto se solucione, lo [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Santos R. Guerra Faro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:542:\"<p>Algunos de los plugins mas utilizados fueron puestos al día, hoy en la madrugada: <a href=\"https://ve.wordpress.org/plugins/woocommerce/\">WooCommerce</a>, <a href=\"https://ve.wordpress.org/plugins/woocommerce-mercadopago/\">MercadoPago para WooCommerce</a> y Yoast SEO.</p>\n<p>Pedimos disculpas por no tener disponible aún la versión 4.9 para la descarga pero hay un problema con generador de la Herramienta que genera el paquete de la Versión. Tan pronto se solucione, lo estaremos publicando por esta vía y el grupo de Facebook.</p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"https://ve.wordpress.org/2018/02/20/traducciones-actualizada-al-100/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"4\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:73:\"\n		\n		\n				\n				\n		\n				\n		\n		\n		\n		\n\n		\n				\n								\n							\n		\n							\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:5:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"Mostrar errores de PHP en WordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"https://ve.wordpress.org/2012/05/27/mostrar-errores-de-php-en-wordpress/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"https://ve.wordpress.org/2012/05/27/mostrar-errores-de-php-en-wordpress/#comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sun, 27 May 2012 04:36:59 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"category\";a:5:{i:0;a:5:{s:4:\"data\";s:8:\"Consejos\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:1;a:5:{s:4:\"data\";s:8:\"Noticias\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:2;a:5:{s:4:\"data\";s:23:\"depuración del código\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:3;a:5:{s:4:\"data\";s:7:\"errores\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}i:4;a:5:{s:4:\"data\";s:3:\"php\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:30:\"http://ve.wordpress.org/?p=116\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:340:\"Por defecto WordPress oculta los errores de PHP, y esto puede venirnos bien para evitar que posibles atacantes puedan ver dónde están localizados los errores, lo cual hace más difícil atacar el servidor. Sin embargo hay veces en las que conviene ver esos errores, por ejemplo a la hora de revisarlos para poder arreglarlos. En [&#8230;]\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Santos R. Guerra Faro\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:40:\"http://purl.org/rss/1.0/modules/content/\";a:1:{s:7:\"encoded\";a:1:{i:0;a:5:{s:4:\"data\";s:1909:\"<p><strong>Por defecto WordPress oculta los errores de PHP</strong>, y esto puede venirnos bien para evitar que posibles atacantes puedan ver dónde están localizados los errores, lo cual hace más difícil atacar el servidor. Sin embargo hay veces en las que conviene ver esos errores, por ejemplo a la hora de revisarlos para poder arreglarlos.</p>\n<p>En esos casos es muy útil que se muestren los errores y para ello hay que deshabilitar ese comportamiento de WordPress, o mejor dicho, activar el modo debug de WordPress.</p>\n<p>Abrimos el archivo <em><strong>wp-config.php</strong> </em>y añadimos la siguiente línea:</p>\n<ul>\n<li>\n<pre>define(‘WP_DEBUG’, true);</pre>\n</li>\n</ul>\n<p>Sin aún así no se muestran los errores, añadimos esta otra línea a continuación de la anterior:</p>\n<ul>\n<li>\n<pre>ini_set(\"display_errors\", 1);</pre>\n</li>\n</ul>\n<p>Si tienes algún problema y quieres pedir ayuda, no olvides que en el archivo <strong><em>wp-config.php</em></strong> se encuentra la contraseña y el usuario de la Base de Datos, así que ten cuidado con qué código vas a compartir.</p>\n<p><strong>Un tip adicional,</strong> si vas a estar revisando los errores por largo tiempo o te tomas mas tiempo del esperado, puedes aplicar este pequeño truco para que sólo tu puedas ver los errores.</p>\n<ul>\n<li>Visita esta página, <a title=\"Cual es mi Número de IP\" href=\"http://www.cualesmiip.com\" target=\"_blank\">www.<strong>cualesmiip</strong>.com</a> para averiguar tu número de IP.</li>\n<li>En vez de colocar:\n<pre>define(‘WP_DEBUG’, true);</pre>\n</li>\n<li>Coloca esta línea:\n<pre>if ($_SERVER[\'REMOTE_ADDR\'] == ’<span style=\"color: #0000ff\">0.0.0.0</span>′) define(‘WP_DEBUG’,true);</pre>\n<p>Reemplaza <span style=\"color: #0000ff\"><strong><em>0.0.0.0</em></strong> </span>por tu número de IP. Ahora sólo tu podrás ver los errores.</li>\n</ul>\n<p><em><br />\n</em></p>\n\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:36:\"http://wellformedweb.org/CommentAPI/\";a:1:{s:10:\"commentRss\";a:1:{i:0;a:5:{s:4:\"data\";s:77:\"https://ve.wordpress.org/2012/05/27/mostrar-errores-de-php-en-wordpress/feed/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:38:\"http://purl.org/rss/1.0/modules/slash/\";a:1:{s:8:\"comments\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"7\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:30:\"https://ve.wordpress.org/feed/\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:44:\"http://purl.org/rss/1.0/modules/syndication/\";a:2:{s:12:\"updatePeriod\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"\n	hourly	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:15:\"updateFrequency\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"\n	1	\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:8:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Fri, 17 Jan 2020 03:31:28 GMT\";s:12:\"content-type\";s:34:\"application/rss+xml; charset=UTF-8\";s:6:\"x-olaf\";s:3:\"⛄\";s:13:\"last-modified\";s:29:\"Thu, 16 Jan 2020 02:40:55 GMT\";s:4:\"link\";s:61:\"<https://ve.wordpress.org/wp-json/>; rel=\"https://api.w.org/\"\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:9:\"HIT ord 1\";}}s:5:\"build\";s:14:\"20130911040210\";}', 'no'),
(200, 'current_theme', 'Twenty Seventeen', 'yes'),
(201, 'theme_mods_twentynineteen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1579187312;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(202, 'theme_switched', '', 'yes'),
(204, 'theme_mods_twentyseventeen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:12:\"header_image\";s:13:\"remove-header\";}', 'yes'),
(214, '_site_transient_timeout_community-events-d41d8cd98f00b204e9800998ecf8427e', '1579281301', 'no'),
(215, '_site_transient_community-events-d41d8cd98f00b204e9800998ecf8427e', 'a:3:{s:9:\"sandboxed\";b:0;s:8:\"location\";a:1:{s:2:\"ip\";b:0;}s:6:\"events\";a:0:{}}', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(70, 33, '_wp_trash_meta_status', 'draft'),
(13, 11, '_wp_trash_meta_status', 'publish'),
(68, 18, '_wp_trash_meta_time', '1579141331'),
(14, 11, '_wp_trash_meta_time', '1579108638'),
(15, 12, '_wp_trash_meta_status', 'publish'),
(16, 12, '_wp_trash_meta_time', '1579108652'),
(94, 63, '_edit_lock', '1579232821:1'),
(71, 33, '_wp_trash_meta_time', '1579141335'),
(72, 33, '_wp_desired_post_slug', ''),
(73, 39, '_edit_lock', '1579186854:1'),
(74, 40, '_edit_lock', '1579205407:1'),
(75, 42, '_edit_lock', '1579194742:1'),
(76, 43, '_edit_lock', '1579201723:1'),
(77, 45, '_edit_lock', '1579195792:1'),
(78, 45, '_wp_trash_meta_status', 'publish'),
(79, 45, '_wp_trash_meta_time', '1579195974'),
(80, 45, '_wp_desired_post_slug', 'inicio'),
(81, 51, '_edit_lock', '1579205397:1'),
(82, 51, '_wp_trash_meta_status', 'draft'),
(83, 51, '_wp_trash_meta_time', '1579201310'),
(84, 51, '_wp_desired_post_slug', ''),
(85, 53, '_edit_lock', '1579216627:1'),
(86, 55, '_wp_trash_meta_status', 'publish'),
(87, 55, '_wp_trash_meta_time', '1579215905'),
(88, 56, '_wp_trash_meta_status', 'publish'),
(89, 56, '_wp_trash_meta_time', '1579215923'),
(90, 57, '_edit_lock', '1579232469:1'),
(91, 59, '_edit_lock', '1579222198:1'),
(61, 29, '_wp_desired_post_slug', 'festival-de-musica'),
(54, 29, '_edit_lock', '1579137449:1'),
(57, 31, '_edit_lock', '1579139377:1'),
(64, 36, '_wp_trash_meta_status', 'publish'),
(63, 35, '_customize_changeset_uuid', 'f748c956-6cdf-447b-a183-7a38368560da'),
(28, 16, '_edit_lock', '1579111502:1'),
(69, 18, '_wp_desired_post_slug', 'anadir-festival'),
(65, 36, '_wp_trash_meta_time', '1579141264'),
(66, 35, '_edit_lock', '1579233684:1'),
(67, 18, '_wp_trash_meta_status', 'publish'),
(36, 18, '_edit_lock', '1579140835:1'),
(37, 20, '_edit_lock', '1579111828:1'),
(38, 20, '_wp_trash_meta_status', 'publish'),
(39, 20, '_wp_trash_meta_time', '1579111855'),
(58, 33, '_edit_lock', '1579141039:1'),
(59, 29, '_wp_trash_meta_status', 'publish'),
(60, 29, '_wp_trash_meta_time', '1579141198');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(47, 1, '2020-01-16 13:32:46', '2020-01-16 17:32:46', '', 'Inicio', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-16 13:32:46', '2020-01-16 17:32:46', '', 35, 'http://localhost/wordpress/2020/01/16/35-revision-v1/', 0, 'revision', '', 0),
(4, 1, '2020-01-15 12:43:31', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-01-15 12:43:31', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=4', 0, 'post', '', 0),
(16, 1, '2020-01-15 14:06:21', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-01-15 14:06:21', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?p=16', 0, 'post', '', 0),
(59, 1, '2020-01-16 20:40:39', '2020-01-17 00:40:39', '', 'Hola Mundo', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2020-01-16 20:40:39', '2020-01-17 00:40:39', '', 0, 'http://localhost/wordpress/?p=59', 0, 'post', '', 0),
(60, 1, '2020-01-16 20:40:39', '2020-01-17 00:40:39', '', 'Hola Mundo', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2020-01-16 20:40:39', '2020-01-17 00:40:39', '', 59, 'http://localhost/wordpress/2020/01/16/59-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2020-01-16 19:18:32', '2020-01-16 23:18:32', '', 'Artistas', '', 'publish', 'closed', 'closed', '', 'artistas', '', '', '2020-01-16 19:18:32', '2020-01-16 23:18:32', '', 0, 'http://localhost/wordpress/?page_id=57', 0, 'page', '', 0),
(58, 1, '2020-01-16 19:18:32', '2020-01-16 23:18:32', '', 'Artistas', '', 'inherit', 'closed', 'closed', '', '57-revision-v1', '', '', '2020-01-16 19:18:32', '2020-01-16 23:18:32', '', 57, 'http://localhost/wordpress/2020/01/16/57-revision-v1/', 0, 'revision', '', 0),
(56, 1, '2020-01-16 19:05:23', '2020-01-16 23:05:23', '{\n    \"twentyseventeen::header_image\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 23:05:23\"\n    },\n    \"twentyseventeen::header_image_data\": {\n        \"value\": \"remove-header\",\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 23:05:23\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '91ee234f-0388-4a7e-a650-5b4a064d1b7a', '', '', '2020-01-16 19:05:23', '2020-01-16 23:05:23', '', 0, 'http://localhost/wordpress/2020/01/16/91ee234f-0388-4a7e-a650-5b4a064d1b7a/', 0, 'customize_changeset', '', 0),
(53, 1, '2020-01-16 15:03:13', '2020-01-16 19:03:13', '', 'Actividad', '', 'publish', 'closed', 'closed', '', 'actividad', '', '', '2020-01-16 15:04:07', '2020-01-16 19:04:07', '', 0, 'http://localhost/wordpress/?page_id=53', 0, 'page', '', 0),
(54, 1, '2020-01-16 15:03:13', '2020-01-16 19:03:13', '', 'Actividad', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2020-01-16 15:03:13', '2020-01-16 19:03:13', '', 53, 'http://localhost/wordpress/2020/01/16/53-revision-v1/', 0, 'revision', '', 0),
(55, 1, '2020-01-16 19:05:05', '2020-01-16 23:05:05', '{\n    \"blogdescription\": {\n        \"value\": \"Producciones Calacas es una marca que produce conciertos y festivales. \",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 23:05:05\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '60e0767e-5fde-4c84-a82d-6424c59f81ad', '', '', '2020-01-16 19:05:05', '2020-01-16 23:05:05', '', 0, 'http://localhost/wordpress/2020/01/16/60e0767e-5fde-4c84-a82d-6424c59f81ad/', 0, 'customize_changeset', '', 0),
(48, 1, '2020-01-16 13:34:40', '2020-01-16 17:34:40', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/festivales/\">Añadir Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Inicio', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-16 13:34:40', '2020-01-16 17:34:40', '', 35, 'http://localhost/wordpress/2020/01/16/35-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2020-01-16 13:42:13', '2020-01-16 17:42:13', '<!-- wp:table -->\n<figure class=\"wp-block-table\"><table class=\"\"><tbody><tr><td>Nombre</td><td>Tipo </td><td>Fecha </td><td>Añadir Eventos</td></tr><tr><td></td><td></td><td></td><td></td></tr></tbody></table></figure>\n<!-- /wp:table -->', 'Listado de Festivales', '', 'inherit', 'closed', 'closed', '', '43-autosave-v1', '', '', '2020-01-16 13:42:13', '2020-01-16 17:42:13', '', 43, 'http://localhost/wordpress/2020/01/16/43-autosave-v1/', 0, 'revision', '', 0),
(50, 1, '2020-01-16 14:37:04', '2020-01-16 18:37:04', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/listado-de-festivales/\">Lista de Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/festivales/\">Añadir Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Inicio', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-16 14:37:04', '2020-01-16 18:37:04', '', 35, 'http://localhost/wordpress/2020/01/16/35-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2020-01-16 15:01:50', '2020-01-16 19:01:50', '', 'Festival', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2020-01-16 15:01:50', '2020-01-16 19:01:50', '', 0, 'http://localhost/wordpress/?page_id=51', 0, 'page', '', 0),
(52, 1, '2020-01-16 15:01:50', '2020-01-16 19:01:50', '', 'Festival', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2020-01-16 15:01:50', '2020-01-16 19:01:50', '', 51, 'http://localhost/wordpress/2020/01/16/51-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2020-01-15 13:17:18', '2020-01-15 17:17:18', '{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-15 17:17:18\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '975c104b-1b3d-472e-b436-57f2105d6252', '', '', '2020-01-15 13:17:18', '2020-01-15 17:17:18', '', 0, 'http://localhost/wordpress/2020/01/15/975c104b-1b3d-472e-b436-57f2105d6252/', 0, 'customize_changeset', '', 0),
(12, 1, '2020-01-15 13:17:31', '2020-01-15 17:17:31', '{\n    \"blogname\": {\n        \"value\": \"Ejercicio WordPress\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-15 17:17:31\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4d192a6b-6d3f-4682-9532-8c6c7eeddc38', '', '', '2020-01-15 13:17:31', '2020-01-15 17:17:31', '', 0, 'http://localhost/wordpress/2020/01/15/4d192a6b-6d3f-4682-9532-8c6c7eeddc38/', 0, 'customize_changeset', '', 0),
(32, 1, '2020-01-15 21:54:31', '2020-01-16 01:54:31', '<h2>Añadir Festival</h2>\n<form action=\"\" enctype=\"multipart/form-data\" method=\"POST\"><label for=\"nombre\">Nombre: </label>\n<p> </p>\n<p><input name=\"nombre\" type=\"text\" /></p>\n<p><label for=\"fecha\">Fecha: </label></p>\n<p><input name=\"fecha\" type=\"date\" /></p>\n<p><input style=\"text-align: center;\" type=\"submit\" value=\"Añadir\" /></p>\n</form>\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Festivales', '', 'inherit', 'closed', 'closed', '', '18-autosave-v1', '', '', '2020-01-15 21:54:31', '2020-01-16 01:54:31', '', 18, 'http://localhost/wordpress/2020/01/15/18-autosave-v1/', 0, 'revision', '', 0),
(28, 1, '2020-01-15 19:52:15', '2020-01-15 23:52:15', '<h2>Añadir Festival</h2>\n<form action=\"\" method=\"POST\" enctype=\"multipart/form-data\">\n			<label for=\"nombre\">Nombre: </label>\n			<p><input type=\"text\" name=\"nombre\"></p>\n			\n			<label for=\"fecha\">Fecha: </label>\n			<p><input type=\"date\" name=\"fecha\"></p>\n		\n<input style=\"text-align: center;\" type=\"submit\" value=\"Añadir\">\n		</form>\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Festivales', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2020-01-15 19:52:15', '2020-01-15 23:52:15', '', 18, 'http://localhost/wordpress/2020/01/15/18-revision-v1/', 0, 'revision', '', 0),
(29, 1, '2020-01-15 21:19:51', '2020-01-16 01:19:51', '', 'Festival de Musica', '', 'trash', 'open', 'open', '', 'festival-de-musica__trashed', '', '', '2020-01-15 22:19:58', '2020-01-16 02:19:58', '', 0, 'http://localhost/wordpress/?p=29', 0, 'post', '', 0),
(30, 1, '2020-01-15 21:19:51', '2020-01-16 01:19:51', '', 'Festival de Musica', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2020-01-15 21:19:51', '2020-01-16 01:19:51', '', 29, 'http://localhost/wordpress/2020/01/15/29-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2020-01-15 21:51:39', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-01-15 21:51:39', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=31', 0, 'page', '', 0),
(63, 1, '2020-01-16 23:44:36', '2020-01-17 03:44:36', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/wp-json/artistas/lista\">Todos los artistas </a></div>\n<!-- /wp:button -->\n\n<!-- wp:embed {\"url\":\"http://localhost/wordpress/wp-json/artistas/lista\"} -->\n<figure class=\"wp-block-embed\"><div class=\"wp-block-embed__wrapper\">\n<span> http://localhost/wordpress/wp-json/artistas/lista </span>\n</div></figure>\n<!-- /wp:embed -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Artistas Endpoint', '', 'publish', 'closed', 'closed', '', 'artistas-endpoint', '', '', '2020-01-16 23:49:30', '2020-01-17 03:49:30', '', 0, 'http://localhost/wordpress/?page_id=63', 0, 'page', '', 0),
(64, 1, '2020-01-16 23:44:36', '2020-01-17 03:44:36', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/wp-json/artistas/lista\">Todos los artistas </a></div>\n<!-- /wp:button -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Artistas Endpoint', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-01-16 23:44:36', '2020-01-17 03:44:36', '', 63, 'http://localhost/wordpress/2020/01/16/63-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2020-01-16 23:42:58', '2020-01-17 03:42:58', '<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/listado-de-festivales/\">Lista de Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/festivales/\">Añadir Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Inicio', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-16 23:42:58', '2020-01-17 03:42:58', '', 35, 'http://localhost/wordpress/2020/01/16/35-revision-v1/', 0, 'revision', '', 0),
(65, 1, '2020-01-16 23:45:20', '2020-01-17 03:45:20', '<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/listado-de-festivales/\">Lista de Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/festivales/\">Añadir Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/artistas-endpoint/\">Artistas Endpoint</a></div>\n<!-- /wp:button -->', 'Inicio', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-16 23:45:20', '2020-01-17 03:45:20', '', 35, 'http://localhost/wordpress/2020/01/16/35-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2020-01-16 23:47:03', '2020-01-17 03:47:03', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/wp-json/artistas/lista\">Todos los artistas </a></div>\n<!-- /wp:button -->\n\n<!-- wp:embed {\"url\":\"http://localhost/wordpress/wp-json/artistas/lista\"} -->\n<figure class=\"wp-block-embed\"><div class=\"wp-block-embed__wrapper\">\n<span> http://localhost/wordpress/wp-json/artistas/lista </span>\n</div></figure>\n<!-- /wp:embed -->', 'Artistas Endpoint', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-01-16 23:47:03', '2020-01-17 03:47:03', '', 63, 'http://localhost/wordpress/2020/01/16/63-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2020-01-16 23:48:38', '2020-01-17 03:48:38', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/wp-json/artistas/lista\">Todos los artistas </a></div>\n<!-- /wp:button -->\n\n<!-- wp:embed {\"url\":\"http://localhost/wordpress/wp-json/artistas/lista\"} -->\n<figure class=\"wp-block-embed\"><div class=\"wp-block-embed__wrapper\">\n<span> http://localhost/wordpress/wp-json/artistas/lista </span>\n</div></figure>\n<!-- /wp:embed -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Artistas Endpoint', '', 'inherit', 'closed', 'closed', '', '63-autosave-v1', '', '', '2020-01-16 23:48:38', '2020-01-17 03:48:38', '', 63, 'http://localhost/wordpress/2020/01/16/63-autosave-v1/', 0, 'revision', '', 0),
(68, 1, '2020-01-16 23:49:30', '2020-01-17 03:49:30', '<!-- wp:button -->\n<div class=\"wp-block-button\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/wp-json/artistas/lista\">Todos los artistas </a></div>\n<!-- /wp:button -->\n\n<!-- wp:embed {\"url\":\"http://localhost/wordpress/wp-json/artistas/lista\"} -->\n<figure class=\"wp-block-embed\"><div class=\"wp-block-embed__wrapper\">\n<span> http://localhost/wordpress/wp-json/artistas/lista </span>\n</div></figure>\n<!-- /wp:embed -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Artistas Endpoint', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2020-01-16 23:49:30', '2020-01-17 03:49:30', '', 63, 'http://localhost/wordpress/2020/01/16/63-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2020-01-15 14:08:53', '2020-01-15 18:08:53', '<h2>Añadir Festival</h2>\n<form action=\"\" method=\"POST\" enctype=\"multipart/form-data\">\n			<label for=\"nombre\">Nombre: </label>\n			<p><input type=\"text\" name=\"nombre\"></p>\n			\n			<label for=\"fecha\">Fecha: </label>\n			<p><input type=\"date\" name=\"fecha\"></p>\n		\n<input style=\"text-align: center;\" type=\"submit\" value=\"Añadir\">\n		</form>\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Festivales', '', 'trash', 'closed', 'closed', '', 'anadir-festival__trashed', '', '', '2020-01-15 22:22:11', '2020-01-16 02:22:11', '', 0, 'http://localhost/wordpress/?page_id=18', 0, 'page', '', 0),
(19, 1, '2020-01-15 14:08:53', '2020-01-15 18:08:53', 'Formulario', 'Añadir Festival', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2020-01-15 14:08:53', '2020-01-15 18:08:53', '', 18, 'http://localhost/wordpress/2020/01/15/18-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2020-01-15 14:10:55', '2020-01-15 18:10:55', '{\n    \"blogname\": {\n        \"value\": \"Producciones Calacas\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-15 18:09:59\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0cc7cfec-37f4-48f7-acd0-056c312ebc0f', '', '', '2020-01-15 14:10:55', '2020-01-15 18:10:55', '', 0, 'http://localhost/wordpress/?p=20', 0, 'customize_changeset', '', 0),
(44, 1, '2020-01-16 13:12:38', '2020-01-16 17:12:38', '', 'Listado de Festivales', '', 'inherit', 'closed', 'closed', '', '43-revision-v1', '', '', '2020-01-16 13:12:38', '2020-01-16 17:12:38', '', 43, 'http://localhost/wordpress/2020/01/16/43-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2020-01-16 13:32:12', '2020-01-16 17:32:12', '', 'Inicio', '', 'trash', 'closed', 'closed', '', 'inicio__trashed', '', '', '2020-01-16 13:32:54', '2020-01-16 17:32:54', '', 0, 'http://localhost/wordpress/?page_id=45', 0, 'page', '', 0),
(46, 1, '2020-01-16 13:32:12', '2020-01-16 17:32:12', '', 'Inicio', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2020-01-16 13:32:12', '2020-01-16 17:32:12', '', 45, 'http://localhost/wordpress/2020/01/16/45-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2020-01-15 22:21:04', '2020-01-16 02:21:04', '<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/listado-de-festivales/\">Lista de Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/festivales/\">Añadir Festivales</a></div>\n<!-- /wp:button -->\n\n<!-- wp:button {\"align\":\"center\"} -->\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"http://localhost/wordpress/artistas-endpoint/\">Artistas Endpoint</a></div>\n<!-- /wp:button -->', 'Inicio', '', 'publish', 'closed', 'closed', '', 'anadir-festival-2', '', '', '2020-01-16 23:45:20', '2020-01-17 03:45:20', '', 0, 'http://localhost/wordpress/?page_id=35', 0, 'page', '', 0),
(36, 1, '2020-01-15 22:21:04', '2020-01-16 02:21:04', '{\n    \"show_on_front\": {\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 02:21:04\"\n    },\n    \"page_on_front\": {\n        \"value\": \"35\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 02:21:04\"\n    },\n    \"nav_menus_created_posts\": {\n        \"value\": [\n            35\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2020-01-16 02:21:04\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'f748c956-6cdf-447b-a183-7a38368560da', '', '', '2020-01-15 22:21:04', '2020-01-16 02:21:04', '', 0, 'http://localhost/wordpress/2020/01/15/f748c956-6cdf-447b-a183-7a38368560da/', 0, 'customize_changeset', '', 0),
(37, 1, '2020-01-15 22:21:04', '2020-01-16 02:21:04', '', 'Añadir Festival', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-15 22:21:04', '2020-01-16 02:21:04', '', 35, 'http://localhost/wordpress/2020/01/15/35-revision-v1/', 0, 'revision', '', 0),
(38, 1, '2020-01-15 22:22:01', '2020-01-16 02:22:01', '', 'Festivales', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2020-01-15 22:22:01', '2020-01-16 02:22:01', '', 35, 'http://localhost/wordpress/2020/01/15/35-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2020-01-16 11:03:09', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-01-16 11:03:09', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=39', 0, 'page', '', 0),
(40, 1, '2020-01-16 11:03:49', '2020-01-16 15:03:49', '', 'Festivales', '', 'publish', 'closed', 'closed', '', 'festivales', '', '', '2020-01-16 11:03:49', '2020-01-16 15:03:49', '', 0, 'http://localhost/wordpress/?page_id=40', 0, 'page', '', 0),
(41, 1, '2020-01-16 11:03:49', '2020-01-16 15:03:49', '', 'Festivales', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2020-01-16 11:03:49', '2020-01-16 15:03:49', '', 40, 'http://localhost/wordpress/2020/01/16/40-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2020-01-16 13:12:10', '0000-00-00 00:00:00', '', 'Borrador automático', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2020-01-16 13:12:10', '0000-00-00 00:00:00', '', 0, 'http://localhost/wordpress/?page_id=42', 0, 'page', '', 0),
(43, 1, '2020-01-16 13:12:38', '2020-01-16 17:12:38', '', 'Listado de Festivales', '', 'publish', 'closed', 'closed', '', 'listado-de-festivales', '', '', '2020-01-16 13:12:38', '2020-01-16 17:12:38', '', 0, 'http://localhost/wordpress/?page_id=43', 0, 'page', '', 0),
(33, 1, '2020-01-15 22:22:15', '2020-01-16 02:22:15', '', 'Añadir Festival', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2020-01-15 22:22:15', '2020-01-16 02:22:15', '', 18, 'http://localhost/wordpress/?page_id=33', 0, 'page', '', 0),
(34, 1, '2020-01-15 21:57:24', '2020-01-16 01:57:24', '', 'Añadir Festival', '', 'inherit', 'closed', 'closed', '', '33-revision-v1', '', '', '2020-01-15 21:57:24', '2020-01-16 01:57:24', '', 33, 'http://localhost/wordpress/2020/01/15/33-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(59, 1, 0),
(29, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(18, 1, 'session_tokens', 'a:1:{s:64:\"fa4bd2233c485ea8600254b423fb18dc8a4452034cc42dd286fa41d1111c55a7\";a:4:{s:10:\"expiration\";i:1579410898;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:132:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36 OPR/65.0.3467.78\";s:5:\"login\";i:1579238098;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$Bc4au6Y1RsqQO7NZrC2T7UJZmcr/VK.', 'admin', 'admin@admin.com', '', '2020-01-15 16:43:12', '', 0, 'admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `wp_artistas`
--
ALTER TABLE `wp_artistas`
  ADD CONSTRAINT `fk_artista_evento` FOREIGN KEY (`evento_id`) REFERENCES `wp_eventos` (`id`);

--
-- Filtros para la tabla `wp_eventos`
--
ALTER TABLE `wp_eventos`
  ADD CONSTRAINT `fk_evento_festival` FOREIGN KEY (`festival_id`) REFERENCES `wp_festivales` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
