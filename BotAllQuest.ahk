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

WinGet, programId, List, BlueStacks App Player for Windows (beta-1)
IfWinExist ahk_id %programId1%
{
	WinActivate
}
	
	
;========================================================
;=================== QUEST ==============================
;========================================================

SetTimer, RandomPopupOrCrash, 5000 ;handles crashes, popup advertisements

loop
{
	while QUEST <= 7
	{
		WaitObject(SELECTEPISODE_BUTTON) ;Wait for quest screen to load (I used the 'Select Episode' button to determine if the quest screen has loaded)
		if QUEST >= 4
		{
			Scroll(840, 770, 840, 190) ;Scroll the list to select quests over level 5
		}

		QuestIndex := AssignQuest(QUEST) ;Assign a quest img path 
		WaitObject(QuestIndex) ;Wait for timer
		Sleep 500 ;Add an extra delay before beginning quest since fantasica boots you if you click it too fast

		ClickObject(QuestIndex) ;Begin quest
		WaitObject(DEPLOYUNIT_BUTTON) ;wait for deploy button

		while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON)
			DeployUnit()

		while DetectObject(CALLALLY_BUTTON)
		{
			if not CallAlly()
			{
				break
			}
		}
		WaitObject(CHOOSEQUESTCOMPLETED_BUTTON) ;Basically waits until questing ends and we get our results
		ClickObject(CHOOSEQUESTCOMPLETED_BUTTON) ;return to quest selection
		QUEST++
		Sleep 10000
	}
	WaitObject(SELECTEPISODE_BUTTON)
	ClickObject(SELECTEPISODE_BUTTON)
	Sleep SLEEPTIME + 500
	Scroll(X_init, Y_init, X_end, Y_end)
	EPISODE++
	QUEST=1
}
Reload

;QUEST-ALL ENDS HERE
;QUEST-ALL ENDS HERE
;========================================================

RandomPopupOrCrash:
if (LaunchGame() || ConnectionError())
	Reload
else
{
	Advertisement()
	LoginBingo()
}
return






TestFunction()
{
	global CHOOSEQUESTCOMPLETED_BUTTON, CONNECTIONERROR_BUTTON, BATTLEOFHEROES_TEXT, QUEST_ICON, QUEST_ICON2, SELECTEPISODE_BUTTON
	while not DetectObject(SELECTEPISODE_BUTTON)
	{
		if DetectObject(QUEST_ICON)
		{
			WaitObject(QUEST_ICON)
			ClickObject(QUEST_ICON)
			break
		}
		else if DetectObject(QUEST_ICON2)
		{
			WaitObject(QUEST_ICON2)
			ClickObject(QUEST_ICON2)
			break
		}
	}
}
Move(coord1,coord2)
{
	MouseMove, %Coord1%,%Coord2%
}
F1::ExitApp
F2::Pause
F3::Reload
F4::ConnectionError()
F5::TestFunction()