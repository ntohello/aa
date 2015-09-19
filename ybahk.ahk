FileEncoding, UTF-8 ; UTF-8
#include ybahk-opgg.ahk ; OPGG Function Include Line "32" Github #1
#include ybahk-naver.ahk ; Naver Function Include LIne "24,28" Github #1
Main:
loop
{
dummy := "[F1] Msgbox 예제`n[F2] 네이버 검색`n[F3] 네이버 실시간 검색어 순위`n[F4] 롤 전적검색"
traytip, 오토핫키 기능 예제, %dummy%,,1
sleep 5000
}
F1::goto Hello
F2::goto Naver
F3::goto HotNaver
F4::goto OPGG
ctrl::reload



Hello:
msgbox, Hello world
return

Naver:
Naver()
return

Hotnaver:
HotNaver()
return

OPGG:
OPGG() ;Call ybahk-opgg
return

#include ybahk-uriencode.ahk ; uriencode Function 