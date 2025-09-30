#Navigating the File System

##important direcctories
    #user home directories
    /home

    #configuration files
    /etc

    #variable data (logs, mail, etc.)
    /var 

    #essential user binaries (commands)
    /bin 

    #root user’s home directory
    /root


##Print Working Directory
pwd

###List directory contents
    Ls 
        #long format
        ls -l
        #show hidden files
        ls -a

    #Change Directory
    cd <path>
        #up one level
        cd ..

        #up 2 levels
        cd ../..

        # to the home directory
        cd ~

        # to  the previous directory
        cd -


## File and Directory Management
    #create an empty file
    touch filename

    #create new directory
    mkdir directoryname

    #copy files
        ##file to file
        cp file1.txt file2.txt

        ##file to different directory
        cp file.txt /home/user/documents/

        ##multiple files to a directory
        cp file1.txt file2.txt file3.txt /home/user/backups/

        ##copies all files ending with .log from the current directory to /var/log/archive/
        cp *.log /var/log/archive/

        #If new_file.txt already exists, the -i option will prompt for confirmation before overwriting it.
        cp -i existing_file.txt new_file.txt

    #move or rename
        #move file to different directory
        mv myfile.txt /home/user/documents/

        #rename file
        mv oldname.pdf newname.pdf

        #Move a directory and its contents
        mv mydirectory /var/www/html/

        #Move multiple files to a directory
        mv file1.txt file2.txt file3.txt /tmp/

    #remove a file
        #remove single file
        rm filename

        #Removing multiple files
        rm file1 file2 file3

        #confirmation before deleting each file but you can also do for multiple file
        #the big one (-I), only prompts once for all the files
        rm -i filename
        rm -I file1 file2 file3 file4

        #Removes directories and their contents recursively
        rm -r directoryname

        #-f (force): Removes files or directories without prompting for confirmation
        #rm -rf command is very powerful and can lead to data loss if used incorrectly
        rm -f filename
        rm -rf directoryname 

    #remove a directory
    rmdir directoryname



## Viewing Files
    #content of a single file
    cat filename.txt
    #display multiple files sequentially
    cat file1.txt file2.txt
    #merge the contents of multiple files into a single new file
    cat file1.txt file2.txt > newfile.txt
    #add content to the end of an existing file without overwriting it
    cat new_content.txt >> existing_file.txt

    #view file page by page
    less filename.txt

    #Displaying the first 10 lines
    head filename.txt
    #Displaying a specific number of lines
    head -n 5 filename.txt
    #displays the first 100 bytes.  -c option specifies the number of bytes. You can also use suffixes like k for kilobytes or m for megabytes
    head -c 100 filename.txt
    #Displaying output from multiple files
    head file1.txt file2.txt
    #the first 3 lines of that output
    ls -l | head -n 3
    #Displaying filename headers explicitly
    head -v filename.txt

    #Display the last lines
    tail -n 5 filename.txt



##Superuser
#'sudo' - helps to run commands with admin privileges
sudo apt update
sudo apt upgrade


##Permissions
#permissions of a file
    #navigate to the file's directory
    cd <path>
    #execute the following
    ls -l filename.txt
    ##RESULT-->   
    -rwxr-xr--
    ##beginning of the result
    #       - for a regular file
    #       d for a directory
    #       l for a symbolic link

    #r - Read permission
    #w - Write permission
    #x - Execute permission
    #-  - Absence of a specific permission


##Searching files
#Search a specific string
grep "string_to_search" filename
grep "error" /var/log/syslog

#Case-insensitive search (-i). every case of "pattern"
grep -i "pattern" filename

#whole word search. only the given word will be searched
grep -w "word" filename

#Counting occurrences (-c). This will output the number of lines where the pattern is found, not the lines themselves.
grep -c "pattern" filename

#This will search for the pattern in all files within the specified directory and its subdirectories
grep -r "pattern" directory/

#Inverting the search (-v). This will display all lines that do not contain the specified pattern
grep -v "pattern" filename

#Showing line numbers (-n).This will display the matching lines along with their corresponding line numbers
grep -n "pattern" filename

#Displaying lines before/after/around a match (-A, -B, -C)
grep -A 3 "pattern" filename  # Shows 3 lines after the match
grep -B 2 "pattern" filename  # Shows 2 lines before the match
grep -C 1 "pattern" filename  # Shows 1 line before and 1 line after the match

#find lines starting with a specific word
grep "^word" filename

# find lines ending with a specific word
grep "word$" filename






# find files and directories within the current working directory
find .

#find files and directories within a specific directory
find /var/log

#To find a file with an exact name (case-sensitive)
find /path/to/search -name "filename.txt"

# find a file by name (case-insensitive)
find /path/to/search -iname "filename.txt"

# find files matching a pattern (e.g., all .log files)
find /path/to/search -name "*.log"

# only files
find /path/to/search -type f

#only directories
find /path/to/search -type d

# find files larger than 50MB
find /path/to/search -type f -size +50M

# find files smaller than 10KB
find /path/to/search -type f -size -10k

# find files modified within the last 10 days
find /path/to/search -mtime -10

# find files modified more than 30 days ago
find /path/to/search -mtime +30

##Executing Commands on Found Items
# find and delete all .tmp files
find /path/to/search -name "*.tmp" -delete

#find all .sh files and change their permissions to 755
find /path/to/search -name "*.sh" -exec chmod 755 {} \;