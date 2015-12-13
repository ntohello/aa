FileEncoding, UTF-8 ; UTF-8
#include ybahk-opgg.ahk ; OPGG Function Include Line "15" Github #1
#include ybahk-naver.ahk ; Naver Function Include LIne "13,14" Github #1
#include ybahk-pibonachi.ahk ; 최상원

Main:
loop
{
dummy := "[F1] Msgbox 예제`n[F2] 네이버 검색`n[F3] 네이버 실시간 검색어 순위`n[F4] 리그오브레전드 전적검색`n[F5] 오목게임 실행`n[F6] 피보나치 함수값 구하기"
traytip, 오토핫키 기능 예제, %dummy%,,1
sleep 7000
}
F1::goto Hello
F2::goto Naver
F3::goto HotNaver
F4::goto OPGG
F5::goto omok
F6::goto pibo
F9::
Run, taskkill.exe /F /IM omok.exe,, Hide
goto Main
return
F10::reload



Hello:
msgbox,, 오토핫키란?, 오토핫키는 무료 오픈소스 기반의 매크로 스크립트 언어입니다.`n기본적으로 단순반복 작업등 컴퓨터 혼자 자동화 하는 프로그래밍이 가능합니다.`n참고 : http://ahkscript.org , http://autohotkey.com
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

omok:
run,./Omok/omok.exe
Loop{
traytip, 오목이 실행중입니다., 종료는 F9으로 해주세요,,1
sleep 3000
}
return

pibo: ;최상원 만듬
pibo()
return

#include ybahk-uriencode.ahk ; uriencode Function 