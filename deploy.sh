# on server

# TODO: sed -i // /etc/ssh/sshd_config # deny password login
# systemctl restart sshd.service

apt update && apt install docker.io

reboot

# upload config files TODO: generate config file with random parameters

cd /root && tar -xzvf hhh.tar.gz

docker run -d -p 2333:2333 --name xray --restart=unless-stopped -v /root/conf:/etc/xray -v /root/certs:/certs teddysun/xray
