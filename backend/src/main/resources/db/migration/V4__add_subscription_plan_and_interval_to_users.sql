ALTER TABLE users
    ADD COLUMN IF NOT EXISTS subscription_plan VARCHAR(50);

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS subscription_interval VARCHAR(50);
