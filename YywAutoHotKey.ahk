#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;  �O��F
;    Change Key�g�p
;      Caps Lock -> ��Ctrl
;      �EAlt -> Caps Lock
;    Google IME�g�p
;      �ϊ��L�[ = IME�I��
;      ���ϊ��L�[ = IME�I�t
;  ��{���j�F
;    �E�������̂��߂̃V���[�g�J�b�g�Ȃ̂ɁA�K���R�X�g���傫���Ɩ{���]�|
;    �E���������Ċ֘A�t���Ŋo���₷���^�v���o���₷���V���[�g�J�b�g�ɂ���
;  �g�����F
;     �ŏ��ɑ�P�e��L���ɂ��Ďg���Ă݂�
;     �����Ɏv���o���邭�炢�g�����Ȃ���悤�ɂȂ������Q�e�ȍ~���g���Ă݂�
;  �Q�l�F
;    https://gist.github.com/kondei/87b5f783a6f84a653790
;    http://pheromone.hatenablog.com/entry/20130603/1370276768
;------------------------------------------------------------------------------
;  ��P�e �J�[�\���ړ��֘A
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
;  ��Q�e �����񑀍�֘A
;------------------------------------------------------------------------------

; BS�Ƃ�Del�����蓖�ĂĂ���������܂�g��Ȃ������̂ň�U�폜�B
; ���̓����������邩��

; \���ł������Ƃ��͉E����g��
; �X�l�[�N�P�[�X�̃R�[�h�����Ƃ��Ɋ��ƕ֗�
vkE2::+vkE2                       ;�E����\�L�[ = �A���_�[�o�[

;------------------------------------------------------------------------------
;  ��R�e �X�N���v�g�֘A
;------------------------------------------------------------------------------

; ���񂾂�X�N���v�g�̕ҏW�E���[�h�����܂߂ɂ�肽���Ȃ��Ă���̂Œǉ�

; Reload��R
vk1D & R::Reload                ;���ϊ� + R = �X�N���v�g�̃����[�h
;^+R::Reload                ;���ϊ� + R = �X�N���v�g�̃����[�h

;------------------------------------------------------------------------------
;  ��S�e �}�E�X�J�[�\���֘A
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

;------------------------------------------------------------------------------
;  ��T�e YYW�֘A �A�v���̋N��
;------------------------------------------------------------------------------

;Ctrl + Shift + C
^+C::
if WinExist("���� - ������")
    WinActivate
else
    Run, "C:\WINDOWS\system32\notepad.exe"
Return

; Ctrl + Shift + E
^+E::
if WinExist("(����)1 - sakura 2.2.0.1")
    WinActivate
else
    if WinExist("(����)1(�X�V) - sakura 2.2.0.1")
        WinActivate
    else
        Run, C:\Program Files (x86)\sakura\sakura.exe
Return


;Ctrl + Shift + Q
^+Q::
Run, "C:\yyw\300_Ref\300_software\sqldeveloperX64\sqldeveloper.exe"
Return

;------------------------------------------------------------------------------
;  ��T�e YYW�֘A�@IE
;------------------------------------------------------------------------------
; Shift + Alt + M
!+M::
;Run,"C:\Program Files\internet explorer\iexplore.exe" https://26.131.131.11/ -private
Run, https://26.131.131.11/
return

; Shift + Alt + G
!+G::
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" http://26.131.131.1/gitbucket/ -private
;Run, https://26.131.131.11/
return


vk1D & g::                                      ;Win+G�L�[�Ɋ��蓖��
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait                                        ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
Run,https://translate.google.co.jp/?hl=ja&text=%Clipboard%  ;�N���b�v�{�[�h�̓��e����������Google��URL���J��
Clipboard = %ClipSaved%                                ;�o�b�N�A�b�v�������e�������߂�
return

;------------------------------------------------------------------------------
;  ��X�e YYW�֘A�@̫��޵����
;------------------------------------------------------------------------------

:*:@wk::
Run, "C:\yyw\500_Person\500_work"
return

:*:@cyw::
Run, "C:\yyw"
return


;------------------------------------------------------------------------------
;  ��X�e YYW�֘A�@����
;------------------------------------------------------------------------------
;:*:btw::by the way {Tab} bbb {Enter}  ; Replaces "btw" with "by the way" without needing an ending character.
::-sf::SELECT if.* {Enter}FROM XXAE_CARD_ACCTG_LOG_IF if {Enter}WHERE if.RECV_DATE = '' {Enter}AND if.RESERVE_CTRL2 = '';  


:*:!psm::
SendInput you.ai{Tab}password1{Tab}
return

:*:!pst::
SendInput TISK169{Tab}TISK169{Tab}
return

:*:!psv::
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



:*:!sd::
;FormatTime, CurrentDateTime,, yyyy/MM/dd hh:mm:ss
FormatTime, CurrentDate,, yyyy/MM/dd
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
;  ��X�e YYW�֘A�@������̒u������ �Q�l�G���A

;:*:!plg::
SendInput DBMS_OUTPUT.PUT_LINE('Sqlerrm.......' || SQLERRM);
return

;:*:!kuro::
SendInput TIKK68559{Tab}
Sleep, 1000
SendInput Welcome1{Tab}
return

;:*:!csvn::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput [�@�\�C��]XXXXXXXX�̒ǉ�{Enter}{Enter}XXXX��XX��XXXX��ǉ����܂����B{Tab}
}
else
{
    SendInput [�@�\�C��]%Clipboard%�̒ǉ�{Enter}{Enter}XXXX��%Clipboard%��ǉ����܂����B{Tab}
}
return
;------------------------------------------------------------------------------


;------------------------------------------------------------------------------
;  ��X�e YYW�֘A�@������̒u������
;------------------------------------------------------------------------------

;���ϊ� + 1
vk1D & 1::

ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait 1                                      ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
if (ErrorLevel)  ; ClipWait timed out.
{
    msgbox ClipWait timed out.
    return
}

Clipboard := RegExReplace(Clipboard, "\t", "")
Clipboard := RegExReplace(Clipboard, "\r\n", "")
Clipboard := RegExReplace(Clipboard, "ooh", "�󒍃w�b�_")
Clipboard := RegExReplace(Clipboard, "ool", "�󒍖���")

SendInput %Clipboard%
Clipboard = %ClipSaved%                          ;�o�b�N�A�b�v�������e�������߂�

return




;-------------------------------------�����p��-----------

;���ϊ� + N
vk1D & N::
Clipboard = %ClipboardAll%
Clipboard := RegExReplace(Clipboard, "\t", "")
Clipboard := RegExReplace(Clipboard, "\r\n", "")
SendInput �u%Clipboard%�v���ݒ肳���
return



;���ϊ� + T
;vk1D & T::
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait 1                                      ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
if (ErrorLevel)  ; ClipWait timed out.
{
    msgbox ClipWait timed out.
    return
}
Clipboard := RegExReplace(Clipboard, "\t", "")
Clipboard := RegExReplace(Clipboard, "\r\n", "")
SendInput �u%Clipboard%�v���ݒ肳���

Clipboard = %ClipSaved%                          ;�o�b�N�A�b�v�������e�������߂�

return



;���ϊ� + F
vk1D & F::

Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait 1                                      ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
if (ErrorLevel)  ; ClipWait timed out.
{
    msgbox ClipWait timed out.
    return
}

;Clipboard := RegExReplace(Clipboard, "\t", "(") ")"
Clipboard := RegExReplace(Clipboard, "\r\n", "")
Clipboard := "--" Clipboard

return



;���ϊ� + F
;vk1D & F::

strReplaceFrom := "AA"
strReplaceTo   := ""

empty          := 
blDelSpace     := false
blDelTab       := true
blDelEnter     := true

ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait 1                                      ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
if (ErrorLevel)  ; ClipWait timed out.
{
    msgbox ClipWait timed out.
    return
}

if (blDelSpace)
{
    Clipboard := RegExReplace(Clipboard, A_Space, %empty%) 
}
if (blDelTab)
{
    Clipboard := RegExReplace(Clipboard, A_Tab, %empty%) 
}
if (blDelEnter)
{
    Clipboard := RegExReplace(Clipboard, "\r\n", %empty%) 
}

;Clipboard := RegExReplace(Clipboard, %strReplaceFrom%, %strReplaceTo%)

; �N���b�v�{�[�h���̃e�L�X�g'ABC'��'DEF'�ɒu�����A�v���[���e�L�X�g�ɕϊ�����
StringReplace, clipboard, clipboard, %strReplaceFrom%, %strReplaceTo% , All


SendInput %Clipboard%
Clipboard = %ClipSaved%                          ;�o�b�N�A�b�v�������e�������߂�

return



;------------------------------------------------------------------------------
;  ��X�e YYW�֘A�@�e�X�g�G���A
;------------------------------------------------------------------------------


;vk1D & 1::
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait                                        ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
;clipboard := RegExMatch(clipboard, "(?<=t=).+$", "DEF") 
;clipboard := RegExMatch(clipboard, "(?<=m=).+$", "DEF") 
;RegExMatch(clipboard, "(?<=t=).+$",SetTgt)
Run,http://phi-jp.github.io/tm-regetor/#i=(?<=m=).+$&t=%Clipboard%  ;�N���b�v�{�[�h�̓��e����������Google��URL���J��
Clipboard = %ClipSaved%                                ;�o�b�N�A�b�v�������e�������߂�
return


vk1D & 2::
ClipSaved = %ClipboardAll%                      ;�N���b�v�{�[�h�̓��e���o�b�N�A�b�v
Clipboard =                                     ;�N���b�v�{�[�h���N���A
Send,^c                                         ;Ctrl+C�L�[�𑗐M
ClipWait                                        ;�N���b�v�{�[�h�Ƀe�L�X�g���i�[�����܂őҋ@
;StringReplace, clipboard, clipboard, ABC, DEF, All   ; �c��?�����L ABC ��?? DEF (��?�c��?�I���e????���{)
clipboard := RegExReplace(clipboard, "ABC", "DEF") 
msgbox, %clipboard%
Clipboard = %ClipSaved%                                ;�o�b�N�A�b�v�������e�������߂�
return

vk1D & 3::
RegExMatch("abcXYZ123FKK123", "abc(.*)123(.*)", SubPat)
msgbox, %SubPat1%
return

;vk1D & c::
;FormatTime, TimeString,, yyyy/MM/dd
MsgBox %A_YEAR%/%A_MM%/%A_DD%
return


^+t::
ClipSaved = %Clipboard%
if (%Clipboard% =) {
    msgbox, test111
} else {
    msgbox, test222
}
return


vk1D & 4::
Run, C:\yyw\500_Person\200_tools\test.ahk  /run /tn Skyltprogram,, MAX, My_PID 
msgbox, %My_PID%
return


vk1D & 5::
msgbox, start222 %My_PID%
ifWinExist ahk_pid %My_PID%
    Process, Close, %My_PID%
msgbox, %LabelPID%
return
