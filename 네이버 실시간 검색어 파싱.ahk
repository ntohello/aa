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
