-- Задание №1.
use lesson_2;
DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
	id int,
    order_date date NOT NULL,
    bucket VARCHAR(50)
    );
INSERT INTO sales (id, order_date, bucket)
VALUES
     ('1', '2021-01-01', '101 to 300'),
     ('1', '2021-01-02', '101 to 300'),
     ('1', '2021-01-03', 'less than equal to 100'),
     ('1', '2021-01-04', '101 to 300'),
     ('1', '2021-01-05', 'greater than 300');
select * from sales;
-- Задание №2
select id, order_date,
    CASE
        WHEN bucket <= 100 THEN 'Маленький заказ'
        WHEN bucket > 100 AND bucket <= 300 THEN 'Средний заказ'
        WHEN bucket > 300 THEN 'Большой заказ'
    END AS bucket_segment
FROM sales;
-- Задание №3
DROP TABLE IF EXISTS sales;
CREATE TABLE orders(
	id int,
    employeeid varchar(50),
    amount VARCHAR(50),
    orderstatus text
    );
INSERT INTO orders (id, employeeid, amount,orderstatus)
VALUES
     ('1', 'e03', '15.00', 'open'),
     ('2', 'e01', '25.50', 'open'),
     ('3', 'e05', '100.70', 'closed'),
     ('4', 'e02', '22.18', 'open'),
     ('5', 'e04', '9.50', 'canceled'),
     ('6', 'e04', '99.99', 'open');
select * from orders;
SELECT id, employeeid, amount, orderstatus,
    CASE
        WHEN orderstatus = 'open' THEN 'Открыт'
        WHEN orderstatus = 'closed' THEN 'Закрыт'
        WHEN orderstatus = 'canceled' THEN 'Отменен'
        ELSE 'Неизвестный статус'
    END AS full_status
FROM orders;
-- Задание №4
-- 0 - это конкретное числовое значение. Тогда как NULL - просто обозначает отсутствие любого значения.