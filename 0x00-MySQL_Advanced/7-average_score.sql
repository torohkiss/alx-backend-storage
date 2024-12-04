-- creates a stored procedure
-- ComputeAverageScoreForUser that computes
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(
	IN user_id INT
)
BEGIN
	DECLARE avg_score DECIMAL(5,2);
	SELECT AVG(score) INTO avg_score
	FROM corrections
	WHERE user_id = user_id;
	
	UPDATE users
	SET average_score = IFNULL(avg_score, 0)
	WHERE id = user_id;
END;

//

DELIMITER ;

