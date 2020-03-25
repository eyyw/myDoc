#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;--General Keys
;CapsLock、Space、Tab、Enter、Return、Escape (or Esc)、Backspace (or BS)
;
;--Modifier Keys
;無変換 ⇒ vk1D ⇒ sc07B
;変換 ⇒  vk1C ⇒ sc079
;CapsLock ⇒ vkF0 ⇒ sc03A
;LWin ⇒ <#
;Ctrl ⇒ ^
;Alt ⇒ !
;LAlt ⇒ <!
;RAlt ⇒ >!
;Shift ⇒ +
;LShift ⇒ <+
;RShift ⇒ >+
;2つのキーを連結（同時押し）⇒ & 
;------------------------------------------------------------------------------




;------------------------------------------------------------------------------
;  アプリの起動
;------------------------------------------------------------------------------

;Ctrl+Shift+C = メモ帳
^+C::
if WinExist("無題 - メモ帳")
    WinActivate
else
    Run, "C:\WINDOWS\system32\notepad.exe"
Return


; Ctrl+Shift+E = sakura editor
^+E::
if WinExist("(無題)1 - sakura 2.2.0.1")
    WinActivate
else
    if WinExist("(無題)1(更新) - sakura 2.2.0.1")
        WinActivate
    else
        Run, C:\Program Files (x86)\sakura\sakura.exe
Return


;Ctrl+Shift+Q = sqldeveloper
^+Q::
Run, "C:\yyw\300_Ref\300_software\sqldeveloperX64\sqldeveloper.exe"
Return


;capslock = ReadModeのAutoHotKey
vkF0::
DetectHiddenWindows On
SetTitleMatchMode 2
if WinExist("YywReadMode.ahk") {
    WinClose YywReadMode.ahk - AutoHotkey
} else {
    Run,"C:\yyw\500_Person\200_tools\YywReadMode.ahk"
}
return


;無変換+R = スクリプトのリロード
vk1D & R::
;msgbox "Reloadしました。※このメッセージが「Reload」の後に置くと、メッセージの表示が一瞬になり、Reloadもしていないみたいです。 " 
FormatTime, TimeString, %A_Now%, yyyy/MM/dd HH:mm:ss
MsgBox 再Reloadしました。「 %TimeString% 」
Reload
return


;------------------------------------------------------------------------------
;  IE起動
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


;無変換 + g
vk1D & g::                                      ;Win+Gキーに割り当て
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
;Run,https://translate.google.co.jp/?hl=ja&text=%Clipboard%  ;クリップボードの内容を検索するGoogleのURLを開く
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -private https://translate.google.co.jp/?hl=ja&text=%Clipboard%
Clipboard = %ClipSaved%                                ;バックアップした内容を書き戻し
return


;無変換 + t
vk1D & t::                                      ;Win+Gキーに割り当て
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
Run,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" -private http://26.131.131.1/redmine/issues/%Clipboard%
Clipboard = %ClipSaved%                         ;バックアップした内容を書き戻し
return


;------------------------------------------------------------------------------
;  文字列操作関連
;------------------------------------------------------------------------------

; BSとかDelを割り当てていたがあんまり使わなかったので一旦削除。
; その内復活させるかも

; \が打ちたいときは右上を使う
; スネークケースのコード書くときに割と便利
vkE2::+vkE2                       ;右下の\キー = アンダーバー


;------------------------------------------------------------------------------
;  入力変換
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
SendInput TIS楊
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
;  ﾌｫﾙﾀﾞｵｰﾌﾟﾝ
;------------------------------------------------------------------------------

:*:@wk::
Run, "C:\yyw\500_Person\500_workIn2020"
return

:*:@cyw::
Run, "C:\yyw"
return




;------------------------------------------------------------------------------
;  カーソル移動関連
;------------------------------------------------------------------------------

; はじめに
vk1D::return                  ;無変換単独はそのまま素通し
vk1C::return                  ;変換単独はそのまま素通し

; DanceDanceRevolutionと矢印の並びが同じって言われて一瞬で覚えた
; Vimエディタ派生だけど他のアプリでもよく使われてるので流用しやすい
vk1D & H::Send,{Blind}{Left}   ;無変換 + H = 左カーソルキー
vk1D & J::Send,{Blind}{Down}   ;無変換 + J = 下カーソルキー
vk1D & K::Send,{Blind}{Up}     ;無変換 + K = 上カーソルキー
vk1D & L::Send,{Blind}{Right}  ;無変換 + L = 右カーソルキー

vk1C & H::Send,{Blind}{Left}   ;変換単独 + H = 左カーソルキー
vk1C & J::Send,{Blind}{Down}   ;変換単独 + J = 下カーソルキー
vk1C & K::Send,{Blind}{Up}     ;変換単独 + K = 上カーソルキー
vk1C & L::Send,{Blind}{Right}  ;変換単独 + L = 右カーソルキー

; 内（Uchi）側の端,外側（Out）の端に移動する、と覚える
; Homeは最初Iに割り当てていたがUの方が打ちやすいので変更
vk1D & U::Send,{Blind}{Home}   ;無変換 + U = Home
vk1D & O::Send,{Blind}{End}    ;無変換 + O = End
vk1D & I::Send,{Blind}{PgUp}   ;無変換 + I = PgUp
vk1D & P::Send,{Blind}{PgDn}   ;無変換 + P = PgDn

vk1C & U::Send,{Blind}{Home}   ;変換単独 + U = Home
vk1C & O::Send,{Blind}{End}    ;変換単独 + O = End
vk1C & I::Send,{Blind}{PgUp}   ;変換単独 + I = PgUp
vk1C & P::Send,{Blind}{PgDn}   ;変換単独 + P = PgDn


;------------------------------------------------------------------------------
;  マウスカーソル関連
;------------------------------------------------------------------------------

; FPSでよく使うWASDキーをマウスカーソルの移動に使う
; 変換 + WASD = マウスカーソル上, 左, 下, 右
vk1D & W::
vk1D & A::
vk1D & S::
vk1D & D::
    While (GetKeyState("vk1D", "P"))           ;式を評価した結果が真である間、一連の処理を繰り返し実行する
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -7 : 0    ;GetKeyState() と ?:演算子(条件) (三項演算子) の組み合わせ
        MoveX += GetKeyState("A", "P") ? -7 : 0
        MoveY += GetKeyState("S", "P") ? 7 : 0
        MoveX += GetKeyState("D", "P") ? 7 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;マウスカーソルを移動する
        Sleep, 10                                    ;負荷が高い場合は設定を変更 設定できる値は-1、0、10～m秒 詳細はSleep
    }
    Return

; 変換 + Enter = 左クリック（押し続けるとドラッグ）
vk1D & Shift::MouseClick,left,,,,,D
vk1D & Shift Up::MouseClick,left,,,,,U

; FPSっぽいキー配置で、WASDの隣にクリックボタンを置く
vk1D & Q::MouseClick,left                      ; 変換 + E = 左クリック
vk1D & E::MouseClick,right                     ; 変換 + F = 右クリック

; 上記の移動キーだけだと遠すぎることが多い
; 一度に大きく移動させるキーを別途割り当てておく
; 変換 + IJKL = マウスカーソル上, 左, 下, 右
; Jキーをベースに矢印キーと同じ配置。WASDキーと合わせる
vk1C & W::MouseMove, 0, -220, 0, R
vk1C & A::MouseMove, -220, 0, 0, R
vk1C & S::MouseMove, 0, 220, 0, R
vk1C & D::MouseMove, 220, 0, 0, R






