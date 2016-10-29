echo "Run as root/sudo"

curdir=`pwd`
user=$1

if [ X$user = X ]; then
    echo "You need to specify a user."
    exit
fi

mv ./suspendautolock.service ./suspendautolock@$user.service
for file in `find . -name "*.service" -printf '%P\n'`; do
    echo "curdir: $curdir"
    echo "file: $file"
    systemctl enable $curdir/$file
    systemctl start $file
done
