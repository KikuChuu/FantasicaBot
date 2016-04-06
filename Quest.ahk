#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk
SetDefaultMouseSpeed 0
;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================

deployUnitNum := 0
pendingAllies := 0
loop,
{
	; ==========================================================================
	; **************************************************************************
	; ---------------------- QUEST SELECTION PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================		
	if (DetectObject(QUEST_TEXT))
	{
		if (BOTALLQUEST == 1 && !latestEpisode)
		{
			if (DetectObject(SELECTEPISODE_BUTTON))
			{
				ClickObject(SELECTEPISODE_BUTTON)
			}
			else if (DetectObject(EPISODELISTNEXT_BUTTON))
			{
				ClickObject(EPISODELISTNEXT_BUTTON)
			}
			else
			{
				Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)

				if DetectObject(EPISODESELECT10_BUTTON)
				{
					ClickObject(EPISODESELECT10_BUTTON)
				}
				else if DetectObject(EPISODESELECT9_BUTTON)
				{
					ClickObject(EPISODESELECT9_BUTTON)
				}
				else if DetectObject(EPISODESELECT8_BUTTON)
				{
					ClickObject(EPISODESELECT8_BUTTON)
				}
				else if DetectObject(EPISODESELECT7_BUTTON)
				{
					ClickObject(EPISODESELECT7_BUTTON)
				}
				else if DetectObject(EPISODESELECT6_BUTTON)
				{
					ClickObject(EPISODESELECT6_BUTTON)
				}
				else if DetectObject(EPISODESELECT5_BUTTON)
				{
					ClickObject(EPISODESELECT5_BUTTON)
				}
				else if DetectObject(EPISODESELECT4_BUTTON)
				{
					ClickObject(EPISODESELECT4_BUTTON)
				}
				else if DetectObject(EPISODESELECT3_BUTTON)
				{
					ClickObject(EPISODESELECT3_BUTTON)
				}
				else if DetectObject(EPISODESELECT2_BUTTON)
				{
					ClickObject(EPISODESELECT2_BUTTON)
				}
				else if DetectObject(EPISODESELECT1_BUTTON)
				{
					ClickObject(EPISODESELECT1_BUTTON)
				}
				
				QUEST = 1
				latestEpisode = 1
			}
		}
		else
		{		
			if (QUEST >= 4)
			{
			  Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
			}
			
			questindex := assignquest(QUEST) ; Quest index represents the actual image path of the quest button
			
			scrollCount := 2 ; Introduced to scroll up to the very top of the quest selection
			if (DetectObject(questindex))
			{
				ClickObject(questindex)
			}
			else
			{
				loop, 2
				{
					Scroll(QUEST_X2, QUEST_Y2, QUEST_X1, QUEST_Y1)
				}
			}
		}
	}
; ====================================================
; ------------------- QUEST BATTLE -------------------
; ====================================================
	if (DetectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1)
	{
		ClickObject(SKIPQUEST_BUTTON)
	}

  if (DetectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER) {
    ClickObject(DEPLOYUNIT_BUTTON)
  }

  if (DetectObject(DEPLOY_TEXT)) {
    if (DetectObject(UNITFAVORITEOFF_BUTTON)) {
      ClickObject(UNITFAVORITEOFF_BUTTON)
    }

    ToggleAttackType()
    ToggleAttribType()
    ChooseUnit()
    Sleep 500
  }

  if (DetectObject(CANCELPLACEMENT_BUTTON)) {
    if (DeployUnit()) {
      deployUnitNum++
    }
  }

	; ==========================================================================
	; **************************************************************************
	; ------------------------ QUEST RESULTS PAGE ------------------------------
	; **************************************************************************
	; ==========================================================================	
	if (DetectObject(QUESTCLEAR_TEXT) || DetectObject(QUESTRESULT_TEXT))
	{
		if (DetectObject(QUESTCLEAR_TEXT) && BOTALLQUEST)
		{
			if (QUEST < 7)
			{
				QUEST++
			}
			else
			{
				latestEpisode = 0
			}
		}
		if (DetectObject(MYPAGE_BUTTON) && BotEvent == 1)
		{
			ClickObject(MYPAGE_BUTTON)
		}
		else if (DetectObject(BACKTOEVENT_BUTTON))
		{
			WaitObject(BACKTOEVENT_BUTTON)
			ClickObject(BACKTOEVENT_BUTTON)
		}
		else if (DetectObject(CHOOSEQUESTCOMPLETED_BUTTON))
		{
			WaitObject(CHOOSEQUESTCOMPLETED_BUTTON)
			ClickObject(CHOOSEQUESTCOMPLETED_BUTTON)
		}
		deployUnitNum = 0
		pendingAllies = 1
	}
}

F1::ExitApp
F2::PAUSE
F3::Reload
