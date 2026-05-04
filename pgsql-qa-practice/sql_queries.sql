
SELECT *
FROM users
WHERE email IS NULL
   OR email = '';


SELECT 
    email,
    COUNT(*) AS users_count
FROM users
WHERE email IS NOT NULL
  AND email <> ''
GROUP BY email
HAVING COUNT(*) > 1;


SELECT *
FROM users
WHERE status NOT IN ('active', 'blocked', 'deleted');


SELECT *
FROM products
WHERE title IS NULL
   OR title = '';


SELECT *
FROM products
WHERE price <= 0;


SELECT *
FROM orders
WHERE status NOT IN ('new', 'paid', 'cancelled', 'completed');


SELECT 
    o.*
FROM orders o
LEFT JOIN users u ON o.user_id = u.id
WHERE u.id IS NULL;


SELECT 
    u.*
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;


SELECT *
FROM order_items
WHERE quantity <= 0;


SELECT *
FROM order_items
WHERE price <= 0;


SELECT 
    oi.*
FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.id
WHERE p.id IS NULL;


SELECT 
    o.id AS order_id,
    o.total_amount AS order_total,
    COALESCE(SUM(oi.quantity * oi.price), 0) AS calculated_total
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id, o.total_amount
HAVING o.total_amount IS DISTINCT FROM COALESCE(SUM(oi.quantity * oi.price), 0);


SELECT 
    status,
    COUNT(*) AS orders_count
FROM orders
GROUP BY status
ORDER BY orders_count DESC;


SELECT 
    p.*
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.product_id IS NULL
  AND p.is_active = true;


SELECT *
FROM orders
WHERE created_at > CURRENT_DATE;


SELECT *
FROM users
WHERE created_at > CURRENT_DATE;


SELECT *
FROM products
WHERE created_at > CURRENT_DATE;


SELECT
    oi.id AS order_item_id,
    oi.order_id,
    oi.product_id,
    oi.quantity,
    oi.price,
    oi.quantity * oi.price AS item_total
FROM order_items oi;


SELECT
    u.id AS user_id,
    u.email,
    COUNT(o.id) AS orders_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.email
ORDER BY orders_count DESC;


SELECT 
    o.id AS order_id,
    o.total_amount AS order_total,
    COALESCE(SUM(oi.quantity * oi.price), 0) AS calculated_total,
    CASE 
        WHEN o.total_amount IS DISTINCT FROM COALESCE(SUM(oi.quantity * oi.price), 0)
            THEN 'FAILED'
        ELSE 'PASSED'
    END AS check_result
FROM orders o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id, o.total_amount
ORDER BY o.id;
