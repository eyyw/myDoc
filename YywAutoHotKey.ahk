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
Run, "C:\WINDOWS\system32\notepad.exe"
Return

; Shift + Alt + A
;!+A::
;Run, "C:\Program Files (x86)\PuTTY\putty.exe" -load 仕訳/財務APサーバ -l intra_admin
;Return

; Shift + Alt + D
!+D::
Run, "C:\Program Files (x86)\PuTTY\putty.exe" -load 仕訳単体DB -l intra_admin
Return

; Shift + Alt + E
; edit_autohotkeyという名前でよく使うエディタのショートカットを作っておく
; ショートカットの引数としてAutoHotKey.ahkの絶対パスを渡す（パスを渡せるエディタであれば）
; ショートカットはPathが通った場所に置いておく
; メモ帳でいいならホットキーは"Edit"でいいr
!+E::
Run, C:\Program Files (x86)\sakura\sakura.exe
Return


;------------------------------------------------------------------------------
;  第５弾 YYW関連　IE
;------------------------------------------------------------------------------
; Shift + Alt + S
!+S::
if (not WinExist("ahk_class PuTTY"))
{
    Run, "C:\Program Files (x86)\PuTTY\putty.exe" -load 仕訳/財務APサーバ -l intra_admin
    sleep, 1000
}
Run,"C:\Program Files\internet explorer\iexplore.exe" http://skfinebap1p.aws.co.jp:8010/OA_HTML/AppsLocalLogin.jsp -private
sleep, 3000
Send XXAE_SETUP{Tab}XXAE_SETUP{Tab}{Enter}
return


; Shift + Alt + A
!+A::
if (not WinExist("ahk_class PuTTY"))
{
    Run, "C:\Program Files (x86)\PuTTY\putty.exe" -load 仕訳/財務APサーバ -l intra_admin
    sleep, 1000
}
Run,"C:\Program Files\internet explorer\iexplore.exe" http://skfinebap1p.aws.co.jp:8010/OA_HTML/AppsLocalLogin.jsp -private
sleep, 3000
Send XXAE_WFAPRV{Tab}XXAE_WFAPRV{Tab}{Enter}
return


;------------------------------------------------------------------------------
;  第６弾 YYW関連　入力
;------------------------------------------------------------------------------
;:*:btw::by the way {Tab} bbb {Enter}  ; Replaces "btw" with "by the way" without needing an ending character.
::-sf::SELECT if.* {Enter}FROM XXAE_CARD_ACCTG_LOG_IF if {Enter}WHERE if.RECV_DATE = '' {Enter}AND if.RESERVE_CTRL2 = '';  




vk1D & g::                                      ;Win+Gキーに割り当て
ClipSaved = %ClipboardAll%                      ;クリップボードの内容をバックアップ
Clipboard =                                     ;クリップボードをクリア
Send,^c                                         ;Ctrl+Cキーを送信
ClipWait                                        ;クリップボードにテキストが格納されるまで待機
Run,https://translate.google.co.jp/?hl=ja&text=%Clipboard%  ;クリップボードの内容を検索するGoogleのURLを開く
Clipboard = %ClipSaved%                                ;バックアップした内容を書き戻し
return


:*:!sd::  ; 此热字串通过后面的命令把 "!sd" 替换成当前日期和时间.
;FormatTime, CurrentDateTime,, yyyy/MM/dd hh:mm:ss
FormatTime, CurrentDate,, yyyy/MM/dd
SendInput %CurrentDate%
return

:*:!yyw::
SendInput TIS楊
return

:*:!log::
SendInput FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'errSQL= ' || );
return

:*:!err::
value := RegExReplace(clipboard, "[`r`n`t]+$")

if value =
{ 
SendInput --X.X.XXXテスト用ソース add start %A_YEAR%/%A_MM%/%A_DD% by yyw{Enter}lv_retcode := xxfnd_constant_pkg.cv_error;{Enter}--X.X.XXXテスト用ソース add end   %A_YEAR%/%A_MM%/%A_DD% by yyw{Enter}
}
else
{
SendInput --%Clipboard%テスト用ソース add start %A_YEAR%/%A_MM%/%A_DD% by yyw{Enter}lv_retcode := xxfnd_constant_pkg.cv_error;{Enter}--%Clipboard%テスト用ソース add end   %A_YEAR%/%A_MM%/%A_DD% by yyw{Enter}
}
return

:*:!rw::
SendInput 31_記述ミス{Tab}35_単純ミス・確認不足{Tab}03_内部設計{Tab}01_単一機能に影響{Tab}01_要{Tab}ご指摘通りにソースを移動しました。{Tab}2018/10/10{Tab}2018/10/10{Tab}TIS楊{Enter}
return

:*:!sf::
SendInput 会計{Tab}フォルダ{Tab}【自動仕訳】セットアップシート_開発部Rv依頼{Tab}TIS石井{Tab}MUN大平様、小澤様、石川様{Tab}以下の領域のセットアップシートを送付いたします。
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
;StringReplace, clipboard, clipboard, ABC, DEF, All   ; 把剪贴板中所有 ABC 替换为 DEF (同时把剪贴板的内容转换为纯文本)
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
