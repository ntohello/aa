#NoTrayIcon

Gui, Add, Button, x22 y20 w160 h50 , Yes
Gui, Add, Button, x202 y20 w160 h50 , No
; Generated using SmartGUI Creator for SciTE
Gui, Show, w397 h83, Yes No GUI 예제
return

ButtonYes:
msgbox, 에를 눌렀네
return

ButtonNo:
MsgBox, 아니오를 눌렀네
return

GuiClose:
;GUI Close를 할때 앱 안꺼주면 백그라운드에서 계속 돌아가는 불상사가 일어남
ExitApp
