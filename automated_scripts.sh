
mkdir -p ~/.config/systemd/user
touch ~/.config/systemd/user/my-service.service



echo '[Unit]
Description=My custom startup script
PartOf=graphical-session.target
# After=network.target
# After=systemd-user-sessions.service
# After=network-online.target

[Service]
# User=nero
# Type=simple
# PIDFile=/run/my-service.pid
ExecStart=/bin/bash /home/nero/test.sh start
#  sleep 3; notify-send "Make a Backup"
# ExecReload=/home/nero/test.sh reload
# ExecStop=/home/nero/test.sh stop
# TimeoutSec=30
# Restart=on-failure
# RestartSec=30
# StartLimitInterval=350
# StartLimitBurst=10



[Install]
WantedBy=graphical-session.target
WantedBy=multi-user.target' >> 'my-service.service'


#test.sh
touch test.sh
echo "bash -c \"notify-send 'Test'\" " >> test.sh

echo <password> | sudo -S chmod 777 ~/.config/systemd/user/my-service.service
systemctl --user enable my-service.service
systemctl --user daemon-reload
systemctl --user start my-service.service


