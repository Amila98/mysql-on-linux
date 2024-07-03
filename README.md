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

