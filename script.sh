#!/bin/bash
sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
sudo wget -P /root https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
rpm -i /root/nginx-1.*
sudo wget -P /root https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
sudo unzip /root/OpenSSL_1_1_1-stable.zip
sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
sudo systemctl start nginx

##создаем свой репозиторий
sudo mkdir /usr/share/nginx/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/
sudo wget -P /root https://downloads.percona.com/downloads/percona-distribution-mysql-ps/percona-distribution-mysql-ps-8.0.28/binary/redhat/8/x86_64/percona-orchestrator-3.2.6-2.el8.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-2.el8.x86_64.rpm
sudo createrepo /usr/share/nginx/html/repo/
sudo sed -e 10"s/^/autoindex on;\n/" -i /etc/nginx/conf.d/default.conf
sudo nginx -s reload
sudo sh -c 'cat > /etc/yum.repos.d/otus.repo <<  EOF
[otus]
name=otus-linux
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF'
yum install percona-orchestrator.x86_64 -y
