echo off
color f1

set prc_nm_cmd=cmd.exe
set prc_nm_cls=cls.exe
set msgTxtBf=" is "
set msgTxtAf=" minutes, rest 5 minutes for your body."

set /A intervalTime=30
set /A cnt=0
set /A oneMinute=60
set /A dfMinute=30

set /A rtn_code_0=0
set /A rtn_code_1=1


:inputNoSleepMinute
  %prc_nm_cls%
  title no sleep batch
  if defined errMsg echo %errMsg%
  echo ------------------------------
  echo exit:0
  echo ------------------------------
  set /p inMinute= plase input alert minute:
  
  if "%inMinute%"=="0" exit
  rem 30分はディフォルト値として、設定する
  if "%inMinute%"=="%~2" set /A inMinute=%dfMinute%
  rem 数値であるかどうかチェック
  call :checkNumber %inMinute%
  
  if %ERRORLEVEL% equ %rtn_code_1% (
    set inMinute=%~2
    set errMsg=Please enter numeric values.。
    goto inputNoSleepMinute
  )
  
  %prc_nm_cls%
  echo tomato time is %inMinute% minute.
  for /l %%i in (1,1,%inMinute%) do (
    set /A cnt+=1
    call :sleep %intervalTime%
  )
  
  goto :end
  

:sleep
  ping localhost -n %oneMinute% > nul
  rem echo %Date% %time% から %cnt% 分経過
  echo %time% From %cnt% Minute
  set /A noSleepSwitch=%cnt%%%%1
  if %noSleepSwitch% == 0 goto prcStart
  goto :EOF
  

:prcStart
  start %prc_nm_cmd% /c %prc_nm_cls%
  goto :EOF
  

:end
  call :alterBoxOpen %msgTxtBf%%cnt%%msgTxtAf%
  goto :EOF
  

:alterBoxOpen
  msg * /server:localhost %1
  goto :EOF
  

:checkNumber
  set data=%1
  if "%data%"=="" (
    exit /B %rtn_code_1%
  )
  
  :loop
    set chk=%data:~0,1%
    set data=%data:~1%
    if "%chk%"=="0" goto :loop
    if "%chk%"=="1" goto :loop
    if "%chk%"=="2" goto :loop
    if "%chk%"=="3" goto :loop
    if "%chk%"=="4" goto :loop
    if "%chk%"=="5" goto :loop
    if "%chk%"=="6" goto :loop
    if "%chk%"=="7" goto :loop
    if "%chk%"=="8" goto :loop
    if "%chk%"=="9" goto :loop
    
  if "%data%"=="~1" (
    exit /B %rtn_code_0%
  ) else (
    exit /B %rtn_code_1%
  )
  goto :EOF

pause