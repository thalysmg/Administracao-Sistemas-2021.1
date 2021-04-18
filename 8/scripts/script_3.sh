#!/bin/bash

if [ ! -d /home/$USER/Backup ]; then
    mkdir /home/$USER/Backup;
fi

tar -cvf /home/$USER/Backup/backup_$(date +"%Y%m%d").tar /home/$USER

gzip -9 -c /home/$USER/Backup/backup_$(date +"%Y%m%d").tar > /home/$USER/Backup/backup_$(date +"%Y%m%d").tar.gz

echo backup_$(date +"%Y%m%d").tar.gz

rm /home/$USER/Backup/backup_$(date +"%Y%m%d").tar