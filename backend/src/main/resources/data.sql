-- ═══════════════════════════════════════════════════════════════════════════════
-- BACKEND ENGINEER — DATABASES (60 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'When would you use a LEFT JOIN instead of a subquery?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you use a LEFT JOIN instead of a subquery?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is the difference between WHERE and HAVING?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between WHERE and HAVING?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How does GROUP BY work internally at a high level?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How does GROUP BY work internally at a high level?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'Write a query to find the second highest salary in a table.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Write a query to find the second highest salary in a table.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'Write a query to return duplicate rows based on an email column.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Write a query to return duplicate rows based on an email column.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'Write a query to delete duplicates while keeping the earliest record.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Write a query to delete duplicates while keeping the earliest record.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is the difference between UNION and UNION ALL?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between UNION and UNION ALL?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What are window functions, and when are they better than GROUP BY?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are window functions, and when are they better than GROUP BY?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'Explain ROW_NUMBER(), RANK(), and DENSE_RANK() with use cases.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Explain ROW_NUMBER(), RANK(), and DENSE_RANK() with use cases.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How would you compute a running total in SQL?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you compute a running total in SQL?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How would you find the top 3 products per category?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you find the top 3 products per category?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is an index, and why does it improve performance?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is an index, and why does it improve performance?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is the difference between a clustered index and a non-clustered index?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between a clustered index and a non-clustered index?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'Why can an index make writes slower?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can an index make writes slower?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is a composite index?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a composite index?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'Why does index column order matter?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why does index column order matter?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'In which cases will a query not use an index even if one exists?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'In which cases will a query not use an index even if one exists?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What is a covering index?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a covering index?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is an execution plan, and how do you use it to debug a slow query?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is an execution plan, and how do you use it to debug a slow query?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What does a full table scan mean?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What does a full table scan mean?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is cardinality, and why does it matter for indexing?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is cardinality, and why does it matter for indexing?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is selectivity, and how does it affect index usefulness?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is selectivity, and how does it affect index usefulness?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'Why can SELECT * be harmful in production systems?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can SELECT * be harmful in production systems?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What are ACID properties?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are ACID properties?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is the difference between a transaction and a query?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between a transaction and a query?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What happens if a transaction fails halfway through?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What happens if a transaction fails halfway through?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is transaction isolation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is transaction isolation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'Explain dirty reads, non-repeatable reads, and phantom reads.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Explain dirty reads, non-repeatable reads, and phantom reads.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What are the common isolation levels, and what anomalies does each allow?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are the common isolation levels, and what anomalies does each allow?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is a deadlock?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a deadlock?' AND topic = 'DATABASES');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How do deadlocks happen in databases?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do deadlocks happen in databases?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How do you reduce the chance of deadlocks?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do you reduce the chance of deadlocks?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is optimistic locking?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is optimistic locking?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is pessimistic locking?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is pessimistic locking?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'When would you use SELECT ... FOR UPDATE?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you use SELECT ... FOR UPDATE?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is normalization?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is normalization?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What are 1NF, 2NF, and 3NF?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are 1NF, 2NF, and 3NF?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'When is denormalization the right choice?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is denormalization the right choice?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What tradeoff are you making when you denormalize?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What tradeoff are you making when you denormalize?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is a foreign key, and why is it useful?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a foreign key, and why is it useful?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is a unique constraint, and how is it different from a primary key?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a unique constraint, and how is it different from a primary key?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'What is the difference between DELETE, TRUNCATE, and DROP?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between DELETE, TRUNCATE, and DROP?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is replication?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is replication?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What is the difference between primary-replica replication and multi-primary replication?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between primary-replica replication and multi-primary replication?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What problems can replication lag cause?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problems can replication lag cause?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What is sharding?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is sharding?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What is the difference between sharding and partitioning?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between sharding and partitioning?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'How would you choose a shard key?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you choose a shard key?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What problems appear when a poor shard key is chosen?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problems appear when a poor shard key is chosen?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is a materialized view?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a materialized view?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'When should you use a materialized view instead of computing results on demand?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should you use a materialized view instead of computing results on demand?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'What is the N+1 query problem?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the N+1 query problem?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'How do ORMs create N+1 problems?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do ORMs create N+1 problems?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'EASY', 'How would you model a many-to-many relationship in a relational database?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you model a many-to-many relationship in a relational database?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'When would you choose a relational database over a document database?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you choose a relational database over a document database?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'MEDIUM', 'When would you choose a document database over a relational one?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you choose a document database over a relational one?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'What is eventual consistency in a database context?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is eventual consistency in a database context?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'How would you debug a production issue where a query became slow after a schema change?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you debug a production issue where a query became slow after a schema change?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'DATABASES', 'HARD', 'A payments table is growing fast and writes are slowing down. What database-level changes would you investigate first?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'A payments table is growing fast and writes are slowing down. What database-level changes would you investigate first?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- BACKEND ENGINEER — BACKEND_FUNDAMENTALS (100 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between stack memory and heap memory?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between stack memory and heap memory?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What kinds of data usually live on the stack?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What kinds of data usually live on the stack?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What kinds of data usually live on the heap?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What kinds of data usually live on the heap?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a memory leak?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a memory leak?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'How can a garbage-collected language still leak memory?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How can a garbage-collected language still leak memory?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is garbage collection at a high level?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is garbage collection at a high level?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why can garbage collection pauses hurt latency?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can garbage collection pauses hurt latency?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the difference between strong, weak, and soft references?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between strong, weak, and soft references?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is object immutability, and why is it useful?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is object immutability, and why is it useful?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between pass-by-value and pass-by-reference?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between pass-by-value and pass-by-reference?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'How do parameter passing semantics work in your main backend language?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do parameter passing semantics work in your main backend language?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between equality by identity and equality by value?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between equality by identity and equality by value?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between compile-time errors and runtime errors?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between compile-time errors and runtime errors?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is exception propagation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is exception propagation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'When should you throw an exception versus returning an error value?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should you throw an exception versus returning an error value?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the cost of using exceptions for control flow?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the cost of using exceptions for control flow?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the difference between checked and unchecked exceptions?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between checked and unchecked exceptions?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a call stack?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a call stack?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What causes stack overflow?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What causes stack overflow?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is recursion, and when is it dangerous in backend services?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is recursion, and when is it dangerous in backend services?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a thread?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a thread?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a process?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a process?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between concurrency and parallelism?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between concurrency and parallelism?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is a race condition?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a race condition?' AND topic = 'BACKEND_FUNDAMENTALS');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Give an example of a race condition in a backend application.'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Give an example of a race condition in a backend application.');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a mutex or lock?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a mutex or lock?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the difference between a mutex and a semaphore?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between a mutex and a semaphore?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is a deadlock in concurrency?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a deadlock in concurrency?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What are the four conditions typically required for deadlock?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are the four conditions typically required for deadlock?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'How do you prevent deadlocks in application code?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do you prevent deadlocks in application code?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is lock contention?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is lock contention?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why can coarse-grained locking destroy throughput?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can coarse-grained locking destroy throughput?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is a read-write lock?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a read-write lock?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'When is a read-write lock worse than a normal mutex?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is a read-write lock worse than a normal mutex?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is an atomic operation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is an atomic operation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why are atomic counters useful?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why are atomic counters useful?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is memory visibility in multithreaded programs?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is memory visibility in multithreaded programs?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why can one thread fail to see another thread''s update?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can one thread fail to see another thread''s update?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is a memory barrier at a high level?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a memory barrier at a high level?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is thread safety?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is thread safety?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What makes a class or object thread-safe?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What makes a class or object thread-safe?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why are immutable objects easier to use concurrently?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why are immutable objects easier to use concurrently?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is thread-local storage?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is thread-local storage?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'When is thread-local state dangerous in request-driven systems?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is thread-local state dangerous in request-driven systems?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is an event loop?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is an event loop?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'How does async I/O differ from thread-per-request models?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How does async I/O differ from thread-per-request models?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is blocking I/O?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is blocking I/O?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is non-blocking I/O?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is non-blocking I/O?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'When does async code improve performance?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When does async code improve performance?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'When does async code make things worse?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When does async code make things worse?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is backpressure?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is backpressure?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why is backpressure necessary in high-throughput systems?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is backpressure necessary in high-throughput systems?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What happens if producers are faster than consumers?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What happens if producers are faster than consumers?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is a worker pool?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a worker pool?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'How do you size a worker pool?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do you size a worker pool?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why can too many threads reduce performance?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can too many threads reduce performance?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is context switching?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is context switching?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why is excessive context switching expensive?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is excessive context switching expensive?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a future or promise?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a future or promise?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the difference between synchronous and asynchronous error handling?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between synchronous and asynchronous error handling?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between CPU-bound work and I/O-bound work?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between CPU-bound work and I/O-bound work?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'How should you treat CPU-bound tasks differently from I/O-bound tasks?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How should you treat CPU-bound tasks differently from I/O-bound tasks?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is connection pooling?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is connection pooling?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why is opening a new database connection per request a bad idea?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is opening a new database connection per request a bad idea?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What problems can occur if a connection pool is too small?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problems can occur if a connection pool is too small?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What problems can occur if a connection pool is too large?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problems can occur if a connection pool is too large?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a timeout?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a timeout?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why should network calls always have timeouts?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why should network calls always have timeouts?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is the difference between connect timeout, read timeout, and overall deadline?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between connect timeout, read timeout, and overall deadline?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is retry logic?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is retry logic?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'When should you not retry a failed operation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should you not retry a failed operation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why can naive retries cause cascading failure?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can naive retries cause cascading failure?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is exponential backoff?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is exponential backoff?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why add jitter to retries?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why add jitter to retries?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is idempotency in backend logic?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is idempotency in backend logic?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'Why does idempotency matter for retries?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why does idempotency matter for retries?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is a circuit breaker?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a circuit breaker?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What problem does a circuit breaker solve?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problem does a circuit breaker solve?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is bulkheading?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is bulkheading?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is fail-fast behavior?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is fail-fast behavior?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is graceful degradation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is graceful degradation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is a queue in backend systems?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is a queue in backend systems?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'When should you use a queue instead of direct synchronous processing?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should you use a queue instead of direct synchronous processing?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is message acknowledgement?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is message acknowledgement?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is at-most-once delivery?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is at-most-once delivery?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is at-least-once delivery?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is at-least-once delivery?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is exactly-once delivery in practice?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is exactly-once delivery in practice?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why is exactly-once usually an application-level illusion?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is exactly-once usually an application-level illusion?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is serialization?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is serialization?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is the difference between JSON, Protobuf, and Avro from a backend perspective?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between JSON, Protobuf, and Avro from a backend perspective?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What problems happen when serialized schemas evolve badly?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problems happen when serialized schemas evolve badly?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is backward compatibility in message formats?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is backward compatibility in message formats?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is forward compatibility in message formats?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is forward compatibility in message formats?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'MEDIUM', 'What is resource starvation?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is resource starvation?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'How can one noisy request class starve other traffic?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How can one noisy request class starve other traffic?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'What is head-of-line blocking?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is head-of-line blocking?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'EASY', 'What is the difference between latency and throughput?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between latency and throughput?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'Why can improving throughput make latency worse?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why can improving throughput make latency worse?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'How would you debug a service that becomes slow only under concurrent load?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you debug a service that becomes slow only under concurrent load?');

