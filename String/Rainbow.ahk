/*
문제
Colors 라는 변수에 무지개 색을 넣고 쉼표 "," 로 구분하여 rainbow.txt 파일에
(쉼표를 StringSplit 에서 사용하려면 `, 형식으로 써야합니다)
저장하는 프로그램을 만드시오
*/

;답
Filedelete, rainbow.txt
Colors = red,orange,yellow,green,blue,navy,purple
Stringsplit, Rainbow_array, Colors, `,
Loop, %Rainbow_array0%
{
	output_t := Rainbow_array%A_index% "`n"
	FileAppend, %output_t%, rainbow.txt
}
