# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "generic/centos8" 
# config.vm.box_version = "2004.01" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 1024 
 v.cpus = 2
 end 
 config.vm.define "rpm" do |rpm| 
 rpm.vm.network "private_network", ip: "192.168.56.10",  virtualbox__intnet: "net1" 
 rpm.vm.hostname = "rpm" 
 end 
config.vm.provision :shell, :path => "script.sh"
#config.vm.provision "shell", inline: <<SHELL
#sudo yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils gcc
#sudo wget -P /root https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
#rpm -i /root/nginx-1.20.2-1.el8.ngx.src.rpm
#sudo wget -P /root https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
#sudo unzip /root/OpenSSL_1_1_1-stable.zip
#sudo yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
#rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
#sudo yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
#sudo systemctl start nginx
#sudo mkdir /usr/share/nginx/html/repo
#sudo cp rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/
#sudo wget https://downloads.percona.com/downloads/percona-distribution-mysql-ps/percona-distribution-mysql-ps-8.0.28/binary/redhat/8/x86_64/percona-orchestrator-3.2.6-2.el8.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-2.el8.x86_64.rpm
#sudo createrepo /usr/share/nginx/html/repo/
#sudo sed -e 10"s/^/autoindex on;\n/" -i /etc/nginx/conf.d/default.conf
#sudo nginx -s reload
#sudo sh -c 'cat > /etc/yum.repos.d/otus.repo <<  EOF
#[otus]
#name=otus-linux
#baseurl=http://localhost/repo
#gpgcheck=0
#enabled=1
#EOF'
#yum install percona-orchestrator.x86_64 -y



#SHELL
end 

