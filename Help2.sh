locate <----- use update before... looks through a database

AWK COMMAND <---- scan a file line by line, contains lines for any pattern you are looking for, split the lines by fields, change format for certain files
awk '{print}' coffee.txt <---- print the whoe file
awk '/coffee/ {print}' coffee.txt  <---- print only the lines that have "coffee" in them
awk '/coffee/ {print NR,$0}' coffee.txt <----- NR,$0 prints out line numbers with the text
awk 'NR==3, NR==8 {print NR,$0}' coffee.txt <------- Read lines 3-8 with line numbers included

tail /etc/passwd | awk -F: '{print $NF}' <------ $NF SIGNIFIES THE LAST/FINAL FIELD

tail /etc/passwd | awk -F: '{print $1,$5}' <------ returned the desired fields, 1 and 5
                    OR
tail /etc/passwd | awk 'BEGIN {FS=":"} '{print $1,$5}' <------- Same effect as the one above it

tail /etc/passwd | awk -F: '{print $1, "and", $5} <------ Splits up the result with "and" in the middle



SORT COMMAND <------ Arrange the lines of a file in particular order, by default it sorts by ASCII (lines with a number first with print first, followed
by lines with capital letters, then lowercase letters.
Does not change the file
sort filename.ext <--------- Sorts the file
sort -o beverages2.txt beverages.txt <------- destination file first, source file second
sort -r beverages.txt <-------- sorts the file in reverse
sort -nr beverages.txt <------ numbers first and in reverse
sort -n beverages.txt <------- letters first, numbers second
sort -m <------- sorts by month
sort -u <----sort duplicates
sort -k # coffeetable.txt <------ -k signifies sorting by colum and the number is the nth column
sort -k 3,3 -k 1,1 coffeetable.txt <------ setting a range and establishing which colum you wish to be sorted where



SED COMMAND <----- Editor. When using sed, it uses "/" to start and finish the string in which you choose, meaning if it includes "/", you have to escape 
them out.
sed 's/tea/coffee' tea.txt <---- substitute the first instance of "tea" with the word "coffee"
sed 's/tea/coffee/g' tea.txt <----- substitute every instance of "tea" with the word "coffee"
sed '5 s/tea/coffee' tea.txt <------ substitute the first instance of "tea" with the word "coffee" on line 5
sed '5 s/tea/coffee/g' tea.txt <----- substitute every instance of "tea" with the word "coffee" on line 5
sed '$d' tea.txt <------ deletes the last line of tea.txt
sed '#d' tea.txt <------ deletes the nth line of tea.txt
sed -i <------ hides the string
sed -e <----- allows scripting
sed -e '/\bin\sd/d' -e /\bin/\dalse/d' $HOME/PASS/passwd <------ -e allows  multiple sed to occur in one command line


UNIQ COMMAND <------ finds repeated lines (patterns) by comparing one line to the very next line... USE SORT BEFORE UNIQ
uniq -c file.txt <----- counts how many times each line was printed in the same text
uniq -d file.txt <----- what line repeated the most
uniq -D file.txt <----- Pulls groups of duplicate lines and displays them
uniq -u <------ shows the unique lines
uniq -t <------ shows the repeated strings regardless of capitalization


ALIAS COMMAND
alias -p <---- presents all current set aliases
alias nano='vim' <------ sets the alias called "nano" to run vim
\command <----- if you named an alias a command name, the backslash will run the command and not the alias
unalias nano <------ remove an alias called "nano"


CONDITIONALS:
IF STATEMENT
 #!/bin/bash
 
 if [[ conditions ]]; then
     commands
 elif [[ conditions ]]; then
     commands
 else
     commands
 fi  

run using: sudo chmod +x scriptname.sh
           ./haha.sh


use GT for > when comparing numbers
use LT for < when comparing numbers


COMMAND SUBSTITUTION = making a variable for a command and using it in script or future commands
A=$(tail /etc/passwd)  <------ Make the variable using a $ on the right side of the equation
ech0 $A   <---- Call the variable with a $
computer=$(hostname)

echo "Running command @ $computer"
for f in /etc/*.conf     <------- for every item in /etc configuration files
> do
> echo "$f"         <--------- print each item to the screen
> done

locate <----- use update before... looks through a database

AWK COMMAND <---- scan a file line by line, contains lines for any pattern you are looking for, split the lines by fields, change format for certain files
awk '{print}' coffee.txt <---- print the whoe file
awk '/coffee/ {print}' coffee.txt  <---- print only the lines that have "coffee" in them
awk '/coffee/ {print NR,$0}' coffee.txt <----- NR,$0 prints out line numbers with the text
awk 'NR==3, NR==8 {print NR,$0}' coffee.txt <------- Read lines 3-8 with line numbers included

tail /etc/passwd | awk -F: '{print $NF}' <------ $NF SIGNIFIES THE LAST/FINAL FIELD

tail /etc/passwd | awk -F: '{print $1,$5}' <------ returned the desired fields, 1 and 5
                    OR
tail /etc/passwd | awk 'BEGIN {FS=":"} '{print $1,$5}' <------- Same effect as the one above it

tail /etc/passwd | awk -F: '{print $1, "and", $5} <------ Splits up the result with "and" in the middle



SORT COMMAND <------ Arrange the lines of a file in particular order, by default it sorts by ASCII (lines with a number first with print first, followed
by lines with capital letters, then lowercase letters.
Does not change the file
sort filename.ext <--------- Sorts the file
sort -o beverages2.txt beverages.txt <------- destination file first, source file second
sort -r beverages.txt <-------- sorts the file in reverse
sort -nr beverages.txt <------ numbers first and in reverse
sort -n beverages.txt <------- letters first, numbers second
sort -m <------- sorts by month
sort -u <----sort duplicates
sort -k # coffeetable.txt <------ -k signifies sorting by colum and the number is the nth column
sort -k 3,3 -k 1,1 coffeetable.txt <------ setting a range and establishing which colum you wish to be sorted where



SED COMMAND <----- Editor. When using sed, it uses "/" to start and finish the string in which you choose, meaning if it includes "/", you have to escape 
them out.
sed 's/tea/coffee' tea.txt <---- substitute the first instance of "tea" with the word "coffee"
sed 's/tea/coffee/g' tea.txt <----- substitute every instance of "tea" with the word "coffee"
sed '5 s/tea/coffee' tea.txt <------ substitute the first instance of "tea" with the word "coffee" on line 5
sed '5 s/tea/coffee/g' tea.txt <----- substitute every instance of "tea" with the word "coffee" on line 5
sed '$d' tea.txt <------ deletes the last line of tea.txt
sed '#d' tea.txt <------ deletes the nth line of tea.txt
sed -i <------ hides the string
sed -e <----- allows scripting
sed -e '/\bin\sd/d' -e /\bin/\dalse/d' $HOME/PASS/passwd <------ -e allows  multiple sed to occur in one command line


UNIQ COMMAND <------ finds repeated lines (patterns) by comparing one line to the very next line... USE SORT BEFORE UNIQ
uniq -c file.txt <----- counts how many times each line was printed in the same text
uniq -d file.txt <----- what line repeated the most
uniq -D file.txt <----- Pulls groups of duplicate lines and displays them
uniq -u <------ shows the unique lines
uniq -t <------ shows the repeated strings regardless of capitalization


ALIAS COMMAND
alias -p <---- presents all current set aliases
alias nano='vim' <------ sets the alias called "nano" to run vim
\command <----- if you named an alias a command name, the backslash will run the command and not the alias
unalias nano <------ remove an alias called "nano"


CONDITIONALS:
IF STATEMENT
 #!/bin/bash
 
 if [[ conditions ]]; then
     commands
 elif [[ conditions ]]; then
     commands
 else
     commands
 fi  

run using: sudo chmod +x scriptname.sh
           ./haha.sh


use GT for > when comparing numbers
use LT for < when comparing numbers


COMMAND SUBSTITUTION = making a variable for a command and using it in script or future commands
A=$(tail /etc/passwd)  <------ Make the variable using a $ on the right side of the equation
ech0 $A   <---- Call the variable with a $
computer=$(hostname)

echo "Running command @ $computer"
for f in /etc/*.conf     <------- for every item in /etc configuration files
> do
> echo "$f"         <--------- print each item to the screen
> done






EXERCISES
1.Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory); sort them 
  uniquely by number of times they appear.

egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}' StoryHiddenIPs | sort | uniq -c | sort -nr



2. Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
   Only display those that use /bin/bash as their default shell.
   The input file is named $HOME/passwd and is located in the current directory.
   Output the results to a file called $HOME/SED/names.txt

awk 'NR==5, NR==44 {print NR,$0}' $HOME/passwd | awk  -F: '($7 == "/bin/bash") {print $1,$7}' | awk 'BEGIN {FS=" "} {print $2}' > $HOME/SED/names.txt
 
 OR
 
awk -F: '$3 >= 3 && $NF == "/bin/bash" {print $1}' $HOME/passwd > $HOME/SED/names.txt


3. Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)
   Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]

dmesg | egrep  'BIOS|CPU' | egrep -vi 'reserved|usable' | cut -d"]" -f2-



4.Write a Bash script using "Command Substitution" to replace all passwords, using openssl, from the file $HOME/PASS/shadow.txt with the MD5 encrypted 
  password: Password1234, with salt: bad4u
  Output of this command should go to the screen/standard output.
  You are not limited to a particular command, however you must use openssl. Type man openssl passwd for more information.
A=$(openssl passwd -1 -salt bad4u Password1234)

awk -F: -v "awk_var=$A" 'BEGIN {OFS=":"} {$2=awk_var} {print}' $HOME/PASS/shadow.txt  <------ awk -F: -v "awk_var=$A" makes A from outside of the 
                                                                                              awk command a local awk variable to use in the command.
                                                                                              It does this because awk can only use variables established
                                                                                              within itself.


5. Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.

sed '/\/bin\/false/d;/\/bin\/sh/d' $HOME/passwd > $HOME/PASS/passwd.txt




EXERCISES
1.Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory); sort them 
  uniquely by number of times they appear.

egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}' StoryHiddenIPs | sort | uniq -c | sort -nr



2. Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
   Only display those that use /bin/bash as their default shell.
   The input file is named $HOME/passwd and is located in the current directory.
   Output the results to a file called $HOME/SED/names.txt

awk 'NR==5, NR==44 {print NR,$0}' $HOME/passwd | awk  -F: '($7 == "/bin/bash") {print $1,$7}' | awk 'BEGIN {FS=" "} {print $2}' > $HOME/SED/names.txt
 
 OR
 
awk -F: '$3 >= 3 && $NF == "/bin/bash" {print $1}' $HOME/passwd > $HOME/SED/names.txt


3. Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)
   Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]

dmesg | egrep  'BIOS|CPU' | egrep -vi 'reserved|usable' | cut -d"]" -f2-



4.Write a Bash script using "Command Substitution" to replace all passwords, using openssl, from the file $HOME/PASS/shadow.txt with the MD5 encrypted 
  password: Password1234, with salt: bad4u
  Output of this command should go to the screen/standard output.
  You are not limited to a particular command, however you must use openssl. Type man openssl passwd for more information.
A=$(openssl passwd -1 -salt bad4u Password1234)

awk -F: -v "awk_var=$A" 'BEGIN {OFS=":"} {$2=awk_var} {print}' $HOME/PASS/shadow.txt  <------ awk -F: -v "awk_var=$A" makes A from outside of the 
                                                                                              awk command a local awk variable to use in the command.
                                                                                              It does this because awk can only use variables established
                                                                                              within itself.


5. Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.

sed '/\/bin\/false/d;/\/bin\/sh/d' $HOME/passwd > $HOME/PASS/passwd.txt
