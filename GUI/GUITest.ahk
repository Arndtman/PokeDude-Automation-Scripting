
#WinActivateForce 
DetectHiddenWindows, On

Img_Path = %A_WorkingDir%\Images\
Menu, tray, Icon , %Img_Path%icon1.ico, 1, 1

height := A_ScreenHeight-420
width := A_ScreenWidth-650

Gui 1:Add, Picture, x0 y0 w250 h170, %Img_Path%LogoScale.png

Gui, Font, s8, Tahoma  

;Column 1
Gui 1:Add, Button, w110 y10 x250 y10 gB1Inst, NPCFarm1
Gui 1:Add, Button, w110 y+10 gSdpInst, Spd EV Trainer
Gui 1:Add, Button, w110 y+10 gSpAtkInst, Sp. Atk EV Trainer
Gui 1:Add, Button, w110 y+10 gHPInst, HP EV Trainer

;Column 2
Gui 1:Add, Button, w110 xp+120 y+-115 gCombatInst, Combat Bot
Gui 1:Add, Button, w110 y+10 gHordeHandle, Horde EV Trainer ++
;Gui 1:Add, Button, w110 y+10 gHPInst, Sp. Def EV Trainer
;Gui 1:Add, Button, w110 y+10 gHPInst, Atk EV Trainer

Gui, Font, s10, Verdana
Gui 1:Add, Text, x10 y170 , What is the Bot Doing?:

Gui, Font, s8, Tahoma  
Gui 1:Add, Edit, vOutPut w335, Words, Man

Gui, Font, s10, Verdana
Gui 1:Add, Text, x10, Please Read Instructions.txt Before Starting Bot
Gui 1:Add, CheckBox, x10 vNoCache Checked, Debug Enabled

Gui 1:Add, Button, x+300 yp-10 w50 gGuiEscape, Exit

Gui 1:Color, 666564
Gui 1:Show, x%width% y%height%, PokeDude

Return


GuiEscape:
GuiClose:
ExitApp

Quitter:
GuiControl, 1:, OutPut, "Closed a window"
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
MsgBox "Disabled due to game hotfixes, may return"
;MsgBox "1) the place 2) the thing 3) generic filler"
return

CombatInst:
Gui, Submit, NoHide
MsgBox This is the Universal Smart Combat Bot filler. 

GuiControl, 1:, OutPut, "in combat bot testing"

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
	Gui, 2:destroy

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
	Gui, 2:destroy
	
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
	Gui, 2:destroy

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


HordeHandle(){
	global Img_Path
	Gui, 2:destroy

	GuiControl, 1:, OutPut, Horde EV Trainer Selected
	height := A_ScreenHeight-500
	width := A_ScreenWidth-500
	
	Gui 2:Font, s12, Verdana
	Gui 2:Add, Text, x5, Horde EV Requirements:
	
	Gui 2:Font, s9, Verdana
	Gui 2:Add, Text, x10, 1)Bellsprout with Sweet Scent in Party 
	Gui 2:Add, Text, x10, 2)First poke has AOE in MOVE1 that 1 shots horde
	Gui 2:Add, Text, x10, 3)HM02 Fly in Party 
	Gui 2:Add, Text, x10, 4)10+ Leppa Berry in Bag (runs until out of Leppa)
	Gui 2:Add, Text, x10, 5)Start bot when at desired bush location
	
	
	
	Gui 2:Add, Button, x0 y250 w80 gSAtkStarter, Start_Bot ()
	Gui 2:Add, Button, x+10 y250 w50 gQuitter, Exit ()
	Gui 2:Color, FFA500
	Gui 2:Show, x%width% y%height%, Horde EV Instructions
return
}

testerino(){
	GuiControl,, OutPut, "GGGG"
	sleep 1000
	GuiControl,, OutPut, "CCCCC"
return
}


/*
Speed EV Bot Script

===============================================================================================
This bot only uses the first move the Poker has, so put the AOE: SURF, HYPER VOICE etc as MOVE1 

To Start, Enter then leave the POKECENTER on ISLE7. After exiting PC and facing the house below, then:
1) Make sure player is OFF bike
2) Make sure player has RUNNING (not walking) toggled on (and the setting is enabled in settings->gameplay->toggle run)
3) Make sure SHOW OVERWORLD is DISABLED in combat (Settings->video->show overworld in battle off)
4) PokeMMO MUST be in 1280x800, make sure to check each new session. 
5) PokeMMO MUST be the MAIN WINDOW
6) Sit back and let it run (slow at some points due to state checks) 
7) press CTRL + Y to start

===============================================================================================

The script will surely fail if these conditions are not met.
*/

