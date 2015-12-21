FileEncoding, UTF-8 ;한글 깨짐 방지
URLDownloadToFile, http://www.hansol.hs.kr/main.php?menugrp=030602&master=meal2&act=list, temp.txt ;temp.txt 의 위치는 오토핫키 소스가 실행되는 위치이다.

;예제로 학교 홈페이지의 급식표를 파싱해와서 표시하는 예제입니다. 이를 잘 활용한다면 여러 가지에 활용할 수 있습니다.

;;;;;초기값 설정;;;
StartLine:=368
EndLine:=410
;;;;;;;;;;;;;;;;;;

;;;;; 반복문 시작
loop{
	if(EndLine<=StartLine){ ;만약 StartLine 이 EndLine 보다 크면
		break ;  반복문 탈출
	}else{ ;아니라면 다시 시작 (가장 밖의 조건 else문 시작)
	
	FileReadLine, po, temp.txt, %StartLine%
	po = %po% ;readline 으로 읽었을경우 쓰래기값이 남아있어서 없애주기 위함 (참조 : https://autohotkey.com/docs/commands/FileReadLine.htm#Remarks)
	
	;읽어온 값의 웹 태그 (<td> , </table> , <~~> 같은 <> 안에 있는 내용)을 null = 빈값 으로 만듬. 이를 정규식 치환이라고 함.
	po := RegExReplace(po, "<caption .*?>.*?</.*?>", NULL) ; <caption class="visible">2015.12 식단</caption> 같은 예외를 처리하기 위해서
	po := RegExReplace(po, "<.*?>", NULL)
	
		;만약 정규식으로 치환해서 NULL 값이 되었다면 줄바꿈할 필요가 없고 내용이 있다면 줄바꿈하여 올바르게 표시함
		;po의 값을 stack 변수에 나서스 스택처럼 차곡 차곡 쌓는 과정임
		if(po==NULL){
			stack = %stack%%po%
		}else{
			stack = %stack%%po%`n
		}
	
	;if 문을 빠져나오면 StartLine의 값을 1 증가시킴 그리고 다시 반복
	StartLine++
	} ;(가장 밖의 조건 else문 종료)
}

;아래의 텍스트를 왼쪽에서 오른쪽으로 변경하는것 (보기 좋으라고)
StringReplace, stack, stack, 중식 메뉴,-중식 메뉴-,All
StringReplace, stack, stack, 석식 메뉴,`n-석식 메뉴-,All

msgbox % stack ;반복문으로 통해서 쌓인값 출력

Filedelete, temp.txt ;출력했으니 임시파일은 삭제
