echo "Run as root/sudo"

curdir=`pwd`
user=$1

mv ./suspendautolock.service ./suspendautolock@$user.service
for file in `find . -name "*.service" -printf '%P\n'`; do
    echo "curdir: $curdir"
    echo "file: $file"
    systemctl enable $curdir/$file
    systemctl start $file
done
