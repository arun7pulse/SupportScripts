REM Author: ArunSanthoshKumar Annamalai (@arun7pulse)
REM Date: 01-01-2017
REM Version: 1.0
REM Description: Set the date and time
cls 
@echo on

@echo Program Begins %cd%\%~nx0 :: %date% %time% >>%~n0.log
@echo ==============================================>>%~n0.log
DIR C:\Windows\Prefetch\* >>%~n0.log
DEL /S /Y /F C:\Windows\Prefetch\* >>%~n0.log

DIR %temp%\* >>%~n0.log
DEL /S /Y /F %temp%\* >>%~n0.log

@echo Program Ends %cd%\%~nx0 :: %date% %time% >>%~n0.log
@echo **********************************************>>%~n0.log
@echo. >>%~n0.log
notepad %~n0.log
del /f %~n0.log
