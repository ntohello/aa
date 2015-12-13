FileEncoding, UTF-8 ; UTF-8
OPGG(){
opggyo:
inputbox, OP, 리그오브레전드 전적검색, 유명 게임인 리그오브레전드의`n닉네임을 입력하면 해당 아이디의 전적을 출력하는 예제입니다.,,300,170
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
RegExMatch(OPGG, "<title>(.*?)</title>", SummonerName)
Stringreplace, SummonerName, SummonerName, <title>,,All
Stringreplace, SummonerName, SummonerName, %A_space%- 소환사 검색 결과 :: 리그오브레전드 ( LOL : 롤 ) 전적 검색 (LOL Stats)</title>,,All
/*
Stringreplace, SummonerName, SummonerName, <span class="Level">,,All
Stringreplace, SummonerName, SummonerName, <span class="Name">,,All
Stringreplace, SummonerName, SummonerName, </span>,,All
*/

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

;UNRANKED
RegExMatch(OPGG, "<span class=""Level"">(.*?)</span>", LEVEL)
Stringreplace, LEVEL, LEVEL, <span class="Level">,,All
Stringreplace, LEVEL, LEVEL, </span>,,All

;최근 20게임
RegExMatch(OPGG, "<div class=""WinRatioText"">(.*?)</div>", ls)
Stringreplace, ls, ls, <div class="WinRatioText">,,All
Stringreplace, ls, ls, </div>,,All
Stringreplace, ls, ls, `%,,All
if(SummonerName=="SKT T1 Faker"){
	pyung := """페이커는 평가할수 없습니다."""
}else if(ls>=70){
	pyung := """제가 평가할만한분이 아닙니다.."""
}else if(ls>=60){
	pyung := """정말 잘하시네요!."""
	
}else if(ls>=50){
	pyung := """괜찮은 실력입니다."""
		
}else if(ls>=40){
	pyung := """그럭저럭 하는 실력입니다."""
	
}else{
	pyung := """평가를 생략한다..."""
}

if(SummonerName==null){
	msgbox, 죄송합니다. %OP%라는 닉네임을 찾을수 없습니다.`n잘못 입력한 경우 다시 입력해주세요.
	goto opggyo
}
if(tier==null){
	
	msgbox, %SummonerName%님은 언랭(Unranked) 의 아이디여서 일반게임 전적을 표시합니다.
	if(MostChamp==null){
		msgbox,,리그오브레전드 전적 검색 결과 입니다., 리그오브레전드 전적검색`n`n%SummonerName% 님은 %LEVEL% 입니다.`n게임을 마지막으로 플레이한 시간이`n너무 오래전이라 더이상 표시할 내용이 없습니다.
	}else{
	msgbox,,리그오브레전드 전적 검색 결과 입니다., 리그오브레전드 전적검색`n`n%SummonerName% 님은 %LEVEL% 이며`n일반게임 모스트 1 챔피언은 [%MostChamp%] KDA : %MostChampKDA% 입니다.`n최근 20게임 승률은 %ls%`%로 실력의 평가는 %pyung%
	}
}else{
msgbox,,리그오브레전드 전적 검색 결과 입니다., 리그오브레전드 전적검색`n`n%SummonerName% 님의 티어는 %tier% 입니다.`n모든 랭크게임 승률은 %win%`n모스트 1 챔피언은 [%MostChamp%] KDA : %MostChampKDA% 입니다.%rank_S%%rank_B%`n최근 20게임 승률은 %ls%`%로 실력의 평가는 %pyung%
}
Filedelete, templol.txt
}