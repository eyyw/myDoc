#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;  ��P�e �J�[�\���ړ��֘A
;------------------------------------------------------------------------------


; DanceDanceRevolution�Ɩ��̕��т��������Č����Ĉ�u�Ŋo����
; Vim�G�f�B�^�h�������Ǒ��̃A�v���ł��悭�g���Ă�̂ŗ��p���₷��
H::Send,{Blind}{Left}   ;H = ���J�[�\���L�[
J::Send,{Blind}{Down}   ;J = ���J�[�\���L�[
K::Send,{Blind}{Up}     ;K = ��J�[�\���L�[
L::Send,{Blind}{Right}  ;L = �E�J�[�\���L�[


; ���iUchi�j���̒[,�O���iOut�j�̒[�Ɉړ�����A�Ɗo����
; Home�͍ŏ�I�Ɋ��蓖�ĂĂ�����U�̕����ł��₷���̂ŕύX
U::Send,{Blind}{Home}   ;U = Home
O::Send,{Blind}{End}    ;O = End
I::Send,{Blind}{PgUp}   ;I = PgUp
P::Send,{Blind}{PgDn}   ;P = PgDn


;------------------------------------------------------------------------------
;  ��S�e �}�E�X�J�[�\���֘A
;------------------------------------------------------------------------------

; FPS�ł悭�g��WASD�L�[���}�E�X�J�[�\���̈ړ��Ɏg��
; WASD = �}�E�X�J�[�\����, ��, ��, �E
W::
A::
S::
D::
    While (True)           ;����]���������ʂ��^�ł���ԁA��A�̏������J��Ԃ����s����
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -10 : 0    ;GetKeyState() �� ?:���Z�q(����) (�O�����Z�q) �̑g�ݍ��킹
        MoveX += GetKeyState("A", "P") ? -10 : 0
        MoveY += GetKeyState("S", "P") ? 10 : 0
        MoveX += GetKeyState("D", "P") ? 10 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;�}�E�X�J�[�\�����ړ�����
        Sleep, 10                                    ;���ׂ������ꍇ�͐ݒ��ύX �ݒ�ł���l��-1�A0�A10�`m�b �ڍׂ�Sleep
    }
    Return

; Enter = ���N���b�N�i����������ƃh���b�O�j
Shift::MouseClick,left,,,,,D
Shift Up::MouseClick,left,,,,,U

; FPS���ۂ��L�[�z�u�ŁAWASD�ׂ̗ɃN���b�N�{�^����u��
Q::MouseClick,left                      ; �ϊ� + E = ���N���b�N
E::MouseClick,right                     ; �ϊ� + F = �E�N���b�N


