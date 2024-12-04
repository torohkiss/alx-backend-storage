-- Initial
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS items (
	name VARCHAR(255) NOT NULL,
	quantity INT NOT NULL DEFAULT 10
);

CREATE TABLE IF NOT EXISTS orders (
	item_name VARCHAR(255) NOT NULL,
	number INT NOT NULL
);

DELIMITER //

CREATE TRIGGER decrease_item_quantity
AFTER INSERT ON orders
FOR EACH ROW
	BEGIN
		UPDATE items
		SET quantity = quantity - NEW.number
		WHERE name = NEW.item_name;
END;

DELIMITER ;

INSERT INTO items (name) VALUES ("apple"), ("pineapple"), ("pear");
