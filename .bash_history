sudo dnf update
sudo dnf install mysql-server
sudo systemctl enable --now mysqld
sudo mysql_secure_installation
sudo mysql
mysql -u root -p
sudo systemctl enable mysqld
nano ~/.bashrc
[ec2-user@ip-172-31-31-155 ~]$ nano ~/.bashrc
-bash: nano: command not found
[ec2-user@ip-172-31-31-155 ~]$
vi ~/.bashrc
source ~/.bashrc
[ec2-user@ip-172-31-31-155 ~]$ source ~/.bashrc
-bash: /home/ec2-user/.bashrc: line 52: syntax error: unexpected end of file
[ec2-user@ip-172-31-31-155 ~]$
vi ~/.bashrc
clear
vi ~/.bashrc
source ~/.bashrc
which mysql
vi ~/.bashrc
source ~/.bashrc
which mysql
mysql -u root
mysql -u root -p
mysql -u Fildon23 -p
mysql -u root -p
mysql -u Fildon23 -p
cat <<EOL > /home/ec2-user/transaction_detail.csv
transaction_date,amount,description
2024-07-01,100.50,Purchase of goods
2024-07-02,75.20,Payment received
2024-07-03,150.75,Expense reimbursement
EOL

mysql -u Fildon23 -p
mysql -u root -p
mysql -u Fildon23 -p
ls -l /home/ec2-user/transaction_detail.csv
sudo chmod 644 /home/ec2-user/transaction_detail.csv
mysql -u root -p
mysql --local-infile=1 -u Fildon23 -p
