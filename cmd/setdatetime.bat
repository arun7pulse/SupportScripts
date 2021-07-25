REM Author: ArunSanthoshKumar Annamalai (@arun7pulse)
REM Date: 01-01-2017
REM Version: 1.0
REM Description: Set the date and time
cls 
@echo on

for /f "tokens=2-4 delims=.:/-, "  %%i in ('date /t') do (set year=%%k&& set month=%%i&& set day=%%j)
@echo %year%%month%%day%
set dayoftheyear=%year%%month%%day%
for /f "tokens=5-8 delims=:. " %%a in ('echo.^|time') do (set hour=%%a&& set min=%%b&& set sec=%%c&&  set msec=%%d)
@echo %hour%%min%%sec%%msec%
set timeoftheday=%hour%%min%%sec%%msec%