#!/bin/bash
yum install httpd -y
echo "Subnet For Firewall: ${firewall_subnets}" >> /var/www/html/index.html
service httpd start
chkconfig httpd on