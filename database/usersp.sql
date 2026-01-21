-- file         usersp.sql
-- date         2023-10-08
-- description  Repurposed from old project

DELIMITER $$

-- 1 - Authenticated
-- 2 - Incorrect Username
-- 3 - Invalid Password
-- 4 - Disabled
-- 5 - Expired account
SELECT '';
SELECT 'Creating sp_authenticate_user';
CREATE PROCEDURE sp_authenticate_user (
    IN UName      VARCHAR(64),
    IN Passwrd  CHAR(64)
)
BEGIN
    -- If authentication fails
    IF ((SELECT COUNT(Username) FROM Users
        WHERE Username = UName AND PasswordHash = Passwrd
        AND `Enabled` = 1 AND Expiration >= NOW()) = 0)     
    THEN
        -- Username does not exist
        IF ((SELECT COUNT(Username) FROM Users WHERE Username = UName) = 0) 
        THEN SELECT 2 AS Result; -- Incorrect Username

        ELSE
            SELECT
                CASE
                    WHEN PasswordHash <> Passwrd THEN 3 -- Invalid Password
                    WHEN `Enabled` = 0 THEN 4  -- Disabled
                    WHEN Expiration < NOW() THEN 5 -- Expired account
                END AS Result
            FROM Users
            WHERE Username = UName
        END IF;
    ELSE
        SELECT 1 AS Result; -- Authenticated
    END IF;

END$$
DELIMITER ;

SELECT '';
SELECT 'Creating sp_select_all_users';
CREATE PROCEDURE sp_select_all_users ()
BEGIN
    SELECT
        Username,
        `Level`,
        Expiration,
        RegisterToken,
        `Enabled`
    FROM Users;
END$$

SELECT '';
SELECT 'Creating sp_select_level_information';
CREATE PROCEDURE sp_select_level_information (
    IN `Level` TINYINT
)
BEGIN
    SELECT
        `Level`,
        HandleCooldown
    FROM Levels
    WHERE `Level` = Lvl;
END$$

SELECT '';
SELECT 'Creating sp_insert_new_user';
CREATE PROCEDURE sp_insert_new_user (
    IN UName        VARCHAR(64),
    IN PasswdHash   CHAR(64),
    IN `Level`      TINYINT,
    IN Expiration   DATETIME,
    IN Token        CHAR(36)
)
BEGIN
    INSERT INTO Users
        (Username, PasswordHash, `Level`, Expiration, RegisterToken)
    VALUES
        (UName, PasswdHash, `Level`, Expiration, Token);
END$$

SELECT '';
SELECT 'Creating sp_select_registered_user_count';
CREATE PROCEDURE sp_select_registered_user_count ()
BEGIN
    SELECT COUNT(Username) AS UserCount
    FROM Users;
END$$