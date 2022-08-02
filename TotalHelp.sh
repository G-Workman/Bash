FOR HELP
# Cheat.sh is an online tool that helps the user understand bash without the density of the man page
# CTRL U deletes everything behind your cursor
# After using history, if you want to navigate to an exact command you can type ! and the number of the command listed in the history list

COMMANDS 
Touch filename <----- Creates a file, change the timestamp of a file (use man page for exactly how to change what time)
Touch A1 A2 A3 <------- touches three files by just using spaces
touch -t = set the time (yyyymmddhhmm.ss)
touch -m = change modified time
ls <------ list contents of the current directory
- ls -lisa shows hidden contents of the directory
file filename <----- see what type of file a file is, if there is nothing in it it will return empty
mkdir test <------- makes a directory called test
rmdir test <-------- removes the directory called test
cd <------ change directory
pwd <------- prints the current directory
whoami <----- what user are you logged into
hostname <---- what device you are using
alias <------ Sets an alias to a command
mv moveme ./BASH <------ moves a file called moveme to your BASH directory
cp <----- copies a file to a new location
rm A* <---- removes everything that starts with "A"
rm *.txt <------ removes anything that ends with ".txt"
ln -s file1 newfileref <------- makes a symbolically linked connection between file1 and your new link called newfileref
-  Symbolic links print what the original file has, but when deleting it, it does nothing to the original file
ln file hardlink <------- creates a hardlink for file called hardlink
-  if the original file of a hardlink gets deleted the hardlink still stays, whereas a symbolic link would error out
locate <------- search database for stuff thats already installed
whereis <------- prived the filepaths that are used to get to a command
mkfifo p testpipe <----- makes a named p called testpipe
- cat shadow.txt | grep student <------ piped the output of the cat to a grep for that file


FIND command
find <----- Search for files
- find -name bad* <------ searches based on any file named with bad in the beginning of the name
- find -iname bad* <------- ignores casing (can be lowercase or uppercase)
- find -type f <------ Searches for files
- find -type d <------ Searches for directories
- find -inum #### <------ Searches for a file at inode ####
- find -mtime 2 <----- Searches for anything modified in the past 2 days
- find -empty <------ find anythion in the current directory that is empty
- find -e <----- find executable files in the current directory
- find / -maxdepth 2 <----- how many sub directories it will look (this one specifically looks at root and then 2 sub directories)
- find /tmp -name core -type f -print0 | xargs -0 /bin/rm <--------- find in the /tmp directory, a file named core and pipe it to the next command
- find ./ -iname "*.txt" -printf "%i %f\n" <------- printf formats the the print statement to exaclty how you want the information received. 
  i = inode, f = file
- find ./ -type d -exec ls -l {} \; <------ finds all the directories in the current directory and ran an ls -l
find ./find/ ! -name *.sh -name 1* <------ return anything that isnt a .sh file and starts with 1
find /* 2>|grep "Permission Denied"  <----- take a standard error with "Permission denied"


GREP command (searches for patterns and prints the results)
egrep  <---- extended grep (grep but better)
grep -i <----- ignore case when grepping
cat /etc/passwd | egrep /home/ <------ opens /etc/passwd and greps /home/ from the file
cat /etc/passwd | egrep -o "/home/.*" <----- same as the one above it but prints everything after what you searched for rather than everything on the line
cat /etc/passwd | egrep ":[0-9]{5}:" <----- finds each time there are five numbers in a row surrounded by colons
cat /etc/passwd | egrep /bash -A2 <------ Grabs the two lines after what you grepped for
cat /etc/passwd | egrep /bash -B2 <------ Grabs the two lines before what you grepped for


CUT command
tail /etc/passwd | cut -d: -f1 <---------- -d is the delimeter (what to split the fields up by, in this case it is a colon) and -f is the field
tail /etc/passwd | cut -d: -f1- <--------- -f- takes the field of choice an everything after it on that line
tail /etc/passwd | cut -d: -f1- -s <--------- -s checks to make sure the delimeter is in the line


FILES
bashrc <------ file your current session uses

BRACE EXPANSION: Multiple lines of code at one time
touch ./find/{1..10}.txt                                  Makes new files naming them 1.txt, 2.txt, 3.txt... 10.txt
touch ./find/{empty,full,total}.txt <------- Makes new files naming them empty.txt, full.txt, total.txt
find ./find/ ! -name *.sh -name 1* <------ return anything that isnt a .sh file and starts with 1

& <------ sends process to the background
&& <----- logical "and"
|| <------ logical "or"
! <-------- logical "not"
; <-------- same as hitting enter and starting a new line, can be used to run multiple different commands on the same line
\ <------- continues the cammand on to a new line
() <-------- group things together
>   <------- takes your output and sends it to, most commonly, a file. Overwrites the second file with what the first file had
>>   <-------- takes your output and sends it to, most commonly, a file. It just appends what was taken to the second file


FILE STREAMS
0 - STDIN (file in)
1 - STDOUT (file out)
2 - STDERR (file error)
/dev/null - black hole for things to go to
find /* 2>/dev/null|grep "Permission Denied"  <----- take a standard error with "Permission denied" and sends it to /dev/null
find /* 1>/dev/null 2> debug.log <----- way to save std out and put it to debug.log


#########PRACTICE PROBLEMS##############
1. Using Brace-Expansion, create the following directories within the $HOME directory:
1123, 1134, 1145, 1156

mkdir $HOME/{1123,1134,1145,1156}

2. create files in the $HOME/1123
Files to create: 1.txt, 2.txt, 3.txt, 4.txt, 5.txt, 6~.txt, 7~.txt, 8~.txt, 9~.txt
touch $HOME/1123/{1,2,3,4,5,6~,7~,8~,9~}.txt

3. Using the find command, list all files in $HOME/1123 that end in .txt.
find $HOME/1123 | egrep *.txt

4. Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.
cp $(find $HOME/1123/ -name *.txt ! -name *~*) $HOME/CUT/

5. Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path), and 
   the inode number, separated by newlines.
find /var/ -empty -printf "%i %f\n"

6. Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the 
   absolute path to the file, separating each filename with a newline. 
find -inum 4026532575 -printf "%f\n"

7. Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
   Write those to a text file called names in $HOME/CUT directory.
   Omit the names filename from your output.
ls -l ~/CUT | cut -d'.' -s -f1- | cut -d: -f2 | cut -d' ' -f2 > ~/CUT/names
