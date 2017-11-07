# sudo lsblk to fine DEVICE_ID e.g. sdb
sudo mkdir -p /mnt/disks/<diskname>
sudo mount -o discard,defaults /dev/<device_id>  /mnt/disks/<diskname>
sudo chmod a+w /mnt/disks/<diskname>
echo UUID=`sudo blkid -s UUID -o value /dev/<device_id>` /mnt/disks/<diskname> ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab

