FileEncoding, UTF-8 ; UTF-8
OPGG(){
inputbox, OP, 리그오브레전드 전적검색, 검색할 아이디를 입력하세요,,300,100
if ErrorLevel
return
else
OPGGDummy := UriEncode(OP)
UrlDownloadTofile, http://www.op.gg/summoner/userName=%OPGGDummy%, templol.txt
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

;Win
RegExMatch(OPGG, "<span class=""Win"">(.*?)\)", win)
Stringreplace, win, win, <span class="Win">,,All
Stringreplace, win, win, </span>,,All
Stringreplace, win, win, </div>,,All
/*
;Lose
RegExMatch(OPGG, "<span class=""Win"">94승</span>(.*?)</div>", lose)
Stringreplace, lose, lose, <span class="Win">94승</span>,,All
Stringreplace, lose, lose, </div>,,All
*/
/*
RegExMatch(OPGG, "<span class=""winratio"">((.*?)))", winratio)
Stringreplace, winratio, winratio, <span class="winratio">(,,All
Stringreplace, winratio, winratio, <span class="winratio">,,All
Stringreplace, winratio, winratio,  ),,All
Stringreplace, winratio, winratio,  </span>,,All
*/
RegExMatch(OPGG, "<span class=""Name"">(.*?)</span>", SummonerName)
Stringreplace, SummonerName, SummonerName, <span class="Name">,,All
Stringreplace, SummonerName, SummonerName, </span>,,All

;RegExMatch(OPGG, "<div class=""WinRatioText"">(.*?)%</div>" WinRatioText)
;Stringreplace, SummonerName, SummonerName, <div class="WinRatioText">,,All
;Stringreplace, SummonerName, SummonerName, </div>,,All

;MOST CHAMPION
;<div class="ChampionName" title="리 신">
RegExMatch(OPGG, "<div class=""ChampionName"" title=""(.*?)"">", MostChamp)
Stringreplace, MostChamp, MostChamp, <div class="ChampionName" title=",,All
Stringreplace, MostChamp, MostChamp, ">,,All

;KDA
;<span class="KDA">2.09:1</span>
RegExMatch(OPGG, "<span class=""KDA"">(.*?)</span>", MostChampKDA)
Stringreplace, MostChampKDA, MostChampKDA, <span class="KDA">,,All
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

msgbox,,리그오브레전드 전적 검색 결과 입니다., 리그오브레전드 전적검색`n`n%SummonerName% 님의 티어는 %tier% 입니다.`n모든 랭크게임 승률은 %win%`n모스트 1 챔피언은 %MostChamp% KDA : %MostChampKDA% 입니다.%rank_S%%rank_B%
Filedelete, templol.txt
}
