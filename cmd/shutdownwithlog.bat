REM Author: ArunSanthoshKumar Annamalai (@arun7pulse)
REM Date: 01-01-2017
REM Version: 1.0
REM Description: This will help logout the machine with log of the time. 
cls 
@echo on
echo "Logout time" >datef.txt 
date /t >>datef.txt
time /t >>datef.txt
Echo ********************* >>Logfile.txt
type datef.txt >>logfile.txt
Echo ========================== >>Logfile.txt

del /q datef.txt

shutdown /s
