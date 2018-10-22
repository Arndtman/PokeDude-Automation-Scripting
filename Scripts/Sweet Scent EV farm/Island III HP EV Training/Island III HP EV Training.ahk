#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#MaxThreadsPerHotkey 2
#SingleInstance, force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

/*
This bot only uses the first move the Poker has, so put the AOE: SURF, HYPER VOICE etc as MOVE1 

To Start, Enter then leave the POKECENTER on ISLE3. After exiting PC and facing the house below, then:
1) Make sure player is OFF bike
2) Make sure player has RUNNING (not walking) toggled on (and the setting is enabled in settings->gameplay->toggle run)
3) Make sure SHOW OVERWORLD is DISABLED in combat (Settings->video->show overworld in battle off)
4) PokeMMO MUST be in 1280x800, make sure to check each new session. 
5) PokeMMO MUST be the MAIN WINDOW
6) Sit back and let it run (slow at some points due to state checks) 
7) press CTRL + Y to start

The script will surely fail if these conditions are not met.
*/

/* Test Battle routine 
Battle: 
^Q::
WinActivate, Pok???O
Loop
{
	ToolTip, Battle Start ,0,0
	sleep 1000
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 p.png
	ToolTip, After IMG  ,0,0
	sleep 1000
	If ErrorLevel = 1
	{
		ToolTip, No Battle Found 1,0,0
		sleep 3000
		gosub, SS
	} else if ErrorLevel = 0 
	{
		ToolTip, IMA FIRIN MAH LAZAR 1,0,0
		sleep 1000
		send {Z down}
		sleep 100
		send {Z up}  Z	
		sleep 8000
	}

}
*/

SS: 
^W::
WinActivate, Pok???O
ToolTip, Sweet Scent Start,0,0
Loop
{
	if Counter > 0 
	{ 
		ToolTip, SS uses left %Counter%,0,0
		sleep 1000
		ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 p.png
		ToolTip, Checking Battle state,0,0
		sleep 1000
		if ErrorLevel = 0
		{
			Battle2()
		}
		ImageSearch, FoundX, FoundY, 1150, 250, 1290, 600, *90 bs.png
		ToolTip, After IMG  ,0,0
		sleep 1000
		If ErrorLevel = 1
		{
			ToolTip, No BellSprout found 1,0,0
			sleep 1000
		} else if ErrorLevel = 0 
		{
			ToolTip, BellSprout Found 1,0,0
			mouseclick, left, %FoundX%, %FoundY%, 1, 0
			sleep 1000
			ImageSearch, FoundX, FoundY, 1000, 250, 1290, 800, *90 ss.png
				If ErrorLevel = 1
				{
					ToolTip, SS FAIL,0,0
					sleep 1000
				} else if ErrorLevel = 0 
				{
					ToolTip, SS OK,0,0
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					sleep 1000
					send {Z down}
					sleep 100
					send {Z up}  Z
					sleep 3000
					Battle2()
				}

			
		}
		Counter -= 1
	} else {
		ToolTip, SS out of PP: Healing,0,0
		Counter = 4
		sleep 1000
		gosub FlyIsle3
		sleep 4000
		gosub Heal
		sleep 2000
		goSub Path
	}
}

^T::
Heal: 
{
ToolTip, Healing at PC,0,0
	send {UP down} 
	sleep 3000
	send {UP up}
ToolTip, Phase 1,0,0
	loop 9{
		send {Z down}
		sleep 100
		send {Z up} 
	}
ToolTip, Phase 2,0,0
	sleep 1000
	loop 6{
		send {Z down}
		sleep 100
		send {Z up} 
	}
	sleep 2000
ToolTip, Phase 3,0,0
	loop 6{
		sleep 100
		send {Z down}
		sleep 100
		send {Z up} 
	}
	sleep 2000
ToolTip, Phase 4,0,0
	loop 2{
		send {Z down}
		sleep 100
		send {Z up} 
	}
ToolTip, Exiting,0,0
	sleep 1000
	send {Down down} 
	sleep 2000
	send {Down up}
ToolTip, Healed,0,0
}
return


^U::
FlyIsle3:
{
	send {F1 down}
	sleep 300
	send {F1 up} 
	sleep 1000

	Loop { 
		ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 FlyIsle3.png
		ToolTip, LF Isle3,0,0
		sleep 1000
		If ErrorLevel = 1
		{
			ToolTip, No Fly Found. Looking again,0,0
			sleep 3000
		} else if ErrorLevel = 0 
		{
			ToolTip, Fly Found,0,0
			sleep 1000
			mX := FoundX + 10 
			mY := FoundY +10
			mouseMove, %FoundX%, %FoundY%, 20
			mouseMove, -8, 0, 20, R
			mouseClick, left
			sleep 2000
		    
			FlySub1:
			ImageSearch, FoundX, FoundY, 300, 200, 1280, 800, *90 chat.png
			If ErrorLevel = 1
			{
				ToolTip, No Chat Found,0,0
				sleep 3000
				gosub FlySub1
			} else if ErrorLevel = 0 
			{
				ToolTip, Chat Found,0,0
				sleep 1000
				mouseclick, left, %FoundX%, %FoundY%, 1, 0
			}
			return
		}
		
	}
}
return

Talk:
{
sleep 100
Loop 7
{
send {Z down}
sleep 300
send {Z up}
}
}
sleep 100
return

Fight(){
	PixelGetColor, x2, 115, 270
	while x2 = 0x000000
	{
		ToolTip, We are in Combat,0,0
		sleep 3000
		gosub Talk
		sleep 3000
		ToolTip, Atk Sleep End,0,0
		sleep 2000
		PixelGetColor, x2, 115, 270
	}

	return
}

^F::
Battle2(x:=0,y:=0) { 
	ToolTip, Battle Start ,0,0
	sleep 3000
	Loop 5
	{
		ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 p.png
		ToolTip, CombatUI Scan  ,0,0
		sleep 1000
		If ErrorLevel = 1
		{
			ToolTip, No Battle Found,0,0
			sleep 3000
		} else if ErrorLevel = 0 
		{
			ToolTip, fight,0,0
			sleep 1000
			Fight()
			break
		}

	}
	ToolTip, dumb sleep,0,0
	sleep 3000 ;ALAKAZAM modify end conditions
	ToolTip, sleep over,0,0
	sleep 1000
	return
}


^Y::
Counter = 4
Path: 
{
ToolTip, Starting Isle3 HP EV Farm,0,0
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

gosub SS
}

