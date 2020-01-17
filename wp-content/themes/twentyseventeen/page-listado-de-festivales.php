<?php get_header(); ?>

<?php 
	global $wpdb; 
	$festivales = $wpdb->get_results( $wpdb->prepare("SELECT * FROM wp_festivales"));

?>


<div class="wrap">

	<h1>Festivales</h1>

	<figure class="wp-block-table">
		<table class="">
			<tbody>
				<tr>
					<th>Nombre</th>
					<th>Tipo </th>
					<th>Fecha </th>
					<th>Eventos </th>
				</tr>
			<?php foreach ($festivales as $festival) : ?>

				<tr>
					<td><?= $festival->nombre ?></td>
					<td><?= $festival->tipo ?></td>
					<td><?= $festival->fecha ?></td>
					<td class="wp-block-button">					
						<a class="wp-block-button__link" href="http://localhost/wordpress/actividad?id=<?= $festival->id ?>">Ver</a>							
					</td>					
				</tr>
	
			<?php endforeach; ?>
				
			</tbody>
		</table>
	<div class="wp-block-button">
		<a class="wp-block-button__link" href="http://localhost/wordpress/festivales/">Añadir Festivales</a>
	</div>
	</figure>	
</div>


<?php get_footer(); ?>
