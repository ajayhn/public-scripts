#(export VOL=ml-play; sudo mkdir -p /mnt/${VOL}; sudo mount -o discard,defaults /dev/disk/by-id/scsi-0DO_Volume_${VOL} /mnt/${VOL}; echo /dev/disk/by-id/scsi-0DO_Volume_${VOL} /mnt/${VOL} ext4 defaults,nofail,discard 0 0 | sudo tee -a /etc/fstab)

