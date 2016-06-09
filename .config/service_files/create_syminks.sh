echo "Run as root/sudo"

curdir=`pwd`

for file in `find . -name "*.service"`; do
    ln -s $curdir/$file /etc/systemd/system/$file
    systemctl enable $file
    systemctl start $file
done
