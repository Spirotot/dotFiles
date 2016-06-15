echo "Run as root/sudo"

curdir=`pwd`

for file in `find . -name "*.service" -printf '%P\n'`; do
    echo "curdir: $curdir"
    echo "file: $file"
    systemctl enable $curdir/$file
    systemctl start $file
done
