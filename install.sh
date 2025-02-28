#!/bin/bash

output_file="danted.conf"

echo "logoutput: syslog" > "$output_file"
echo "logoutput: stderr" >> "$output_file"
echo "internal: 0.0.0.0 port = 1080" >> "$output_file"
echo "external: eth0" >> "$output_file"
echo "socksmethod: username" >> "$output_file"
echo "method: username" >> "$output_file"
echo "user.privileged: root" >> "$output_file"
echo "user.unprivileged: nobody" >> "$output_file"
echo "client pass {" >> "$output_file"
echo "        from: 0.0.0.0/0 to: 0.0.0.0/0" >> "$output_file"
echo "        socksmethod: username" >> "$output_file"
echo "}" >> "$output_file"
echo "socks pass {" >> "$output_file"
echo "        from: 0.0.0.0/0 to: 0.0.0.0/0" >> "$output_file"
echo "        protocol: tcp udp" >> "$output_file"
echo "}" >> "$output_file"

cat "$output_file"

sudo apt install dante-server -y
sudo cp danted.conf /etc/danted.conf
sudo systemctl restart danted
sudo systemctl enable danted
