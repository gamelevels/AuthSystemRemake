
const Roles = {
    SystemAdmin: 'SystemAdmin',
    Developer: 'Developer',
    Client: 'Client'
}

function UserModel({Username, Email, Role, Level, ProgramID, RegisterToken, Expiration, HWID, LastLoginDate, CreatedAt}) {
    return {
        Username: Username,
        email:  Email,
        role: Role,
        level: Level,
        programID: ProgramID,
        registerToken: RegisterToken,
        expiration: Expiration,
        hwid: HWID,
        lastLoginDate: LastLoginDate,
        createdAt: CreatedAt
    };
};

function UserLoginModel({Username, Email, PasswordHash, HWID}) {
    return {
        Username,
        Email,
        PasswordHash,
        HWID
    }
};

module.exports = {
    UserModel,
    UserLoginModel
};

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