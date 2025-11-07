#step 1
## I found out the type of the file using the command 'file'
file pass
## i noticed it was an executable file
#step 2
## I ran the executable file using the command './pass'
./pass
## it asked me for a password
#step 3
## I used the command 'strings' to find any readable text in the binary
strings pass
## i input the password when prompted
#step 4
## i found the hash value which was then basically inputted at the website's answer box.