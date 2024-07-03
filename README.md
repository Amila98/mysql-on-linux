Detail explanation of the process

Startup Service:
Added MySQL service to startup.

Command Accessibility:
Made MySQL command accessible from anywhere in the OS.

Root Password Reset:
Reset password of root user.

Database Creation:
Created database named 'hms_training'

User and Permissions:
Created a database user with appropriate permissions, accessible only from my account and machine.

Table Creation and Data Loading:
Created TRANSACTION_DETAIL table using provided SQL script and loaded the CSV dump.

Query Optimization:
Developed and optimized a query to retrieve total CREDIT_AMOUNT from TRANSACTION_DETAIL table meeting specified criteria, ensuring execution time < 3 seconds using indexing techniques.

Temporary Table Creation:
Created a temporary table and inserted the first 200 entries from TRANSACTION_DETAIL table.

MySQL Configuration:
Identified configuration parameters under my.cnf and reviewed MySQL variables.

InnoDB Buffer Memory and Log File Size Adjustment:
Increased InnoDB buffer memory to 512 MB and adjusted InnoDB log file size as recommended.

AWS EC2 Instance Details
Instance ID: i-048f9bdc89aae561c
Public IPv4 Address: 35.160.43.118
Private IPv4 Address: 172.31.31.155
Platform: Red Hat Enterprise Linux 9
Instance Type: t2.micro
AMI ID: ami-0423fca164888b941



Here Some MySQL Scripts

Installed MySQL 8.0.36 on AWS EC2 instance using Redhat Linux9

Database and User Management:
Created the hms_training database:


CREATE DATABASE hms_training;
Created a database user and granted permissions:
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON hms_training.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
Table Creation and Data Import:

Created the TRANSACTION_DETAIL table:

CREATE TABLE TRANSACTION_DETAIL (
    transaction_date DATE,
    amount DECIMAL(10,2),
    description VARCHAR(255)
);
Loaded data from transaction_detail.csv into the table:

LOAD DATA INFILE '/path/to/transaction_detail.csv'
INTO TABLE TRANSACTION_DETAIL
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SQL Queries and Optimization:

Query to retrieve total CREDIT_AMOUNT meeting specific conditions:

SELECT SUM(CREDIT_AMOUNT) AS Total_Credit_Amount
FROM TRANSACTION_DETAIL
WHERE SOURCE_ADDRESS = 'cargills'
AND SUBSCRIBER_TYPE = 'POST'
AND OBJECT_TYPE = 'hsenidmobile.mrecharge.model.IPGRemoteMerchantTransactionDetail'
AND STATUS = 3
AND REMOTE_TRX_CREATED_TIME BETWEEN '2011-05-01' AND '2012-12-31';
Indexing for optimization:

CREATE INDEX idx_source_subscriber_object_status_time
ON TRANSACTION_DETAIL (SOURCE_ADDRESS, SUBSCRIBER_TYPE, OBJECT_TYPE, STATUS, REMOTE
