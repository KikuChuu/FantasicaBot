#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include UserInput.txt
#include %A_ScriptDir%\includes\GlobalConstants.ahk
#include %A_ScriptDir%\includes\GuiConstructor.ahk
#include %A_ScriptDir%\includes\ObjectInteraction.ahk 
#include %A_ScriptDir%\includes\LoginBingo.ahk
#include %A_ScriptDir%\includes\QuestProcedures.ahk
#include %A_ScriptDir%\includes\ErrorHandlers\QuestErrorHandler.ahk

;------- INITIALIZE -------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------

WinGet, programId, List, Bluestacks App Player
IfWinExist ahk_id %programId1%
{
	WinActivate  Bluestacks App Player
	WinWaitActive, ahk_id %programId1%, , 2
}

;========================================================
;=================== QUEST START =====================
;========================================================

SetTimer, RandomPopupOrCrash, 7000 ;handles crashes, popup advertisements

waitobject(selectepisode_button) ;wait for quest screen to load (i used the 'select episode' button to determine if the quest screen has loaded)

if quest >= 4
{
	global QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2
	scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2) ;scroll the list to select quests over level 5
}

questindex := assignquest(quest) ;assign a quest img path 
waitobject(questindex) ;wait for timer
sleep 500 ;add an extra delay before beginning quest since fantasica boots you if you click it too fast

clickobject(questindex) ;begin quest
waitobject(DEPLOYUNIT_BUTTON) ;wait for deploy button

while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON) {
	DeployUnit()
}
while DetectObject(CALLALLY_BUTTON)
	if (CallAlly(SORTINDEX, TYPEINDEX) == 0)
	{
		break
	}

;quick fix
Sleep 500
if DetectObject(BACKQUEST_BUTTON)
{
	while DetectObject(BACKQUEST_BUTTON)
	{
		WaitObject(BACKQUEST_BUTTON)
		ClickObject(BACKQUEST_BUTTON)
	}
}

WaitObject(CHOOSEQUESTCOMPLETED_BUTTON) ;Basically waits until questing ends and we get our results
ClickObject(CHOOSEQUESTCOMPLETED_BUTTON) ;return to quest selection

waitobject(selectepisode_button) ;wait for quest screen to load (i used the 'select episode' button to determine if the quest screen has loaded)

Reload


RandomPopupOrCrash:
if (LaunchGame() || ConnectionError() || Maintenance())
	Reload
else
	Advertisement()
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