# DevOps-Connect

# Run Linux from a Web Browser with this website - http://copy.sh/v86/?profile=linux26

# Linux Commands

**whoami**: It will display the currently logged-in username

**pwd** : present working directory

**date**: To display the current date

**cal** : To display calendar


In Linux everything will be represented as a file

We have 3 types of files in Linux

1) Ordinary File / Normal File  (it will start with -) - The file which contains data is called as ordinary file
2) Directory File  (it will start with d) - A directory file is equal to a folder (it can contain files and folders)
3) Link File (it will start with l) - The file which is having to link is called as Link File 


**touch**: It is used to create an empty file

```
$ touch f1.txt
$ touch f2.txt
$ touch f3.txt f4.txt
```
	
**ls**: To display files we will use the 'ls' command
Note: We can pass several options for 'ls' commands

**ls**: It will display all files in alphabetical order (a to z)

**ls -r**: It will display all files in reverse alphabetical order (z to a)

**ls -l**: It will display a long listing of files

**ls -t**: It will display all files based on the last modified date and time. The most recent file will be displayed at the top and old files will display at the bottom.

**ls -rt**: It will display all files based on the reverse of the last modified date and time. Old files will display at the top and recent files will display bottom.

**ls -a**: It will display all files including hidden files (hidden files will start with .)

**ls -li**: It will display files with the inode.

**ls -lR**: It will display all files and directories along with subdirectories content

**Note**: -R represents recursive

Note:  We can use several options for the ls command at a time. When we are using multiple options order of the options is not important

	$ ls -ltr
	$ ls -tlr
	$ ls -l -t -r
	$ ls -trl

Note: All the above commands will give the same output

**cat**: To create/display a file with data we will use the 'cat' command

```
$ cat > hello.txt
//write data
Press CTRL + d (to save and exit)

$ cat hello.txt   (To display file data)

$ cat >> hello.txt (To append data in the file)
//write data
Press CTRL + d (to save and exit)
```

**mkdir**:  To create a directory we will use 'mkdir' command

	$ mkdir dirname


**rm**: To remove the file we will use 'rm' command

	$ rm filename	

**rmdir**: To remove the empty directory we will use 'rmdir' command

	$ rmdir dirname

## Reversing File Content ##

**tac**: command is used to reverse file content

	$ tac filename

**rev**: command is used to reverse each line content of the file

	$ rev filename


## head command
**head**:  command is used to display file data from the top (default 10 lines)
```
$ head filename
$ head -n 5 data.log  (first 5 lines data)
$ head -n 20 data.log (first 20 lines data)
```
## tail command

**tail**: command is used to display file data from the bottom (default 10 lines)
```
$ tail filename (last 10 lines data)
$ tail -n 100 filename (last 100 lines data)
$ tail +25 filename (it will display data from 25th line to bottom)
```	

Note: To see on-growing logs we can use '-f' option

```$ tail -f data.log   (Live log message we can see)```

## wc command

**wc**: It is used to count no.of lines, no.of words, and no.of characters in the file

```$ wc f1.txt ```

## cp command

**cp** -To copy the data from one file to another file

```$ cp one.txt two.txt  ```


Rename the files or directories
--------------------------------
**mv**: To rename files we will use the 'mv' command

	$ mv f1.txt f1111.txt

	$ mv  dirname dirnewname

Note: We can use the 'mv' command for renaming and moving files

## Comparing files
---------------
To compare files we can use the below commands

	$ cmp f1.txt f2.txt
	$ diff f1.txt f2.txt

cmp command will display only the first difference in the given 2 two files
diff command will display all the differences in the content

## grep command
------------
**grep**: stands for global regular expression print.

The 'grep' command will process the text line by line and print any lines that match the given pattern.

Ex: I want to print all lines which contain 'NullPointerException'

	$ grep -i 'NullPointerException' *

Note: We can install grep using the below command

	$ sudo yum install grep

Search for the lines that contain the given word in the given filename

	$ grep 'word' filename

Search for the lines that have exception keywords in the server.log file
	
 	$ grep -i 'exception' server.log 

search for the given text in the present directory and in sub-directories also
	
 	$ grep -R 'exception'

=> We can pass several options for the 'grep' command

-c: This prints only the count of files that match the given pattern

-i: ignore case-sensitivity

-n: Display the matched lines and their line numbers

-l: Displays only file names that match the pattern

-h: Displays matched lines without file names

-R: Displays matched lines with file names

--------------------------------------------------------------------------------------------


## Working with Text Editors in Linux

The default editor that comes with the UNIX operating system 
is called vi (visual editor). 

Using vi editor, we can edit an existing file or create a new file from scratch.

We can also use this editor to just read a text file.

**Modes of Operation in vi editor** 
There are three modes of operation in vi:

1) command mode
2) Insert mode
3) escape mode

