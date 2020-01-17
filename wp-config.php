<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'r*1zG,Qz_WG*1dMBo87LlxPQm_-%p9=_h{5Ln{!f=CO6z#mnkc(kxo$UJ@%Nv<Y>' );
define( 'SECURE_AUTH_KEY',  'lk`,wc(#E>f^A63ZcUm^w<k)v2Y3:mf!dwm</zut24fO7hlt(RoflivfbAL[A,j<' );
define( 'LOGGED_IN_KEY',    '}Aj)Oz/]CP{S*Q(4*+olp1{HwR%C;E#W_ohqDR^li|vTt@lf2:c+`l+=O@^O/11e' );
define( 'NONCE_KEY',        'Ho(*Jn{7W?6nMg+T(;NGCQ8z~kN{]Y`5HM?]GP(ziPjwO0AS/:l*$O&2t f,Vbki' );
define( 'AUTH_SALT',        '; iF=(sP)2g+Hl>IV(mj[VF3PgB G`E(S=4?#Ex?;1b)^LWJ5e9}q0UQ.|k>?(Aq' );
define( 'SECURE_AUTH_SALT', 'Jfh&w-zpG~L=&gHC5q4q?8J[rgImp1+DdjLf(hEE/6JN(2lc$pmeAS843rFPG=qq' );
define( 'LOGGED_IN_SALT',   ']<3=Qba[xnqK5[SxYbhhmT6>^<d)qJg:~.C:p}d.DNfHUM7c/}n`C):lr]n>Nd~_' );
define( 'NONCE_SALT',       '!F]n+A;7K*VZ+V;IL{j&_Ty_*b&7o]GEi5Ggl12ltZ;oY4^GS<v0D=hQ_l-fc/t`' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
