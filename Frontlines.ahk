﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;===================== QUEST START ======================
;========================================================

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes

waitobject(FIGHT_BUTTON)

while detectObject(CPBAR0_TEXT)
{
	waitObject(CPBAR1_TEXT)
}

waitobject(FIGHT_BUTTON)
ClickObject(FIGHT_BUTTON)

while not DetectObject(OPPONENT1_BUTTON)
{
	sleep SLEEPTIME
}

scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)

if detectObject(OPPONENT20_BUTTON)
{
	waitObject(OPPONENT20_BUTTON)
	clickObject(OPPONENT20_BUTTON)
}
else if detectObject(OPPONENT19_BUTTON)
{
	waitObject(OPPONENT19_BUTTON)
	clickObject(OPPONENT19_BUTTON)
}
else if detectObject(OPPONENT18_BUTTON)
{
	waitObject(OPPONENT18_BUTTON)
	clickObject(OPPONENT18_BUTTON)
}
else if detectObject(OPPONENT17_BUTTON)
{
	waitObject(OPPONENT17_BUTTON)
	clickObject(OPPONENT17_BUTTON)
}
else if detectObject(OPPONENT16_BUTTON)
{
	waitObject(OPPONENT16_BUTTON)
	clickObject(OPPONENT16_BUTTON)
}
else
{
	msg := "Could not find a valid opponent on opponent selection screen"
	SB_SetText(msg)
	Log(msg)
}

waitObject(SKIP_BUTTON)
clickObject(SKIP_BUTTON)

Sleep 5000

if DetectObject(SPEED_BUTTON) 
{
	waitObject(SPEED_BUTTON)
	clickObject(SPEED_BUTTON)
}
if DetectObject(CRITICAL_BUTTON)
{
	waitObject(CRITICAL_BUTTON)
	clickObject(CRITICAL_BUTTON)
}
if DetectObject(DRAIN_BUTTON)
{
	waitObject(DRAIN_BUTTON)
	clickObject(DRAIN_BUTTON)
}

waitObject(FRONTLINEBACK_BUTTON)
clickObject(FRONTLINEBACK_BUTTON)
reload

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




;=====================
TestFunction()
{
	Send { ESC down}
	Sleep 1000
	
	
	
}
TestFunction2()
{
	Roulette()
}
Move(coord1,coord2)
{
	SendEvent {Click 780, 500}
}
F1::ExitApp
F2::Pause
F3::Reload
F4::DetectObject("E:/Programmingasdfsdf")