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
	if (detectObject(FANTASICAAPP_BUTTON)) {
    clickObject(FANTASICAAPP_BUTTON)
	}
  
  if (detectObject(STARTGAME_BUTTON)) {
    clickObject(STARTGAME_BUTTON)
  }

	if (detectObject(CONNECTIONERROR_BUTTON)) {
		clickObject(CONNECTIONERROR_BUTTON)
	}

	if (detectObject(CONNECTIONERROR_TEXT))
	{
		Send {ESC down}
		Sleep 1000
		Send {ESC up}
	}

	if (detectObject(CONFIRMEXITAPP_BUTTON)) {
		clickObject(CONFIRMEXITAPP_BUTTON)
	}
}

F1::ExitApp
F2::Pause
F3::Reload
