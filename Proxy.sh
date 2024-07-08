#!/bin/bash

echo "Please enter [Proxy Web or IP Address] for HTTP: "
read HTTP

echo "Please enter [Port Number] for HTTP: "
read HTTP_Port

echo "Please enter username: "
read username

echo "Please enter password: "
read password

echo "export HTTP_PROXY="$username:$password@$HTTP:$HTTP_Port"" >> /etc/environment
sleep 1
echo "Ubuntu HTTP Proxy set up ✔"
echo "Acquire::http::Proxy "http://$username:$password@$HTTP:$HTTP_Port";" >> /etc/apt/apt.conf
sleep 1
echo "Apt HTTP Proxy set up ✔"
git config --global http.proxy http://$username:$password@$HTTP:$HTTP_Port
sleep 1
echo "Git HTTP Proxy set up ✔"
mkdir -p /etc/systemd/system/docker.service.d
echo "[Service]" >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo "Environment="HTTP_PROXY=http://$HTTP:$HTTP_Port/"" >> /etc/systemd/system/docker.service.d/http-proxy.conf
sleep 1
echo "Docker HTTP Proxy set up ✔"
echo "Restarting Docker Services..."
echo -ne '>>>                       [20%]\r'
sleep 0.5
echo -ne '>>>>>>>                   [40%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>            [60%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
echo -ne '\n'
systemctl daemon-reload
service docker restart
echo "Docker Services restarted ✔"

echo "Please enter [Proxy Web or IP Address] for HTTPS: "
read HTTPS

echo "Please enter [Port Number] for HTTPS: "
read HTTPS_Port

echo "export HTTPS_PROXY="$username:$password@$HTTPS:$HTTPS_Port"" >> /etc/environment
sleep 1
echo "Ubuntu HTTPS Proxy set up ✔"
echo "Acquire::https::Proxy "http://$username:$password@$HTTPS:$HTTPS_Port";" >> /etc/apt/apt.conf
sleep 1
echo "Apt HTTPS Proxy set up ✔"
sleep 1
echo "Git HTTPS Proxy set up ✔"
mkdir -p /etc/systemd/system/docker.service.d
echo "Environment="HTTPS_PROXY=http://$HTTPS:$HTTPS_Port/"" >> /etc/systemd/system/docker.service.d/http-proxy.conf
sleep 1
echo "Docker HTTPS Proxy set up ✔"
echo "Restarting Docker Services..."
echo -ne '>>>                       [20%]\r'
sleep 0.5
echo -ne '>>>>>>>                   [40%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>            [60%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
sleep 0.5
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
echo -ne '\n'
systemctl daemon-reload
service docker restart
echo "Docker Services restarted ✔"
sleep 1
echo "The necessary proxy settings have been applied for the start."
sleep 0.5
echo "Applied proxy settings: For Ubuntu, Apt, Git, Docker, Pip services."
sleep 0.5
echo "You need to make the necessary proxy settings yourself for other online services you want to use."
sleep 0.5
echo "Good day, good luck. "
sleep 0.5
apt-get -qq install lolcat
echo "This script written by Hakan Uskan ☺" | lolcat -as 20
