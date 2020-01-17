<?php get_header(); ?>

<?php 
	$id = $_GET['id'];
	global $wpdb; 
	$festivales = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_festivales WHERE id=$id"));
	$eventos = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_eventos WHERE id=$id"));
	$artistas = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_artistas WHERE evento_id=$id"));

?>



<div class="wrap">
	
	<h1>Artistas</h1>

	<h3>Listado de todos los artistas</h3>

	<p>http://localhost/wordpress/wp-json/artistas/lista/</p>

	<h3>Listado de artistas por evento</h3>

	<p>http://localhost/wordpress/wp-json/artistas/lista/evento/"id"</p>

	<p style="color: red">Cambie el "id" por algún numero del 1 al 15</p>


</div>

<?php get_footer(); ?>