SpdEVTrainer: 
{
	Img_Path_Spd = %A_WorkingDir%\Images\EV\

	Gui, Submit, NoHide
	sleep 500
		
	GuiControl, 1:, OutPut, "Spd Scripts Testing: Set PokeMMO as Main Window Now (3 sec..)"
	sleep 3000
	
	SpdPath: 
	{
		WinActivate, PokeMMO
		Counter = 4
		GuiControl, 1:, OutPut, Starting Isle7 Spd EV Farm
		send {Left down} 
		sleep 800
		send {Left up}
		sleep 300
		send {Down down} 
		sleep 4600
		send {Down up} 
		gosub SS_Spd
	}

	SS_Spd: 
	{
		GuiControl, 1:, OutPut, Sweet Scent Start
		Loop
		{
			if Counter > 0 
			{ 
				GuiControl, 1:, OutPut, SS uses left %Counter%
				sleep 1000
				GuiControl, 1:, OutPut, Checking Battle State
				sleep 1000
				ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_Spd%p.png
				if ErrorLevel = 0
				{
					gosub Battle_Spd
				}
				GuiControl, 1:, OutPut, Out of Battle
				sleep 1000
				ImageSearch, FoundX, FoundY, 1150, 250, 1290, 600, *90 %Img_Path_Spd%bs.png 
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, No BellSprout found
					sleep 1000
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, BellSprout Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					ImageSearch, FoundX, FoundY, 1000, 250, 1290, 800, *90 %Img_Path_Spd%ss.png
					If ErrorLevel = 1
					{
						GuiControl, 1:, OutPut, SS FAIL
						Counter += 1
						sleep 1000
					} else if ErrorLevel = 0 
					{
						GuiControl, 1:, OutPut, SS OK
						mouseclick, left, %FoundX%, %FoundY%, 1, 0
						sleep 1000
						send {Z down}
						sleep 100
						send {Z up}  
						sleep 3000
						GuiControl, 1:, OutPut, Entering Battle
						sleep 300
						gosub Battle_Spd
					}
				}
				Counter -= 1
			} else {
				GuiControl, 1:, OutPut, SS out of PP: Healing
				Counter = 4
				sleep 1000
				gosub FlyIsle7
				sleep 4000
				gosub HealIsle7
				sleep 2000
				goSub SpdPath
			}
		}
		return
	}
    
	HealIsle7: 
	{
		GuiControl, 1:, OutPut, Healing at PC
		send {UP down} 
		sleep 3000
		send {UP up}
		GuiControl, 1:, OutPut, Heal: Phase 1
		loop 9{
			send {Z down}
			sleep 100
			send {Z up} 
		}
		GuiControl, 1:, OutPut, Heal: Phase 2
		sleep 1000
		loop 6{
			send {Z down}
			sleep 100
			send {Z up} 
		}
		sleep 2000
		GuiControl, 1:, OutPut, Heal: Phase 3
		loop 4{
			sleep 100
			send {Z down}
			sleep 100
			send {Z up} 
		}
		sleep 2000
		GuiControl, 1:, OutPut, Heal: Phase 4
		sleep 1000
		send {Down down} 
		sleep 2000
		send {Down up}
		GuiControl, 1:, OutPut, Healed
		return
	}

	FlyIsle7:
	{
		send {F1 down}
		sleep 300
		send {F1 up} 
		sleep 1000

		Loop { 
			GuiControl, 1:, OutPut, LF Isle7
			sleep 1000
			ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 %Img_Path_Spd%flyIsle7.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, No Fly Found. Looking again
				sleep 3000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, Fly Found
				sleep 1000
				mX := FoundX + 10 
				mY := FoundY +10
				mouseMove, %FoundX%, %FoundY%, 20
				mouseMove, -8, 0, 20, R
				mouseClick, left
				sleep 2000
				
				FlySub1:
				ImageSearch, FoundX, FoundY, 300, 200, 1280, 800, *90 %Img_Path_Spd%chat.png
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, No Chat Found
					sleep 3000
					gosub FlySub1
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, Chat Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
				}
				return
			}
		}
		return
	}

	Talk_Spd:
	{
		sleep 100
		Loop 7
		{
			send {Z down}
			sleep 300
			send {Z up}
		}
		sleep 100
		return
	}

	Fight_Spd:
	{
		GuiControl, 1:, OutPut, Fight Begin
		PixelGetColor, x2, 115, 270
		while x2 = 0x000000
		{
			GuiControl, 1:, OutPut, Move Loop
			sleep 3000
			gosub Talk_Spd
			sleep 3000
			GuiControl, 1:, OutPut, Move Used: Atk Sleep End
			sleep 2000
			PixelGetColor, x2, 115, 270
		}
		GuiControl, 1:, OutPut, Fight End
		sleep 1000
		return
	}

	Battle_Spd:
	{ 
		GuiControl, 1:, OutPut, Battle Start 
		sleep 3000
		Loop 5
		{
			GuiControl, 1:, OutPut, CombatUI Scan
			sleep 1000
			ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_Spd%p.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, No Battle Found
				sleep 3000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, Fight
				sleep 1000
				gosub Fight_Spd
				break
			}
		}
		sleep 2000 ;ALAKAZAM modify end conditions
		GuiControl, 1:, OutPut, Battle Over
		sleep 1000
		return
	}
		
	return
}





