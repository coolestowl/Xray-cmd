docker run -d -p 2333:2333 --name xray --restart=unless-stopped -v /root/conf:/etc/xray -v /root/certs:/certs teddysun/xray
