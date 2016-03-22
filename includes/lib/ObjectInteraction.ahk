#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Loops until the object at the specified coordinate is clicked
ClickAt(CoordX, CoordY)
{
	global SLEEPTIME
	global BLUESTACK_WINDOW_TITLE
	
	IfWinNotActive, %BLUESTACK_WINDOW_TITLE%
	{
		WinActivate, %BLUESTACK_WINDOW_TITLE%
	}
    
    SendEvent { Click down %CoordX%, %CoordY%}
    sleep SLEEPTIME
    SendEvent { Click up }
}

;Objects are buttons and icons
;MsgBox if img file is missing
;MsgBox if img wasn't found in search
;Note: Use with WaitObject(Path) function to ensure 'Searched Failed' MsgBox does not popup
ClickObject(ByRef Path, variation := 0)
{
	global SLEEPTIME, X1,X2,Y1,Y2
	global BLUESTACK_WINDOW_TITLE
	
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *%variation% %Path%
	if ErrorLevel = 2
	{
		;MsgBox, 0, File Missing(ClickObject), We can't seem to find this file: `n%Path%. >_< `n`n Pausing Script.
		;Pause
		msg := "File Missing(ClickObject), We can't seem to find this file: " . Path
		SB_SetText(msg)
		Log(msg)
	}
	if ErrorLevel = 1
	{
		msg := "Click Failed, " . Path . " could not be found."
		SB_SetText(msg)
		Log(msg)
	}
	else
	{
		SB_SetText("Clicking " . Path)
		ClickAt(FoundX, FoundY)
		;Sleep SLEEPTIME
	}
}

;Return 1 if Object or button is detected
;Return 0 if not detected
DetectObject(ByRef Path, variation := 0)
{
	global X1,X2,Y1,Y2, BACK_BUTTON, SLEEEPTIME
	global BLUESTACK_WINDOW_TITLE
	global BufferX, BufferY
	
	IfWinNotActive, %BLUESTACK_WINDOW_TITLE%
	{
		WinActivate, %BLUESTACK_WINDOW_TITLE%
	}
	
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *TransBlack *%variation% %Path%
	if ErrorLevel = 2
	{
		msg := "File Missing(DetectObject), We can't seem to find this file: " . Path
		SB_SetText(msg)
		Log(msg)
		
		; TODO ADD DRAG n' DROP function here
		
		Sleep SLEEEPTIME
		;MsgBox, 0, File Missing(DetectObject), We can't seem to find this file: `n%Path%. >_< `n`n                    Pausing Script.
		;Pause
	}
	else if ErrorLevel = 1
	{
		msg := "NotFound(DetectObject), Image not detected on the screen: " . Path 
		SB_SetText(msg)
		;Log(msg)
		return 0
	}
	else
	{
		BufferX := FoundX
		BufferY := FoundY
		return 1
	}
}

;Objects are buttons and icons
;MsgBox if img file is missing
;Loop until img is found. Then move mouse to the upper left coordinates of the img location
WaitObject(ByRef Path)
{
	global X1, X2, Y1, Y2, SLEEPTIME
	global WAIT_X, WAIT_Y
	global BLUESTACK_WINDOW_TITLE
	
	WinActivate, %BLUESTACK_WINDOW_TITLE%
	
	randomX := WAIT_X
	randomY := WAIT_Y
	SB_SetText("Waiting for `n`n" . Path)
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
	while (ErrorLevel == 2)
	{
		msg := "File Missing(WaitObject), We can't seem to find this file: " . Path
		SB_SetText(msg)
		Log(msg)
		; TODO ADD DRAG n' DROP function here
	}
	
	waitStatus := Object()
	waitStatus[0] := "*"
	waitStatus[1] := "* *"
	waitStatus[2] := "* * *"
	
	while (ErrorLevel == 1)
	{
		SB_SetText("Waiting for `n`n" . Path . waitStatus[mod(A_Index,3)])
		
		IfWinNotActive, %BLUESTACK_WINDOW_TITLE%
		{
			WinActivate, %BLUESTACK_WINDOW_TITLE%
		}
		SendEvent {Click %randomX%, %randomY% }
		ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %Path%
	}
	;Sleep SLEEPTIME
	array := [Foundx, FoundY]
	return array
}
