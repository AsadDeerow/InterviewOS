ALTER TABLE users
    ADD COLUMN IF NOT EXISTS stripe_customer_id VARCHAR(255);

ALTER TABLE users
    ADD COLUMN IF NOT EXISTS stripe_subscription_id VARCHAR(255);

CREATE UNIQUE INDEX IF NOT EXISTS uk_users_stripe_customer_id ON users (stripe_customer_id);

CREATE UNIQUE INDEX IF NOT EXISTS uk_users_stripe_subscription_id ON users (stripe_subscription_id);
