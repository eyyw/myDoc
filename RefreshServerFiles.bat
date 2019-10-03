echo off

REM FILE_1 = 設計QA
SET FILE_PATH_1=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\01.成果物\21.外部設計\QA\
SET FILE_NAME_1=QA一覧v3.xlsx

REM FILE_2 = 開発QA
SET FILE_PATH_2=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\01.成果物\23.開発\QA\
SET FILE_NAME_2=QA一覧.xlsx

REM FILE_3 = 設計レビュー
SET FILE_PATH_3=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\01.成果物\21.外部設計\設計レビュー\
SET FILE_NAME_3=ﾚﾋﾞｭｰ記録_一般メタル_外部設計.xlsx

REM FILE_4 = プロジェクト管理
SET FILE_PATH_4=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\99.WORK\you\20190704_開発関連資料\
SET FILE_NAME_4=Git上のプロジェクト管理.xlsx

REM FILE_5 = 受入不具合
SET FILE_PATH_5=\\26.131.131.1\pj_share\20_Fact展開（一般メタル）\01.成果物\22.テスト\01.単体テスト\02.単体テスト（オフショア）\
SET FILE_NAME_5=オフショア_テスト結果(不具合票（一覧）(1.0.6).xls



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
  rem if errorlevel 0 echo [%3]ファイルのコピーが完了しました。
  rem if errorlevel 1 echo [%3]ファイル見つかりません。
  rem if errorlevel 2 echo Ctrl-Cで[%3]ファイルのコピーが中止しました。
  rem if errorlevel 4 echo [%3]予想外エラーでコピーが中止しました。
  rem if errorlevel 5 echo [%3]hard disk witring error。
  goto :EOF


