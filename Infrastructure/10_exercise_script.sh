# Write a script that finds all files with a specific extension in a given directory and, based on the parameters sent:
# ◦ Make copies of the files with a new extension
# ◦ Rename the files to a new extension
# ◦ Remove the files.

directory="$1"
action="$2"
ext1="$3"
ext2="$4"

# Verify if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' doesn't exist."
    exit 1
fi

# Verify user permission
if [ ! -w "$directory" ]; then
    echo "Error: '$directory' directory's access permission denied."
    exit 1
fi

# Verificar a opção de ação
case "$action" in
    -c)  # Copy files
        for file in "$directory"/*."$ext1"; do
            new_name="${file%.$ext1}.$ext2"
            cp "$file" "$new_name"
            echo "$file => $new_name"
        done
        ;;
    -m)  # Move/rename files
        for file in "$directory"/*."$ext1"; do
            new_name="${file%.$ext1}.$ext2"
            mv "$file" "$new_name"
            echo "$file => $new_name"
        done
        ;;
    -r)  # Remove files
        for file in "$directory"/*."$ext1"; do
            rm "$file"
            echo "Removed: $file"
        done
        ;;
    *)
        echo "Error: Invalid option. Use -c to copy, -m to move/rename, or -r to remove."
        exit 1
        ;;
esac
