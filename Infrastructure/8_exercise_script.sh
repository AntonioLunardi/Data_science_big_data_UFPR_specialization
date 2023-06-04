# Backup generator script

# Check if the argument is correctly given
if [ "$#" -ne 2 ]; then
    echo "Use: $0  <origin> <destination>"
    exit 1
fi

origin=$1
destination=$2


# Verify if the file exists
if [ ! -d "$origin" ]; then
    echo "Origin directory '$origin' doesn't exist."
    exit 1
fi

# Verify if the directory exists
if [ ! -d "$destination" ]; then
    echo "Destiny directory '$destination' doesn't exist."
    exit 1
fi

# Backup file name based on the current day period
time=$(date +"%H")
if   [ $time -ge 0 -a $time -lt 12 ]; then
    backup_file_name="morning_backup.tar.gz"
elif [ $time -ge 12 -a $time -lt 18 ]; then
    backup_file_name="afternoon_backup.tar.gz"
else
    backup_file_name="evening_backup.tar.gz"
fi

# Backup file full path
backup_destination="$destination/$backup_file_name"

# Zip backup and save in the destination
tar -czvf "$backup_destination" "$origin"

echo "The backup from '$origin' to '$destination' was successfull"

