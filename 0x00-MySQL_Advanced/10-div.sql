-- that creates a function SafeDiv
-- that divides (and returns) the
-- first by the second number
DELIMITER //

CREATE FUNCTION SafeDiv(
	a INT,
	b INT
) RETURNS INT
BEGIN
	RETURN IF(b = 0, 0, a / b);
END;

//

DELIMITER ;

