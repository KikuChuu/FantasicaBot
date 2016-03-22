#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

; ======================
; === Variables here ===
TACTICS_EVENTICON := Decorate("FANTASICA IMAGES/Event/Tactics/eventicon.png")
TACTICS_BATTLE := Decorate("FANTASICA IMAGES/Event/Tactics/battle.png")
TACTICS_SQUADINFO := Decorate("FANTASICA IMAGES/Event/Tactics/battle/squadinfo.png")
TACTICS_NEXT := Decorate("FANTASICA IMAGES/Event/Tactics/results/next.png")
TACTICS_TOP := Decorate("FANTASICA IMAGES/Event/Tactics/results/top.png")
TACTICS_BOSS := Decorate("FANTASICA IMAGES/Event/Tactics/boss.png")
; ======================
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
	if (DetectObject(FANTASICAAPP_BUTTON))
	{
		LaunchGame()
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
  
  if (DetectObject(TACTICS_EVENTICON)) {
    ClickObject(TACTICS_EVENTICON)
  }  

  if (DetectObject(TACTICS_BATTLE)) {
    ClickObject(TACTICS_BATTLE)
  }

  if (DetectObject(TACTICS_BOSS)) {
    ClickObject(TACTICS_BOSS)
  }

  if (DetectObject(TACTICS_SQUADINFO)) {
    ; Squad ordering
    ; --------------
    ; 1 2 3
    ; 4 5 6
    ClickAt(130, 850) ; Squad 4
    ClickAt(340, 850) ; Squad 5
    ClickAt(340, 700) ; Squad 2
    ClickAt(130, 700) ; Squad 1
    ClickAt(550, 700) ; Squad 3
    ClickAt(550, 850) ; Squad 6
  }

  if (DetectObject(TACTICS_TOP)) {
    ClickObect(TACTICS_TOP)
  }

  if (DetectObject(TACTICS_NEXT)) {
    ClickObject(TACTICS_NEXT)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
