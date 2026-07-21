# sql-select-fundamentals

Repositorio con las consultas SQL basicas de SELECT y alias solicitadas por el equipo de finanzas de TechStore, escritas sobre la tabla `sales`.

## Contenido del repositorio

El archivo `consultas_basicas.sql` contiene las tres consultas pedidas: exploracion general con SELECT *, seleccion de columnas especificas para finanzas y seleccion con alias en espanol para stakeholders. Este archivo `README.md` documenta las decisiones tomadas en cada consulta.

## Por que es mala practica usar SELECT * en produccion

Usar SELECT * esta bien para una exploracion rapida en el entorno local, cuando todavia no conocemos la tabla, pero en un entorno de produccion o en un reporte trae varios problemas concretos.

En cuanto a rendimiento, la consulta viaja con todas las columnas de la tabla aunque el reporte solo necesite tres, lo que aumenta el volumen de datos transferidos y el tiempo de respuesta, sobre todo si la tabla crece o tiene columnas pesadas.

En cuanto a mantenibilidad, si mas adelante alguien agrega, borra o reordena columnas en sales, el resultado de SELECT * cambia sin que nadie lo pida explicitamente, y cualquier proceso o reporte que dependa de un orden o cantidad fija de columnas puede romperse sin previo aviso.

En cuanto a seguridad, SELECT * puede exponer columnas sensibles o de uso interno que no deberian llegar a un reporte de finanzas simplemente porque nadie las excluyo a proposito. Elegir las columnas de forma explicita, como se hizo en la Consulta 2, evita este riesgo.

## Por que son importantes los alias para un stakeholder no tecnico

Los nombres de columnas de una base de datos estan pensados para quien programa, no para quien toma decisiones de negocio. Una persona del equipo de finanzas no tiene por que saber que total_amount es el monto total de una venta, ni por que ver nombres en ingles con guiones bajos en un reporte que va a leer.

Por ejemplo, la columna total_amount puede renombrarse con total_amount AS monto_total. En el resultado de la consulta ya no aparece la columna tecnica total_amount, sino monto_total, un nombre que cualquier persona de finanzas entiende de inmediato sin tener que preguntarle a alguien de sistemas que significa ese campo.

En la Consulta 3 del ejercicio se aplica la misma idea: order_date, product_name y quantity se renombran como fecha_pedido, nombre_producto y cantidad_unidades, de modo que el reporte queda listo para compartirse directamente con el area de negocio, sin necesidad de aclaraciones adicionales.
