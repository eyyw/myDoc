REM https://note.com/nanigashi/n/nbd9759140047

@echo off
cd /d %~dp0
:■実行権限と引数で分岐

:管理者特権で実行しないとエラーになる処理
openfiles > NUL 2>&1

:上記処理がエラー（ユーザー権限）であれば一般権限で実行する処理に移動
if NOT %ERRORLEVEL% EQU 0 goto promotion

:■管理者権限で実行する処理
echo 管理者権限です。
pause

cls
echo 処理が正常に完了しました
echo このウィンドウは自動的に閉じます
timeout /T 5 >nul
goto end

:■一般権限で実行する処理
:promotion
echo ユーザー権限です。

:管理者権限で自分自身を実行（昇格処理）
powershell start-process %~nx0 -verb runas

:end