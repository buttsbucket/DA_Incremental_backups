# Requirements
- at least one DirectAdmin server
- one server to store and run the backups process

# How it work
- The DirectAdmin server will make the backup for the mysql database and account configurations to the remote backup server using FTP/sFTP
- Once the accounts configurations backups are done, we will use the all_backups_post.sh to send a query to a mysql database (using update_sync.php) to tell the remote backups server that the accounts configurations backups are done
- The backups server will query the mysql database and executer the backups of the users /home directory
- The backups server will rsync the user /home directory to /lastest/USER and make a .tar.gaz file in the /lastest folder used as the reference file.
- If /lastest/USER.tar already exists, it will extract it to /lastest/USER before the rsync .
 - Once rsync done the files synchronisation between the hosting server and /lastest/USER, it will create a new .tar.gz file in /lastest (as file reference) and will copy the file to /backups/SERVER/2019-04-01/USER_TYPE.CREATEOR.USER.data.tar.gz (the backup)
