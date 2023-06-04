# Read data from current date
temph=$(date | cut -c13-14)
dat=$(date +"%A, %B %d of %Y (%r)")


# Conditions to respond according to current day period
if [ $temph -lt 12 ]; then
    mess="Good morning $LOGNAME, have a nice day!"
    exit 1
elif [ $temph -gt 12 -a $temph -le 18 ]; then
    mess="Good afternoon $LOGNAME"
    exit 1
elif [ $temph -gt 18 ]; then
    mess="Good evening $LOGNAME"
    exit 1
fi

# Print the message
echo -and "$mess\n Today is $dat"
