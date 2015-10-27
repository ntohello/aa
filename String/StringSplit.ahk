FileDelete, output.txt
String := "My Name is Hearthstone" ; 내 이름은 벽난로의 바닥돌이야
StringSplit, word_array, String, %A_Space%
Msgbox, word_array 의 4번째에 들어있는 값은 %word_array4% 입니다.

Loop, %word_array0%
{
	output := "[" A_index "]" " : " word_array%A_index%
	output_t := word_array%A_index% "`n"
	msgbox, %output%
	FileAppend, %output_t%, output.txt
}
