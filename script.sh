#!/bin/bash

yum install python -y
yum install epel-release -y
yum install ansible -y
yum install git -y

git clone https://github.com/friveram/finalprojectdevops.git
ansible-playbook finalprojectdevops/playbooks/wordpress_playbook.yml

DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=0913cc4f2c24c1932d5e4db42f047a4d DD_SITE="us5.datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

cp finalprojectdevops/configfiles/httpd.conf /etc/httpd/conf
cp finalprojectdevops/configfiles/datadog.yaml /etc/datadog-agent
cp finalprojectdevops/configfiles/conf.yaml /etc/datadog-agent/conf.d/apache.d

systemctl restart httpd
systemctl restart datadog-agent

chmod 655 -R /var/log/httpd

#echo linea dummy