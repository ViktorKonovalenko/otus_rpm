# otus_rpm
Домашнее задание<br>
1) Создать свой RPM пакет (можно взять свое приложение, либо собрать, например, апач с определенными опциями)<br>
2) Создать свой репозиторий и разместить там ранее собранный RPM

РЕШЕНИЕ<br>
Запускаем Vagrant
```vagrant up ```
С помощью скрипта будут проделаны все шаги по сборке пакета и созданию repo

```

#!/bin/bash
###Создать свой RPM пакет
sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
sudo wget -P /root https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
rpm -i /root/nginx-1.*
sudo wget -P /root https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stabl>
sudo unzip /root/OpenSSL_1_1_1-stable.zip
sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
sudo systemctl start nginx

##создаем свой репозиторий
sudo mkdir /usr/share/nginx/html/repo
sudo cp /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/
sudo wget -P /root https://downloads.percona.com/downloads/percona-distribution-mysql-ps/per>
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

```
