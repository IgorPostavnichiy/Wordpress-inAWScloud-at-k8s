#!/bin/bash

kubectl exec -i service/mysql -- mysql -u root -p1234 -e "\
    CREATE DATABASE IF NOT EXISTS ddd_test; \
    USE ddd_test; \
    CREATE TABLE IF NOT EXISTS test_table (id INT PRIMARY KEY, name VARCHAR(50)); \
    INSERT IGNORE INTO test_table (id, name) VALUES (1, 'Igor'), (2, 'TEST'), (3, 'AWS'); \
    Show databases;"