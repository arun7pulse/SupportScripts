REM Author: ArunSanthoshKumar Annamalai (@arun7pulse)
REM Date: 01-01-2017
REM Version: 1.0
REM Description: Run the batch file with this log file and you will get the log file end of the run. 
cls 
@echo on

@echo off
call %1 %2 %3 %4 %5 > ..\log\%1.log 2>&1
call notepad ..\log\%1.log
