#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;  前提：
;    Change Key使用
;      Caps Lock -> 左Ctrl
;      右Alt -> Caps Lock
;    Google IME使用
;      変換キー = IMEオン
;      無変換キー = IMEオフ
;  基本方針：
;    ・効率化のためのショートカットなのに、習得コストが大きいと本末転倒
;    ・したがって関連付けで覚えやすい／思い出しやすいショートカットにする
;  使い方：
;     最初に第１弾を有効にして使ってみる
;     すぐに思い出せるくらい使いこなせるようになったら第２弾以降を使ってみる
;  参考：
;    https://gist.github.com/kondei/87b5f783a6f84a653790
;    http://pheromone.hatenablog.com/entry/20130603/1370276768
;------------------------------------------------------------------------------
;  第１弾 カーソル移動関連
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
;  第２弾 文字列操作関連
;------------------------------------------------------------------------------

; BSとかDelを割り当てていたがあんまり使わなかったので一旦削除。
; その内復活させるかも

; \が打ちたいときは右上を使う
; スネークケースのコード書くときに割と便利
vkE2::+vkE2                       ;右下の\キー = アンダーバー

;------------------------------------------------------------------------------
;  第３弾 スクリプト関連
;------------------------------------------------------------------------------

; だんだんスクリプトの編集・ロードをこまめにやりたくなってくるので追加

; ReloadのR
vk1D & R::Reload                ;無変換 + R = スクリプトのリロード
;^+R::Reload                ;無変換 + R = スクリプトのリロード

;------------------------------------------------------------------------------
;  第４弾 マウスカーソル関連
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

;------------------------------------------------------------------------------
;  第５弾 YYW関連 アプリの起動
;------------------------------------------------------------------------------

;Ctrl + Shift + C
^+C::
if WinExist("無題 - メモ帳")
    WinActivate
else
    Run, "C:\WINDOWS\system32\notepad.exe"
Return

; Ctrl + Shift + E
^+E::
if WinExist("(無題)1 - sakura 2.2.0.1")
    WinActivate
else
    Run, C:\Program Files (x86)\sakura\sakura.exe
Return


;Ctrl + Shift + Q
^+Q::
Run, "C:\yyw\300_software\sqldeveloperX64\sqldeveloper.exe"
Return

;------------------------------------------------------------------------------
;  第５弾 YYW関連　IE
;------------------------------------------------------------------------------
; Shift + Alt + M
!+M::
;Run,"C:\Program Files\internet explorer\iexplore.exe" https://26.131.131.11/ -private
Run, https://26.131.131.11/
return


vk1D & g::                                      ;Win+Gキーに割り当て
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
Run,https://translate.google.co.jp/?hl=ja&text=%Clipboard%  ;クリップボードの内容を検索するGoogleのURLを開く
Clipboard = %ClipSaved%                                ;バックアップした内容を書き戻し
return

;------------------------------------------------------------------------------
;  第６弾 YYW関連　入力
;------------------------------------------------------------------------------
;:*:btw::by the way {Tab} bbb {Enter}  ; Replaces "btw" with "by the way" without needing an ending character.
::-sf::SELECT if.* {Enter}FROM XXAE_CARD_ACCTG_LOG_IF if {Enter}WHERE if.RECV_DATE = '' {Enter}AND if.RESERVE_CTRL2 = '';  


:*:@wk::
Run, "C:\yyw\500_Person\500_work"
return

:*:@cyw::
Run, "C:\yyw"
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
SendInput TIS楊
return

:*:!plg::
SendInput DBMS_OUTPUT.PUT_LINE('Sqlerrm.......' || SQLERRM);
return


:*:!kuro::
SendInput TIKK68559{Tab}
Sleep, 1000
SendInput Welcome1{Tab}
return

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

:*:!csvn::
value := RegExReplace(clipboard, "[`r`n`t]+$")
if value =
{
    SendInput [機能修正]XXXXXXXXの追加{Enter}{Enter}XXXXにXXのXXXXを追加しました。{Tab}
}
else
{
    SendInput [機能修正]%Clipboard%の追加{Enter}{Enter}XXXXに%Clipboard%を追加しました。{Tab}
}
return




;------------------------------------------------------------------------------
;  第７弾 YYW関連　文字列の置き換え
;------------------------------------------------------------------------------



;無変換 + F
vk1D & F::

strReplaceFrom := "AA"
strReplaceTo   := ""

empty          := 
blDelSpace     := false
blDelTab       := true
blDelEnter     := true

ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait 1                                      ;クリップボードにテキストが格納されるまで待機
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

; クリップボード内のテキスト'ABC'を'DEF'に置換し、プレーンテキストに変換する
StringReplace, clipboard, clipboard, %strReplaceFrom%, %strReplaceTo% , All


SendInput %Clipboard%
Clipboard = %ClipSaved%                          ;バックアップした内容を書き戻し

return



;------------------------------------------------------------------------------
;  第７弾 YYW関連　テストエリア
;------------------------------------------------------------------------------


vk1D & 1::
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
;clipboard := RegExMatch(clipboard, "(?<=t=).+$", "DEF") 
;clipboard := RegExMatch(clipboard, "(?<=m=).+$", "DEF") 
;RegExMatch(clipboard, "(?<=t=).+$",SetTgt)
Run,http://phi-jp.github.io/tm-regetor/#i=(?<=m=).+$&t=%Clipboard%  ;クリップボードの内容を検索するGoogleのURLを開く
Clipboard = %ClipSaved%                                ;バックアップした内容を書き戻し
return


vk1D & 2::
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
;StringReplace, clipboard, clipboard, ABC, DEF, All   ; 把剪?板中所有 ABC 替?? DEF (同?把剪?板的内容????文本)
clipboard := RegExReplace(clipboard, "ABC", "DEF") 
msgbox, %clipboard%
Clipboard = %ClipSaved%                                ;バックアップした内容を書き戻し
return

vk1D & 3::
RegExMatch("abcXYZ123FKK123", "abc(.*)123(.*)", SubPat)
msgbox, %SubPat1%
return

vk1D & c::
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
