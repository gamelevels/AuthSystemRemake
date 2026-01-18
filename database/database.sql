CREATE TABLE Programs (
    ProgramID         CHAR(36)        NOT NULL,
    Name              VARCHAR(40)     NOT NULL,
    Description       VARCHAR(255)    NOT NULL,
    ProgramVersion    VARCHAR(15)     NOT NULL,
    MOTD              VARCHAR(255)    NULL,
    DownloadLink      VARCHAR(255)    NULL,
    OwnerID           CHAR(36)        NOT NULL,
    Tier              VARCHAR(15)     NOT NULL,
    MaxRequestsMonth  INT             NOT NULL,
    RequestPerMonth   INT             NOT NULL,
    MaxUsers          INT             NOT NULL,
    MaxApiKeys        INT             NOT NULL,
    MaxWebhooks       INT             NOT NULL,
    ExpirationDate    DATETIME        NOT NULL,
    CreatedAt         DATETIME        DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt         DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Enabled           BOOLEAN         DEFAULT TRUE,
    AutoUpdate        BOOLEAN         DEFAULT TRUE,
    PRIMARY KEY (ProgramID)
);

CREATE TABLE Levels (
    ProgramID    CHAR(36)      NOT NULL,
    Level        TINYINT       NOT NULL,
    Value        INT           NULL,
    ValueLabel   VARCHAR(32)   NULL,
    CreatedAt    DATETIME      DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ProgramID, Level),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE RegisterTokens (
    RegisterToken   CHAR(36)      NOT NULL,
    Level           SMALLINT      NOT NULL,
    Days            SMALLINT      NOT NULL,
    UsedBy          VARCHAR(64)   NULL,
    UsedDate        DATETIME      NULL,
    ProgramID       CHAR(36)      NOT NULL,
    CreationDate    DATETIME      DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (RegisterToken),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE Users (
    Username       VARCHAR(64)    NOT NULL,
    Email          VARCHAR(128)   NOT NULL,
    PasswordHash   CHAR(64)       NOT NULL,
    Role           ENUM('SystemAdmin','Developer','Client') NOT NULL,
    Level          TINYINT        NOT NULL,
    ProgramID      CHAR(36)       NOT NULL,
    RegisterToken  CHAR(36)       NOT NULL,
    Expiration     DATETIME       NOT NULL,  
    HWID           VARCHAR(64)    NULL,
    LastLoginDate  DATETIME       NULL,
    CreatedAt      DATETIME       DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (Username),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
    FOREIGN KEY (RegisterToken) REFERENCES RegisterTokens(RegisterToken),
    FOREIGN KEY (ProgramID, Level) REFERENCES Levels(ProgramID, Level)
);

CREATE TABLE Tickets (
    ID             CHAR(36)       NOT NULL DEFAULT (UUID()),
    ProgramID      CHAR(36)       NOT NULL,
    Title          VARCHAR(64)    NOT NULL,
    Issue          TEXT           NOT NULL,
    Priority       INT            NOT NULL,
    Resolved       BOOLEAN        DEFAULT FALSE,
    Submitter      VARCHAR(64)    NOT NULL,
    DateSubmitted  DATETIME       DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt      DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    FOREIGN KEY (Submitter) REFERENCES Users(Username),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE TicketMessages (
    TicketID      CHAR(36)       NOT NULL,
    ProgramID     CHAR(36)       NOT NULL,
    Message       TEXT           NOT NULL,
    Sender        VARCHAR(64)    NOT NULL,
    SentTime      DATETIME       DEFAULT CURRENT_TIMESTAMP,
    IsStaff       BOOLEAN        DEFAULT FALSE,
    PRIMARY KEY (TicketID, SentTime, Sender),
    FOREIGN KEY (TicketID) REFERENCES Tickets(ID),
    FOREIGN KEY (Sender) REFERENCES Users(Username),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE APIs (
    APIID                 CHAR(36)       NOT NULL DEFAULT (UUID()),
    ProgramID             CHAR(36)       NOT NULL,
    Link                  VARCHAR(255)   NOT NULL,
    ParameterPlaceHolder  VARCHAR(32)    NOT NULL,
    Enabled               BOOLEAN        DEFAULT TRUE,
    CreatedAt             DATETIME       DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt             DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (APIID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE Webhooks (
    WebhookID    CHAR(36)       NOT NULL DEFAULT (UUID()),
    ProgramID    CHAR(36)       NOT NULL,
    Link         VARCHAR(255)   NOT NULL,
    Title        VARCHAR(64)    NOT NULL,
    Enabled      BOOLEAN        DEFAULT TRUE,
    CreatedAt    DATETIME       DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt    DATETIME       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (WebhookID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE APIRequestLogs (
    RequestID    CHAR(36)       NOT NULL DEFAULT (UUID()),
    ProgramID    CHAR(36)       NOT NULL,
    UserID       VARCHAR(64)    NOT NULL,
    APIEndpoint  VARCHAR(255)   NOT NULL,
    RequestData  TEXT           NOT NULL,
    StatusCode   INT            NOT NULL,
    ResponseTime FLOAT          NOT NULL,
    Timestamp    DATETIME       DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (RequestID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
    FOREIGN KEY (UserID) REFERENCES Users(Username)
);

CREATE TABLE WebhookLogs (
    WebhookLogID  CHAR(36)       NOT NULL DEFAULT (UUID()),
    ProgramID     CHAR(36)       NOT NULL,
    WebhookID     CHAR(36)       NOT NULL,
    TriggeredEvent VARCHAR(64)   NOT NULL,
    Payload       TEXT           NOT NULL,
    Status        INT            NOT NULL,
    ResponseTime  FLOAT          NOT NULL,
    Timestamp     DATETIME       DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (WebhookLogID),
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID),
    FOREIGN KEY (WebhookID) REFERENCES Webhooks(WebhookID)
);
