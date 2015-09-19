HotNaver(){
FileEncoding, UTF-8
UrlDownloadTofile, http://www.naver.com, tempnaver.txt
Fileread, Naver, tempnaver.txt

RegExMatch(Naver,"<select name=""query""(.*?)</select>",var)
Stringreplace, var, var, <select name="query">,,All
Stringreplace, var, var, </option>,,All
Stringreplace, var, var, </select>,,All
var := RegExReplace(var, "<option value=""(.*?"">)")


msgbox, 네이버 실시간 검색어 순위~`n%var%
FileDelete, tempnaver.txt
}

Naver(){
FileEncoding, UTF-8
inputbox, N, 네이버 검색기, 검색할 내용을 입력하세요,,300,100
if ErrorLevel
return
else
UnicodeNaver := uriencode(N) ; 유니코드 변환한걸 받아줄 변수값
run, http://search.naver.com/search.naver?where=nexearch&query=%UnicodeNaver%&sm=top_hty&fbm=0&ie=utf8
}