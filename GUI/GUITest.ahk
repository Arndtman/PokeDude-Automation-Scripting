﻿
Img_Path = %A_WorkingDir%\Images\
Menu, tray, Icon , %Img_Path%icon1.ico, 1, 1

Gui 1:Add, Picture, x0 y0 w250 h170, %Img_Path%LogoScale.png

Gui, Font, s8, Tahoma  

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

Gui, Font, s10, Verdana
Gui 1:Add, Text, x10 y170 , What is the Bot Doing?:

Gui, Font, s8, Tahoma  
Gui 1:Add, Edit, vOutPut w335, Words, Man

Gui, Font, s10, Verdana
Gui 1:Add, Text, x10, Please Read Instructions.txt Before Starting Bot
Gui 1:Add, CheckBox, x10 vNoCache Checked, Debug Enabled

Gui 1:Add, Button, x+300 yp-10 w50 gGuiEscape, Exit

Gui 1:Color, 666564
Gui 1:Show,, PokeDude

Return


GuiEscape:
GuiClose:
ExitApp

Quitter:
GuiControl, 1:, OutPut, "Exited Window"
sleep 300
Gui, Destroy
return

SpdStarter:
gosub Quitter
gosub SpdEVTrainer
return

SAtkStarter:
gosub Quitter
gosub SpAtkEVTrainer
return

HPStarter:
gosub Quitter
gosub HPEVTrainer
return

B1Inst:
Gui, Submit, NoHide
MsgBox "Bot will not work without the following requirements"
MsgBox "1) the place 2) eat the thing 3) generic filler"
return

CombatInst:
Gui, Submit, NoHide
MsgBox This is the Universal Combat Bot. It fights for you whenever you enter combat automatically.
+ Press Ok to Start

GuiControl, 1:, OutPut, "in combat bot"

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
	Gui 2:Add, Button, x0 y250 w80 gSpdStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%, Spd EV Instructions
return
}

SpAtkEVHandle(){
	global Img_Path
	
	GuiControl, 1:, OutPut, Sp. Atk EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
	
	Gui 2:Add, Picture, x0 y0 w350 h250, %Img_Path%SpAtkEVInst.png
	Gui 2:Add, Button, x0 y250 w80 gSAtkStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%, Sp. Atk EV Instructions
return
}

HPEVHandle(){
	global Img_Path

	GuiControl, 1:, OutPut, HP EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
	
	Gui 2:Add, Picture, x0 y0 w350 h250, %Img_Path%hpevInst.png
	Gui 2:Add, Button, x0 y250 w80 gHPStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%, HP EV Instructions
return
}


testerino(){
	GuiControl,, OutPut, "GGGG"
	sleep 1000
	GuiControl,, OutPut, "CCCCC"
return
}


SpdEVTrainer: 
Gui, Submit, NoHide
sleep 500
WinActivate, PokeMMO
GuiControl,1:, OutPut, "Spd Scripts Missing"
return

SpAtkEVTrainer: 
Gui, Submit, NoHide
sleep 500
WinActivate, PokeMMO
GuiControl,1:, OutPut, "Sp. Atk Scripts Missing"
return


HPEVTrainer: 
Gui, Submit, NoHide
sleep 500
WinActivate, PokeMMO
GuiControl,1:, OutPut, "HP Scripts Missing"
return

