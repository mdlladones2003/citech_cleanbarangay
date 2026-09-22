INSERT INTO users (
    role_id,
    first_name,
    last_name,
    email,
    password,
    phone,
    address
)
SELECT
    id,
    'System',
    'Administrator',
    'admin@example.com',
    '$2y$10$REPLACE_WITH_GENERATED_PASSWORD_HASH',
    NULL,
    NULL
FROM roles
WHERE name = 'admin';