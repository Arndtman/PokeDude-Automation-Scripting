#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#MaxThreadsPerHotkey 2+
#SingleInstance, force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Toggle = 0



^T::
FlyVerm:
{
	send {F1 down}
	sleep 300
	send {F1 up} 
	sleep 1000

	Loop { 
		ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 flyVerm.png
		ToolTip, LF Verm,0,0
		sleep 1000
		If ErrorLevel = 1
		{
			ToolTip, No Fly Found,0,0
			sleep 3000
		} else if ErrorLevel = 0 
		{
			ToolTip, Fly Found,0,0
			sleep 1000
			mX := FoundX + 10 
			mY := FoundY +10
			mouseMove, %FoundX%, %FoundY%, 20
			mouseMove, -5, 5, 20, R
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
Battle(x:=0,y:=0) { 
	ToolTip, Battle Start ,0,0
	sleep 2000
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
		}

	}
	ToolTip, dumb sleep,0,0
	sleep 7000 ;ALAKAZAM modify end conditions
	ToolTip, sleep over,0,0
	sleep 1000
	return
}

MyStart: 
^Q:: ;at PC
WinActivate, Pok???O

ToolTip, WALKIN,0,0

send {Right down} 
sleep 1800
send {Right up}

send {Down down} 
sleep 2400
send {Down up}

send {Right down} 
sleep 3000
send {Right up}

sleep 1000

send {Right down} 
sleep 3800
send {Right up}

sleep 1000

send {Down down}
sleep 1700
send {Down up}

send {Right down} 
sleep 500
send {Right up}

sleep 1000

ToolTip, OLDMAN1 ,0,0

send {Up down}
sleep 100
send {Up up}

send {Up down}
sleep 100
send {Up up}

sleep 300 

gosub Talk
Battle()


^W:: ;at 2nd man
WinActivate, Pok???O

ToolTip, OLDMAN2,0,0

send {Right down} 
sleep 3000
send {Right up}

sleep 300 

gosub Talk
Battle()

ToolTip, OLDMAN3,0,0

send {Down down}
sleep 500
send {Down up}

send {Right down}
sleep 1500
send {Right up}

send {Up down}
sleep 900
send {Up up}

sleep 300 

^E:: ;at 2nd man
WinActivate, Pok???O

gosub Talk
Battle()


ToolTip, OLDMAN4,0,0

Loop 2
{ 
send {Left down}
sleep 100
send {Left up}
}

send {Up down}
sleep 2400
send {Up up}

send {Right down}
sleep 2400
send {Right up}

send {Right down}
sleep 100ZZ
send {Right up}

gosub Talk
Battle()


ToolTip, OLDMAN5,0,0

send {Left down}
sleep 2100
send {Left up}

send {Down down}
sleep 800
send {Down up}

send {Right down}
sleep 1000
send {Right up}

^R:: ;at 2nd man
WinActivate, Pok???O

gosub Talk
Battle()

ToolTip, OLDMAN6,0,0

Loop 2
{ 
send {Down down}
sleep 100
send {Down up}
}

send {Right down}
sleep 800
send {Right up}

send {Down down}
sleep 1600
send {Down up}

send {Right down}
sleep 2400
send {Right up}

Loop 2
{ 
send {Up down}
sleep 100
send {Up up}
}

gosub Talk
Battle()


ToolTip, FLYING BACK,0,0
sleep 1000
gosub FlyVerm

