
# MySQL Setup on AWS EC2 Linux

This guide outlines the steps to install and configure MySQL on an AWS EC2 instance running Red Hat Enterprise Linux 9, as well as perform basic database operations, user setup, and data import.

## Table of Contents
- [Instance Setup](#instance-setup)
- [MySQL Installation and Configuration](#mysql-installation-and-configuration)
- [Database Setup](#database-setup)
- [Importing Data from CSV](#importing-data-from-csv)
- [MySQL Operations](#mysql-operations)
- [Optimizing MySQL](#optimizing-mysql)

### Instance Setup

1. **Launch AWS EC2 Instance**: 
   - Use Amazon Red Hat Enterprise Linux 9 as the AMI.
   - Instance type: `t2.micro`.

2. **Security Groups**:
   - Configure Security Groups to allow **SSH access (port 22)** and **MySQL access (port 3306)** only from trusted IPs.

3. **Connect to EC2 Instance**:
   - Connect via SSH to the instance.

### MySQL Installation and Configuration

1. **Update Packages**:
   ```bash
   sudo dnf update
   ```

2. **Install MySQL Server**:
   ```bash
   sudo dnf install mysql-server
   ```

3. **Enable MySQL Service**:
   - Start and enable MySQL to run on startup:
     ```bash
     sudo systemctl enable --now mysqld
     ```

4. **Secure MySQL Installation**:
   ```bash
   sudo mysql_secure_installation
   ```

5. **Access MySQL**:
   - Log in as the root user:
     ```bash
     mysql -u root -p
     ```

6. **Add MySQL to PATH** (optional):
   - Update the `.bashrc` to add MySQL commands to PATH:
     ```bash
     echo 'export PATH=$PATH:/usr/local/mysql/bin' >> ~/.bashrc
     source ~/.bashrc
     ```

### Database Setup

1. **Create Database**:
   ```sql
   CREATE DATABASE hms_training;
   ```

2. **Create User and Grant Permissions**:
   ```sql
   CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
   GRANT ALL PRIVILEGES ON hms_training.* TO 'your_username'@'localhost';
   FLUSH PRIVILEGES;
   ```

### Importing Data from CSV

1. **Prepare CSV Data**:
   - Create or upload the `transaction_detail.csv` file:
     ```bash
     cat <<EOL > /home/ec2-user/transaction_detail.csv
     transaction_date,amount,description
     2024-07-01,100.50,Purchase of goods
     2024-07-02,75.20,Payment received
     2024-07-03,150.75,Expense reimbursement
     EOL
     ```

2. **Set Permissions on CSV File**:
   ```bash
   sudo chmod 644 /home/ec2-user/transaction_detail.csv
   ```

3. **Load CSV Data into MySQL**:
   - Enable local file loading:
     ```bash
     mysql --local-infile=1 -u your_username -p
     ```
   - Use `LOAD DATA` command to import data.

### MySQL Operations

1. **Create Table**:
   ```sql
   CREATE TABLE TRANSACTION_DETAIL (
     transaction_date DATE,
     amount DECIMAL(10, 2),
     description VARCHAR(255)
   );
   ```

2. **Query Example**:
   - Calculate the total credit amount:
     ```sql
     SELECT SUM(CREDIT_AMOUNT) AS Total_Credit_Amount
     FROM TRANSACTION_DETAIL
     WHERE SOURCE_ADDRESS = 'cargills'
       AND SUBSCRIBER_TYPE = 'POST'
       AND STATUS = 3;
     ```

3. **Create Temporary Table**:
   ```sql
   CREATE TEMPORARY TABLE temp_transaction_detail
   SELECT * FROM TRANSACTION_DETAIL LIMIT 200;
   ```

### Optimizing MySQL

1. **Update MySQL Configuration**:
   - Edit `/etc/my.cnf` to set important parameters:
     ```ini
     [mysqld]
     innodb_buffer_pool_size = 512M
     innodb_log_file_size = 256M
     ```

2. **Restart MySQL**:
   ```bash
   sudo systemctl restart mysqld
   ```

3. **Analyze Query Execution**:
   - Use `EXPLAIN` to identify performance bottlenecks and create indexes as needed.

