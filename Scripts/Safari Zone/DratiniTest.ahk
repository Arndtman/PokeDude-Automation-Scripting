#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#MaxThreadsPerHotkey 2
#SingleInstance, force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

;============
^R::
Idle: 
while 1 < 2 { 
sleep 100 
} 

^E::
MainLoop: 
Loop { 
	;send {F3 Down} {F3 Up}
	;sleep 4000
	gosub FindChat 
	gosub FindBattle	
} 

Run:
{
	ToolTip, We are Running,0,0
	;sleep 1000
	mouseMove, 500, 630, 20
	mouseMove, 5, -4 , 10, R
	mouseClick, left
	mouseMove, 5, 6 , 10, R
	mouseClick, left
	sleep 50
	mouseClick, left
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

Fight:
	PixelGetColor, x2, 115, 270
	ToolTip, We are in Combat,0,0
	if DratiniCatch() {
		while x2 = 0x000000
		{
			sleep 2000
			gosub Talk
			sleep 3000
			ToolTip, Atk Sleep End,0,0
			sleep 2000
			PixelGetColor, x2, 115, 270
		}
	} else { 
		sleep 500
		gosub Run
		sleep 50
		gosub Run
		sleep 300
	} 
	return


^F::
Battle2:
	ToolTip, Battle Start ,0,0
	sleep 3000
	Loop 5
	{
		ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 p.png
		ToolTip, CombatUI Scan  ,0,0
		;sleep 1000
		If ErrorLevel = 1
		{
			ToolTip, No Battle Found,0,0
			sleep 3000
		} else if ErrorLevel = 0 
		{
			ToolTip, fight,0,0
			sleep 1200
			gosub Fight
			gosub FindX
			gosub FindX
			break
		}

	}
	ToolTip, dumb sleep,0,0
	sleep 500
	return



DratiniCatch() {
Loop 2 { 
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 D.png
	If ErrorLevel = 1
	{
		ToolTip, No D Found,0,0
		;sleep 700
	} else if ErrorLevel = 0 
	{
		ToolTip, D Found,0,0
		sleep 700
		return true
	}
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 D2.png
	If ErrorLevel = 1
	{
		ToolTip, No D2 Found,0,0
		;sleep 700
	} else if ErrorLevel = 0 
	{
		ToolTip, D2 Found,0,0
		sleep 700
		return true
	}
}
return false
}

FindX:
ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 x.png
If ErrorLevel = 1
{
	ToolTip, No X Found,0,0
} else if ErrorLevel = 0 
{
	ToolTip, X Found,0,0
	sleep 1000
	mouseMove, %FoundX%, %FoundY%, 20
	mouseMove, 2, -2 , 10, R
	mouseClick, left
	mouseMove, 1, 1 , 10, R
	mouseClick, left
}

FindChat:
ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 chat.png
while ErrorLevel = 1 
{
	ToolTip, No Chat Found 1,0,0
	sleep 1000
	send {F3 Down} {F3 Up}
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 chat.png
} 
ToolTip, Chat Found 1,0,0
;sleep 1000
return 

FindBattle: 
ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 n.png
if ErrorLevel = 1 
{
	ToolTip, No N Found LF L,0,0
	;sleep 1000
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 800, *90 L.png
	if ErrorLevel = 1
	{
		ToolTip, No L Found 1,0,0
		;sleep 1000
	}
	else if ErrorLevel = 0 
	{
		ToolTip, L Found 1,0,0
		;sleep 1000
		mouseMove, %FoundX%, %FoundY%, 20
		mouseMove, 5, -4 , 10, R
		mouseClick, left
		mouseMove, 5, 6 , 10, R
		mouseClick, left
		gosub Battle2
	}
} else if ErrorLevel = 0 
{
	ToolTip, N Found 1,0,0
	;sleep 1000
	mouseMove, %FoundX%, %FoundY%, 20
	mouseMove, 5, -4 , 10, R
	mouseClick, left
	mouseMove, 5, 6 , 10, R
	mouseClick, left
}
return





