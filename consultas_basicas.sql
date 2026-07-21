-- ======================================================
-- TechStore -- Consultas Basicas SELECT
-- Autor: Gilda Frias
-- Fecha: 2026-07-21
-- ======================================================

-- Consulta 1: Exploracion general de la tabla sales
-- SELECT * solo tiene sentido en exploracion ad-hoc o debugging rapido,
-- cuando queremos ver rapidamente toda la estructura de una tabla desconocida.
-- No debe usarse en producción ni en reportes porque trae columnas
-- innecesarias, es mas lento y se rompe si la tabla cambia de estructura.
SELECT *
FROM sales;

-- Consulta 2: Seleccion de columnas especificas para finanzas
SELECT
    customer_id,
    product_id,
    total_amount
FROM sales;

-- Consulta 3: Seleccion con alias en espanol para stakeholders
SELECT
    order_date AS fecha_pedido,
    product_name AS nombre_producto,
    quantity AS cantidad_unidades
FROM sales;