/*
Sp. Atk EV Bot Script

===============================================================================================
Instructions
===============================================================================================

The script will surely fail if these conditions are not met.
*/

SpAtkEVTrainer: 
{
	Img_Path_SpAtk = %A_WorkingDir%\Images\EV\
	Gui, Submit, NoHide
	sleep 500
	
	WinActivate, PokeMMO
	GuiControl, 1:, OutPut, "EV Scripts Testing: Set PokeMMO as Main Window Now (3 sec..)"
	sleep 3000
	
	Counter = 4
		
	
	SS_SpAtk: 
	{
		GuiControl, 1:, OutPut, Sweet Scent Start
		Loop
		{
			if Counter > 0 
			{ 
				GuiControl, 1:, OutPut, SS uses left %Counter%
				sleep 1000
				GuiControl, 1:, OutPut, Checking Battle State
				sleep 1000
				ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_SpAtk%p.png
				if ErrorLevel = 0
				{
					gosub Battle_SpAtk
				}
				GuiControl, 1:, OutPut, Out of Battle
				sleep 1000
				ImageSearch, FoundX, FoundY, 1150, 250, 1290, 600, *90 %Img_Path_SpAtk%bs.png
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, No BellSprout found
					sleep 1000
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, BellSprout Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					ImageSearch, FoundX, FoundY, 1000, 250, 1290, 800, *90 %Img_Path_SpAtk%ss.png
					If ErrorLevel = 1
					{
						GuiControl, 1:, OutPut, SS FAIL
						Counter += 1
						sleep 1000
					} else if ErrorLevel = 0 
					{
						GuiControl, 1:, OutPut, SS OK
						mouseclick, left, %FoundX%, %FoundY%, 1, 0
						sleep 1000
						send {Z down}
						sleep 100
						send {Z up}  
						GuiControl, 1:, OutPut, Entering Battle
						sleep 300
						gosub Battle_SpAtk
					}	
				}
				Counter -= 1
			} else {
				GuiControl, 1:, OutPut, SS out of PP: Healing
				Counter = 4
				sleep 1000
				gosub Heal
				sleep 2000
			}
		}
	}
	
	Heal: 
	{
		Loop 2 { 
			GuiControl, 1:, OutPut, Using Leppa
			sleep 300
			send {B down} {B up}
			sleep 300

			ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 %Img_Path_SpAtk%berry.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, Berry's tab not found
				sleep 1000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, In berry bag LF leppa
				sleep 1000
				mouseclick, left, %FoundX%, %FoundY%, 1, 0
				sleep 1000
				ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 %Img_Path_SpAtk%leppa.png
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, Leppa not found
					sleep 1000
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, Leppa Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					sleep 1000
					sleep 300
					send {B down} {B up}
					sleep 300
					ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 %Img_Path_SpAtk%bs2.png
					If ErrorLevel = 1
					{
						GuiControl, 1:, OutPut, Bellsprout not found
						sleep 1000
					} else if ErrorLevel = 0 
					{
						GuiControl, 1:, OutPut, BS found, giving PP
						sleep 1000
						mouseclick, left, %FoundX%, %FoundY%, 1, 0
						sleep 300
						ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 %Img_Path_SpAtk%ss2.png
						If ErrorLevel = 1
						{
							GuiControl, 1:, OutPut, Sweet Scent Not Found
							sleep 1000
						} else if ErrorLevel = 0 
						{
							GuiControl, 1:, OutPut, Sweet Scent Found
							sleep 1000
							mouseclick, left, %FoundX%, %FoundY%, 1, 0
							sleep 300
						}
					}
				}
			}
			GuiControl, 1:, OutPut, Leppa Used
			sleep 500
			send {ESC down} {ESC up} 
			sleep 500
		}
	GuiControl, 1:, OutPut, PP Restore End
	return
	}
	
	Talk_SpAtk:
	{
		sleep 100
		Loop 7
		{
			send {Z down}
			sleep 300
			send {Z up}
		}
		sleep 100
		return
	}

	Fight_SpAtk:
	{
		GuiControl, 1:, OutPut, Fight Begin
		PixelGetColor, x2, 115, 270
		while x2 = 0x000000
		{
			GuiControl, 1:, OutPut, Move Loop
			sleep 3000
			gosub Talk_SpAtk
			sleep 3000
			GuiControl, 1:, OutPut, Move Used: Atk Sleep End
			sleep 2000
			PixelGetColor, x2, 115, 270
		}
		GuiControl, 1:, OutPut, Fight End
		sleep 1000
		return
	}

	Battle_SpAtk:
	{ 
		GuiControl, 1:, OutPut, Battle Start 
		sleep 3000
		Loop 5
		{
			GuiControl, 1:, OutPut, CombatUI Scan
			sleep 1000
			ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_SpAtk%p.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, No Battle Found
				sleep 3000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, Fight
				sleep 1000
				gosub Fight_SpAtk
				break
			}
		}
		sleep 2000 ;ALAKAZAM modify end conditions
		GuiControl, 1:, OutPut, Battle Over
		sleep 1000
		return
	}
	
	return
}

