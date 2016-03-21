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
	if (DetectObject(LOGINBONUSMYPAGE_BUTTON))
	{
		ClickObject(LOGINBONUSMYPAGE_BUTTON)
	} 

	if (DetectObject(POPUPCLOSE_BUTTON))
	{
		ClickObject(POPUPCLOSE_BUTTON)
	}	

	if (DetectObject(STARTGAME_BUTTON))
	{
		if (DetectObject(RESUMEQUESTNO_BUTTON))
		{
		    ClickObject(RESUMEQUESTNO_BUTTON)
		}
		else
		{
		    ClickObject(STARTGAME_BUTTON)
		}
	}

	if (DetectObject(ALLYPENDINGREQUEST_TEXT))
	{
		ClickObject(BACK_BUTTON)
	}
	else if (DetectObject(ALLY_TEXT))
	{
		ClickObject(BACK_BUTTON)
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

	if (DetectObject(LOGINBINGO_TEXT))
	{
		if (DetectObject(LOGINBINGORECEIVE_BUTTON))
		{
			ClickObject(LOGINBINGORECEIVE_BUTTON)
		}
		else
		{
			LoginBingoHelperClicker()
		}
	}	
}

F1::ExitApp
F2::Pause
F3::Reload
