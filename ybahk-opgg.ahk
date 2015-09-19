OPGG(LOLID){
OPGGDummy := UriEncode(LOLID)
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
}