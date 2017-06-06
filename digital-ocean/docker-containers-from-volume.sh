# format/mkfs volume if not already done

#sudo mkdir -p /mnt/var-lib-docker; sudo mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_var-lib-docker /mnt/var-lib-docker; echo /dev/disk/by-id/scsi-0DO_Volume_var-lib-docker /mnt/var-lib-docker ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab

# ubuntu with systemd
 # check if dir already exists and bail
 # sudo service docker stop
 # sudo mkdir /etc/systemd/system/docker.service.d
 # sudo echo "[Service]" > /etc/systemd/system/docker.service.d/docker.conf
 # sudo echo "ExecStart=" >> /etc/systemd/system/docker.service.d/docker.conf
 # sudo echo "ExecStart=/usr/bin/dockerd -H fd:// --graph=/mnt/var-lib-docker" >> /etc/systemd/system/docker.service.d/docker.conf
 # sudo systemctl daemon-reload
 # sudo service docker start
 # sudo service docker status
