# Create files numbered from 0 up to 9 using a for loop

for i in {0..9}; do
touch "ex_3_file_${i}.txt"
echo "File $file_name created successfully!"
done
