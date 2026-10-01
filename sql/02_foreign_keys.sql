USE olist;

-- Pehle quick check: customers aur orders ki rows
SELECT COUNT(*) AS customers_rows FROM customers;


SELECT COUNT(*) AS orders_rows FROM orders;

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items
    ADD CONSTRAINT fk_items_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    ADD CONSTRAINT fk_items_product
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    ADD CONSTRAINT fk_items_seller
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE payments
    ADD CONSTRAINT fk_payments_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE reviews
    ADD CONSTRAINT fk_reviews_order
    FOREIGN KEY (order_id) REFERENCES orders(order_id);