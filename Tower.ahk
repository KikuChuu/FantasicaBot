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

TOWER_MYPAGE := Decorate("FANTASICA IMAGES/Event/Tower/buttonmypage.png")
TOWER_BATTLESTART := Decorate("FANTASICA IMAGES/Event/Tower/buttonbattlestart.png")
TOWER_BACK := Decorate("FANTASICA IMAGES/Event/Tower/buttonback.png")

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes


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
	if (DetectObject(TOWER_BATTLESTART)) {
		ClickObject(TOWER_BATTLESTART)
	}
	if (DetectObject(TOWER_BACK)) {
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


RandomPopupOrCrash:
if (LaunchGame() || ConnectionError() || Maintenance())
	Reload
else
	Advertisement()
return

InitGlobals:
  Init_globals() ; Found in GlobalConstants.ahk
return

;QUEST ENDS HERE
;========================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::DetectObject("E:/Programmingasdfsdf")
