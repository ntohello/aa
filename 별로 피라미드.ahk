;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 설정 부분

;F1을 눌렀을때 PyramidFloor 값에 따라서 피라미드를 생성하는 소스

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