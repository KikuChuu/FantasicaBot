#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

loop
{
	if (DetectObject(FANTASICAAPP_BUTTON))
	{
		LaunchGame()
	}

	if (DetectObject(CONNECTIONERROR_BUTTON))
	{
		ClickObject(CONNECTIONERROR_BUTTON)
	}

	if (DetectObject(CONNECTIONERROR_TEXT))
	{
		Send {ESC down}
		Sleep 1000
		Send {ESC up}
	}

	if (DetectObject(CONFIRMEXITAPP_BUTTON))
	{
		ClickObject(CONFIRMEXITAPP_BUTTON)
	}
}

F1::ExitApp
F2::Pause
F3::Reload
