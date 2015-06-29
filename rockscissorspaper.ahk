F9::
/*
	오토핫키로 조건문을 활용해 가위바위보를 만드는 소스입니다.
	
	게임이 끝나면 게임 결과를 출력 합니다.
	
	F9를 누르면 게임을 시작합니다. F10을 누르거나 입력창에 "그만"을 입력하면 게임을 종료합니다.
	
	아무것도 입력하지 않으면 경고메세지를 보냅니다.
	
	사용된 명령어 : Msgbox , Random
	
	사용된 변수 : win , lose , draw , USER , COMPUTER
*/
;;;;;;;;;;;;;;;;;;
win := 0
lose := 0
draw := 0
;;;;;;;;;;;;;;;;;; 승무패 사용을 위한 초기화
GameCount := 3
;;;;;;;;;;;;;;;;;; Option

;게임시작
;전체를 루프문으로 구성하여 조건문을 계속 돌려줍니다
Loop, %GameCount%
{
	inputbox, USER, 가위바위보 게임, 어떤 손을 내실 건가요?`n(가위/바위/보)`n게임을 종료하시려면 "그만"을 입력하세요.,,300,220
	;유저가 무엇을 낼것인지.. 물어봅니다.
	Random, COMPUTER, 1, 3
	;1부터 3까지 컴퓨터에게 무작위 값을 줍니다 이것에 따라서 가위바위보 구현
	; 저는 컴퓨터에게 1은 가위 2는 주먹 3은 보자기를 주었습니다.
	
	if USER = 가위
	{
		if COMPUTER = 1
		{
			draw := draw + 1
			MsgBox,, 가위바위보, 비겼습니다.
		}
		else if COMPUTER = 2
		{
			lose := lose + 1
			MsgBox,, 가위바위보, 졌습니다.
		}
		else if COMPUTER = 3
		{
			win := win + 1
			MsgBox,, 가위바위보, 이겼습니다.
		}
	}
	else if USER = 바위
	{
		if COMPUTER = 2
		{
			draw := draw + 1
			MsgBox,, 가위바위보, 비겼습니다.
		}
		else if COMPUTER = 3
		{
			lose := lose + 1
			MsgBox,, 가위바위보, 졌습니다.
		}
		else if COMPUTER = 1
		{
			win := win + 1
			MsgBox,, 가위바위보, 이겼습니다.
		}
	}
	else if USER = 보
	{
		if COMPUTER = 3
		{
			draw := draw + 1
			MsgBox,, 가위바위보, 비겼습니다.
		}
		else if COMPUTER = 1
		{
			lose := lose + 1
			MsgBox,, 가위바위보, 졌습니다.
		}
		else if COMPUTER = 2
		{
			win := win + 1
			MsgBox,, 가위바위보, 이겼습니다.
		}
	}
	else if USER = 그만
	{
		break ;루프문을 나가면서 아래의 통계창을 보여줌
	}
	else
	{
		MsgBox,, 가위바위보, 끌거면 그만으로 꺼라...
	}
}
MsgBox,, 가위바위보, 당신의 전적은 `n %win% 승, %lose% 패, %draw% 무 입니다.
;전체적으로 루프문이 구성된 경우 return을 넣게 되면 무한 반복되므로 넣지 않음

F10::ExitApp