#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------



switch := 1
training := 0
deployUnitNum := 0
pendingAllies := 1
latestEpisode := 1

sketchDiceStock1 := 0
portraitDiceStock1 := 0
masterDiceStock1 := 0
move1Stock1 := 0
move2Stock1 := 0
move3Stock1 := 0
move4Stock1 := 0
move5Stock1 := 0
move6Stock1 := 0
move10Stock1 := 0
bronzestopStock1 := 0
silverstopStock1 := 0
lowprobStock1 := 0
highprobStock1 := 0
lowdiceStock1 := 0
highdiceStock1 := 0
ally2Stock1 := 0

loop,
{	
	if (SHOULD_CLICK == 1)
	{
		SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
	}
	
    ; ==========================================================================
	; **************************************************************************
	; ------------------------ CLASH OF LEGENDS EVENT PAGE ---------------------
	; **************************************************************************
	; ==========================================================================
    if (ClashOfLegendsEvent)
    {
        if (DetectObject(CSH_TITLE))
        {
            if (DetectObject(CSH_BATTLE))
            {
                ClickObject(CSH_BATTLE)
            }
        }
        if (DetectObject(CSH_BATTLESELECTTITLE))
        {
            if (DetectObject(CSH_USETEPROMPT))
            {
                ClickObject(CSH_USETEYES)
            }
            if (DetectObject(CSH_RESTORECPPROMPT))
            {
                ClickObject(CSH_RESTOREYES)
            }
            if (DetectObject(CSH_FIGHTL))
            {
                ClickObject(CSH_FIGHTL)
            }
            if (DetectObject(CSH_CPBAR4, 100))
            {
                Scroll(QUEST_X1,QUEST_Y1, QUEST_X2, QUEST_Y2)
                ClickObject(CSH_FIGHTM)
            }
            else if (DetectObject(CSH_CPBAR3, 100))
            {
                ClickObject(CSH_FIGHT)
            }
        }
        if (DetectObject(CSH_START))
        {
            if (DetectObject(CSH_START))
            {
                ClickObject(CSH_START)
            }
        }
        if (DetectObject(CSH_BEGINPROMPT))
        {
            if (DetectObject(CSH_YES))
            {
                ClickObject(CSH_YES)
            }
        }
        if (DetectObject(CSH_RESULTSTITLE))
        {
            if (DetectObject(CSH_NEXT))
            {
                ClickObject(CSH_NEXT)
            }
            if (DetectObject(CSH_TOP, 10))
            {
                ClickObject(CSH_TOP, 10)
            }
        }
        if (DetectObject(CSH_SPEEDORDER))
        {
           ClickObject(CSH_SPEEDORDER)
        }
        else if (DetectObject(CSH_PENTAATTACK))
        {
            ClickObject(CSH_PENTAATTACK)
        }
        else if (DetectObject(CSH_QUADATTACK))
        {
            ClickObject(CSH_QUADATTACK)
        }
        else if (DetectObject(CSH_TRIPLEATTACK))
        {
            ClickObject(CSH_TRIPLEATTACK)
        }
        else if (DetectObject(CSH_SKIP))
        {
            ClickObject(CSH_SKIP)
        }
        
    }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)