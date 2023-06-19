# Check if the argument is correctly given
if [ "$#" -ne 1 ]; then
    echo "Use: $0  <archive>"
    exit 1
fi

file="$1"

# Verify if the file exists
if [ ! -f "$file" ]; then
    echo "File '$file' doesn't exist."
    exit 1
fi

mv "$file" /tmp
#  Move the file to the /tmp directory

# Print the message
echo "File moved to /tmp directory"
