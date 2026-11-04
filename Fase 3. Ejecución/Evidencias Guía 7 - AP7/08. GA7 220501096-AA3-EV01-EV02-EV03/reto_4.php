<?php
/* functions.php: tema Vitrina SENA */
# 1. Función que carga style.css y assets/js/main.js
function vitrina_cargar_recursos() {
    // Carga la hoja de estilos principal del tema.
    wp_enqueue_style(
        'vitrina-estilos',
        get_stylesheet_uri()
    );
    // Carga el JavaScript del menú principal en el pie de página.
    wp_enqueue_script(
        'vitrina-menu',
        get_template_directory_uri() . '/assets/js/main.js',
        array(),
        '1.0',
        true
    );
}
# 2. Engánchela al hook wp_enqueue_scripts
add_action( 'wp_enqueue_scripts', 'vitrina_cargar_recursos' );
/**
 * Configura las funcionalidades básicas del tema.
 */
function vitrina_configurar_tema() {
# 3. Función que activa title-tag y registra el menú principal    add_theme_support( 'title-tag' );
    // Registra la ubicación del menú principal del sitio.
    register_nav_menus(
        array(
            'principal' => 'Menú principal'
        )
    );
}
// Ejecuta la configuración cuando WordPress inicializa el tema.
add_action( 'after_setup_theme', 'vitrina_configurar_tema' );