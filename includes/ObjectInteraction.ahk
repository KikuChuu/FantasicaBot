#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Loops until the object at the specified coordinate is clicked
ClickAt(CoordX, CoordY)
{
	global SLEEPTIME
	PixelGetColor, PixColor, %CoordX%, %CoordY%
	PixState := PixColor
	while PixState = PixColor
	{
		SendEvent { Click down %CoordX%, %CoordY%}
		sleep SLEEPTIME
		PixelGetColor, PixState, %CoordX%, %CoordY%
		SendEvent { Click up }
	}
}

;Objects are buttons and icons
;MsgBox if img file is missing
;MsgBox if img wasn't found in search
;Note: Use with WaitObject(Path) function to ensure 'Searched Failed' MsgBox does not popup
ClickObject(ByRef Path)
{
	global SLEEPTIME, X1,X2,Y1,Y2
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
	if ErrorLevel = 2
	{
		MsgBox, 0, File Missing(ClickObject), We can't seem to find this file: `n%Path%. >_< `n`n Pausing Script.
		Pause
	}
	else if ErrorLevel = 1
		SB_SetText("Click Failed, " . Path . " could not be found.")
	else
	{
		SB_SetText("Clicking " . Path)
		ClickAt(FoundX, FoundY)
		Sleep SLEEPTIME
	}
}

;Return 1 if Object or button is detected
;Return 0 if not detected
DetectObject(ByRef Path)
{
	global X1,X2,Y1,Y2, BACK_BUTTON
	
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
	if ErrorLevel = 2
	{
		MsgBox, 0, File Missing(DetectObject), We can't seem to find this file: `n%Path%. >_< `n`n                    Pausing Script.
		Pause
	}
	else if ErrorLevel = 1
		return 0
	else
		return 1
}

;Objects are buttons and icons
;MsgBox if img file is missing
;Loop until img is found. Then move mouse to the upper left coordinates of the img location
WaitObject(ByRef Path)
{
	global X1, X2, Y1, Y2, SLEEPTIME
	
	randomX := X2 * 0.40364583333333333333333333333333 ; A ratio obtained by 775 / 1920
	randomY:= Y2 * 0.39537037037037037037037037037037 ; A ratio obtained by 427 / 1080
	SB_SetText("Waiting for `n`n" . Path)
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
	if ErrorLevel = 2
	{
		MsgBox, 0, File Missing(WaitObject), We can't seem to find this file: `n%Path%. >_< `n`n                    Pausing Script.
		Pause
	}	
	else if ErrorLevel = 1 
	{
	    Array := Object()
		Array[0] := "*"
		Array[1] := "* *"
		Array[2] := "* * *"
		while ErrorLevel = 1
		{
			SB_SetText("Waiting for `n`n" . Path . Array[mod(A_Index,3)])
			SendEvent {Click %randomX%, %randomY% }
			ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
		}
	}
	Sleep SLEEPTIME
}