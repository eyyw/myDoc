REM https://note.com/nanigashi/n/nbd9759140047

@echo off
cd /d %~dp0
:�����s�����ƈ����ŕ���

:�Ǘ��ғ����Ŏ��s���Ȃ��ƃG���[�ɂȂ鏈��
openfiles > NUL 2>&1

:��L�������G���[�i���[�U�[�����j�ł���Έ�ʌ����Ŏ��s���鏈���Ɉړ�
if NOT %ERRORLEVEL% EQU 0 goto promotion

:���Ǘ��Ҍ����Ŏ��s���鏈��
echo �Ǘ��Ҍ����ł��B
pause

cls
echo ����������Ɋ������܂���
echo ���̃E�B���h�E�͎����I�ɕ��܂�
timeout /T 5 >nul
goto end

:����ʌ����Ŏ��s���鏈��
:promotion
echo ���[�U�[�����ł��B

:�Ǘ��Ҍ����Ŏ������g�����s�i���i�����j
powershell start-process %~nx0 -verb runas

:end