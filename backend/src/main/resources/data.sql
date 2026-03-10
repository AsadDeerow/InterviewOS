INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'Explain REST and why statelessness matters.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'BACKEND_ENGINEER'
      AND question_text = 'Explain REST and why statelessness matters.'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'Explain database indexing and when indexes hurt performance.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'BACKEND_ENGINEER'
      AND question_text = 'Explain database indexing and when indexes hurt performance.'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'CONCURRENCY', 'MEDIUM', 'What is a race condition and how can it be prevented?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'BACKEND_ENGINEER'
      AND question_text = 'What is a race condition and how can it be prevented?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'How would you design a URL shortener like bit.ly?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'BACKEND_ENGINEER'
      AND question_text = 'How would you design a URL shortener like bit.ly?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Explain how JWT authentication works.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'BACKEND_ENGINEER'
      AND question_text = 'Explain how JWT authentication works.'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Explain the bias-variance tradeoff.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'DATA_SCIENTIST'
      AND question_text = 'Explain the bias-variance tradeoff.'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is overfitting and how do you detect it?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'DATA_SCIENTIST'
      AND question_text = 'What is overfitting and how do you detect it?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'DATA_SCIENTIST', 'MODEL_EVALUATION', 'MEDIUM', 'Explain precision vs recall and when each matters.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'DATA_SCIENTIST'
      AND question_text = 'Explain precision vs recall and when each matters.'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'DATA_SCIENTIST', 'DATA_CLEANING', 'MEDIUM', 'How do you handle missing data in a dataset?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'DATA_SCIENTIST'
      AND question_text = 'How do you handle missing data in a dataset?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'How would you evaluate whether a new feature is successful?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'PRODUCT_MANAGER'
      AND question_text = 'How would you evaluate whether a new feature is successful?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'PRODUCT_MANAGER', 'METRICS', 'MEDIUM', 'What metrics would you track for a ride-sharing app?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'PRODUCT_MANAGER'
      AND question_text = 'What metrics would you track for a ride-sharing app?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'PRODUCT_MANAGER', 'ROADMAP', 'MEDIUM', 'How do you prioritize competing feature requests?'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'PRODUCT_MANAGER'
      AND question_text = 'How do you prioritize competing feature requests?'
);

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'PRODUCT_MANAGER', 'STAKEHOLDERS', 'MEDIUM', 'Describe how you handle conflict between engineering and marketing.'
WHERE NOT EXISTS (
    SELECT 1 FROM question_bank
    WHERE role = 'PRODUCT_MANAGER'
      AND question_text = 'Describe how you handle conflict between engineering and marketing.'
);
