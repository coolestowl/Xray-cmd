#!/bin/bash

mkdir -p /etc/systemd/system/ssh.socket.d
cat > /etc/systemd/system/ssh.socket.d/listen.conf << EOF
[Socket]
ListenStream=
ListenStream=22
EOF

systemctl daemon-reload
systemctl restart ssh.socket ssh.service
systemctl enable ssh.socket ssh.service
