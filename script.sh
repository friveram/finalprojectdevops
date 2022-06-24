#!/bin/bash

yum install python -y
yum install epel-release -y
yum install ansible -y
yum install git -y

git clone https://github.com/friveram/tests-do.git
ansible-playbook tests-do/playbooks/wordpress_playbook.yml

DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=0913cc4f2c24c1932d5e4db42f047a4d DD_SITE="us5.datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"