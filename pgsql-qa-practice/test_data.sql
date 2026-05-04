INSERT INTO users (email, name, status, created_at)
VALUES
    ('ivan@example.com', 'Ivan Petrov', 'active', '2026-01-10'),
    ('anna@example.com', 'Anna Smirnova', 'active', '2026-01-12'),
    ('petr@example.com', 'Petr Ivanov', 'blocked', '2026-01-15'),
    ('duplicate@example.com', 'Alex One', 'active', '2026-01-18'),
    ('duplicate@example.com', 'Alex Two', 'active', '2026-01-19'),
    ('', 'Empty Email User', 'active', '2026-01-20'),
    (NULL, 'Null Email User', 'active', '2026-01-21'),
    ('wrong-status@example.com', 'Wrong Status User', 'unknown', '2026-01-22'),
    ('no-orders@example.com', 'User Without Orders', 'active', '2026-01-23');

INSERT INTO products (title, price, is_active, created_at)
VALUES
    ('Laptop', 75000.00, true, '2026-01-10'),
    ('Mouse', 1200.00, true, '2026-01-11'),
    ('Keyboard', 3500.00, true, '2026-01-12'),
    ('Monitor', 18000.00, true, '2026-01-13'),
    ('Inactive Product', 5000.00, false, '2026-01-14'),
    ('', 1000.00, true, '2026-01-15'),
    ('Negative Price Product', -500.00, true, '2026-01-16'),
    ('Zero Price Product', 0.00, true, '2026-01-17'),
    ('Never Ordered Product', 999.00, true, '2026-01-18');

INSERT INTO orders (user_id, status, total_amount, created_at)
VALUES
    (1, 'paid', 76200.00, '2026-02-01'),
    (2, 'completed', 3500.00, '2026-02-02'),
    (3, 'cancelled', 0.00, '2026-02-03'),
    (4, 'new', 18000.00, '2026-02-04'),
    (5, 'wrong_status', 1200.00, '2026-02-05'),
    (1, 'paid', 10000.00, '2026-02-06'),
    (2, 'paid', 5000.00, '2099-01-01');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 75000.00),
    (1, 2, 1, 1200.00),
    (2, 3, 1, 3500.00),
    (4, 4, 1, 18000.00),
    (5, 2, 1, 1200.00),
    (6, 1, 1, 75000.00),
    (7, 2, 0, 1200.00),
    (7, 3, -1, 3500.00);
