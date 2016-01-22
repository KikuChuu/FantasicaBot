#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

red := 0
green := 0
blue := 0
cooldown := 2700000
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
            if (DetectObject(CSH_ASSIST))
            {
                ClickObject(CSH_ASSIST)
            }
            else if (DetectObject(CSH_BATTLE))
            {
                ClickObject(CSH_BATTLE)
            }
        }
        if (DetectObject(CSH_ASSIST_TITLE))
        {
            if (DetectObject(CSH_ASSIST_ALL))
            {
                ClickObject(CSH_ASSIST_ALL)
            }
            else if (DetectObject(CSH_REQUEST_ASSIST))
            {
                ClickObject(CSH_REQUEST_ASSIST)
            }
            else
            {
                ClickObject(CSH_GOTO_BATTLE)
            }
        }
        if (DetectObject(CSH_ASSIST_RESULTS_TITLE))
        {
            if (DetectObject(CSH_ASSIST_BACK))
            {
                ClickObject(CSH_ASSIST_BACK)
            }
        }
        if (DetectObject(CSH_BATTLESELECTTITLE))
        {
        
            if (DetectObject(CSH_USETEPROMPT))
            {
                ClickObject(CSH_USETEYES)
            }
            else if (DetectObject(CSH_USE_TONIC_PROMPT))
            {
                ClickObject(CSH_USE_TONIC_YES)
            }
            else if (DetectObject(CSH_RESTORECPPROMPT))
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
            else if (DetectObject(CSH_LEGEND))
            {
                ClickObject(CSH_FIGHT_LEGEND)
            }
            else if (DetectObject(CSH_CPBAR4, 100))
            {
                Scroll(QUEST_X1,QUEST_Y1, QUEST_X2, QUEST_Y2)
                ClickObject(CSH_FIGHT_MASTER)
            }
            else if (DetectObject(CSH_CPBAR3, 100))
            {
                ClickObject(CSH_FIGHT_VETERAN)
            }
            else if (DetectObject(CSH_CPBAR2, 100))
            {
                ClickObject(CSH_FIGHT_ADEPT)
            }
            else
            {
                if (cooldown == -1000)
                {
                    InputBox, cooldown, "CP Timer", "How long do you want the script to sleep? (in milliseconds)", 375, 189
                }
                currTime := A_Now
                computeWakeTime := currTime
                secondsToAdd := cooldown // 1000 ; cooldown is in milliseconds
                computeWakeTime += %secondsToAdd%, Seconds
                FormatTime, wakeTime, %computeWakeTime%, Time
                FormatTime, currTime, A_Now, Time
                sleepMsg := "Script began sleeping since " . currTime . " and will wake at " . wakeTime
                SB_SetText(sleepMsg)
                sleep cooldown
            }
        }
        if (DetectObject(CSH_START))
        {
            if (DetectObject(CSH_ENEMY1_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY1_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY1_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY2_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY2_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY2_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY3_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY3_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY3_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY4_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY4_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY4_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY5_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY5_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY5_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY6_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY6_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY6_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY7_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY7_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY7_MISSILE))
            {
                green++
            }
            if (DetectObject(CSH_ENEMY8_MAGIC))
            {
                blue++
            }
            else if (DetectObject(CSH_ENEMY8_MELEE))
            {
                red++
            }
            else if (DetectObject(CSH_ENEMY8_MISSILE))
            {
                green++
            }
            if (blue == 8)
            {
                ClickObject(CSH_TEAM4)
            }
            else if (red == 8)
            {
                ClickObject(CSH_TEAM3)
            }
            else if (green == 8)
            {
                ClickObject(CSH_TEAM2)
            }
            else if (blue == 4 && red == 4)
            {
                ClickObject(CSH_TEAM4)
            }
            else if (red == 4 && green == 4)
            {
                ClickObject(CSH_TEAM3)
            }
            else if (green == 4 && blue == 4)
            {
                ClickObject(CSH_TEAM2)
            }
            else if (blue == 3 && red == 3 && green == 2)
            {
                ClickObject(CSH_TEAM4)
            }
            else if (red == 3 && green == 3 && blue == 2)
            {
                ClickObject(CSH_TEAM3)
            }
            else if (green == 3 && blue == 3 && red == 2)
            {
                ClickObject(CSH_TEAM2)
            }
            else if (blue >= 4)
            {
                ClickObject(CSH_TEAM4)
            }
            else if (red >= 4)
            {
                ClickObject(CSH_TEAM3)
            }
            else if (green >= 4)
            {
                ClickObject(CSH_TEAM2)
            }
            
            if (DetectObject(CSH_START))
            {
                ClickObject(CSH_START)
                
                ; reset team selection control variables
                green = 0
                red = 0
                blue = 0
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
        if (DetectObject(CSH_SUPPORT1))
        {
           ClickObject(CSH_SUPPORT1)
        }
        else if (DetectObject(CSH_SUPPORT2))
        {
            ClickObject(CSH_SUPPORT2)
        }
        else if (DetectObject(CSH_SUPPORT3))
        {
            ClickObject(CSH_SUPPORT3)
        }
        else if (DetectObject(CSH_SUPPORT4))
        {
            ClickObject(CSH_SUPPORT4)
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