**Command Mode**: 
---------------
When vi starts up, it is in Command Mode. This mode is where vi interprets any characters we type as commands and thus does not display them in the window

This mode allows us to move through a file, and to delete, copy, or paste a piece of text.

Enter into Command Mode from any other mode, requires pressing the [Esc] key. If we press [Esc] when we are already in Command Mode, then vi will beep or flash the screen.

**Insert mode**: 
--------------
This mode enables you to insert text into the file. 

Everything that is typed in this mode is interpreted as input and finally, it is put in the file. 

The vi always starts in command mode. To enter text, you must be in insert mode.

To come in insert mode you simply type i. 
 
To get out of insert mode, press the Esc key, which will put you back into command mode.

**Last Line Mode(Escape Mode)**: 
-----------------------------
Line Mode is invoked by typing a colon [:], while vi is in Command Mode. 

The cursor will jump to the last line of the screen and vi will wait for a command. 

This mode enables you to perform tasks such as saving files and executing commands.

There are the following ways you can start using vi editor :

Commands and their Description
---------------------------------
**vi filename**: Creates a new file if it already does not exist, otherwise opens the existing file.
**vi -R filename**: Opens an existing file in read-only mode.
**view filename**: Opens an existing file in read-only mode.

	vi f1.txt

After making changes if we don't want to save those changes then execute: ```q!```

**Moving within a File(Navigation)**:
-----------------------------------
To move around within a file without affecting text must be in command mode (press Esc twice). Here are some of the commands that can be used to move around one character at a time.

Commands and their Description
---------------------------------
**K**: Moves the cursor up one line

**j**: Moves the cursor down one line

**h**: Moves the cursor to the left one-character position

**l**: Moves the cursor to the right one-character position

**0** or **|**: Positions cursor at the beginning of a line

**$**: Positions cursor at end of the line

**W**: Positions cursor to the next word

**B**: Positions cursor to the previous word

**(**: Positions cursor to the beginning of a current sentence

**)**: Positions cursor to the beginning of the next sentence

**H**: Move to the top of the screen

**nH**: Moves to an nth line from the top of the screen

**M**: Move to the middle of the screen

**L**: Move to the bottom of the screen

**nL**: Moves to nth line from the bottom of the screen

colon along with x: Colon followed by a number would position the cursor on the line number represented by x.


**Usecase**
-------
We will use the 'vi' editor to perform the below activities

a) To edit config files of our application
b) To edit shell script files

Working with SED command
------------------------
SED command in UNIX stands for stream editor and it can perform lots of functions on files like searching, finding and replacing, insertion or deletion.

Though most common use of the SED command in UNIX is for a substitution or for find and replace. 

By using SED you can edit files even without opening them, which is a much quicker way to find and replace something in a file, than first opening that file in VI Editor and then changing it.

SED is a powerful text stream editor. Can do insertion, deletion, search, and replace(substitution).

SED command in Unix supports regular expression which allows it to perform complex pattern matching.

Example:
```
$ cat > myfile.txt
unix is great os. Unix is open source. Unix is a free OS.
learn operating systems.
unix Linux Which one did you choose?
Unix is easy to learn. Unix is a multiuser OS. Learn Unix. Unix is powerful.
```

Replacing or substituting string : 
----------------------------------
Sed command is mostly used to replace the text in a file. The below simple sed command replaces the word â€œunixâ€ with â€œlinuxâ€ in the file

	$sed 's/unix/linux/' myfile.txt

By default, the sed command replaces the first occurrence of the pattern in each line and it wonâ€™t replace the second, thirdâ€¦occurrence in the line.

Replacing the nth occurrence of a pattern in a line : 
---------------------------------------------------
Use the /1, /2 etc flags to replace the first, and second occurrence of a pattern in a line. The below command replaces the second occurrence of the word unix with linux in a line.

	$sed 's/unix/linux/2' geekfile.txt

Replacing all the occurrences of the pattern in a line : 
----------------------------------------------
The substitute flag /g (global replacement) specifies the sed command to replace all the occurrences of the string in the line.

	$ sed 's/unix/linux/g' myfile.txt

Deleting lines from a particular file 
-------------------------------------
The SED command can also be used for deleting lines from a particular file. The SED command is used for performing deletion operations without even opening the file

To Delete a particular line say n in this example

	$ sed '5d' myfile.txt

To Delete a last line

	$ sed '$d' myfile.txt


To Delete from the nth to the last line

	$ sed '12,$d' myfile.txt


Note: By default, SED command changes will not be stored in the file.

To make SED command changes to the file permanently we will use the '-i' option.

	$ sed -i 's/unix/linux/g' myfile.txt  

Note: With the above command 'unix' keyword will be replaced with the 'linux' keyword in the file permanently.

File permissions
================

