;스크립트에 대한 설명: 피보나치 수열 넣은숫자번째의 수를 구한다
pibo(){
pibomain:
InputBox, p, 피보나치, 몇번째 피보나치 수를 알고 싶은가?`n제작자 : 최상원
if ErrorLevel
{
    MsgBox, 취소하셨습니다.
	return
}

ELSE
if (p < 1)
{
    msgbox, 1이상으로 지정해 주세요.
    goto pibomain
    exitapp
}

if (1 < p < 30)
n := fibget(p)
msgbox, %p%번째 숫자는 %n%
return

if (p > 30)
{
  n = (0.2)*sqrt 5 * {(1/2)**p}*[{(1+sqrt 5)**p} -{(1-sqrt 5)**p)}]
  msgbox, %p%번째 숫자는 %n%
  return
}
}
fibget(p)
{
    if (p = 1)
    return 1
    if (p = 2)
        return 1
        fib := fibget(p-1) + fibget(p-2)
        return fib
}