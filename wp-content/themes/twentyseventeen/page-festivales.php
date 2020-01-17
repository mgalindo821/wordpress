<?php get_header(); ?>

<div class="wrap">

	<h3>Añadir Festival</h3>

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

		<label for="nombre">Nombre</label>
		<input type="text" name="nombre" id="nombre" required="">

		<label for="tipo">Tipo de Festival</label>
		<input type="text" name="tipo" id="tipo" required="">

		<label for="fecha">Fecha del Evento</label>
		<input type="date" name="fecha" id="fecha" required="">

		<br/>
		<input type="submit" value="Añadir">

		<input type="hidden" name="action" value="formfestival">

	</form>
	<br/>
	<div class="wp-block-button">
		<a class="wp-block-button__link" href="http://localhost/wordpress/listado-de-festivales/">Ver Festivales</a>
	</div>
</div>


<?php get_footer(); ?>