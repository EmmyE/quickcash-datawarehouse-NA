-- Quickcash Dimensional Data Warehouse

-- Create schema first
CREATE SCHEMA IF NOT EXISTS staging; --raw data
CREATE SCHEMA IF NOT EXISTS dim;
CREATE SCHEMA IF NOT EXISTS fact;
CREATE SCHEMA IF NOT EXISTS reports;

--CREATE BANKING TRANSACTIONS TABLE
CREATE TABLE banking_transactions (
transaction_id VARCHAR(20),
customer_id VARCHAR(20),
cu
)

ALTER TABLE fact.transactions ADD PRIMARY KEY (transaction_sk);

ALTER TABLE fact.transactions ADD PRIMARY KEY (transaction_sk)
ADD CONSTRAINT fk_customer FOREIGN KEY (customer_sk) REFERENCES dim.customer(customer_sk);

ALTER TABLE fact.transactions ADD PRIMARY KEY (transaction_sk)
ADD CONSTRAINT fk_service FOREIGN KEY (service_sk) REFERENCES dim.customer(service_sk);

ALTER TABLE fact.transactions ADD PRIMARY KEY (transaction_sk)
ADD CONSTRAINT fk_channel FOREIGN KEY (channel_sk) REFERENCES dim.customer(channel_sk);

ALTER TABLE fact.transactions ADD PRIMARY KEY (transaction_sk)
ADD CONSTRAINT fk_date FOREIGN KEY (date_sk) REFERENCES dim.customer(date_sk);

--performance optimization
CREATE INDEX idx_fact_customer ON fact.transactions (customer_sk);
CREATE INDEX idx_fact_service ON fact.transactions(service_sk);
CREATE INDEX idx_fact_channel ON fact.transactions(channel_sk);
CREATE INDEX idx_fact_date ON fact.transactions(date_sk);

CREATE INDEX idx_customer ON dim.customer (customer_sk, customer_id);

-SECURITY and access control
CREATE ROLE quickcash_finance_team;

CREATE USER finance WITH PASSWORD '********';

GRANT quickcashcash_finance_team TO finance;

GRANT SELECT ON fact.transactions TO quickcash_finance_team;
CREATE ROLE quickcash_marketing_team;
