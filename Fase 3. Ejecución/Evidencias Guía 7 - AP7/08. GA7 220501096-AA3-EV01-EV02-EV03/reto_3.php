<?php
/* header.php: tema Vitrina SENA */
?>
<!-- 1. DOCTYPE, html con idioma y head con charset y viewport -->
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo( 'charset' ); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 2. wp_head() antes de cerrar head -->
    <?php wp_head(); ?>
</head>
<!-- 3. body con body_class y encabezado: logo del tema y menú principal -->
<body <?php body_class(); ?>>
<header class="encabezado">
    <div class="contenedor">
        <a href="<?php echo esc_url( home_url( '/' ) ); ?>" class="logo">
            <img
                src="<?php echo esc_url( get_template_directory_uri() . '/assets/images/logo.png' ); ?>"
                alt="<?php bloginfo( 'name' ); ?>"
            >
        </a>
        <nav class="menu-principal">
            <?php
            wp_nav_menu(
                array(
                    'theme_location' => 'principal'
                )
            );
            ?>
        </nav>
    </div>
</header>
/* header.php: tema Vitrina SENA */
?>