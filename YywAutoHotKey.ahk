#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;--General Keys
;CapsLock�ASpace�ATab�AEnter�AReturn�AEscape (or Esc)�ABackspace (or BS)
;
;--Modifier Keys
;���ϊ� �� vk1D �� sc07B
;�ϊ� ��  vk1C �� sc079
;CapsLock �� vkF0 �� sc03A
;LWin �� <#
;Ctrl �� ^
;Alt �� !
;LAlt �� <!
;RAlt �� >!
;Shift �� +
;LShift �� <+
;RShift �� >+
;2�̃L�[��A���i���������j�� & 
;------------------------------------------------------------------------------




;------------------------------------------------------------------------------
;  �A�v���̋N��
;------------------------------------------------------------------------------

;Ctrl+Shift+C = ������
^+C::
if WinExist("���� - ������")
    WinActivate
else
    Run, "C:\WINDOWS\system32\notepad.exe"
Return


; Ctrl+Shift+E = sakura editor
^+E::
if WinExist("(����)1 - sakura 2.2.0.1")
    WinActivate
else
    if WinExist("(����)1(�X�V) - sakura 2.2.0.1")
        WinActivate
    else
        Run, C:\Program Files (x86)\sakura\sakura.exe
Return


;Ctrl+Shift+Q = sqldeveloper
^+Q::
Run, "C:\yyw\300_Ref\300_software\sqldeveloperX64\sqldeveloper.exe"
Return


;capslock = ReadMode��AutoHotKey
vkF0::
DetectHiddenWindows On
SetTitleMatchMode 2
if WinExist("YywReadMode.ahk") {
    WinClose YywReadMode.ahk - AutoHotkey
} else {
    Run,"C:\yyw\500_Person\200_tools\YywReadMode.ahk"
}
return


;���ϊ�+R = �X�N���v�g�̃����[�h
vk1D & R::
;msgbox "Reload���܂����B�����̃��b�Z�[�W���uReload�v�̌�ɒu���ƁA���b�Z�[�W�̕\������u�ɂȂ�AReload�����Ă��Ȃ��݂����ł��B " 
FormatTime, TimeString, %A_Now%, yyyy/MM/dd HH:mm:ss
MsgBox ��Reload���܂����B�u %TimeString% �v
Reload
return


;------------------------------------------------------------------------------
;  IE�N��
;------------------------------------------------------------------------------
; Shift + Alt + M
!+M::
Run, https://26.131.131.11/
return


; Shift + Alt + G
!+G::
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -private http://26.131.131.1/gitbucket/
return


; Shift + Alt + E
!+E::
Run,"C:\Program Files\internet explorer\iexplore.exe" -nomerge http://srv043.intra.vpjr.jp:8010/OA_HTML/AppsLogin
return


;���ϊ� + g
vk1D & g::                                      ;Win+G�L�[�Ɋ��蓖��
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait                                        ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
;Run,https://translate.google.co.jp/?hl=ja&text=%Clipboard%  ;�N���b�v�{�[�h�̓��e����������Google��URL���J��
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -private https://translate.google.co.jp/?hl=ja&text=%Clipboard%
Clipboard = %ClipSaved%                                ;�o�b�N�A�b�v�������e�������߂�
return


;���ϊ� + t
vk1D & t::                                      ;Win+G�L�[�Ɋ��蓖��
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait                                        ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -private http://26.131.131.1/redmine/issues/%Clipboard%
Clipboard = %ClipSaved%                         ;�o�b�N�A�b�v�������e�������߂�
return


;------------------------------------------------------------------------------
;  �����񑀍�֘A
;------------------------------------------------------------------------------

; BS�Ƃ�Del�����蓖�ĂĂ���������܂�g��Ȃ������̂ň�U�폜�B
; ���̓����������邩��

; \���ł������Ƃ��͉E����g��
; �X�l�[�N�P�[�X�̃R�[�h�����Ƃ��Ɋ��ƕ֗�
vkE2::+vkE2                       ;�E����\�L�[ = �A���_�[�o�[


;------------------------------------------------------------------------------
;  ���͕ϊ�
;------------------------------------------------------------------------------

:*:!psm::
SendInput you.ai{Tab}password1{Tab}
return

:*:!pst::
SendInput TISK169{Tab}TISK169{Tab}
return

:*:!psvf::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput PJ131_182_bp{Tab}PJ131_182_bps{Tab}
}
else
{
    SendInput PJ131_182_bp{Tab}PJ131_182_bps%Clipboard%{Tab}
}
return

:*:!psve::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput PJ043_002_bp{Tab}tis002{Tab}
}
else
{
    SendInput PJ043_002_bp{Tab}tis002%Clipboard%{Tab}
}
return


:*:!sd1::
;FormatTime, CurrentDateTime,, yyyy/MM/dd hh:mm:ss
FormatTime, CurrentDate,, yyyy/MM/dd
SendInput %CurrentDate%
return

:*:!sd2::
;FormatTime, CurrentDateTime,, yyyyMMdd hh:mm:ss
FormatTime, CurrentDate,, yyyyMMdd
SendInput %CurrentDate%
return

:*:!bsd:: 
FormatTime, CurrentDate,, yyyy/MM/dd
SendInput _bk%CurrentDate%
return


:*:!yyw::
SendInput TIS�k
return


:*:!sf::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput SELECT * FROM XXXXX WHERE ROWNUM < 100
}
else
{
    Clipboard := RegExReplace(Clipboard, "\t", "")
    Clipboard := RegExReplace(Clipboard, "\r\n", "")
    SendInput SELECT * FROM %Clipboard% WHERE ROWNUM < 100
}
return

:*:!ss::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput SELECT * FROM XXXXX WHERE TRUNC(CREATION_DATETIME) = TRUNC(SYSDATE) OR TRUNC(LAST_UPDATE_DATETIME) = TRUNC(SYSDATE);
}
else
{
    Clipboard := RegExReplace(Clipboard, "\t", "")
    Clipboard := RegExReplace(Clipboard, "\r\n", "")
    SendInput SELECT * FROM %Clipboard% WHERE TRUNC(CREATION_DATETIME) = TRUNC(SYSDATE) OR TRUNC(LAST_UPDATE_DATETIME) = TRUNC(SYSDATE);
}
return

:*:!df::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput DELETE FROM XXXXX WHERE 1=2
}
else
{
    Clipboard := RegExReplace(Clipboard, "\t", "")
    Clipboard := RegExReplace(Clipboard, "\r\n", "")
    SendInput DELETE FROM %Clipboard% WHERE 1=2
}
return


;------------------------------------------------------------------------------
;  ̫��޵����
;------------------------------------------------------------------------------

:*:@wk::
Run, "C:\yyw\500_Person\500_workIn2020"
return

:*:@cyw::
Run, "C:\yyw"
return




;------------------------------------------------------------------------------
;  �J�[�\���ړ��֘A
;------------------------------------------------------------------------------

; �͂��߂�
vk1D::return                  ;���ϊ��P�Ƃ͂��̂܂ܑf�ʂ�
vk1C::return                  ;�ϊ��P�Ƃ͂��̂܂ܑf�ʂ�

; DanceDanceRevolution�Ɩ��̕��т��������Č����Ĉ�u�Ŋo����
; Vim�G�f�B�^�h�������Ǒ��̃A�v���ł��悭�g���Ă�̂ŗ��p���₷��
vk1D & H::Send,{Blind}{Left}   ;���ϊ� + H = ���J�[�\���L�[
vk1D & J::Send,{Blind}{Down}   ;���ϊ� + J = ���J�[�\���L�[
vk1D & K::Send,{Blind}{Up}     ;���ϊ� + K = ��J�[�\���L�[
vk1D & L::Send,{Blind}{Right}  ;���ϊ� + L = �E�J�[�\���L�[

vk1C & H::Send,{Blind}{Left}   ;�ϊ��P�� + H = ���J�[�\���L�[
vk1C & J::Send,{Blind}{Down}   ;�ϊ��P�� + J = ���J�[�\���L�[
vk1C & K::Send,{Blind}{Up}     ;�ϊ��P�� + K = ��J�[�\���L�[
vk1C & L::Send,{Blind}{Right}  ;�ϊ��P�� + L = �E�J�[�\���L�[

; ���iUchi�j���̒[,�O���iOut�j�̒[�Ɉړ�����A�Ɗo����
; Home�͍ŏ�I�Ɋ��蓖�ĂĂ�����U�̕����ł��₷���̂ŕύX
vk1D & U::Send,{Blind}{Home}   ;���ϊ� + U = Home
vk1D & O::Send,{Blind}{End}    ;���ϊ� + O = End
vk1D & I::Send,{Blind}{PgUp}   ;���ϊ� + I = PgUp
vk1D & P::Send,{Blind}{PgDn}   ;���ϊ� + P = PgDn

vk1C & U::Send,{Blind}{Home}   ;�ϊ��P�� + U = Home
vk1C & O::Send,{Blind}{End}    ;�ϊ��P�� + O = End
vk1C & I::Send,{Blind}{PgUp}   ;�ϊ��P�� + I = PgUp
vk1C & P::Send,{Blind}{PgDn}   ;�ϊ��P�� + P = PgDn


;------------------------------------------------------------------------------
;  �}�E�X�J�[�\���֘A
;------------------------------------------------------------------------------

; FPS�ł悭�g��WASD�L�[���}�E�X�J�[�\���̈ړ��Ɏg��
; �ϊ� + WASD = �}�E�X�J�[�\����, ��, ��, �E
vk1D & W::
vk1D & A::
vk1D & S::
vk1D & D::
    While (GetKeyState("vk1D", "P"))           ;����]���������ʂ��^�ł���ԁA��A�̏������J��Ԃ����s����
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -7 : 0    ;GetKeyState() �� ?:���Z�q(����) (�O�����Z�q) �̑g�ݍ��킹
        MoveX += GetKeyState("A", "P") ? -7 : 0
        MoveY += GetKeyState("S", "P") ? 7 : 0
        MoveX += GetKeyState("D", "P") ? 7 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;�}�E�X�J�[�\�����ړ�����
        Sleep, 10                                    ;���ׂ������ꍇ�͐ݒ��ύX �ݒ�ł���l��-1�A0�A10�`m�b �ڍׂ�Sleep
    }
    Return

; �ϊ� + Enter = ���N���b�N�i����������ƃh���b�O�j
vk1D & Shift::MouseClick,left,,,,,D
vk1D & Shift Up::MouseClick,left,,,,,U

; FPS���ۂ��L�[�z�u�ŁAWASD�ׂ̗ɃN���b�N�{�^����u��
vk1D & Q::MouseClick,left                      ; �ϊ� + E = ���N���b�N
vk1D & E::MouseClick,right                     ; �ϊ� + F = �E�N���b�N

; ��L�̈ړ��L�[�������Ɖ������邱�Ƃ�����
; ��x�ɑ傫���ړ�������L�[��ʓr���蓖�ĂĂ���
; �ϊ� + IJKL = �}�E�X�J�[�\����, ��, ��, �E
; J�L�[���x�[�X�ɖ��L�[�Ɠ����z�u�BWASD�L�[�ƍ��킹��
vk1C & W::MouseMove, 0, -220, 0, R
vk1C & A::MouseMove, -220, 0, 0, R
vk1C & S::MouseMove, 0, 220, 0, R
vk1C & D::MouseMove, 220, 0, 0, R






