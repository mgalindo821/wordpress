<?php

function addfestival(){

	//Verificar campos

	if( !isset ( $_POST['nombre']) || empty( $_POST['nombre']) || !isset ( $_POST['tipo']) || empty( $_POST['tipo'] ) || !isset($_POST['fecha']) || empty( $_POST['fecha'] ) ):

		wp_redirect( add_query_arg( array('errormsg' => 'Ingrese todos los datos'), get_home_url() . "/festivales" ) ); exit;

	endif;

	//Limpiar valores

	$nombre = sanitize_text_field( $_POST['nombre'] );
	$tipo = sanitize_text_field( $_POST['tipo'] );
	$fecha = sanitize_text_field( $_POST['fecha'] );

	//Guardar en la base de datos

	global $wpdb;
	$tablafestivales = $wpdb->prefix . 'festivales';

	if($_POST['nombre'] != '' && $_POST['tipo'] != '' && $_POST['fecha'] != ''):

		$wpdb->insert($tablafestivales, array('nombre' => $_POST['nombre'],
											  'tipo' => $_POST['tipo'],
											  'fecha' => $_POST['fecha']));

		wp_redirect( add_query_arg( array('exitomsg' => 'Los datos han sido guadados con exito'), get_home_url() . "/festivales" ) ); exit;

	endif;
}

add_action('admin_post_nopriv_formfestival', 'addfestival');
add_action('admin_post_formfestival', 'addfestival');

function addevento(){


	global $wpdb;
	$tablaeventos = $wpdb->prefix . 'eventos';

	//Verificar campos

	if( !isset ( $_POST['festival_id']) || empty( $_POST['festival_id']) || !isset ( $_POST['nombre']) || empty( $_POST['nombre']) || !isset ( $_POST['descripcion']) || empty( $_POST['descripcion'] ) ):

		wp_redirect( add_query_arg( array('errormsg' => 'Ingrese todos los datos'), get_home_url() . "/actividad/?id=$id" ) ); exit;

	endif;

	//Limpiar valores

	$nombre = sanitize_text_field( $_POST['nombre'] );
	$descripcion = sanitize_text_field( $_POST['descripcion'] );

	//Guardar en la base de datos

	$id = $_POST['festival_id'];

	if( $_POST['festival_id'] != '' && $_POST['nombre'] != '' && $_POST['descripcion'] != '' ):

		$wpdb->insert($tablaeventos, array( 'festival_id' => $_POST['festival_id'], 
										    'nombre' => $_POST['nombre'],
											'descripcion' => $_POST['descripcion']));

		wp_redirect( add_query_arg( array('exitomsg' => 'Los datos han sido guadados con exito'), get_home_url() . "/actividad/?id=$id" ) ); exit;

	endif;
}

add_action('admin_post_nopriv_formeventos', 'addevento');
add_action('admin_post_formeventos', 'addevento');

function addartista(){


	global $wpdb;
	$tablartistas = $wpdb->prefix . 'artistas';

	//Verificar campos

	if( !isset ( $_POST['evento_id']) || empty( $_POST['evento_id']) || !isset ( $_POST['nombre']) || empty( $_POST['nombre']) ):

		wp_redirect( add_query_arg( array('errormsg' => 'Ingrese todos los datos'), get_home_url() . "/actividad/?id=$id" ) ); exit;

	endif;

	//Limpiar valores

	$nombre = sanitize_text_field( $_POST['nombre'] );

	//Guardar en la base de datos

	$id = $_POST['evento_id'];

	if( $_POST['evento_id'] != '' && $_POST['nombre'] != '' ):

		$wpdb->insert($tablartistas, array( 'evento_id' => $_POST['evento_id'], 
										    'nombre' => $_POST['nombre']));

		wp_redirect( add_query_arg( array('exitomsg' => 'Los datos han sido guadados con exito'), get_home_url() . "/artistas/?id=$id" ) ); exit;

	endif;
}

add_action('admin_post_nopriv_artista_list', 'addartista');
add_action('admin_post_artista_list', 'addartista');