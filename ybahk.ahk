#include ybahk-opgg.ahk ; OPGG Function Include Line "43" Github #1
Main:
loop
{
dummy := "[F1] Msgbox 예제`n[F2] 네이버 검색`n[F3] 네이버 실시간 검색어 순위`n[F4] 롤 전적검색"
traytip, 오토핫키 기능 예제, %dummy%,,1
sleep 10000
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
inputbox, N, 네이버 검색기, 검색할 내용을 입력하세요,,300,100
UnicodeNaver := uriencode(N) ; 유니코드 변환한걸 받아줄 변수값
run, http://search.naver.com/search.naver?where=nexearch&query=%UnicodeNaver%&sm=top_hty&fbm=0&ie=utf8
return

Hotnaver:
UrlDownloadTofile, http://www.naver.com, tempnaver.txt
FileEncoding, UTF-8
Fileread, Naver, tempnaver.txt

RegExMatch(Naver,"<select name=""query""(.*?)</select>",var)
Stringreplace, var, var, <select name="query">,,All
Stringreplace, var, var, </option>,,All
Stringreplace, var, var, </select>,,All
var := RegExReplace(var, "<option value=""(.*?"">)")


msgbox, 네이버 실시간 검색어 순위~`n%var%
FileDelete, tempnaver.txt
return

OPGG:
inputbox, OP, 리그오브레전드 전적검색, 검색할 아이디를 입력하세요,,300,100
OPGG(OP) ;Call ybahk-opgg & hand over Summoner ID
return



;;;;;;;;;;;;;;;;;;;; Unicode Converter

UriEncode(Uri, Enc = "UTF-8")
{
   StrPutVar(Uri, Var, Enc)
   f := A_FormatInteger
   SetFormat, IntegerFast, H
   Loop
   {
      Code := NumGet(Var, A_Index - 1, "UChar")
      If (!Code)
         Break
      If (Code >= 0x30 && Code <= 0x39 ; 0-9
         || Code >= 0x41 && Code <= 0x5A ; A-Z
         || Code >= 0x61 && Code <= 0x7A) ; a-z
         Res .= Chr(Code)
      Else
         Res .= "%" . SubStr(Code + 0x100, -1)
   }
   SetFormat, IntegerFast, %f%
   Return, Res
}
UriDecode(Uri, Enc = "UTF-8")
{
   Pos := 1
   Loop
   {
      Pos := RegExMatch(Uri, "i)(?:%[\da-f]{2})+", Code, Pos++)
      If (Pos = 0)
         Break
      VarSetCapacity(Var, StrLen(Code) // 3, 0)
      StringTrimLeft, Code, Code, 1
      Loop, Parse, Code, `%
         NumPut("0x" . A_LoopField, Var, A_Index - 1, "UChar")
      StringReplace, Uri, Uri, `%%Code%, % StrGet(&Var, Enc), All
   }
   Return, Uri
}
StrPutVar(Str, ByRef Var, Enc = "")
{
   Len := StrPut(Str, Enc) * (Enc = "UTF-16" || Enc = "CP1200" ? 2 : 1)
   VarSetCapacity(Var, Len, 0)
   Return, StrPut(Str, &Var, Enc)
}
return
