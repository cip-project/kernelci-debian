#! /bin/sh
# Copyright (C) 2017, Codethink, Ltd., Don Brown <don.brown@codethink.co.uk>
# SPDX-License-Identifier:	Apache-2.0
# Configure KernelCI for 'Single Developer at Desk with Board' Use Case
echo "START: configure_singledev.sh"

# To make KernelCI Server available to host machine
# Add host to /srv/kernelci-frontend/app/server.py
sudo sed -ie 's/app.run(thread/app.run(host='\''0.0.0.0'\'', thread/g' /srv/kernelci-frontend/app/server.py

# To Make KernelCI use the local machine for the "KernelCI Storage Server"
# 1. Add this line in Vagrantfile, where ports are forwarded:
# Make FILE_SERVER_URL point to 'http://localhost:8000/' instead of 'localhost'.
sudo sed -ie "/FILE_SERVER_URL/s/localhost/localhost:8000\//g" /etc/linaro/kernelci-frontend.cfg

# 2. The first is /etc/linaro/kernelci-frontend.cfg:
# Make FILE_SERVER_URL point to "http://127.0.0.1:8000/" instead of "127.0.0.1".
sudo sed -ie "/FILE_SERVER_URL/s/127.0.0.1/127.0.0.1:8000/g" /srv/kernelci-frontend/app/dashboard/default_settings.py

# 3. Run the fileserver from the directory that has artifacts:
# cd /var/www/images/kernel-ci
# python -m SimpleHTTPServer 8000 &
# pushd /var/www/images/kernel-ci; python -m SimpleHTTPServer &; popd

# Start the webserver to run in the background
# /vagrant/scripts/start_webserver.sh &

echo "END: configure_singledev.sh"