INSERT INTO question_bank (role, topic, difficulty, question_text)
SELECT 'BACKEND_ENGINEER', 'BACKEND_FUNDAMENTALS', 'HARD', 'A service is stable with 10 users but breaks with 1,000. What runtime and concurrency causes would you investigate first?'
WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'A service is stable with 10 users but breaks with 1,000. What runtime and concurrency causes would you investigate first?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- BACKEND ENGINEER — SYSTEM_DESIGN (40 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a URL shortener.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a URL shortener.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a rate limiter for public APIs.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a rate limiter for public APIs.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a file upload service for large media files.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a file upload service for large media files.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a notification system that supports email, SMS, and push.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a notification system that supports email, SMS, and push.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a chat service for one-to-one messaging.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a chat service for one-to-one messaging.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a group chat system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a group chat system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a feed or timeline service.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a feed or timeline service.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a distributed job queue.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a distributed job queue.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a background task processing system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a background task processing system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design an image resizing pipeline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design an image resizing pipeline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a search autocomplete service.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a search autocomplete service.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a feature flag service.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a feature flag service.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a metrics ingestion pipeline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a metrics ingestion pipeline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a logging platform for many microservices.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a logging platform for many microservices.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design an audit trail system for sensitive actions.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design an audit trail system for sensitive actions.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a payment processing backend.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a payment processing backend.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design an order management service for e-commerce.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design an order management service for e-commerce.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design an inventory service that avoids overselling.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design an inventory service that avoids overselling.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a booking system for hotel rooms or appointments.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a booking system for hotel rooms or appointments.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a ride dispatch backend at a high level.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a ride dispatch backend at a high level.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Design a webhook delivery system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a webhook delivery system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a distributed cache invalidation strategy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a distributed cache invalidation strategy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'Design a service that handles 10x traffic growth over six months.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Design a service that handles 10x traffic growth over six months.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you design for high availability across regions?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design for high availability across regions?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'When would you choose eventual consistency over strong consistency?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you choose eventual consistency over strong consistency?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'How would you decide whether to split a monolith into microservices?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you decide whether to split a monolith into microservices?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'What signals tell you a monolith should stay a monolith?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What signals tell you a monolith should stay a monolith?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'How would you prevent a single downstream dependency from taking down your whole system?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you prevent a single downstream dependency from taking down your whole system?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'Where would you place caches in a read-heavy architecture?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Where would you place caches in a read-heavy architecture?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you design idempotent payment or order creation flows?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design idempotent payment or order creation flows?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you handle duplicate events in an event-driven system?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you handle duplicate events in an event-driven system?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you design a service that must survive partial regional failure?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design a service that must survive partial regional failure?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'How would you choose between relational storage, key-value storage, and document storage for a new service?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you choose between relational storage, key-value storage, and document storage for a new service?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you model hot keys or hotspots in a distributed system?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you model hot keys or hotspots in a distributed system?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you design a system that must process delayed retries safely?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design a system that must process delayed retries safely?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you handle schema changes in a zero-downtime system?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you handle schema changes in a zero-downtime system?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'MEDIUM', 'How would you approach observability in a system with many services?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you approach observability in a system with many services?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you design a service-level rate limit that is fair per customer?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design a service-level rate limit that is fair per customer?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'How would you handle backpressure in a large event ingestion system?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you handle backpressure in a large event ingestion system?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SYSTEM_DESIGN', 'HARD', 'A system is read-heavy during the day and write-heavy at night. How would that change your design decisions?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'A system is read-heavy during the day and write-heavy at night. How would that change your design decisions?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- BACKEND ENGINEER — API_DESIGN (40 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What makes a good REST API?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What makes a good REST API?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'When should an endpoint use GET versus POST?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should an endpoint use GET versus POST?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'When should you use PUT versus PATCH?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should you use PUT versus PATCH?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What makes an operation idempotent?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What makes an operation idempotent?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'Which HTTP methods are expected to be idempotent?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Which HTTP methods are expected to be idempotent?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you design an endpoint for creating orders safely under client retries?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design an endpoint for creating orders safely under client retries?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would you expose pagination for a very large dataset?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you expose pagination for a very large dataset?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What is the difference between offset pagination and cursor pagination?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between offset pagination and cursor pagination?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'When is cursor pagination clearly better?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is cursor pagination clearly better?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would you version an API without breaking old clients?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you version an API without breaking old clients?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'What are the tradeoffs between URI versioning and header-based versioning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are the tradeoffs between URI versioning and header-based versioning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would you design filtering and sorting in list endpoints?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design filtering and sorting in list endpoints?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What HTTP status code would you return for validation failure?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What HTTP status code would you return for validation failure?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What HTTP status code would you return for unauthorized versus forbidden?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What HTTP status code would you return for unauthorized versus forbidden?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What HTTP status code would you return when a conflict occurs on create?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What HTTP status code would you return when a conflict occurs on create?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How should error responses be structured?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How should error responses be structured?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'Why is stable error formatting important for API consumers?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is stable error formatting important for API consumers?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you design partial success responses for batch APIs?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design partial success responses for batch APIs?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'When is a batch API a bad idea?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is a batch API a bad idea?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would you design an endpoint for long-running jobs?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design an endpoint for long-running jobs?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'When should an API respond synchronously versus asynchronously?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When should an API respond synchronously versus asynchronously?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would a client check status for an async job?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would a client check status for an async job?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What is webhook design, and when is it better than polling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is webhook design, and when is it better than polling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How would you secure webhook delivery?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you secure webhook delivery?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you make webhook delivery reliable under consumer failures?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you make webhook delivery reliable under consumer failures?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'What is the outbox pattern?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the outbox pattern?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'What problem does the outbox pattern solve?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What problem does the outbox pattern solve?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'What is the saga pattern?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the saga pattern?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'When would you use a saga instead of a distributed transaction?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When would you use a saga instead of a distributed transaction?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What is the repository pattern, and when does it become useless abstraction?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the repository pattern, and when does it become useless abstraction?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What is the service layer pattern?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the service layer pattern?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'EASY', 'What is dependency injection, and why is it useful?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is dependency injection, and why is it useful?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What is the circuit breaker pattern from an API consumer perspective?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the circuit breaker pattern from an API consumer perspective?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What is the retry pattern, and when does it become dangerous?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the retry pattern, and when does it become dangerous?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you design rate limiting for an API with free and paid tiers?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design rate limiting for an API with free and paid tiers?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'What metadata should you return in paginated responses?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What metadata should you return in paginated responses?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'MEDIUM', 'How do you avoid breaking clients when renaming a field?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do you avoid breaking clients when renaming a field?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you design an idempotency-key mechanism?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you design an idempotency-key mechanism?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'How would you expose eventual consistency to API clients without confusing them?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you expose eventual consistency to API clients without confusing them?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'API_DESIGN', 'HARD', 'A client says your API created duplicate charges after timeout retries. What design failure likely caused that?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'A client says your API created duplicate charges after timeout retries. What design failure likely caused that?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- BACKEND ENGINEER — SECURITY (30 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'What is the difference between authentication and authorization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between authentication and authorization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is the difference between session-based auth and token-based auth?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between session-based auth and token-based auth?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'What is JWT, and what is it good at?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is JWT, and what is it good at?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What are the main weaknesses or risks of JWT-based auth?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What are the main weaknesses or risks of JWT-based auth?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'When is server-side session auth a better choice than JWT?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'When is server-side session auth a better choice than JWT?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'How should passwords be stored?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How should passwords be stored?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Why is plain hashing not enough for passwords?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is plain hashing not enough for passwords?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is salting, and why does it matter?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is salting, and why does it matter?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Why are bcrypt, scrypt, or Argon2 preferred for password hashing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why are bcrypt, scrypt, or Argon2 preferred for password hashing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'What is SQL injection?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is SQL injection?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'How do parameterized queries prevent SQL injection?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do parameterized queries prevent SQL injection?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'What is XSS?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is XSS?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is the difference between stored XSS and reflected XSS?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is the difference between stored XSS and reflected XSS?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is CSRF?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is CSRF?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Why are same-site cookies relevant to CSRF defense?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why are same-site cookies relevant to CSRF defense?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'HARD', 'What is SSRF?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is SSRF?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'HARD', 'How can a backend service accidentally create SSRF risk?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How can a backend service accidentally create SSRF risk?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is command injection?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is command injection?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is path traversal?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is path traversal?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Why must user-uploaded filenames never be trusted directly?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why must user-uploaded filenames never be trusted directly?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'What is least privilege?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is least privilege?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'How should database credentials and API keys be stored?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How should database credentials and API keys be stored?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'EASY', 'Why is hardcoding secrets in source code a severe mistake?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why is hardcoding secrets in source code a severe mistake?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is secret rotation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is secret rotation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'Why should sensitive data usually be encrypted at rest and in transit?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'Why should sensitive data usually be encrypted at rest and in transit?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'What is rate limiting from a security perspective?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What is rate limiting from a security perspective?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'MEDIUM', 'How do you protect login endpoints against brute-force attacks?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How do you protect login endpoints against brute-force attacks?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'HARD', 'What should and should not be logged in authentication systems?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'What should and should not be logged in authentication systems?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'HARD', 'How would you revoke compromised tokens or sessions?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'How would you revoke compromised tokens or sessions?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'BACKEND_ENGINEER', 'SECURITY', 'HARD', 'A backend was breached because an internal admin endpoint was reachable publicly. What basic security controls failed?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'BACKEND_ENGINEER' AND question_text = 'A backend was breached because an internal admin endpoint was reachable publicly. What basic security controls failed?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- DATA SCIENTIST — STATISTICS (80 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a random variable?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a random variable?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'Difference between discrete and continuous variables.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between discrete and continuous variables.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a probability distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a probability distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'Define expectation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Define expectation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'Define variance.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Define variance.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'Relationship between variance and standard deviation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Relationship between variance and standard deviation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is covariance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is covariance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is correlation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is correlation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'Difference between covariance and correlation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between covariance and correlation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is independence?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is independence?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is conditional probability?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is conditional probability?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'State Bayes'' theorem.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'State Bayes'' theorem.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'When is Bayes'' theorem useful?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When is Bayes'' theorem useful?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a normal distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a normal distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Properties of a normal distribution.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Properties of a normal distribution.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is the central limit theorem?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is the central limit theorem?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Why is CLT important in practice?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is CLT important in practice?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a Bernoulli distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a Bernoulli distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a binomial distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a binomial distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Expected value of a binomial distribution.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Expected value of a binomial distribution.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a Poisson distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a Poisson distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'When is Poisson a good approximation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When is Poisson a good approximation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is an exponential distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is an exponential distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'Memoryless property explanation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Memoryless property explanation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a uniform distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a uniform distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is skewness?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is skewness?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is kurtosis?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is kurtosis?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is sampling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is sampling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is sampling bias?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is sampling bias?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a population vs sample?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a population vs sample?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a statistic vs parameter?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a statistic vs parameter?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is an estimator?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is an estimator?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What makes an estimator unbiased?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What makes an estimator unbiased?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is consistency of an estimator?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is consistency of an estimator?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is efficiency of an estimator?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is efficiency of an estimator?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is maximum likelihood estimation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is maximum likelihood estimation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is MAP estimation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is MAP estimation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'Difference between MLE and MAP.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between MLE and MAP.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a confidence interval?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a confidence interval?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Interpret a 95% confidence interval.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Interpret a 95% confidence interval.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is hypothesis testing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is hypothesis testing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is a null hypothesis?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a null hypothesis?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is an alternative hypothesis?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is an alternative hypothesis?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a p-value?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a p-value?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'Common misconception about p-values.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Common misconception about p-values.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is statistical significance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is statistical significance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is Type I error?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Type I error?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is Type II error?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Type II error?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'Tradeoff between Type I and Type II errors.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Tradeoff between Type I and Type II errors.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is statistical power?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is statistical power?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What affects statistical power?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What affects statistical power?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a t-test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a t-test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'When to use a t-test vs z-test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When to use a t-test vs z-test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is ANOVA?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ANOVA?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'When to use ANOVA?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When to use ANOVA?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a chi-square test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a chi-square test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is goodness-of-fit?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is goodness-of-fit?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is overdispersion?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is overdispersion?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is bootstrapping?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is bootstrapping?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Why use bootstrapping?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why use bootstrapping?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is resampling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is resampling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is cross-validation from a statistical view?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is cross-validation from a statistical view?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is bias?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is bias?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is variance in the context of model error?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is variance in the context of model error?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Bias-variance decomposition.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Bias-variance decomposition.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is underfitting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is underfitting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is overfitting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is overfitting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a prior distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a prior distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is a posterior distribution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a posterior distribution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is likelihood?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is likelihood?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is a conjugate prior?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a conjugate prior?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is Bayesian updating?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Bayesian updating?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is Monte Carlo simulation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Monte Carlo simulation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is law of large numbers?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is law of large numbers?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'What is heteroscedasticity?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is heteroscedasticity?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'HARD', 'Why is heteroscedasticity a problem?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is heteroscedasticity a problem?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'What is multicollinearity?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is multicollinearity?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Why is multicollinearity harmful?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is multicollinearity harmful?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'EASY', 'What is correlation vs causation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is correlation vs causation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'STATISTICS', 'MEDIUM', 'Why is correlation not causation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is correlation not causation?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- DATA SCIENTIST — MACHINE_LEARNING (100 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is supervised learning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is supervised learning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is unsupervised learning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is unsupervised learning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is semi-supervised learning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is semi-supervised learning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is reinforcement learning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is reinforcement learning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a feature?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a feature?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a label?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a label?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a training set?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a training set?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a test set?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a test set?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a validation set?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a validation set?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'Why split data into train/test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why split data into train/test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is overfitting in ML?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is overfitting in ML?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is underfitting in ML?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is underfitting in ML?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is generalization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is generalization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is regularization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is regularization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'L1 vs L2 regularization.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'L1 vs L2 regularization.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is linear regression?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is linear regression?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Assumptions of linear regression.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Assumptions of linear regression.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is logistic regression?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is logistic regression?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Why is logistic regression used for classification?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is logistic regression used for classification?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is the sigmoid function?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is the sigmoid function?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is a decision tree?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a decision tree?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is tree depth?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is tree depth?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is pruning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pruning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is a random forest?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a random forest?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Why do random forests reduce overfitting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why do random forests reduce overfitting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is gradient boosting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is gradient boosting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Difference between bagging and boosting.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between bagging and boosting.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is XGBoost?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is XGBoost?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is a support vector machine?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a support vector machine?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is the kernel trick?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is the kernel trick?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is margin in SVM?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is margin in SVM?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is k-nearest neighbors?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is k-nearest neighbors?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'How does K affect KNN?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How does K affect KNN?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is distance metric importance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is distance metric importance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is clustering?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is clustering?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is k-means?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is k-means?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Limitations of k-means.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Limitations of k-means.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is hierarchical clustering?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is hierarchical clustering?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is DBSCAN?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is DBSCAN?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'When is DBSCAN better than k-means?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When is DBSCAN better than k-means?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is dimensionality reduction?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is dimensionality reduction?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is PCA?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is PCA?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What does PCA optimize?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What does PCA optimize?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is explained variance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is explained variance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is feature scaling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is feature scaling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'Why is scaling necessary?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is scaling necessary?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is normalization vs standardization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is normalization vs standardization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is one-hot encoding?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is one-hot encoding?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is label encoding?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is label encoding?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is data leakage?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data leakage?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'Example of data leakage.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Example of data leakage.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is cross-validation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is cross-validation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is k-fold CV?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is k-fold CV?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is stratified sampling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is stratified sampling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is class imbalance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is class imbalance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'How to handle class imbalance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to handle class imbalance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is precision?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is precision?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is recall?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is recall?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is F1 score?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is F1 score?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is accuracy?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is accuracy?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'When is accuracy misleading?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When is accuracy misleading?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is ROC curve?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ROC curve?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is AUC?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is AUC?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'What is confusion matrix?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is confusion matrix?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is log loss?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is log loss?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is hinge loss?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is hinge loss?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is gradient descent?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is gradient descent?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is learning rate?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is learning rate?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What happens if learning rate is too high?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What happens if learning rate is too high?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What happens if learning rate is too low?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What happens if learning rate is too low?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is stochastic gradient descent?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is stochastic gradient descent?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is batch vs mini-batch training?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is batch vs mini-batch training?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is early stopping?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is early stopping?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is hyperparameter tuning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is hyperparameter tuning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is grid search?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is grid search?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is random search?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is random search?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is feature importance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is feature importance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is permutation importance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is permutation importance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is SHAP?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is SHAP?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is model interpretability?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is model interpretability?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is bias in ML models?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is bias in ML models?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is fairness in ML?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is fairness in ML?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is model drift?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is model drift?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is concept drift?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is concept drift?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is data drift?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data drift?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'How do you detect drift?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How do you detect drift?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is ensemble learning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ensemble learning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is stacking?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is stacking?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is blending?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is blending?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is pipeline in ML?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pipeline in ML?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is reproducibility?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is reproducibility?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'EASY', 'Why fix random seeds?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why fix random seeds?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'MEDIUM', 'What is feature selection?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is feature selection?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is wrapper vs filter methods?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is wrapper vs filter methods?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is curse of dimensionality?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is curse of dimensionality?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'Why high dimensions are problematic?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why high dimensions are problematic?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is calibration?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is calibration?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'What is probability calibration?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is probability calibration?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'How to debug a poorly performing model?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to debug a poorly performing model?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'MACHINE_LEARNING', 'HARD', 'A model performs well offline but poorly in production. Why?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'A model performs well offline but poorly in production. Why?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- DATA SCIENTIST — SQL_DATA (60 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is a primary key?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a primary key?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is a foreign key?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a foreign key?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'Difference between INNER and LEFT JOIN.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between INNER and LEFT JOIN.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'Write a query to find duplicates.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Write a query to find duplicates.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'Write a query to remove duplicates.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Write a query to remove duplicates.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is GROUP BY?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is GROUP BY?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is HAVING?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is HAVING?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'Difference between WHERE and HAVING.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between WHERE and HAVING.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is COUNT vs COUNT DISTINCT?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is COUNT vs COUNT DISTINCT?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a subquery?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a subquery?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'Correlated vs non-correlated subquery.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Correlated vs non-correlated subquery.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a window function?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a window function?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is ROW_NUMBER?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ROW_NUMBER?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is RANK vs DENSE_RANK?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is RANK vs DENSE_RANK?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is partitioning in window functions?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is partitioning in window functions?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'Running totals using SQL.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Running totals using SQL.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a CTE?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a CTE?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'When to use a CTE vs subquery?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When to use a CTE vs subquery?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is indexing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is indexing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'When does an index help?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When does an index help?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'When does an index not help?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When does an index not help?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is a full table scan?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a full table scan?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is a join explosion?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a join explosion?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data skew?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data skew?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'How to detect skew in SQL outputs?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to detect skew in SQL outputs?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is NULL handling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is NULL handling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'Difference between NULL and 0.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Difference between NULL and 0.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What does COALESCE do?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What does COALESCE do?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is data cleaning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data cleaning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'How to handle missing data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to handle missing data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is deduplication?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is deduplication?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'EASY', 'What is data aggregation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data aggregation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is pivoting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pivoting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is unpivoting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is unpivoting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is normalization of data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is normalization of data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is denormalization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is denormalization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a fact table?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a fact table?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a dimension table?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a dimension table?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a star schema?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a star schema?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is a snowflake schema?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a snowflake schema?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is ETL?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ETL?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is ELT?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is ELT?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data pipeline?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data pipeline?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is batch processing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is batch processing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is streaming data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is streaming data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'How to handle late arriving data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to handle late arriving data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is idempotent data processing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is idempotent data processing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data consistency?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data consistency?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data integrity?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data integrity?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is schema evolution?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is schema evolution?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is partition pruning?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is partition pruning?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is query optimization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is query optimization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is explain plan?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is explain plan?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is indexing strategy?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is indexing strategy?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is join order importance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is join order importance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data lineage?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data lineage?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'MEDIUM', 'What is data validation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data validation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'What is anomaly detection in data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is anomaly detection in data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'How to debug wrong aggregation results?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to debug wrong aggregation results?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'SQL_DATA', 'HARD', 'A dashboard shows incorrect numbers. Where do you start?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'A dashboard shows incorrect numbers. Where do you start?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- DATA SCIENTIST — EXPERIMENTATION (60 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'EASY', 'What is an A/B test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is an A/B test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'EASY', 'What is control vs treatment?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is control vs treatment?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'EASY', 'What is randomization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is randomization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'Why randomization matters?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why randomization matters?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is sample size?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is sample size?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'How to calculate sample size?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to calculate sample size?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is statistical power in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is statistical power in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is significance level?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is significance level?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is p-hacking?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is p-hacking?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is multiple testing problem?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is multiple testing problem?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is false discovery rate?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is false discovery rate?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is experiment bias?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is experiment bias?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is selection bias?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is selection bias?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is survivorship bias?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is survivorship bias?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is Simpson''s paradox?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Simpson''s paradox?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is metric definition?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is metric definition?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is north star metric?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is north star metric?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is guardrail metric?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is guardrail metric?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is primary vs secondary metric?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is primary vs secondary metric?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'EASY', 'What is conversion rate?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is conversion rate?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'EASY', 'What is uplift?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is uplift?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is lift vs relative change?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is lift vs relative change?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is confidence interval in A/B tests?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is confidence interval in A/B tests?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is sequential testing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is sequential testing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'Why peeking invalidates tests?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why peeking invalidates tests?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is CUPED?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is CUPED?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is variance reduction?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is variance reduction?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is stratification in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is stratification in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is clustering in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is clustering in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is interference between users?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is interference between users?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is network effect in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is network effect in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is novelty effect?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is novelty effect?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is long-term vs short-term effect?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is long-term vs short-term effect?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is experiment duration?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is experiment duration?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is stopping rule?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is stopping rule?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is Bayesian A/B testing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is Bayesian A/B testing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'Frequentist vs Bayesian testing.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Frequentist vs Bayesian testing.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is causal inference?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is causal inference?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is confounding variable?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is confounding variable?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is regression adjustment?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is regression adjustment?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is instrumental variable?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is instrumental variable?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is difference-in-differences?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is difference-in-differences?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is propensity score matching?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is propensity score matching?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is uplift modeling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is uplift modeling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is experiment logging?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is experiment logging?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is data quality in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data quality in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is metric sensitivity?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is metric sensitivity?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is variance of metric?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is variance of metric?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'What is heavy-tailed distribution issue?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is heavy-tailed distribution issue?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is outlier handling in experiments?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is outlier handling in experiments?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is guardrail failure?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is guardrail failure?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is experiment rollback?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is experiment rollback?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is experiment ramp-up?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is experiment ramp-up?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is holdout group?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is holdout group?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is shadow testing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is shadow testing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'What is A/A test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is A/A test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'MEDIUM', 'Why run A/A tests?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why run A/A tests?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'How to debug conflicting experiment results?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to debug conflicting experiment results?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'When should you not run an A/B test?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When should you not run an A/B test?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'EXPERIMENTATION', 'HARD', 'A test shows significance but business impact is zero. Why?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'A test shows significance but business impact is zero. Why?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- DATA SCIENTIST — PYTHON_DATA (50 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is a list vs tuple?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a list vs tuple?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is a dictionary?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a dictionary?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is a set?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a set?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is list comprehension?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is list comprehension?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is generator?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is generator?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'Generator vs list memory usage.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Generator vs list memory usage.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is a DataFrame?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is a DataFrame?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'How to load data into pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to load data into pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'How to handle missing values in pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'How to handle missing values in pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is groupby in pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is groupby in pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is apply vs map?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is apply vs map?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is vectorization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is vectorization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'Why is vectorization faster?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why is vectorization faster?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is NumPy?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is NumPy?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is broadcasting?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is broadcasting?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is shape vs dimension?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is shape vs dimension?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is indexing vs slicing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is indexing vs slicing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is boolean masking?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is boolean masking?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is merge in pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is merge in pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is join in pandas?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is join in pandas?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is concat?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is concat?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is pivot table?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pivot table?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is melt?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is melt?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is data type conversion?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data type conversion?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'Why data types matter for performance?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why data types matter for performance?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'HARD', 'What is memory usage optimization?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is memory usage optimization?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'HARD', 'What is chunking large data?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is chunking large data?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is lazy evaluation?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is lazy evaluation?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is file I/O in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is file I/O in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'CSV vs Parquet differences.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'CSV vs Parquet differences.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is serialization in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is serialization in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is pickle risk?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pickle risk?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is multiprocessing?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is multiprocessing?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is multithreading in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is multithreading in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'HARD', 'Why GIL matters?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why GIL matters?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'HARD', 'When to use multiprocessing over threading?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'When to use multiprocessing over threading?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is logging?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is logging?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is exception handling?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is exception handling?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is debugging in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is debugging in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is virtual environment?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is virtual environment?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'Why dependency management matters?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'Why dependency management matters?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is reproducibility in data workflows?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is reproducibility in data workflows?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'EASY', 'What is random seed?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is random seed?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is pipeline structure in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is pipeline structure in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is modular code?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is modular code?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is unit testing for data code?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is unit testing for data code?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is data validation in Python?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is data validation in Python?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'MEDIUM', 'What is schema enforcement?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'What is schema enforcement?');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'DATA_SCIENTIST', 'PYTHON_DATA', 'HARD', 'A pandas pipeline is slow on large data. What do you optimize first?' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'DATA_SCIENTIST' AND question_text = 'A pandas pipeline is slow on large data. What do you optimize first?');

-- ═══════════════════════════════════════════════════════════════════════════════
-- PRODUCT MANAGER — PRODUCT_SENSE (80 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Design a note-taking app for students.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a note-taking app for students.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Improve WhatsApp for power users.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve WhatsApp for power users.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Design a food delivery app for a small town.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a food delivery app for a small town.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Improve Google Maps for pedestrians.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Maps for pedestrians.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Design a habit tracker for teenagers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a habit tracker for teenagers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve YouTube recommendations.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve YouTube recommendations.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a job search platform for fresh graduates.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a job search platform for fresh graduates.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Uber driver experience.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Uber driver experience.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Design a fitness app for beginners.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a fitness app for beginners.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Instagram Stories.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Instagram Stories.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'EASY', 'Design a budgeting app for university students.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a budgeting app for university students.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Amazon product discovery.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Amazon product discovery.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a messaging app for gamers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a messaging app for gamers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve LinkedIn feed relevance.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve LinkedIn feed relevance.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a travel planner for solo travelers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a travel planner for solo travelers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Spotify playlist creation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Spotify playlist creation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a study group platform.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a study group platform.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve TikTok retention for new users.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve TikTok retention for new users.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a calendar app for busy professionals.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a calendar app for busy professionals.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Airbnb booking flow.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Airbnb booking flow.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a dating app for serious relationships.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a dating app for serious relationships.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Google Search for local queries.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Search for local queries.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a platform for online tutoring.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a platform for online tutoring.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Netflix homepage.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Netflix homepage.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a marketplace for second-hand clothes.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a marketplace for second-hand clothes.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Slack onboarding.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Slack onboarding.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a news app for Gen Z.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a news app for Gen Z.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Zoom meeting experience.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Zoom meeting experience.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a grocery delivery app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a grocery delivery app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Reddit moderation tools.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Reddit moderation tools.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a carpooling app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a carpooling app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Twitter/X conversation quality.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Twitter/X conversation quality.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a productivity tool for engineers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a productivity tool for engineers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Facebook Groups engagement.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Facebook Groups engagement.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a mental health support app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a mental health support app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Apple Maps.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Apple Maps.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a platform for freelancers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a platform for freelancers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Discord server discovery.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Discord server discovery.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a rewards system for a fintech app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a rewards system for a fintech app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Google Docs collaboration.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Docs collaboration.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a parental control app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a parental control app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve eBay seller experience.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve eBay seller experience.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a language learning app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a language learning app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Tinder matching algorithm.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Tinder matching algorithm.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a peer-to-peer lending platform.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a peer-to-peer lending platform.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Deliveroo courier efficiency.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Deliveroo courier efficiency.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a music sharing social network.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a music sharing social network.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Dropbox file organization.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Dropbox file organization.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a platform for event planning.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a platform for event planning.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Pinterest recommendations.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Pinterest recommendations.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a telemedicine platform.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a telemedicine platform.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Stripe onboarding.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Stripe onboarding.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a logistics tracking dashboard.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a logistics tracking dashboard.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Google Photos search.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Photos search.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a loyalty program for airlines.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a loyalty program for airlines.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Microsoft Teams usability.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Microsoft Teams usability.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a real-time collaboration whiteboard.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a real-time collaboration whiteboard.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Snapchat engagement.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Snapchat engagement.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a marketplace for digital assets.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a marketplace for digital assets.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Uber Eats delivery time.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Uber Eats delivery time.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a social network for professionals.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a social network for professionals.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Duolingo retention.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Duolingo retention.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Design a platform for remote work teams.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a platform for remote work teams.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Shopify merchant tools.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Shopify merchant tools.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a ride-sharing system for cities.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a ride-sharing system for cities.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Gmail inbox management.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Gmail inbox management.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a platform for creators to monetize.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a platform for creators to monetize.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Notion usability for beginners.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Notion usability for beginners.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a smart home control app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a smart home control app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'MEDIUM', 'Improve Google Drive search.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Drive search.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a fraud detection UX for fintech users.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a fraud detection UX for fintech users.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve YouTube Shorts monetization.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve YouTube Shorts monetization.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a cloud storage product.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a cloud storage product.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Amazon Prime retention.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Amazon Prime retention.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a healthcare records system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a healthcare records system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Google Assistant usefulness.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Google Assistant usefulness.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a metaverse social platform.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a metaverse social platform.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Tesla app experience.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Tesla app experience.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Design a global remittance app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design a global remittance app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'PRODUCT_SENSE', 'HARD', 'Improve Apple App Store discovery.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Improve Apple App Store discovery.');

-- ═══════════════════════════════════════════════════════════════════════════════
-- PRODUCT MANAGER — ANALYTICAL (60 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'EASY', 'Define success metrics for a food delivery app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define success metrics for a food delivery app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'EASY', 'Measure success of a new feature launch.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Measure success of a new feature launch.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose drop in daily active users.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose drop in daily active users.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'EASY', 'Build a funnel for an e-commerce site.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Build a funnel for an e-commerce site.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Identify north star metric for Spotify.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Identify north star metric for Spotify.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze retention for a mobile game.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze retention for a mobile game.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Explain A/B test results with conflicting metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain A/B test results with conflicting metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose decline in conversion rate.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose decline in conversion rate.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'EASY', 'Define metrics for a messaging app.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for a messaging app.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'EASY', 'Identify leading vs lagging metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Identify leading vs lagging metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze churn in a SaaS product.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze churn in a SaaS product.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Build cohort analysis for users.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Build cohort analysis for users.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate experiment with small sample size.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate experiment with small sample size.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose spike in signups but low retention.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose spike in signups but low retention.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define metrics for Uber drivers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for Uber drivers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze revenue drop in marketplace.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze revenue drop in marketplace.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Interpret retention curves.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Interpret retention curves.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Design experiment for new onboarding flow.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design experiment for new onboarding flow.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Identify metric manipulation risks.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Identify metric manipulation risks.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose drop in session time.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose drop in session time.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define success for a recommendation system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define success for a recommendation system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze funnel leakage points.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze funnel leakage points.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate impact of pricing change.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate impact of pricing change.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Design KPI dashboard.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design KPI dashboard.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose increase in bounce rate.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose increase in bounce rate.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Identify causal vs correlation issues.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Identify causal vs correlation issues.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze user segmentation impact.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze user segmentation impact.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define metrics for social network.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for social network.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate conflicting A/B results.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate conflicting A/B results.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose app crash impact on metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose app crash impact on metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define retention vs engagement tradeoff.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define retention vs engagement tradeoff.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Analyze growth plateau.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze growth plateau.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Design metric for marketplace liquidity.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design metric for marketplace liquidity.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose drop in ad revenue.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose drop in ad revenue.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate experiment validity.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate experiment validity.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze impact of feature removal.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze impact of feature removal.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define metrics for fintech product.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for fintech product.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose low feature adoption.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose low feature adoption.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze seasonal trends.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze seasonal trends.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Identify metric gaming.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Identify metric gaming.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate long-term vs short-term gains.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate long-term vs short-term gains.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Design funnel for subscription product.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design funnel for subscription product.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose drop in NPS.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose drop in NPS.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Analyze virality coefficient.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze virality coefficient.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Define metrics for search engine.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for search engine.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose latency impact on engagement.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose latency impact on engagement.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Evaluate cohort retention differences.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate cohort retention differences.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Analyze LTV vs CAC.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze LTV vs CAC.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Diagnose supply-demand imbalance.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose supply-demand imbalance.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define metrics for content platform.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define metrics for content platform.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate rollout strategy using metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate rollout strategy using metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose decline in referrals.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose decline in referrals.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze effect of UI change.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze effect of UI change.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Define guardrail metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define guardrail metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate experiment with biased sample.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate experiment with biased sample.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose drop in app installs.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose drop in app installs.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Analyze conversion across regions.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Analyze conversion across regions.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Define activation metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Define activation metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'HARD', 'Evaluate experiment stopping criteria.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Evaluate experiment stopping criteria.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'ANALYTICAL', 'MEDIUM', 'Diagnose sudden metric spike.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Diagnose sudden metric spike.');

-- ═══════════════════════════════════════════════════════════════════════════════
-- PRODUCT MANAGER — EXECUTION (50 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'EASY', 'Prioritize features for MVP.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize features for MVP.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'EASY', 'Decide what to build in 2 weeks.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide what to build in 2 weeks.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Tradeoff between speed vs quality.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tradeoff between speed vs quality.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize roadmap with limited engineers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize roadmap with limited engineers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Decide between two competing features.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide between two competing features.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Handle missed deadlines.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle missed deadlines.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Scope down a large feature.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Scope down a large feature.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize bugs vs new features.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize bugs vs new features.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Plan product launch timeline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan product launch timeline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Decide go/no-go for launch.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide go/no-go for launch.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Handle stakeholder disagreement.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle stakeholder disagreement.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize user requests vs business goals.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize user requests vs business goals.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Allocate resources across teams.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Allocate resources across teams.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Decide feature rollout strategy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide feature rollout strategy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Handle urgent production issue.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle urgent production issue.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Balance short-term vs long-term roadmap.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Balance short-term vs long-term roadmap.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize technical debt.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize technical debt.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide metrics vs user feedback conflict.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide metrics vs user feedback conflict.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Plan international expansion.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan international expansion.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize experiments backlog.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize experiments backlog.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Handle team bandwidth constraints.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle team bandwidth constraints.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide kill vs continue product.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide kill vs continue product.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize monetization vs growth.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize monetization vs growth.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Scope feature under tight deadline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Scope feature under tight deadline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Plan beta testing strategy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan beta testing strategy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide API vs UI investment.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide API vs UI investment.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize platform vs feature work.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize platform vs feature work.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Handle conflicting executive requests.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle conflicting executive requests.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Plan migration strategy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan migration strategy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize onboarding improvements.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize onboarding improvements.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide pricing strategy rollout.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide pricing strategy rollout.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Handle regulatory constraint impact.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle regulatory constraint impact.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize cross-team dependencies.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize cross-team dependencies.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Plan feature deprecation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan feature deprecation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Decide experiment sequencing.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide experiment sequencing.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize reliability vs new features.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize reliability vs new features.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Handle roadmap changes mid-quarter.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle roadmap changes mid-quarter.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Plan scaling strategy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan scaling strategy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize personalization features.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize personalization features.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Decide partner integration priority.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide partner integration priority.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Handle data inconsistency issues.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Handle data inconsistency issues.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Plan user feedback incorporation.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan user feedback incorporation.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide UI redesign vs backend rewrite.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide UI redesign vs backend rewrite.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Prioritize accessibility improvements.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize accessibility improvements.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Plan feature rollout globally.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan feature rollout globally.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide product pivot.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide product pivot.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize security improvements.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize security improvements.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'MEDIUM', 'Plan cross-platform consistency.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Plan cross-platform consistency.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Decide build vs buy.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Decide build vs buy.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'EXECUTION', 'HARD', 'Prioritize experimentation vs stability.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Prioritize experimentation vs stability.');

-- ═══════════════════════════════════════════════════════════════════════════════
-- PRODUCT MANAGER — TECHNICAL (50 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design URL shortener.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design URL shortener.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design news feed system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design news feed system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'EASY', 'Explain how APIs work.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain how APIs work.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design chat system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design chat system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain database indexing.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain database indexing.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design file storage system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design file storage system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain caching strategies.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain caching strategies.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design notification system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design notification system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain load balancing.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain load balancing.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design search system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design search system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain REST vs GraphQL.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain REST vs GraphQL.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design recommendation system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design recommendation system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain eventual consistency.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain eventual consistency.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design payment system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design payment system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain rate limiting.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain rate limiting.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design logging system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design logging system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain database sharding.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain database sharding.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design video streaming system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design video streaming system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain CDN.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain CDN.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design authentication system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design authentication system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain message queues.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain message queues.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design ride-sharing backend.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design ride-sharing backend.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain microservices vs monolith.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain microservices vs monolith.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design analytics pipeline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design analytics pipeline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain fault tolerance.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain fault tolerance.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design email system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design email system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain CAP theorem.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain CAP theorem.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design collaborative editing system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design collaborative editing system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain API versioning.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain API versioning.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design caching layer.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design caching layer.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain SQL vs NoSQL.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain SQL vs NoSQL.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design image hosting system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design image hosting system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain data replication.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain data replication.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design fraud detection system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design fraud detection system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain latency vs throughput.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain latency vs throughput.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design leaderboard system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design leaderboard system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain circuit breakers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain circuit breakers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design real-time bidding system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design real-time bidding system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain observability.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain observability.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Design location tracking system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design location tracking system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain consistency models.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain consistency models.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design feature flag system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design feature flag system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain horizontal vs vertical scaling.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain horizontal vs vertical scaling.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design queue processing system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design queue processing system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Explain data pipelines.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain data pipelines.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design metrics collection system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design metrics collection system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain service discovery.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain service discovery.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design backup system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design backup system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'HARD', 'Explain distributed locks.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Explain distributed locks.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'TECHNICAL', 'MEDIUM', 'Design API gateway.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Design API gateway.');

-- ═══════════════════════════════════════════════════════════════════════════════
-- PRODUCT MANAGER — BEHAVIORAL (40 questions)
-- ═══════════════════════════════════════════════════════════════════════════════

INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Tell me about a conflict you handled.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a conflict you handled.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Describe a failure.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a failure.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Tell me about leadership experience.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about leadership experience.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a difficult stakeholder.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a difficult stakeholder.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you disagreed.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you disagreed.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you took ownership.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you took ownership.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a missed deadline.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a missed deadline.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Describe a time you influenced without authority.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you influenced without authority.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Tell me about a time you failed a team.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you failed a team.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe handling ambiguity.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe handling ambiguity.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Tell me about a time you learned quickly.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you learned quickly.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a tough decision.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a tough decision.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you said no.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you said no.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you handled pressure.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you handled pressure.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you improved a process.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you improved a process.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe working with engineers.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe working with engineers.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Tell me about a time you handled feedback.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you handled feedback.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you led a project.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you led a project.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you managed conflict.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you managed conflict.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you delivered impact.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you delivered impact.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Tell me about a time you failed to deliver.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you failed to deliver.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you made a tradeoff.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you made a tradeoff.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Tell me about a time you challenged authority.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you challenged authority.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you motivated others.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you motivated others.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you handled criticism.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you handled criticism.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you worked cross-functionally.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you worked cross-functionally.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'EASY', 'Tell me about a time you adapted.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you adapted.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you solved a hard problem.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you solved a hard problem.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you managed priorities.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you managed priorities.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you dealt with uncertainty.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you dealt with uncertainty.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Tell me about a time you led without title.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you led without title.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Describe a time you fixed a broken system.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you fixed a broken system.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Tell me about a time you handled failure publicly.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you handled failure publicly.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Describe a time you made a risky decision.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you made a risky decision.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you improved metrics.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you improved metrics.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Describe a time you aligned stakeholders.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you aligned stakeholders.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you resolved ambiguity.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you resolved ambiguity.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Describe a time you handled conflict in team.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you handled conflict in team.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'MEDIUM', 'Tell me about a time you delivered under constraints.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Tell me about a time you delivered under constraints.');
INSERT INTO question_bank (role, topic, difficulty, question_text) SELECT 'PRODUCT_MANAGER', 'BEHAVIORAL', 'HARD', 'Describe a time you owned a product outcome.' WHERE NOT EXISTS (SELECT 1 FROM question_bank WHERE role = 'PRODUCT_MANAGER' AND question_text = 'Describe a time you owned a product outcome.');
