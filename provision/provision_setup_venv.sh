#!/usr/bin/env bash

#this provision script should be run with the privileged flag set to 'false' in the Vagrantfile

printf "*** setup virtual python environment ***"

# virtualenvwrapper settings
export WORKON_HOME=/vagrant/.virtualenvs
export PROJECT_HOME=/vagrant
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv $1_env --always-copy
setvirtualenvproject $VIRTUAL_ENV /vagrant

printf "*** Installing python packages ***\n"

printf "   1. django..."
pip install django > /dev/null
printf " Done\n"

printf " Done\n"