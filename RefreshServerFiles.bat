echo off
setlocal enabledelayedexpansion

set switch="FACT"

if %switch% == "STK" (
set  wkFile01[0]="\\26.43.131.1\public\2_MISSION�J��\6_�E�ӊǗ��̒ǉ��J��\�d�l�����ꗗ.xlsx"
set  wkFile01[1]="\\26.43.131.1\public\2_MISSION�J��\0_�v��\�H���Ǘ�.xlsx"
set  wkFile01[2]="\\26.43.131.1\public\2_MISSION�J��\6_�E�ӊǗ��̒ǉ��J��\�E�ӊǗ�_���r���[�L�^�\.xlsx"
set  wkFile01[3]=""
set  wkFile01[4]=""
set  wkFile01[5]=""
set  wkFile01[6]=""
set  wkFile01[7]=""
set  wkFile01[8]=""
set  wkFile01[9]=""
set wkFile01[10]=""
set PATH_LOC_WK_01=C:\yyw\500_Person\500_work\20191119_EBS\6_�E�ӊǗ��̒ǉ��J��\
)

if %switch% == "FACT" (
set  wkFile02[0]="\\26.131.131.1\pj_share\24_Fact�W�J\00.Admin\02.PJ�Ǘ�\02.�ۑ�Ǘ�\�ۑ�ꗗ.xlsx"
set  wkFile02[1]="\\26.131.131.1\pj_share\24_Fact�W�J\00.Admin\02.PJ�Ǘ�\01.�i���Ǘ�\01.�O���݌v�E�J���E�P��\10.IF�o�b�`\2019�N_�J���`�[��(�̈於)_����_WBS.xlsm"
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

REM �Ƃ肠����50�񃋁[�v����
REM for /l %%f in (0,1,50) do (
REM    if not "a!wkFile01[%%f]!" == "a" (
REM        call :startCopy !wkFile01[%%f]! %PATH_LOC_WK_01%
REM    )
REM    if not "a!wkFile02[%%f]!" == "a" (
REM        call :startCopy !wkFile02[%%f]! %PATH_LOC_WK_02%
REM    )
REM )

REM �Ƃ肠����10�񃋁[�v����
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
  if errorlevel 0 echo [%1]�t�@�C���̃R�s�[���������܂����B
  if errorlevel 1 echo [%1]�t�@�C��������܂���B
  if errorlevel 2 echo Ctrl-C��[%1]�t�@�C���̃R�s�[�����~���܂����B
  if errorlevel 4 echo [%1]�\�z�O�G���[�ŃR�s�[�����~���܂����B
  if errorlevel 5 echo [%1]hard disk witring error�B
  goto :EOF

