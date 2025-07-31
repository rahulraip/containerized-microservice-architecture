
-- Connect to the correct database
-- \c users;  -- Uncomment this if running manually, not needed in Docker auto init

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) UNIQUE,
    info TEXT NOT NULL
);

