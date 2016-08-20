#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
initGlobals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;=================== QUEST ==============================
;========================================================

loop
{
	while QUEST <= 7
	{
		
		WaitObject(SELECTEPISODE_BUTTON) ;Wait for quest screen to load (I used the 'Select Episode' button to determine if the quest screen has loaded)
		if QUEST >= 4
		{
		  global QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2
		  scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
		}

		QuestIndex := AssignQuest(QUEST) ;Assign a quest img path 
		WaitObject(QuestIndex) ;Wait for timer
		Sleep 500 ;Add an extra delay before beginning quest since fantasica boots you if you click it too fast

		ClickObject(QuestIndex) ;Begin quest
		
		WaitObject(DEPLOYUNIT_BUTTON) ;wait for deploy button
		hasDeployedAllAllies := 0
		while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON)
		{
			DeployUnit()
			
			if (!hasDeployedAllAllies)
			{
				while DetectObject(CALLALLY_BUTTON)
				{   
					if (CallAlly(SORTINDEX, TYPEINDEX) == 0)
					{
						hasDeployedAllAllies := 1
						break
					}
				}
			}
		}

		WaitObject(CHOOSEQUESTCOMPLETED_BUTTON) ;Basically waits until questing ends and we get our results
		if (DetectObject(QUESTCLEAR_TEXT))
		{
			QUEST++
		}
		ClickObject(CHOOSEQUESTCOMPLETED_BUTTON) ;return to quest selection
	}
	WaitObject(SELECTEPISODE_BUTTON)
	ClickObject(SELECTEPISODE_BUTTON)
	WaitObject(EPISODESELECT1_BUTTON)
	
	while not DetectObject(EPISODELISTNONEXT_BUTTON)
	{
		WaitObject(EPISODELISTNEXT_BUTTON)
		ClickObject(EPISODELISTNEXT_BUTTON)
		WaitObject(EPISODESELECT1_BUTTON)
	}
	
	Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
	
	if DetectObject(EPISODESELECT10_BUTTON)
	{
		WaitObject(EPISODESELECT10_BUTTON)
		ClickObject(EPISODESELECT10_BUTTON)
	}
	else if DetectObject(EPISODESELECT9_BUTTON)
	{
		WaitObject(EPISODESELECT9_BUTTON)
		ClickObject(EPISODESELECT9_BUTTON)
	}
	else if DetectObject(EPISODESELECT8_BUTTON)
	{
		WaitObject(EPISODESELECT8_BUTTON)
		ClickObject(EPISODESELECT8_BUTTON)
	}
	else if DetectObject(EPISODESELECT7_BUTTON)
	{
		WaitObject(EPISODESELECT7_BUTTON)
		ClickObject(EPISODESELECT7_BUTTON)
	}
	else if DetectObject(EPISODESELECT6_BUTTON)
	{
		WaitObject(EPISODESELECT6_BUTTON)
		ClickObject(EPISODESELECT6_BUTTON)
	}
	else if DetectObject(EPISODESELECT5_BUTTON)
	{
		WaitObject(EPISODESELECT5_BUTTON)
		ClickObject(EPISODESELECT5_BUTTON)
	}
	else if DetectObject(EPISODESELECT4_BUTTON)
	{
		WaitObject(EPISODESELECT4_BUTTON)
		ClickObject(EPISODESELECT4_BUTTON)
	}
	else if DetectObject(EPISODESELECT3_BUTTON)
	{
		WaitObject(EPISODESELECT3_BUTTON)
		ClickObject(EPISODESELECT3_BUTTON)
	}
	else if DetectObject(EPISODESELECT2_BUTTON)
	{
		WaitObject(EPISODESELECT2_BUTTON)
		ClickObject(EPISODESELECT2_BUTTON)
	}
	else if DetectObject(EPISODESELECT1_BUTTON)
	{
		WaitObject(EPISODESELECT1_BUTTON)
		ClickObject(EPISODESELECT1_BUTTON)
	}
	EPISODE++
	QUEST=1
}


F1::ExitApp
F2::Pause
F3::Reload
