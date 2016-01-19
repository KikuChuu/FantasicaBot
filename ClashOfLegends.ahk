#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------




viciousTonic := -1
timeElixir := -1
potion := -1
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
            if (DetectObject(CSH_USE_TONIC_PROMPT))
            {
                ClickObject(CSH_USE_TONIC_YES)
            }
            if (DetectObject(CSH_RESTORECPPROMPT))
            {
                if (viciousTonic == -1)
                {
                    InputBox, viciousTonic, "Vicious Tonic", "How many Vicious Tonics are there in stock?", 375, 189
                }
                if (timeElixir == -1)
                {
                    InputBox, timeElixir, "Time Elixirs", "How many Time Elixirs are there in stock?", 375, 189
                }
                if (viciousTonic > 0)
                {
                    ClickObject(CSH_RESTORE_VIA_TONIC)
                    viciousTonic--
                }
                else if (timeElixir > 0)
                {
                    ClickObject(CSH_RESTORE_VIA_TE)
                }
                else
                {
                    ClickObject(CSH_CANCEL_RESTORE)
                }
               
            }
            if (DetectObject(CSH_LEGEND))
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
        else if (DetectObject(CSH_RETRYPROMPT))
        {
            if (viciousTonic == -1)
            {
                InputBox, viciousTonic, "Vicious Tonic", "How many Vicious Tonic is there in stock?", 375, 189
            }
            if (potion == -1)
            {
                InputBox, potion, "Potion", "How many Potions are there in stock?", 375, 189
            }
            if (viciousTonic > 0)
            {
                ClickObject(CSH_RETRY_VIA_TONIC)
                viciousTonic--
            }
            else if (potion > 0)
            {
                ClickObject(CSH_RETRY_VIA_POTION)
            }
            else
            {
                ClickObject(CSH_CANCEL_RETRY)
            }
            if (DetectObject(CSH_POTION_PROMPT))
            {
                ClickObject(CSH_POTIONYES)
            }
            else if (DetectObject(CSH_TONIC_PROMPT))
            {
                ClickObject(CSH_TONIC_YES)
            }
            else if (DetectObject(CSH_GIVEUP_PROMPT))
            {
                ClickObject(CSH_GIVEUP_YES)
            }
        }
    }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)