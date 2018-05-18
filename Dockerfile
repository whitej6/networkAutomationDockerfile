FROM centos:7

RUN yum -y install vim && \
	yum -y install epel-release && \
	yum -y install python34 && \ 
	yum -y install python2-pip && \
	yum -y install python34-pip && \
	yum -y install python-devel && \
	yum -y install python34-devel && \
	yum -y install gcc && \
	yum -y install gcc-c++ && \
	yum -y install git && \
        yum -y install ftp && \
	yum -y install scp %% \
	yum -y install sl && \
	yum -y install cowsay && \
	pip2 install --upgrade pip && \
        pip3 install --upgrade pip && \
        pip2 install netmiko && \
        pip3 install netmiko && \
        pip2 install ansible && \
	pip2 install jinja2 && \
	pip3 install jinja2 && \ 
	pip2 install Requests && \ 
	pip3 install Requests && \
	pip2 install suds && \
	pip3 install suds-py3 && \
	pip2 install infoblox-client && \
	pip3 install infoblox-client && \
	pip2 install pymssql && \
	pip3 install pymssql && \
	pip2 install pymysql && \
	pip3 install pymysql && \
	pip2 install junos-eznc && \
	pip3 install junos-eznc && \
	pip2 install requests_ntlm && \
	pip3 install requests_ntlm && \
	pip2 install napalm-ansible && \
	pip2 install xmltodict && \
	pip3 install xmltodict && \
	pip2 install pymongo && \
	pip3 install pymongo && \
	pip2 install ntc-ansible && \
	pip2 install python-gitlab && \
	pip3 install python-gitlab && \
	pip2 install jxmlease && \
	pip3 install jxmlease && \
	useradd -m automationUser && \
	mkdir -p /usr/share/ansible/roles && \	
	ansible-galaxy install Juniper.junos -p /usr/share/ansible/roles && \
	mkdir -p /usr/share/ansible/plugins/modules && \
	cd /usr/share/ansible/plugins/modules && \
	git clone https://github.com/networktocode/ntc-ansible --recursive

#Create ansible cfg file
RUN mkdir -p /etc/ansible && \
    touch /etc/ansible/ansible.cfg && \
	echo $'[defaults] \nhost_key_checking = False \nretry_files_enabled = False \nhash_behaviour = merge' > /etc/ansible/ansible.cfg
	
WORKDIR /home/automationUser

USER automationUser

RUN git config --global http.sslverify false
