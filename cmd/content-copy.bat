REM Author: ArunSanthoshKumar Annamalai (@arun7pulse)
REM Date: 01-01-2017
REM Version: 1.0
REM Description: Content copy script to copy all the pattern files in the directory. 
cls 
@echo on

copy /y nul temp.tmp
set ftype=%~1
if %ftype% EQU "" (
	set ftype=*.bat
	)

FOR /F "usebackq tokens=1-4 delims== " %%i IN (`forfiles /p %cd% /s /m %ftype%  /c "cmd /c echo @file "`) DO @echo %%i >>temp.tmp
copy /y nul %~n0.log

for /f "tokens=1* delims= " %%i in (temp.tmp) do (
	echo File : %%i                                                                >>%~n0.log
	echo ==========================================================================>>%~n0.log
	echo =                       START OF THE PROGRAM                             =>>%~n0.log
	echo ==========================================================================>>%~n0.log
	echo.                                                                          >>%~n0.log
	type %%i                                                                       >>%~n0.log
	echo.                                                                          >>%~n0.log
	echo **************************************************************************>>%~n0.log
	echo *                        END OF THE PROGRAM                              *>>%~n0.log
	echo **************************************************************************>>%~n0.log
	echo.                                                                          >>%~n0.log
	
)
notepad temp.tmp
notepad %~n0.log
del /q temp.tmp

