-- Drop old constraint first
ALTER TABLE question_bank DROP CONSTRAINT IF EXISTS question_bank_topic_check;

-- Migrate old BE topic values
UPDATE question_bank SET topic = 'BACKEND_FUNDAMENTALS' WHERE topic IN ('CONCURRENCY', 'ARCHITECTURE', 'CACHING', 'MESSAGING', 'ANALYTICS', 'FEATURE_ENGINEERING', 'ML_SYSTEMS', 'CUSTOMERS');
UPDATE question_bank SET topic = 'BACKEND_FUNDAMENTALS' WHERE topic = 'EXPERIMENTATION' AND role = 'BACKEND_ENGINEER';
UPDATE question_bank SET topic = 'BACKEND_FUNDAMENTALS' WHERE topic = 'EXECUTION' AND role = 'BACKEND_ENGINEER';

-- Migrate old DS topic values
UPDATE question_bank SET topic = 'MACHINE_LEARNING' WHERE topic IN ('MODEL_EVALUATION', 'DATA_CLEANING', 'MODELING');
UPDATE question_bank SET topic = 'PYTHON_DATA' WHERE topic = 'PERFORMANCE' AND role = 'DATA_SCIENTIST';

-- Migrate old PM topic values
UPDATE question_bank SET topic = 'ANALYTICAL' WHERE topic = 'METRICS' AND role = 'PRODUCT_MANAGER';
UPDATE question_bank SET topic = 'EXECUTION' WHERE topic = 'ROADMAP' AND role = 'PRODUCT_MANAGER';
UPDATE question_bank SET topic = 'EXECUTION' WHERE topic = 'STAKEHOLDERS' AND role = 'PRODUCT_MANAGER';
UPDATE question_bank SET topic = 'EXECUTION' WHERE topic = 'PRODUCT_STRATEGY' AND role = 'PRODUCT_MANAGER';

-- Add new constraint with all valid topics
ALTER TABLE question_bank ADD CONSTRAINT question_bank_topic_check CHECK (
    topic IN (
        'API_DESIGN', 'BACKEND_FUNDAMENTALS', 'DATABASES', 'SYSTEM_DESIGN', 'SECURITY',
        'STATISTICS', 'MACHINE_LEARNING', 'SQL_DATA', 'EXPERIMENTATION', 'PYTHON_DATA',
        'PRODUCT_SENSE', 'ANALYTICAL', 'EXECUTION', 'TECHNICAL', 'BEHAVIORAL'
    )
);
