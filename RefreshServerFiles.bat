echo off
setlocal enabledelayedexpansion

set switch="FACT"

if %switch% == "STK" (
set  wkFile01[0]="\\26.43.131.1\public\2_MISSION開発\6_職責管理の追加開発\仕様検討一覧.xlsx"
set  wkFile01[1]="\\26.43.131.1\public\2_MISSION開発\0_計画\工数管理.xlsx"
set  wkFile01[2]="\\26.43.131.1\public\2_MISSION開発\6_職責管理の追加開発\職責管理_レビュー記録表.xlsx"
set  wkFile01[3]=""
set  wkFile01[4]=""
set  wkFile01[5]=""
set  wkFile01[6]=""
set  wkFile01[7]=""
set  wkFile01[8]=""
set  wkFile01[9]=""
set wkFile01[10]=""
set PATH_LOC_WK_01=C:\yyw\500_Person\500_work\20191119_EBS\6_職責管理の追加開発\
)

if %switch% == "FACT" (
set  wkFile02[0]="\\26.131.131.1\pj_share\24_Fact展開\00.Admin\02.PJ管理\02.課題管理\課題一覧.xlsx"
set  wkFile02[1]="\\26.131.131.1\pj_share\24_Fact展開\00.Admin\02.PJ管理\01.進捗管理\01.外部設計・開発・単体\10.IFバッチ\2019年_開発チーム(領域名)_製造_WBS.xlsm"
set  wkFile02[2]=""
set  wkFile02[3]=""
set  wkFile02[4]=""
set  wkFile02[5]=""
set  wkFile02[6]=""
set  wkFile02[7]=""
set  wkFile02[8]=""
set  wkFile02[9]=""
set wkFile02[10]=""
set PATH_LOC_WK_02=C:\yyw\500_Person\500_workIn2020\
)

REM とりあえず50回ループする
REM for /l %%f in (0,1,50) do (
REM    if not "a!wkFile01[%%f]!" == "a" (
REM        call :startCopy !wkFile01[%%f]! %PATH_LOC_WK_01%
REM    )
REM    if not "a!wkFile02[%%f]!" == "a" (
REM        call :startCopy !wkFile02[%%f]! %PATH_LOC_WK_02%
REM    )
REM )

REM とりあえず10回ループする
for /l %%f in (0,1,10) do (
   if exist !wkFile01[%%f]! (
       call :startCopy !wkFile01[%%f]! %PATH_LOC_WK_01%
   )
   if exist !wkFile02[%%f]! (
       call :startCopy !wkFile02[%%f]! %PATH_LOC_WK_02%
   )
)



pause

goto :EOF


rem %1=cp_path_from,%2=cp_path_to,%3=cp_file_nm
:startCopy
  rem echo copy /Y %1 %2
  copy /Y %1 %2
  if errorlevel 0 echo [%1]ファイルのコピーが完了しました。
  if errorlevel 1 echo [%1]ファイル見つかりません。
  if errorlevel 2 echo Ctrl-Cで[%1]ファイルのコピーが中止しました。
  if errorlevel 4 echo [%1]予想外エラーでコピーが中止しました。
  if errorlevel 5 echo [%1]hard disk witring error。
  goto :EOF

