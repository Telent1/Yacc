@echo off
set src=%cd%\src
set out=%cd%\bin
set test=%cd%\testcases

@echo Compiling Start
javac %src%\Yacc.java -d %out% -encoding utf-8
@echo Compiling End

@echo Testing Start

@echo off & setlocal EnableDelayedExpansion

for /f "delims=" %%a in ('"dir %test% /B"') do (
    set testName=%%~a
    set testPath=%test%\!testName!

    echo ***** Testing !testName!
    java -cp %out% Yacc !testPath!
    echo ***** Testing End
)
pause