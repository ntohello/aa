HotNaver(){
FileEncoding, UTF-8
UrlDownloadTofile, http://www.naver.com, tempnaver.txt
Fileread, Naver, tempnaver.txt

RegExMatch(Naver,"<select name=""query""(.*?)</select>",var)
Stringreplace, var, var, <select name="query">,,All
Stringreplace, var, var, </option>,,All
Stringreplace, var, var, </select>,,All
var := RegExReplace(var, "<option value=""(.*?"">)")


msgbox, ���̹� �ǽð� �˻��� ����~`n%var%
FileDelete, tempnaver.txt
}

Naver(){
FileEncoding, UTF-8
inputbox, N, ���̹� �˻���, �˻��� ������ �Է��ϼ���,,300,100
UnicodeNaver := uriencode(N) ; �����ڵ� ��ȯ�Ѱ� �޾��� ������
run, http://search.naver.com/search.naver?where=nexearch&query=%UnicodeNaver%&sm=top_hty&fbm=0&ie=utf8
}