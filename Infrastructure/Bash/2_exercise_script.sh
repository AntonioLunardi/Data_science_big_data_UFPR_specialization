# Move the file to the specified directory

# Check if the argument is correctly given
if [ "$#" -ne 2 ]; then
    echo "Use: $0  <archive> <directory>"
    exit 1
fi

# Read both arguments
file="$1"
directory="$2"

# Verify if the file exists
if [ ! -f  "$file" ]; then
    echo "File '$file' doesn't exist."
    exit 1
fi

# Verify if the directory exists
if [ ! -d "$directory" ]; then
    echo "File '$directory' doesn't exist."
    exit 1
fi

# Move the file to the directory
mv "$file" "$directory"

# Print the message
echo "File was '$file' successfully moved to directory '$directory' "
