# Ask the user if he/she's over 18 years old
echo "How old are you?"

read age

if [ $age -ge 18 ]; then
    echo "You may drink alcohol"
    expected_drunk_liters=$(((age-18)*100))
    echo "It's expected from somebody of your age to have drunk $expected_drunk_liters liters of beer already!"
else
    echo "You MAY NOT drink alcohol"
    wait_time=$((18 - age))
    echo "You will be allowed in $wait_time year(s)"
fi
