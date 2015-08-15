;This code use temp file (for html parsing) file name is tempformaple.txt

inputbox, a, 파풀라투스 클리어횟수 조회, 닉네임을 입력하세요,,300,100
{
if errorlevel
;if click cancel button
exitapp
}

UrlDownloadToFile,% "http://maview.nexon.com/Rank/Boss3?b=23000077&k="uriencode(a), tempformaple.txt
;23000077 = Papulatus
;you can change b=~~~~ 
Fileread, Result, tempformaple.txt

;Parsing Clear Count
RegExMatch(Result,"<td class=""record"">(.*)</td>",var)
RegExMatch(var,"[0-9]+",var2)


if (var2 = ""){
   msgbox, 없는 아이디 입니다.
   filedelete, tempformaple.txt
   exitapp
}


else{
   if(var2>=10){
   msgbox, 이 플레이어를 초대하는걸 권장합니다.`n%a%님은 %var2%회 클리어입니다.
   Filedelete, tempformaple.txt
   }
   ;파풀라투스 확클팟 최소 기준인 10회 이상이면 권장 알림 표시
   ;if Papulatus Clear Count > 10
   if(var2<10){
   msgbox, %var2%회 클리어입니다.
   filedelete, tempformaple.txt
   }
}

;;;;;;;;;;; URI Encoder For Korean ;;;;;;;;;;;
;; This Code Korean String convert web UTF-8;;
;; thanks to autohotkey.com in answers      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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