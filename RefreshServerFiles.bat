echo off

rem SET PATH_SEV_QA=Z:\01.成果物\21.外部設計\QA\
SET PATH_SEV_QA=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\01.成果物\21.外部設計\QA\
SET FILE_QA=QA一覧v3.xlsx

SET PATH_LOC_WK=C:\yyw\500_Person\500_work\

rem copy /Y %PATH_SEV_QA%%FILE_QA% %PATH_LOC_WK%
call :startCopy %PATH_SEV_QA% %PATH_LOC_WK% %FILE_QA%

rem msg * /server:localhost [%FILE_QA%]ファイルのコピーが完了しました。

pause

goto :EOF


rem %1=cp_path_from,%2=cp_path_to,%3=cp_file_nm
:startCopy
  echo [%3]ファイルコピー中。
  copy /Y %1%3 %2
  goto :EOF


