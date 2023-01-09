#!/bin/bash

mkdir -p /etc/systemd/system/ssh.socket.d
cat > /etc/systemd/system/ssh.socket.d/listen.conf << EOF
[Socket]
ListenStream=2222
EOF

ufw delete allow 22/tcp
ufw allow 2222/tcp

systemctl daemon-reload
systemctl enable ssh.socket ssh.service
reboot
