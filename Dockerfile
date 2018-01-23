FROM centos:7

RUN yum -y install vim && \
	yum -y install epel-release && \
	yum -y install python34 && \ 
	yum -y install python2-pip && \
	yum -y install python34-pip && \
	yum -y install git && \
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
	pip2 install ntc-ansible && \
	ansible-galaxy install Juniper.junos && \
	mkdir -p /usr/share/ansible/plugins/modules && \
	cd /usr/share/ansible/plugins/modules && \
	git clone https://github.com/networktocode/ntc-ansible --recursive && \
	git config --global http.sslverify false

RUN chgrp -R 0 /home && \
    chmod -R g=u /home && \
    touch /.viminfo && \
    chmod -R g=u /.viminfo

WORKDIR /home

USER 1001
