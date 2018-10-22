#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.

#MaxThreadsPerHotkey 2
#SingleInstance, force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

/*
mousemove, 150, 140
sleep 1000
mousemove, 530, 240
sleep 1000 
*/

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


SS: 
^W::
WinActivate, Pok???O
Loop
{
	ToolTip, Sweet Scent Start,0,0
	sleep 1000
	ImageSearch, FoundX, FoundY, 150, 140, 1280, 600, *90 p.png
	ToolTip, Checking Battle state,0,0
	sleep 1000
	if ErrorLevel = 0
	{
		gosub Battle
	}
	ImageSearch, FoundX, FoundY, 1150, 250, 1290, 600, *90 bs.png
	ToolTip, After IMG  ,0,0
	sleep 1000
	If ErrorLevel = 1
	{
		ToolTip, No BS found 1,0,0
		sleep 1000
	} else if ErrorLevel = 0 
	{
		ToolTip, BS Found 1,0,0
		mouseclick, left, %FoundX%, %FoundY%, 1, 0
		sleep 1000
		ImageSearch, FoundX, FoundY, 1000, 250, 1290, 800, *90 ss.png
			If ErrorLevel = 1
			{
				ToolTip, SS FAIL 1,0,0
				sleep 1000
			} else if ErrorLevel = 0 
			{
				ToolTip, SS GG 1,0,0
				mouseclick, left, %FoundX%, %FoundY%, 1, 0
				sleep 1000
				send {Z down}
				sleep 100
				send {Z up}  Z
				sleep 12000
				gosub, Battle
			}

		
	}
}

^R::
WinActivate, Pok???O 

ToolTip, Fly Start,0,0

send {F1 down}
sleep 100
send {F1 up} 
sleep 1000


send {UP down}
sleep 100
send {UP up} 

send {UP down}
sleep 100
send {UP up} 

sleep 1000

Loop 4 
{
send {Z down}
sleep 100
send {Z up} 
sleep 30
}


	

