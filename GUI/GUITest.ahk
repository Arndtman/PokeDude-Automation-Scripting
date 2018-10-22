
Img_Path = %A_WorkingDir%\Images\

Gui 1:Add, Picture, x0 y0 w250 h170, %Img_Path%LogoScale.png

;Column 1
Gui 1:Add, Button, w110 y10 x250 y10 gB1Inst, NPCFarm1
Gui 1:Add, Button, w110 y+10 gSdpInst, Spd EV Trainer
Gui 1:Add, Button, w110 y+10 gSpAtkInst, Sp. Atk EV Trainer
Gui 1:Add, Button, w110 y+10 gHPInst, HP EV Trainer

;Column 2
Gui 1:Add, Button, w110 xp+120 y+-115 gCombatInst, Combat Bot
Gui 1:Add, Button, w110 y+10 gHPInst, Def EV Trainer
Gui 1:Add, Button, w110 y+10 gHPInst, Sp. Def EV Trainer
Gui 1:Add, Button, w110 y+10 gHPInst, Atk EV Trainer

Gui 1:Add, Text, x10 y170 , What is the Bot Doing?:
Gui 1:Add, Edit, vOutPut w335, Words, Man

Gui 1:Add, Text, x10, Please Read Instructions.txt Before Starting Bot
Gui 1:Add, CheckBox, x10 vNoCache Checked, Debug Enabled

Gui 1:Add, Button, x+200 yp-10 w50 gQuitter, Exit ()
Gui 1:Add, Button,,Pause

Gui 1:Color, 666564
Gui 1:Show

Return

GuiEscape:
GuiClose:
Quitter:
;ExitApp
GuiControl, 1:, OutPut, "New Window Test"
sleep 300
Gui, Cancel
return

Starter:
gosub Quitter
gosub myTest
return

B1Inst:
Gui, Submit, NoHide
MsgBox "Bot will not work without the following requirements"
MsgBox "1) the place 2) eat the thing"
return

CombatInst:
Gui, Submit, NoHide
MsgBox This is the Universal Combat Bot. It fights for you whenever you enter combat automatically. 
+ Press Ok to Start 
return

SdpInst:
Gui, Submit, NoHide
SpdEVHandle()
return

SpAtkInst:
Gui, Submit, NoHide
SpAtkEVHandle()
return

HPInst:
Gui, Submit, NoHide
HPEVHandle()
return




SpdEVHandle(){
	global Img_Path
	GuiControl, 1:, OutPut, Spd EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
		
	Gui 2:Add, Picture, x0 y0 w350 h250, %Img_Path%SpdEVInst.png
	Gui 2:Add, Button, x0 y250 w80 gStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%
return
}

SpAtkEVHandle(){
	global Img_Path
	GuiControl, 1:, OutPut, Sp. Atk EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
	
	Gui 2:Add, Picture, x0 y0 w350 h250, %Img_Path%SpAtkEVInst.png
	Gui 2:Add, Button, x0 y250 w80 gStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%
return
}

HPEVHandle(){
	global Img_Path
	GuiControl, 1:, OutPut, HP EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
	
	Gui 2:Add, Picture, x0 y0 w350 h250, %Img_Path%hpevInst.png
	Gui 2:Add, Button, x0 y250 w80 gStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%
return
}



testerino(){
	GuiControl,, OutPut, "GGGG"
	sleep 1000
	GuiControl,, OutPut, "CCCCC"

return
}

myTest: 
sleep 500
WinActivate, PokeMMO
GuiControl,1:, OutPut, "Scripts Missing"



return
