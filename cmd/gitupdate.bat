REM Author ArunSanthoshKumar
REM Description: git update
@ECHO OFF

set update=%1 
for /f "tokens=2-4 delims=.:/-, "  %%i in ('date /t') do (set year=%%k&& set month=%%i&& set day=%%j)
rem @echo %year%%month%%day%
set dayoftheyear=%year%%month%%day%
for /f "tokens=5-8 delims=:. " %%a in ('echo.^|time') do (set hour=%%a&& set min=%%b&& set sec=%%c&&  set msec=%%d)
rem @echo %hour%%min%%sec%%msec%
set timeoftheday=%hour%%min%%sec%%msec%

git status
REM git updates. 
if /i "%update%" EQU "update " (
    git add . 
    git commit -m "Updated the files on %dayoftheyear%_%timeoftheday%"
    git push
)
git log --oneline --graph --decorate -n 20
git remote -v 

