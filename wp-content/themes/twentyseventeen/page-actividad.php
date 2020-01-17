<?php get_header(); ?>

<?php 
	$id = $_GET['id'];
	global $wpdb; 
	$festivales = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_festivales WHERE id=$id"));
	$eventos = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_eventos WHERE festival_id=$id"));

?>



<div class="wrap">
	
	<h1>Eventos</h1>

	<?php foreach ($festivales as $festival) : ?>
		<h2><?= $festival->nombre ?></h2>
		<?php $festival_id = $festival->id ?>
	<?php endforeach ?>

	<figure class="wp-block-table">
		<table class="">
			<tbody>
				<tr>
					<th>Nombre</th>
					<th>Descripcion </th>
					<th>Lista de Artistas</th>
				</tr>
			<?php foreach ($eventos as $evento) : ?>
				<tr>
					<td><?= $evento->nombre ?></td>
					<td><?= $evento->descripcion ?></td>
					<td class="wp-block-button">					
						<a class="wp-block-button__link" href="http://localhost/wordpress/artistas?id=<?= $evento->id ?>">Ver</a>							
					</td>					
				</tr>
	
			<?php endforeach; ?>
				
			</tbody>
		</table>
	</figure>

</div>

<div class="wrap">

	<h3>Añadir Evento</h3>

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

		<input type="hidden" name="festival_id" value="<?= $id ?>">
		
		<label for="nombre">Nombre</label>
		<input type="text" name="nombre" id="nombre" required="">

		<label for="descripcion">Descripción</label>
		<input type="text" name="descripcion" id="descripcion" required="">

		<br/>
		<input type="submit" value="Añadir">

		<input type="hidden" name="action" value="formeventos">

	</form>
	<br/>
	<div class="wp-block-button">
		<a class="wp-block-button__link" style="text-align: center;" href="http://localhost/wordpress/listado-de-festivales/">Volver a Festivales</a>
	</div>

</div>



<?php get_footer(); ?>