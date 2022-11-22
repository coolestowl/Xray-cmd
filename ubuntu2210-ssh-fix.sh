#!/bin/bash

cat > /etc/systemd/system/ssh.socket.d/listen.conf << EOF
[Socket]
ListenStream=
ListenStream=22
EOF

systemctl enable ssh.socket sshd.service
systemctl daemon-reload
systemctl start ssh.socket ssh.service
