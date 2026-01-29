INSERT INTO Programs
    (ProgramID, `Name`, `Description`, ProgramVersion, OwnerID, Tier, MaxRequestsMonth, MaxUsers, MaxApiKeys, MaxWebhooks, ExpirationDate)
VALUES
    ('1c164aeb-6b11-4843-b137-584bb87e89c9', 'Some Website', 'na', '1.0.0', '3f7a9c2e-4b6a-4a1f-9c8d-2f1b6e7a0d93', 'Beta', 10000, 100, 5, 5, '2099-12-31 23:59:59'),
    ('6d074326-b76b-4216-a4bf-d97071d9e678', 'Some Panel', 'na', '1.0.0', '8d41c6f4-2a3e-4f9b-b0a7-6c5e1d9f2b48', 'Alpha', 100000, 1000, 50, 50, '2099-12-31 23:59:59'),
    ('42c26666-fa28-4704-806a-3df147f2cd69', 'Some App', 'na', '1.0.0', 'a5c9e2b1-7f34-4d8c-9e6a-0b2d4f8c1a73', 'Enterprise', 1000000, 10000, 500, 500, '2099-12-31 23:59:59');

INSERT INTO Levels (ProgramID, `Level`, Value, ValueLabel)
VALUES
    ('1c164aeb-6b11-4843-b137-584bb87e89c9', 1, 100, 'Basic'),
    ('1c164aeb-6b11-4843-b137-584bb87e89c9', 12, 1000, 'Pro'),
    ('1c164aeb-6b11-4843-b137-584bb87e89c9', 99, 9999, 'Admin');

INSERT INTO RegisterTokens (RegisterToken, `Level`, `Days`, ProgramID)
VALUES
    ('00000000-0000-0000-0000-000000000000', 99, 9999, '1c164aeb-6b11-4843-b137-584bb87e89c9');

INSERT INTO Users
    (Username, Email, PasswordHash, `Role`, `Level`, ProgramID, RegisterToken, Expiration)
VALUES
    ('onlyadmin', 'onlyadmin@onlyauth.com', '9f735e0df9a1ddc702bf0a1a7b83033f9f7153a00c29de82cedadc9957289b05', 'SystemAdmin', 99, '1c164aeb-6b11-4843-b137-584bb87e89c9', '00000000-0000-0000-0000-000000000000', '2099-12-31 23:59:59'),
    ('user1', 'onlyuser@gmail.com', '9f735e0df9a1ddc702bf0a1a7b83033f9f7153a00c29de82cedadc9957289b05', 'Developer', 12, '1c164aeb-6b11-4843-b137-584bb87e89c9', '00000000-0000-0000-0000-000000000000', '2099-12-31 23:59:59'),
    ('user2', 'seconduser@outlook.com', '9f735e0df9a1ddc702bf0a1a7b83033f9f7153a00c29de82cedadc9957289b05', 'Client', 1, '1c164aeb-6b11-4843-b137-584bb87e89c9', '00000000-0000-0000-0000-000000000000', '2099-12-31 23:59:59');
