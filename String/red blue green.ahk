Colors = red|green|blue
StringSplit,ColorArray,Colors,|,|
;StringSplit, 외부출력, 분활할것, 쪼개는데 구분될 문자, 이문자를 만나면 파싱종료
Loop,%ColorArray0% ; 외부 출력한 것을 다시
{
	;A_index : 반복문 돌때마다 숫자가 1씩증가함
    this_color := ColorArray%A_index%
    MsgBox, Color number %A_index% is %this_color%.
}