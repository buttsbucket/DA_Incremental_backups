DATE=`date +%Y-%m-%d`
BACKUP_USER = 'ADMIN_USER'
CALLBACK = 'CALLBACK_URL'


if [ $success = "1" ]; then
if [ "$owner" = "imhotep" ]; then
curl "$CALLBACK/update_sync.php?serveur=$HOSTNAME&date=$DATE&status=ready" > /dev/null 2>&1
fi
 fi
