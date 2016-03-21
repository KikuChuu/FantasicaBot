#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

latestEpisode := 1
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

  if (DetectObject(QUESTTIMER_TEXT)) {
    scrollCount := QUEST_INDEX // 3
    if (DetectObject(QUEST3_ICON, 150))
    {
      ClickObject(QUEST3_ICON, 150)
    }
    else if (DetectObject(QUEST4_ICON, 150))
    {
      ClickObject(QUEST4_ICON, 150)
    }
    else if (DetectObject(QUEST5_ICON, 150))
    {
      ClickObject(QUEST5_ICON, 150)
    }
    else
    {
      loop, %scrollCount%
      {
        Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
      }
      
      if (DetectObject(QUEST3_ICON, 150))
      {
        ClickObject(QUEST3_ICON, 150)
      }
      else if (DetectObject(QUEST4_ICON, 150))
      {
        ClickObject(QUEST4_ICON, 150)
      }
      else if (DetectObject(QUEST5_ICON, 150))
      {
        ClickObject(QUEST5_ICON, 150)
      }
      else ; Scroll the opposite direction
      {   
        scrollCount++
        loop, %scrollCount%
        {
            Scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
        }
      }
    }
  }
}

F1::ExitApp
F2::Pause
F3::Reload
