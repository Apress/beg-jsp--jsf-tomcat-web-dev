@echo off
set aname=ebookshop
set /P fname=Please enter the java file name without extension:
set fil=%aname%\%fname%
echo *** compile_it.bat: compile src\%fil%.java
javac -verbose -deprecation -Xlint:unchecked -classpath classes src\%fil%.java
if %errorlevel% GTR 1 goto _PAUSE
echo *** compile_it.bat: move the class to the package directory
move /y src\%fil%.class classes\%fil%.class
:_PAUSE
pause
