String := "와 한글 어렵다!"
StringTrimLeft, output, String, 3 ; 전체 문장중 왼쪽 3개 뺍니다.
msgbox, %output%
StringTrimRight, output, String, 3
msgbox, %output%