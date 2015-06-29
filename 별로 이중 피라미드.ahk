;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 설정 부분

;F1을 눌렀을때 PyramidFloor 값에 따라서 이중 피라미드를 생성하는 소스

;피라미드 설정
Block := "*"
PyramidFloor := 8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Code
F1::
CurrentPower := 1

Loop %PyramidFloor%
{
	Loop %CurrentPower%
	{
		Send %Block%
	}
	Send {Enter}
	CurrentPower := CurrentPower + 1
}
Loop %PyramidFloor%
{
	Loop %CurrentPower%
	{
		Send %Block%
	}
Send {Enter}
CurrentPower := CurrentPower - 1
}
Send %Block% ; 역삼각형의 경우 마지막 한번은 처리 방법이 없으므로 하나 수동으로 추가...