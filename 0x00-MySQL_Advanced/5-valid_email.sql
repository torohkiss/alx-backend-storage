-- Write a SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.

-- Context: Nothing related to MySQL, but perfect for user email validation - distribute the logic to the database itself!

DELIMITER //

CREATE TRIGGER reset_valid_email_on_change
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    -- Check if the email column is being changed
    IF NEW.email != OLD.email THEN
        -- If the email is different, set valid_email to 0 (false)
        SET NEW.valid_email = 0;
    END IF;
END;
//

DELIMITER ;
