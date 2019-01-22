@echo on

set BATCH_TYPE=*.sql *.pkg
set BATCH_FILE=%CD%\SqlBatch.btsql
set LOG_FILE=%CD%\SqlBatch.log
set SQLPLUS_HOME=C:\app\tikK68559\product\11.2.0\client_1\BIN
set USER=apps
set PASSWORD=Q19H41_c
set DSN=shidev

if exist %BATCH_FILE% del %BATCH_FILE%
if exist %LOG_FILE% del %LOG_FILE%

echo -- created on %DATE% %TIME%>%BATCH_FILE%
echo SPOOL %LOG_FILE%>>%BATCH_FILE%

:ADD_FILE
rem echo start %1;>>%BATCH_FILE%
rem echo @%1;>>%BATCH_FILE%
rem for /R %%f in (%BATCH_TYPE%) do echo @%%~f>>%BATCH_FILE%
for %%f in (%BATCH_TYPE%) do echo @%%~f>>%BATCH_FILE%
shift
if "%1"=="" goto RUN
goto ADD_FILE

:RUN
echo SPOOL OFF>>%BATCH_FILE%
echo quit;>>%BATCH_FILE%
call %SQLPLUS_HOME%\sqlplus.exe %USER%@%DSN%/%PASSWORD% @%BATCH_FILE%

pause
