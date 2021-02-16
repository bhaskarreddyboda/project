#!/bin/sh
cat>>/etc/hosts<<EOF
172.31.25.251 master.example.com
172.31.22.49  slave.example.com
EOF
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
yum install puppet -y
cat >> /etc/puppetlabs/puppet/puppet.conf <<EOF
dns_alt_name=master.example.com
EOF
sudo systemctl start  puppet

