#!/usr/bin/env bash

PYTHON_VERSION="python"
PIP_COMMAND="pip"
if [ "$1" == "python2" ]; then
	printf "Using python version 2"
elif [ "$1" == "python3" ]; then
	PYTHON_VERSION="python3"
	PIP_COMMAND="pip3"
	printf "Using python version 3"
else
	printf "Unknonw python version string... Default to python 2"
fi

printf "*** Provisioning base django development machine ***"

printf "*** Updating ubuntu software repositories..."
apt-get update > /dev/null
printf " Done\n"

printf "*** Installing base packages\n"

printf " 1. base utils: unzip ack-grep vim tmux curl wget build-essential..."
sudo apt-get install -y unzip ack-grep vim tmux curl wget build-essential > /dev/null
printf " Done\n"

printf " 2. python-software-properties python-dev python-pip..."
sudo apt-get install -y ${PYTHON_VERSION}-software-properties ${PYTHON_VERSION}-dev ${PYTHON_VERSION}-pip > /dev/null
printf " Done\n"

printf " 3. virtualenv..."
sudo ${PIP_COMMAND} install virtualenv > /dev/null
printf " Done\n"

printf " 4. virtualenvwrapper"
sudo ${PIP_COMMAND} install virtualenvwrapper > /dev/null
echo "# virtualenvwrapper settings" >> /home/vagrant/.profile
echo "export WORKON_HOME=/vagrant/.virtualenvs" >> /home/vagrant/.profile
echo "export PROJECTS_HOME=/vagrant" >> /home/vagrant/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.profile
printf " Done\n"

printf " 5. git..."
sudo apt-get install git > /dev/null
printf " Done\n"



