#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;------------------------------------------------------------------------------
;  第１弾 カーソル移動関連
;------------------------------------------------------------------------------


; DanceDanceRevolutionと矢印の並びが同じって言われて一瞬で覚えた
; Vimエディタ派生だけど他のアプリでもよく使われてるので流用しやすい
H::Send,{Blind}{Left}   ;H = 左カーソルキー
J::Send,{Blind}{Down}   ;J = 下カーソルキー
K::Send,{Blind}{Up}     ;K = 上カーソルキー
L::Send,{Blind}{Right}  ;L = 右カーソルキー


; 内（Uchi）側の端,外側（Out）の端に移動する、と覚える
; Homeは最初Iに割り当てていたがUの方が打ちやすいので変更
U::Send,{Blind}{Home}   ;U = Home
O::Send,{Blind}{End}    ;O = End
I::Send,{Blind}{PgUp}   ;I = PgUp
P::Send,{Blind}{PgDn}   ;P = PgDn


;------------------------------------------------------------------------------
;  第４弾 マウスカーソル関連
;------------------------------------------------------------------------------

; FPSでよく使うWASDキーをマウスカーソルの移動に使う
; WASD = マウスカーソル上, 左, 下, 右
W::
A::
S::
D::
    While (True)           ;式を評価した結果が真である間、一連の処理を繰り返し実行する
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("W", "P") ? -10 : 0    ;GetKeyState() と ?:演算子(条件) (三項演算子) の組み合わせ
        MoveX += GetKeyState("A", "P") ? -10 : 0
        MoveY += GetKeyState("S", "P") ? 10 : 0
        MoveX += GetKeyState("D", "P") ? 10 : 0
        MouseMove, %MoveX%, %MoveY%, 1, R           ;マウスカーソルを移動する
        Sleep, 10                                    ;負荷が高い場合は設定を変更 設定できる値は-1、0、10～m秒 詳細はSleep
    }
    Return

; Enter = 左クリック（押し続けるとドラッグ）
Shift::MouseClick,left,,,,,D
Shift Up::MouseClick,left,,,,,U

; FPSっぽいキー配置で、WASDの隣にクリックボタンを置く
Q::MouseClick,left                      ; 変換 + E = 左クリック
E::MouseClick,right                     ; 変換 + F = 右クリック