To create a secure environment in Linux, you need to learn about user groups and permissions. For example, if you work in a company and you want the finance department to read a file but not make any modifications to it, then you need to use permissions in Linux. It is a must for every programmer working with Linux nowadays.

Let's start by talking about the ownership of Linux files.

**User**: the owner of the file (person who created the file).

**Group**: The group can contain multiple users. 

Therefore, all users in that group will have the same permissions. It makes things easier than assigning permission for every user you want.

**Other**: any person has access to that file, that person has neither created the file nor are they in any group that has access to that file.

Execute ``` ls -l ``` command to file's permissions

We will work with this part ```-rw-r--r--```.

The characters mean:

r-- = read.
-w- = write.
--x = execute.
--- = no permission.

```-rw-r--r--```

**-**: It represents file
**rw-**: User
**r--**: Group
**r--**: Other

As we see above, the empty first part means that it is a file. If it were a directory then it would be the letter ```d``` instead. 

The second part means that the user ```rw-``` has read and write permissions but he does not have the execute one.

The group and others have only the read permission.

Let's change the permissions using the chmod command.

	$ chmod o+w section.txt

This command will add the write permission for other users to my text file â€œsection.txtâ€.

Now if you try to execute ls -l then you will see -rw-r--rw-

```rw-``` refers to others, ```r--``` for the group, ```rw-``` for the user.

Now let's add the execute permission to the user with the:

	$ chmod u+x section.txt

The permissions will be ```-rwxr--rw-```

If you want to remove the permission, you can use the same method but with ```u-x``` instead of ```u+x```. 

For example, let's remove the execute permission from the user by:

	$ chmod u-x section.txt

And the permissions now are: ```-rw-r--rw-```

Also, you can use Symbolic Mode to modify permissions like the following:

Number	Permission
0	No permission
1	Execute
2	Write
3	Execute and Write
4	Read
5	Read and Execute
6	Read and Write
7	Read, Write, and Execute

For example, let's give every permission for all with:

	$ chmod 777 section.txt

Then the permissions will be: ```-rwxrwxrwx```

Let's remove the execute from the group and the write from other by:

	$ chmod 765 section.txt
		
Then the permission will be: ```-rwxrw-r-x```

Working with User Accounts
==========================

Linux is a multi-user-based operating systems

Within one Linux machine, we can create multiple user accounts

Multiple users can access a single Linux machine and can perform multitasking

Create a user
==========================

	$ sudo adduser <uname>

=> After creating a user account we can verify useraccount details using the 'id' command

	$ id <uname>

=> 'id' command will display user account information

=> Check the files available in the home directory 

	$ ls -l


After creating a new user and setting a password to it, you can log in from the terminal

	$ su - <uname>


Delete a user
=============
	$ sudo userdel <uname>

If you try that command, you will notice that the user directory has not been deleted and you need to delete it by yourself.

You can use this automated command to do everything for you:

	$ sudo deluser --remove-home <uname>


User groups
============
-> A group is a collection of users. 

-> The primary purpose of the groups is to define a set of privileges like read, write, or execute permission for a given resource that can be shared among the users within the group.

Create a group
---------------
You can see all of the groups you have by opening the following file:

	$ cat /etc/group

Create a group
----------------
	$ sudo groupadd <groupname>

Add user to a group
--------------------
	$ sudo usermod -aG <group-name> <username>

-> verify user groups using command -> $ id username

Delete the user from a group
-------------------------
	$ sudo gpasswd -d <username> <groupname>

Delete a group
--------------
	$ sudo groupdel <groupname>

locate command
------------------------------------------
The locate Command will search for data in the local DB

```
$ sudo apt install mlocate

$ locate apache

$ locate -c apache

$ locate -c *.txt

$ locate -S (to see locate database)
```

Note: When we create new files it will take some time to update those files in locate db

Working with 'find' and 'locate' commands
------------------------------------------

find command
------------------------------------------
find command will search for the files in the entire Linux file system.
find command providing advanced searching technique
Using the find command, we can search for the files based on name and type.

Find Files Under the Home Directory
	
	find /home -name f1.txt

Find Files With 777 Permissions

   	find. -type f -perm 0777 -print

Find all Empty Files

	find /home -type f -empty

Find all Empty Directories
		
	find /home -type d -empty

Note: As the find command is scanning the entire file system, it will take more time to give search results.
----------------------------------------------------------------------------------------------
**man**: command is like a help command. It is used to understand command syntax and options.

	$ man cat

**ifconfig**: To see ip address we will use the 'ifconfig' command

	$ ifconfig

Note: ifconfig is not installed then execute the below command

	$ sudo apt install net-tools

**ping**: command is used to check connectivity

	$ ping <ip>

**curl**: command is used to get a response from the server

	$ curl <url>

**wget**: command is used to download resources from the internet

	$ wget <url>
