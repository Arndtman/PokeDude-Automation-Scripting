#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#MaxThreadsPerHotkey 2
#SingleInstance, force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

/*
This bot only uses the first move the Poker has, so put the AOE: SURF, HYPER VOICE etc as MOVE1 to kill HORDES

BRING LEPPA BERRIES!!! The bot will AUTOMATICALLY apply LEPPAS to BELLSPROUT SWEET SCENT.
The bot assumes you start with full PP usage on first poker and bellsprout.

To Start, Go to Mt. Ember 3rd or 4th floor then:
1) Make sure a BELLSPROUT is in your party with SWEET SCENT
2) Make sure your first poker has an AOE move like Surf, Hyper Voice, Earthquake ETC as their first selectable move
3) Make sure you have enough LEPPA berrys for your desired run length
4) Make sure SHOW OVERWORLD is DISABLED in combat (Settings->video->show overworld in battle->off)
5) PokeMMO MUST be in 1280x800, make sure to check each new session. 
6) PokeMMO MUST be the MAIN WINDOW
7) Sit back and let it run (slow at some points due to state checks) 
8) press CTRL + W to start

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

^W::
Counter = 4
SS: 
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
		ToolTip, SS out of PP: Restoring,0,0
		Counter = 4
		sleep 1000
		gosub Heal
		sleep 2000
	}
}

^T::
Heal: 
{
Loop 2 { 
	ToolTip, Using Leppa ,0,0
	sleep 300
	send {B down} {B up}
	sleep 300

	ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 berry.png
		If ErrorLevel = 1
		{
			ToolTip, Berry's tab not found,0,0
			sleep 1000
		} else if ErrorLevel = 0 
		{
			ToolTip, In berry bag LF leppa,0,0
			sleep 1000
			mouseclick, left, %FoundX%, %FoundY%, 1, 0
			sleep 1000
			ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 leppa.png
			If ErrorLevel = 1
			{
				ToolTip, Leppa not found,0,0
				sleep 1000
			} else if ErrorLevel = 0 
			{
				ToolTip, Leppa Found,0,0 
				sleep 1000
				mouseclick, left, %FoundX%, %FoundY%, 1, 0
				sleep 1000
				sleep 300
				send {B down} {B up}
				sleep 300
				ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 bs2.png
				If ErrorLevel = 1
				{
					ToolTip, Leppa not found,0,0
					sleep 1000
				} else if ErrorLevel = 0 
				{
					ToolTip, Leppa found,0,0
					sleep 1000
					mouseclick, left, %FoundX%, %FoundY%, 1, 0
					sleep 300
					ImageSearch, FoundX, FoundY, 100, 250, 1290, 800, *90 ss2.png
					If ErrorLevel = 1
					{
						ToolTip, Sweet Scent Not Found,0,0
						sleep 1000
					} else if ErrorLevel = 0 
					{
						ToolTip, Sweet Scent Found,0,0
						sleep 1000
						mouseclick, left, %FoundX%, %FoundY%, 1, 0
						sleep 300
					}
				}
			}
		}
	ToolTip,Leppa Used,0,0
	sleep 500
	send {ESC down} {ESC up} 
	sleep 500
}
ToolTip, PP End,0,0
return
}



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
ToolTip, Starting Isle7 Spd EV Farm,0,0
send {Left down} 
sleep 800
send {Left up}
sleep 300
send {Down down} 
sleep 4600
send {Down up} 
gosub SS
}

