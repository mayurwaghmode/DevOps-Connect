# DevOps-Connect

# Run Linux from Web Browser with these wbsite - http://copy.sh/v86/?profile=linux26

# Linux Commands

**whoami**: It will display the currently logged in username

**pwd** : present working directory

**date**: To display the current date

**cal** : To display calendar


In Linux everything everything will be represented as a file

We have 3 types of files in Linux

1) Ordinary File / Normal File  (it will start with -) - The file which contains data is called as ordinary file
2) Directory File  (it will start with d) - A directory file is equal to a folder (it can contain files and folders)
3) Link File (it will start with l) - The file which is having to link is called as Link File 


**touch**: it is used to create an empty file

```
		$ touch f1.txt
		$ touch f2.txt
		$ touch f3.txt f4.txt
```
	
**ls**: To display files we will use the 'ls' command


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

**rmdir**: To remove empty directory we will use 'rmdir' command

		$ rmdir dirname

## Reversing File Content ##

**tac**: command is used to reverse file content

	   	$ tac filename

**rev**: command is used to reverse each line content of the file

	  	$ rev filename


## head command
**head**:  command is used to display file data from top (default 10 lines)
```
		$ head filename
		$ head -n 5 data.log  (first 5 lines data)
		$ head -n 20 data.log (first 20 lines data)
```
## tail command

**tail**: command is used to display file data from bottom (default 10 lines)
```
		$ tail filename (last 10 lines data)
		$ tail -n 100 filename (last 100 lines data)
		$ tail +25 filename (it will display data from 25th line to bottom)
```	

Note: To see on-growing logs we can use '-f' option

		$ tail -f data.log   (Live log message we can see)


## wc command

**wc**: It is used to count no.of lines, no.of words, and no.of characters in the file

     		$ wc f1.txt ```
