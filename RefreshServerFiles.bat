echo off

REM FILE_1 = �݌vQA
SET FILE_PATH_1=\\26.131.131.1\pj_share\20_Fact�W�J�i��ʃ��^���j\01.���ʕ�\21.�O���݌v\QA\
SET FILE_NAME_1=QA�ꗗv3.xlsx

REM FILE_2 = �J��QA
SET FILE_PATH_2=\\26.131.131.1\pj_share\20_Fact�W�J�i��ʃ��^���j\01.���ʕ�\23.�J��\QA\
SET FILE_NAME_2=QA�ꗗ.xlsx

REM FILE_3 = �݌v���r���[
SET FILE_PATH_3=\\26.131.131.1\pj_share\20_Fact�W�J�i��ʃ��^���j\01.���ʕ�\21.�O���݌v\�݌v���r���[\
SET FILE_NAME_3=��ޭ��L�^_��ʃ��^��_�O���݌v.xlsx

REM FILE_4 = �v���W�F�N�g�Ǘ�
SET FILE_PATH_4=\\26.131.131.1\pj_share\20_Fact�W�J�i��ʃ��^���j\99.WORK\you\20190704_�J���֘A����\
SET FILE_NAME_4=Git��̃v���W�F�N�g�Ǘ�.xlsx

REM FILE_5 = ����s�
SET FILE_PATH_5=\\26.131.131.1\pj_share\20_Fact�W�J�i��ʃ��^���j\01.���ʕ�\22.�e�X�g\01.�P�̃e�X�g\02.�P�̃e�X�g�i�I�t�V���A�j\
SET FILE_NAME_5=�I�t�V���A_�e�X�g����(�s��[�i�ꗗ�j(1.0.6).xls



SET PATH_LOC_WK=C:\yyw\500_Person\500_work\

call :startCopy %FILE_PATH_1% %PATH_LOC_WK% %FILE_NAME_1%
call :startCopy %FILE_PATH_2% %PATH_LOC_WK% %FILE_NAME_2%
call :startCopy %FILE_PATH_3% %PATH_LOC_WK% %FILE_NAME_3%
call :startCopy %FILE_PATH_4% %PATH_LOC_WK% %FILE_NAME_4%
call :startCopy %FILE_PATH_5% %PATH_LOC_WK% %FILE_NAME_5%


pause

goto :EOF


rem %1=cp_path_from,%2=cp_path_to,%3=cp_file_nm
:startCopy
  echo copy %1%3 %2
  copy /Y %1%3 %2
  rem if errorlevel 0 echo [%3]�t�@�C���̃R�s�[���������܂����B
  rem if errorlevel 1 echo [%3]�t�@�C��������܂���B
  rem if errorlevel 2 echo Ctrl-C��[%3]�t�@�C���̃R�s�[�����~���܂����B
  rem if errorlevel 4 echo [%3]�\�z�O�G���[�ŃR�s�[�����~���܂����B
  rem if errorlevel 5 echo [%3]hard disk witring error�B
  goto :EOF


