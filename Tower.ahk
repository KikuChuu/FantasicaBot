#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;==================== QUEST START =======================
;========================================================

TOWER_ICON := Decorate("FANTASICA IMAGES/Event/Tower/eventicon.png")
TOWER_MYPAGE := Decorate("FANTASICA IMAGES/Event/Tower/buttonmypage.png")
TOWER_BATTLESTART := Decorate("FANTASICA IMAGES/Event/Tower/buttonbattlestart.png")
TOWER_BACK := Decorate("FANTASICA IMAGES/Event/Tower/resultscreen/buttonback.png")
TOWER_USE_TIME_ELIXIR := Decorate("FANTASICA IMAGES/Event/Tower/buttonbattlestartte.png")
TOWER_YES := Decorate("FANTASICA IMAGES/Event/Tower/yes.png")

mutex := 0
deployUnitNum := 0
pendingAllies := 1

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

  ; Event
  if (DetectObject(TOWER_ICON)) 
  {
    ClickObject(TOWER_ICON)
  }

	if (DetectObject(TOWER_BATTLESTART)) 
  {
		ClickObject(TOWER_BATTLESTART)
    deployUnitNum := 0
    pendingAllies := 1
	}

  if (DetectObject(TOWER_USE_TIME_ELIXIR)) 
  {
    ClickObject(TOWER_USE_TIME_ELIXIR)
  }

  if (DetectObject(TOWER_YES)) 
  {
    ClickObject(TOWER_YES)
    deployUnitNum := 0
    pendingAllies := 1
  }

	if (DetectObject(TOWER_BACK)) 
  {
		ClickObject(TOWER_BACK)
	}
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- QUEST BATTLE --------------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1)
	{
		ClickObject(SKIPQUEST_BUTTON)
	}

	if (DetectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER)
	{
		ClickObject(DEPLOYUNIT_BUTTON)
	}

	if (DetectObject(DEPLOY_TEXT))
	{
    if (DetectObject(UNITFAVORITEOFF_BUTTON)) 
    {
      ClickObject(UNITFAVORITEOFF_BUTTON)
    }
		if (DeployUnit(SORTINDEX, TYPEINDEX))
		{
			deployUnitNum++
		}
	}

	if (DetectObject(CALLALLY_BUTTON) && pendingAllies)
	{
		ClickObject(CALLALLY_BUTTON)
	}

	if (DetectObject(CALLALLYPAGE_TEXT))
	{
		if (CallAlly(SORTINDEX, TYPEINDEX))
		{
			pendingAllies = 1
		}
		else
		{
			pendingAllies = 0
		}
	}
}

;QUEST ENDS HERE
;========================================================

F1::ExitApp
F2::Pause
F3::Reload
