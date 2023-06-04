# This script provides information about a file

FILENAME="$1"
echo "Properties of $FILENAME:"

if [ -f $FILENAME ]; then
 echo "Size: $(ls -lh $FILENAME | awk '{ print $5 }')"
 echo "Type: $(file $FILENAME | cut -d":" -f2 -)"
 echo "Inode number: $(ls -i $FILENAME | cut -d" " -f1 -)"
 echo "$(df -h $FILENAME | grep -v Mounted | awk '{ print $1", \
that is in partition mode ",$6}')"
else
 echo "File doesn't exist"
fi
