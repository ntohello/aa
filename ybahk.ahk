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
OPGGDummy := UriEncode(OP)
UrlDownloadTofile, http://www.op.gg/summoner/userName=%OPGGDummy%, templol.txt
FileEncoding, UTF-8
Fileread, OPGG, templol.txt

RegExMatch(OPGG, "<span class=""tierRank"">(.*?)</span>", tier)
Stringreplace, tier, tier, <span class="tierRank">,,All
Stringreplace, tier, tier, </span>,,All
Stringreplace, tier, tier, 1,I,All
Stringreplace, tier, tier, 2,II,All
Stringreplace, tier, tier, 3,III,All
Stringreplace, tier, tier, 4,IV,All
Stringreplace, tier, tier, 5,V,All
Stringreplace, tier, tier, Bronze,브론즈,All
Stringreplace, tier, tier, Silver,실버,All
Stringreplace, tier, tier, Gold,골드,All
Stringreplace, tier, tier, Platinum,플레티넘,All
Stringreplace, tier, tier, Diamond,다이아,All
Stringreplace, tier, tier, Master,마스터,All
Stringreplace, tier, tier, Challenger,챌린저,All

RegExMatch(OPGG, "<span class=""wins"">(.*?)</span>", win)
Stringreplace, win, win, <span class="wins">,,All
Stringreplace, win, win, </span>,,All

RegExMatch(OPGG, "<span class=""losses"">(.*?)</span>", lose)
Stringreplace, lose, lose, <span class="losses">,,All
Stringreplace, lose, lose, </span>,,All

RegExMatch(OPGG, "<span class=""winratio"">((.*?))</span>", winratio)
Stringreplace, winratio, winratio, <span class="winratio">(,,All
Stringreplace, winratio, winratio, <span class="winratio">,,All
Stringreplace, winratio, winratio,  ),,All
Stringreplace, winratio, winratio,  </span>,,All

RegExMatch(OPGG, "data-username=""(.*?)""", SummonerName)
Stringreplace, SummonerName, SummonerName, ",,All
Stringreplace, SummonerName, SummonerName, data-username=,,All

;RegExMatch(OPGG, "<div class=""WinRatioText"">(.*?)%</div>" WinRatioText)
;Stringreplace, SummonerName, SummonerName, <div class="WinRatioText">,,All
;Stringreplace, SummonerName, SummonerName, </div>,,All
RegExMatch(OPGG, "<span class=""name"">(.*?)</span>", MostChamp)
Stringreplace, MostChamp, MostChamp, <span class="name">,,All
Stringreplace, MostChamp, MostChamp, </span>,,All
RegExMatch(OPGG, "<span class=""kda average"">(.*?)</span>", MostChampKDA)
Stringreplace, MostChampKDA, MostChampKDA, <span class="kda average">,,All
Stringreplace, MostChampKDA, MostChampKDA, </span>,,All

RegExMatch(OPGG, "title=""래더 랭킹 목록에서 보기"" target=""_blank"">(.*?)</span>", rank_S)
Stringreplace, rank_S, rank_S, title="래더 랭킹 목록에서 보기" target="_blank">,,All
Stringreplace, rank_S, rank_S, <span class="ranking">,,All
Stringreplace, rank_S, rank_S, </span>,,All
Stringreplace, rank_S, rank_S, %A_TAB%,,All

RegExMatch(OPGG, "</span>위(.*?)</a>", rank_B)
Stringreplace, rank_B, rank_B, </span>,,All
Stringreplace, rank_B, rank_B, %A_TAB%,,All
Stringreplace, rank_B, rank_B, </a>,,All
Stringreplace, rank_B, rank_B, 위,위,All

msgbox,,리그오브레전드 전적 검색 결과 입니다., 리그오브레전드 전적검색`n`n%SummonerName% 님의 티어는 %tier% 입니다.`nWin : %win% Lose : %lose% (%winratio%)`n모스트 1 챔피언은 %MostChamp% KDA : %MostChampKDA% 입니다.%rank_S%%rank_B%
Filedelete, templol.txt
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
