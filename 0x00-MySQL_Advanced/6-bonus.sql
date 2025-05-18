-- SQL script that creates a stored procedure AddBonus that adds a new correction for a student.
-- Procedure AddBonus is taking 3 inputs (in this order):
-- user_id, a users.id value (you can assume user_id is linked to an existing users)
-- project_name, a new or already exists projects - if no projects.name found in the table, you should create it
-- score, the score value for the correction
-- Context: Write code in SQL is a nice level up!

CREATE PROCEDURE AddBonus(
    IN p_user_id INT,
    IN p_project_name VARCHAR(255),
    IN p_score INT
)
BEGIN
    DECLARE v_project_id INT;

    -- Check if the project already exists
    SELECT id INTO v_project_id
    FROM projects
    WHERE name = p_project_name
    LIMIT 1; -- Ensure only one ID is retrieved if (however unlikely) duplicate names exist

    -- If the project does not exist, create it
    IF v_project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (p_project_name);
        SET v_project_id = LAST_INSERT_ID(); -- Get the ID of the newly created project
    END IF;

    -- Add the new correction
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (p_user_id, v_project_id, p_score);

END //

DELIMITER ;
