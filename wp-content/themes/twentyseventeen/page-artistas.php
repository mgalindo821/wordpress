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

	<?php foreach ($eventos as $evento) : ?>
		<h2> Evento: <?= $evento->nombre ?></h2>
		<?php $evento_id = $evento->id ?>
	<?php endforeach ?>

	<figure class="wp-block-table">
		<table class="">
			<tbody>
				<tr>
					<th>Nombre</th>
				</tr>
			<?php foreach ($artistas as $artista) : ?>
				<tr>
					<td><?= $artista->nombre ?></td>				
				</tr>
	
			<?php endforeach; ?>
				
			</tbody>
		</table>
	</figure>

</div>

<div class="wrap">

	<h3>Añadir Artista</h3>

	<?php
	if (isset($_GET['errormsg'])) : ?>

		<div style="color: red">
		<p><?php echo $_GET['errormsg']?></p>
		</div>
	
	<?php endif; ?>
	<?php
	if (isset($_GET['exitomsg'])) : ?>

		<div style="color: green">
		<p><?php echo $_GET['exitomsg']?></p>
		</div>
	
	<?php endif; ?>

	<form action="<?php echo esc_url( admin_url( 'admin-post.php' ))?>" method="POST">

		<input type="hidden" name="evento_id" value="<?= $id ?>">
		
		<label for="nombre">Nombre</label>
		<input type="text" name="nombre" id="nombre" required="">

		<br/>
		<input type="submit" value="Añadir">

		<input type="hidden" name="action" value="artista_list">

	</form>
	<br/>
	<div class="wp-block-button">
		<a class="wp-block-button__link" style="text-align: center;" href="http://localhost/wordpress/actividad/?id=<?=$id?>">Volver a Eventos</a>
	</div>

</div>



<?php get_footer(); ?>