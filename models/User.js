// CREATE TABLE Users (
//     Username       VARCHAR(64)    NOT NULL,
//     Email          VARCHAR(128)   NOT NULL,
//     PasswordHash   CHAR(64)       NOT NULL,
//     Role           ENUM('SystemAdmin','Developer','Client') NOT NULL,
//     Level          TINYINT        NOT NULL,
//     ProgramID      CHAR(36)       NOT NULL,
//     RegisterToken  CHAR(36)       NOT NULL,
//     Expiration     DATETIME       NOT NULL,  
//     HWID           VARCHAR(64)    NULL,
//     LastLoginDate  DATETIME       NULL,
//     CreatedAt      DATETIME       DEFAULT CURRENT_TIMESTAMP,
//     PRIMARY KEY (Username),
//     FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
//     FOREIGN KEY (RegisterToken) REFERENCES RegisterTokens(RegisterToken),
//     FOREIGN KEY (ProgramID, Level) REFERENCES Levels(ProgramID, Level)
// );