/*
HP EV Bot Script

===============================================================================================
Instructions
===============================================================================================

The script will surely fail if these conditions are not met.
*/

HPEVTrainer: 
{	
	Img_Path_Hp = %A_WorkingDir%\Images\EV\

	Gui, Submit, NoHide
	sleep 500
		
	GuiControl, 1:, OutPut, "HP Scripts Missing"
	sleep 3000
	gosub HpPath
	;return
	

Counter = 4
	SS_Hp: 
	{
		GuiControl, 1:, OutPut, Sweet Scent Start
		Loop
		{
			if Counter > 0 
			{ 
				GuiControl, 1:, OutPut, SS uses left %Counter%
				sleep 1000
				GuiControl, 1:, OutPut, Checking Battle State
				sleep 1000
				ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_Hp%p.png
				if ErrorLevel = 0
				{
					gosub Battle_Hp
				}
				GuiControl, 1:, OutPut, Out of Battle
				sleep 1000
				ImageSearch, FoundX, FoundY, 1150, 250, 1290, 600, *90 %Img_Path_Hp%bs.png 
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, No BellSprout found
					sleep 1000
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, BellSprout Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					ImageSearch, FoundX, FoundY, 1000, 250, 1290, 800, *90 %Img_Path_Hp%ss.png
					If ErrorLevel = 1
					{
						GuiControl, 1:, OutPut, SS FAIL
						Counter += 1
						sleep 1000
					} else if ErrorLevel = 0 
					{
						GuiControl, 1:, OutPut, SS OK
						mouseclick, left, %FoundX%, %FoundY%, 1, 0
						sleep 1000
						send {Z down}
						sleep 100
						send {Z up}  
						sleep 3000
						GuiControl, 1:, OutPut, Entering Battle
						sleep 300
						gosub Battle_Hp
					}
				}
				Counter -= 1
			} else {
				GuiControl, 1:, OutPut, SS out of PP: Healing
				Counter = 4
				sleep 1000
				gosub FlyIsle3
				sleep 4000
				gosub HealIsle3
				sleep 2000
				goSub HpPath
			}
		}
		return
	}


	HealIsle3: 
	{
		GuiControl, 1:, OutPut, Healing at PC
		send {UP down} 
		sleep 3000
		send {UP up}
		GuiControl, 1:, OutPut, Heal: Phase 1
		loop 9{
			send {Z down}
			sleep 100
			send {Z up} 
		}
		GuiControl, 1:, OutPut, Heal: Phase 2
		sleep 1000
		loop 6{
			send {Z down}
			sleep 100
			send {Z up} 
		}
		sleep 2000
		GuiControl, 1:, OutPut, Heal: Phase 3
		loop 4{
			sleep 100
			send {Z down}
			sleep 100
			send {Z up} 
		}
		sleep 2000
		GuiControl, 1:, OutPut, Heal: Phase 4
		sleep 1000
		send {Down down} 
		sleep 2000
		send {Down up}
		GuiControl, 1:, OutPut, Healed
		return
	}


	FlyIsle3:
	{
		send {F1 down}
		sleep 300
		send {F1 up} 
		sleep 1000

		Loop { 
			GuiControl, 1:, OutPut, LF Isle3
			sleep 1000
			ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 %Img_Path_Hp%flyIsle3.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, No Fly Found. Looking again
				sleep 3000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, Fly Found
				sleep 1000
				mX := FoundX + 10 
				mY := FoundY +10
				mouseMove, %FoundX%, %FoundY%, 20
				mouseMove, -8, 0, 20, R
				mouseClick, left
				sleep 2000
				
				FlySub1Hp:
				ImageSearch, FoundX, FoundY, 300, 200, 1280, 800, *90 %Img_Path_Hp%chat.png
				If ErrorLevel = 1
				{
					GuiControl, 1:, OutPut, No Chat Found
					sleep 3000
					gosub FlySub1Hp
				} else if ErrorLevel = 0 
				{
					GuiControl, 1:, OutPut, Chat Found
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
				}
				return
			}
		}
		return
	}

	Talk_Hp:
	{
		sleep 100
		Loop 7
		{
			send {Z down}
			sleep 300
			send {Z up}
		}
		sleep 100
		return
	}

	Fight_Hp:
	{
		GuiControl, 1:, OutPut, Fight Begin
		PixelGetColor, x2, 115, 270
		while x2 = 0x000000
		{
			GuiControl, 1:, OutPut, Move Loop
			sleep 3000
			gosub Talk_Hp
			sleep 3000
			GuiControl, 1:, OutPut, Move Used: Atk Sleep End
			sleep 2000
			PixelGetColor, x2, 115, 270
		}
		GuiControl, 1:, OutPut, Fight End
		sleep 1000
		return
	}

	Battle_Hp:
	{ 
		GuiControl, 1:, OutPut, Battle Start 
		sleep 3000
		Loop 5
		{
			GuiControl, 1:, OutPut, CombatUI Scan
			sleep 1000
			ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 %Img_Path_Hp%p.png
			If ErrorLevel = 1
			{
				GuiControl, 1:, OutPut, No Battle Found
				sleep 3000
			} else if ErrorLevel = 0 
			{
				GuiControl, 1:, OutPut, Fight
				sleep 1000
				gosub Fight_Hp
				break
			}
		}
		sleep 2000 ;ALAKAZAM modify end conditions
		GuiControl, 1:, OutPut, Battle Over
		sleep 1000
		return
	}


	HpPath: 
	{
		WinActivate, PokeMMO
		Counter = 4
		GuiControl, 1:, OutPut, Starting Isle3 HP EV Farm
		sleep 500
		send {Down down} 
		sleep 1000
		send {Down up} 
		sleep 300

		send {Left down} 
		sleep 500
		send {Left up}
		sleep 300

		send {Down down} 
		sleep 2300
		send {Down up} 
		sleep 300

		send {Right down} 
		sleep 800
		send {Right up}
		sleep 300

		send {Right down} 
		sleep 100
		send {Right up}
		sleep 300

		send {Up down} 
		sleep 1500
		send {Up up}
		sleep 300

		send {Up down} 
		sleep 300
		send {Up up}
		sleep 300

		send {F2 down}{F2 up} 
		sleep 200

		send {Right down} 
		sleep 1800
		send {Right up}
		sleep 300

		send {Up down} 
		sleep 800
		send {Up up}
		sleep 300

		send {Right down} 
		sleep 1000
		send {Right up}
		sleep 300

		send {Down down} 
		sleep 80	0
		send {Down up} 
		sleep 300

		send {Left down} 
		sleep 100
		send {Left up}
		sleep 300	

		send {Left down} 
		sleep 800
		send {Left up}
		sleep 300	

		send {F2 down}{F2 up} 
		sleep 200

		gosub SS_Hp
	}
	
	return 
}
