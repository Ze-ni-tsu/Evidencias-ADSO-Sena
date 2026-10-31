# Reto 1: análisis de requerimientos de la vitrina

Redacte el análisis que sustenta el diseño del front-end de la vitrina. Escriba debajo de cada línea guía; las líneas que empiezan por # no se califican. Identifique los requerimientos con un código (por ejemplo RF-01 o RNF-01). Mínimo 120 palabras.

Caso. Un centro de formación quiere una vitrina web donde los aprendices emprendedores publiquen sus productos. Los clientes, entre ellos aprendices de jornada nocturna, la consultarán sobre todo desde el celular y algunos usan lector de pantalla. Hoy los pedidos se toman por WhatsApp y se pierden. La vitrina debe verse bien en teléfono, tableta y computador.

## **1. Requerimientos: dos funcionales y dos no funcionales**

**RF-01 – Visualización de productos:** La vitrina debe permitir que los clientes consulten los productos publicados por los aprendices emprendedores, mostrando información como nombre, descripción, precio e imagen.

**RF-02 – Gestión de pedidos:** La vitrina debe permitir que los clientes registren sus pedidos mediante un formulario que almacene la información de contacto y los productos seleccionados, evitando la pérdida de solicitudes.

**RNF-01 – Diseño responsive:** La interfaz debe adaptarse correctamente a teléfonos celulares, tabletas y computadores, garantizando una navegación cómoda y una presentación organizada en diferentes tamaños de pantalla.

**RNF-02 – Accesibilidad:** La vitrina debe permitir la navegación mediante teclado y ser compatible con lectores de pantalla, utilizando etiquetas descriptivas, textos alternativos en las imágenes y suficiente contraste entre los colores.

## **2. Una historia de usuario con su criterio de aceptación**

**Historia de usuario:**

**Como** cliente de la vitrina web, **quiero** consultar los productos disponibles y registrar mis pedidos desde mi dispositivo móvil, **para** adquirir productos de los aprendices emprendedores de manera sencilla y asegurar que mi solicitud quede registrada.

**Criterio de aceptación:**

Dado que un cliente está consultando la vitrina, cuando selecciona un producto, completa sus datos de contacto y confirma el pedido, el sistema debe registrar la solicitud y mostrar un mensaje de confirmación que indique que el pedido fue recibido correctamente.

## **3. Una decisión de diseño (color, tipografía, retícula o espaciado) y por qué**

Elegiría una interfaz limpia, con fondo blanco, azul oscuro para los encabezados y verde para destacar acciones importantes.

**¿Por qué?**

Porque estamos construyendo una vitrina comercial: los productos deben ser los protagonistas, las fotografías deben destacar y los botones deben ser fáciles de identificar.

Se utilizará una retícula de productos en forma de cuadrícula, con un máximo de cuatro columnas por fila en computadores, dos columnas en tabletas y dos columnas en teléfonos celulares. Los productos se organizarán inicialmente de menor a mayor precio para facilitar la comparación de opciones. Cada producto tendrá una tarjeta con fotografía, nombre, descripción breve y precio. Esta distribución permitirá visualizar diferentes alternativas de manera organizada, aprovechar el espacio disponible y facilitar la navegación de los clientes desde distintos dispositivos.

## 4. Estrategia responsive y accesibilidad

Lo recomendable sería usar puntos de quiebre (breakpoints):

| Dispositivo | Ancho de pantalla | Columnas |
| :---: | :---: | :---: |
| Celular | Menos de 768 px | 2 |
| Tableta | Desde 768 px | 2 |
| Computador | Desde 1024 px | 4 |

También se debe contemplar la accesibilidad:

- Textos alternativos (*alt*) para describir las fotografías.
- Contraste suficiente entre texto y fondo.
- Navegación mediante teclado.
- Etiquetas descriptivas en formularios y botones.
- Estructura semántica para facilitar la interpretación mediante lectores de pantalla.
- Utilizar un atributo HTML llamado **``aria-label``**, que proporciona un nombre accesible al elemento.
  - Ejemplo:

```HTML
<button aria-label="Ver carrito de compras">
    🛍️
</button>`

<!-- O una opción más completa sería -->

<button>
    🛍️ Ver carrito
</button>
```

## 5. Verificación de requerimientos

- **Prueba de verificación – RNF-01**

| Herramienta | Chrome DevTools |
| :---: | :---: |
| Resolución 1 | 375 × 667 px |
| Resolución 2 | 768 × 1024 px |
| Resolución 3 | 1366 × 768 px |

- **Resultado esperado**

  - La vitrina debe reorganizar sus productos según el ancho disponible, sin desbordamientos horizontales, elementos superpuestos ni textos ilegibles.
