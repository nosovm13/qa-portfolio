DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(255),
    name VARCHAR(255),
    status VARCHAR(50),
    created_at DATE
);

CREATE TABLE products (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(255),
    price NUMERIC(10, 2),
    is_active BOOLEAN,
    created_at DATE
);

CREATE TABLE orders (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    status VARCHAR(50),
    total_amount NUMERIC(10, 2),
    created_at DATE
);

CREATE TABLE order_items (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INTEGER REFERENCES orders(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER,
    price NUMERIC(10, 2)
);
