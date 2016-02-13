#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

SelectAndStartLatestTraining()
{
	global
	if (DetectObject(TRAININGCHALLENGE_BUTTON))
	{
		WaitObject(TRAININGCHALLENGE_BUTTON)
		ClickObject(TRAININGCHALLENGE_BUTTON)
	}
	else if (DetectObject(STARTTRAINING5_BUTTON))
	{
		WaitObject(STARTTRAINING5_BUTTON)
		ClickObject(STARTTRAINING5_BUTTON)
	}
	; else if (DetectObject(STARTTRAINING4_BUTTON))
	; {
		; WaitObject(STARTTRAINING4_BUTTON)
		; ClickObject(STARTTRAINING4_BUTTON)
	; }
	else if (DetectObject(STARTTRAINING3_BUTTON))
	{
		WaitObject(STARTTRAINING3_BUTTON)
		ClickObject(STARTTRAINING3_BUTTON)
	}
	else if (DetectObject(STARTTRAINING2_BUTTON))
	{
		WaitObject(STARTTRAINING2_BUTTON)
		ClickObject(STARTTRAINING2_BUTTON)
	}
	else if (DetectObject(STARTTRAINING1_BUTTON))
	{
		WaitObject(STARTTRAINING1_BUTTON)
		ClickObject(STARTTRAINING1_BUTTON)
	}
}

;========================================================
;==================== QUEST START =======================
;========================================================
DoQuest()
{
	global
	hasDeployedAllAllies := 0
	while A_index <= DEPLOY_NUMBER AND DetectObject(DEPLOYUNIT_BUTTON)
	{
		DeployUnit()

		if (!hasDeployedAllAllies)
		{
			while DetectObject(CALLALLY_BUTTON)
			{
				if DetectObject(BACKQUEST_BUTTON)
				{
					while DetectObject(BACKQUEST_BUTTON)
					{
						WaitObject(BACKQUEST_BUTTON)
						ClickObject(BACKQUEST_BUTTON)
					}
				}
				if (CallAlly(SORTINDEX, TYPEINDEX) == 0)
				{
					hasDeployedAllAllies := 1
					break
				}
			}
		}
	}
}


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
	if (DetectObject(DAILY_BONUS))
	{
		ClickObject(LOGINBONUSMYPAGE_BUTTON)
	}
	if (DetectObject(POPUPCLOSE_BUTTON))
	{
		ClickObject(POPUPCLOSE_BUTTON)
	}
	; if (DetectObject(LB_YES_BUTTON))
	; {
		; ClickObject(LB_YES_BUTTON)
	; }
	; if (DetectObject(LB_WALK1_BUTTON))
	; {
		; ClickObject(LB_WALK1_BUTTON)
	; }
	; else if (DetectObject(LB_WALK2_BUTTON))
	; {
		; ClickObject(LB_WALK2_BUTTON)
	; }
	; if (DetectObject(LB_FIGHTYES_BUTTON))
	; {
		; ClickObject(LB_FIGHTYES_BUTTON)
	; }
	; else if (DetectObject(LB_FIGHT_BUTTON))
	; {
		; ClickObject(LB_FIGHT_BUTTON)
	; }
	; if (DetectObject(LB_AUTOBATTLE_BUTTON))
	; {
		; ClickObject(LB_AUTOBATTLE_BUTTON)
	; }
	; if (DetectObject(LB_RESULT1_TEXT))
	; {
		; ClickObject(LB_RESULTBACK_BUTTON)
	; }
	; if (DetectObject(LB_ENEMYLIST_TEXT))
	; {
		; if (DetectObject(LB_FIGHTAGAIN_BUTTON))
		; {
			; ClickObject(LB_FIGHTAGAIN_BUTTON)
		; }
	; }
	; if (DetectObject(LB_RESULT3_TEXT) || DetectObject(LB_RESULT2_TEXT))
	; {
		; ClickObject(LB_COMPLETECLEARBACK_BUTTON)
	; }
	; if (DetectObject(LB_POTION_BUTTON))
	; {
		; ClickObject(LB_BATTLEFIELDBACK_BUTTON)
		; Sleep 2000
		; WaitObject(LB_BATTLEFIELDBACK_BUTTON)
		; ClickObject(LB_BATTLEFIELDBACK_BUTTON)
	; }
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
        if (DetectObject(LOGINBINGOMYPAGE_BUTTON))
        {
            ClickObject(LOGINBINGOMYPAGE_BUTTON)
        }
		else if (DetectObject(LOGINBINGORECEIVE_BUTTON))
		{
			ClickObject(LOGINBINGORECEIVE_BUTTON)
		}
		else if (DetectObject(LOGINBINGOPANEL_ICON, 50))
		{
			; LoginBingoHelperClicker()
            ClickObject(LOGINBINGOPANEL_ICON, 50)
		}
	}
	; if (DetectObject(TOP_TITLE_IMAGE))
	; {
		; if (DetectObject(TOP_CLIMBTREE_BUTTON) && !DetectObject(TOP_TRAININGPOINTS_TEXT))
		; {
			; ClickObject(TOP_CLIMBTREE_BUTTON)
		; }
		; else if (DetectObject(TOP_FIGHTBOSS_BUTTON))
		; {
			; ClickObject(TOP_FIGHTBOSS_BUTTON)
		; }
	; }
	; if (DetectObject(TOP_ADVANCE1_BUTTON))
	; {
		; ClickObject(TOP_ADVANCE1_BUTTON)
	; }
	; if (DetectObject(TOP_ADVANCE2_BUTTON))
	; {
		; ClickObject(TOP_ADVANCE2_BUTTON)
	; }
	; if (DetectObject(TOP_FIGHT_BUTTON))
	; {
		; ClickObject(TOP_FIGHT_BUTTON)
	; }
	; if (DetectObject(TOP_UTTON))
	; {
		; ClickObject(TOP_TRAININGBACK_BUTTON)
	; }
	; if (DetectObject(TOP_TRAININGPOINTS_TEXT))
	; {
		; ClickObject(TOP_BACKTOMAINPAGE_BUTTON)
	; }
	
	; ==============================================
	; **********************************************
	; ---------------- MAIN PAGE -------------------
	; **********************************************
	; ==============================================
    if (DetectObject(MYPAGEID_TEXT))
	{
        scrollCount := INBOX_INDEX // 3
        if (CheckInbox)
        {
            scrollCount := INBOX_INDEX // 3
            if (DetectObject(INBOX1_ICON))
            {
                CheckInbox = 0
                SetTimer, Inbox, 3600000
                ClickObject(INBOX1_ICON)
            }
            else if (DetectObject(INBOX2_ICON))
            {
                CheckInbox = 0
                SetTimer, Inbox, 3600000
                ClickObject(INBOX2_ICON)
            }
            else
            {
                loop, %scrollCount%
                {
                    Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
                }
                if (DetectObject(INBOX1_ICON))
                {
                    CheckInbox = 0
                    SetTimer, Inbox, 3600000
                    ClickObject(INBOX1_ICON)
                }
                else if (DetectObject(INBOX2_ICON))
                {
                    CheckInbox = 0
                    SetTimer, Inbox, 3600000
                    ClickObject(INBOX2_ICON)
                }
                else
                {
                    scrollCount++
                    loop, %scrollCount%
                    {
                        Scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
                    }
                }
            }
        } ; CHECK INBOX
        else if (RollTheDiceEvent)
        {
            if (DetectObject(DICE_EVENT_ICON))
            {
                ClickObject(DICE_EVENT_ICON)
            }
            else
            {
                if (scrollCount > 0)
                {
                    scrollCount++
                    loop, %scrollCount%
                    {
                        Scroll(MENU_X2, MENU_Y2, MENU_X1, MENU_Y1)
                    }
                    if (DetectObject(DICE_EVENT_ICON))
                    {
                        ClickObject(DICE_EVENT_ICON)
                    }
                }
            }
        }
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
        if (DetectObject(CSH_BATTLESELECTTITLE))
        {
            ; if (DetectObject(CSH_CPBAR4))
            ; {
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
                else if (DetectObject(CSH_CPBAR3, 50))
                {
                    ;ClickObject(CSH_FIGHT)
                }
            ; }
            ; else
            ; {
            ; }
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
            if (DetectObject(CSH_TOP))
            {
                ClickObject(CSH_TOP)
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
        
    }

    ; ==========================================================================
	; **************************************************************************
	; -------------------------- DICE EVENT PAGE -------------------------------
	; **************************************************************************
	; ==========================================================================
    if (RollTheDiceEvent)
    {
        if (DetectObject(DICE_MENU_BUTTON) || DetectObject(DICE_RETREAT_BUTTON))
        {
            ClickAt(CARDMENU_X, CARDMENU_Y)
            Sleep 1000
            shadeVar := 27 ; shade of 
            if (DetectObject(DICE_MOVE1CARD_BUTTON, shadeVar))
            {
                move1Stock1 = 1
                SB_SetText(move1)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE2CARD_BUTTON, shadeVar))
            {
                move2Stock1 = 1
                SB_SetText(move2)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE3CARD_BUTTON, shadeVar))
            {
                move3Stock1 = 1
                SB_SetText(move3)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE4CARD_BUTTON, shadeVar))
            {
                move4Stock1 = 1
                SB_SetText(move4)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE5CARD_BUTTON, shadeVar))
            {
                move5Stock1 = 1
                SB_SetText(move5)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE6CARD_BUTTON), shadeVar)
            {
                move6Stock1 = 1
                SB_SetText(move6)
                sleep 1000
            }
            if (DetectObject(DICE_MOVE10CARD_BUTTON, shadeVar))
            {
                move10Stock1 = 1
                SB_SetText(move10)
                sleep 1000
            }
            if (DetectObject(DICE_PROB1CARD_BUTTON, shadeVar))
            {
                prob1Stock1 = 1
                SB_SetText(prob1Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_PROB2CARD_BUTTON, shadeVar))
            {
                prob2Stock1 := 1
                SB_SetText(prob2Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_HIGHPROBCARD_BUTTON, shadeVar))
            {
                highDiceStock1 = 1
                SB_SetText(highDiceStock1)
                sleep 1000
            }
            if (DetectObject(DICE_LOWPROBCARD_BUTTON, shadeVar))
            {
                lowDiceStock1 = 1
                SB_SetText(LowDiceStock1)
                sleep 1000
            }
            if (DetectObject(DICE_ALLY2CARD_BUTTON, shadeVar))
            {   ally2Stock1 := 1
                SB_SetText(ally2Stock1)
                sleep 1000
            }
            if (DetectObject(DICE_BRONZESTOPCARD_BUTTON, shadeVar))
            {
                bronzestopStock1 := 1
                SB_SetText(bronzestopStock1)
                sleep 1000
            }
            if (DetectObject(DICE_SILVERSTOPCARD_BUTTON), shadeVar)
            {
                silverstopStock1 = 1
                SB_SetText(LowDiceStock1)
                sleep 1000
            }
            ClickObject(DICE_CLOSECARDMENU_BUTTON)
            sleep 1000
        }
        if (DetectObject(DICE_MENU_BUTTON) || DetectObject(DICE_RETREAT_BUTTON))
        {
            ClickAt(DICEMENU_X, DICEMENU_Y)
            Sleep 1000
            if (DetectObject(DICE_SKETCH_BUTTON))
            {
                sketchDiceStock1 = 1
            }
            if (DetectObject(DICE_PORTRAIT_BUTTON))
            {
                portraitDiceStock1 = 1
            }
            if (DetectObject(DICE_MASTER_BUTTON))
            {
                masterDiceStock1 = 1
            }
            ClickObject(DICE_CLOSEDICESMENU_BUTTON)
            sleep 1000
        }
        if (move6Stock1)
        {
            ClickAt(CARDMENU_X, CARDMENU_Y)
            sleep 1000
            ClickObject(DICE_MOVE6CARD_BUTTON, 27)
        }
        if (DetectObject(DICE_TITLE_IMAGE))
        {
            if (DetectObject(DICE_BEGINEVENT_BUTTON))
            {
                if (RollTheDiceDoEvent)
                {
                    ClickObject(DICE_BEGINEVENT_BUTTON)
                }
                else
                {
                    ClickObject(DICE_MPBACK_BUTTON)
                    RollTheDiceEvent = 0
                }
            }
        }
        if (DetectObject(DICE_POTIONPROMPT_TEXT))
        {
            if (RollTheDiceUsePotion)
            {
                ClickObject(DICE_USEPOTIONYES_BUTTON)
            }
            else
            {
                ClickObject(DICE_USEPOTIONNO_BUTTON)
                WaitObject(DICE_GIVEUPYES_BUTTON)
                ClickObject(DICE_GIVEUPYES_BUTTON)
            }
        }
        if (DetectObject(DICE_DISCARD_BUTTON))
        {
            ClickObject(DICE_DISCARD_BUTTON)
            WaitObject(DICE_DISCARDYES_BUTTON)
            ClickObject(DICE_DISCARDYES_BUTTON)
        }
        if (DetectObject(DICE_CLOSEPOPUP_BUTTON))
        {
            ClickObject(DICE_CLOSEPOPUP_BUTTON)
        }
        if (DetectObject(DICE_USECARDYES_BUTTON))
        {
            ClickObject(DICE_USECARDYES_BUTTON)
        }
        else if (DetectObject(DICE_USECARD_BUTTON))
        {
            ClickObject(DICE_USECARD_BUTTON)
        }
        
        else if (DetectObject(DICE_HEAL_BUTTON))
        {
            if (SHOULD_CLICK == 1)
            {
                SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
            }
            if (RollTheDiceUseDrops)
            {
                if (DetectObject(DICE_DROPSSTOCK0_TEXT))
                {
                    ClickObject(DICE_BOARDBACK_BUTTON)
                    RollTheDiceDoEvent = 0
                    SetTimer, Dice, 3000000
                }
                else
                {
                    ClickObject(DICE_HEAL_BUTTON)
                }
            }
            else
            {
                ClickObject(DICE_BOARDBACK_BUTTON)
                RollTheDiceDoEvent = 0
                SetTimer, Dice, 3000000
            }
        }
        else if (DetectObject(DICE_ROLL_BUTTON))
        {
            ClickObject(DICE_ROLL_BUTTON)
        }
        else if (DetectObject(DICE_MOVE_BUTTON))
        {
            ClickObject(DICE_MOVE_BUTTON)
        }
        else if (DetectObject(DICE_OPENCHEST_BUTTON))
        {
            ClickObject(DICE_OPENCHEST_BUTTON)
        }
        else if (DetectObject(DICE_STOP_BUTTON))
        {
            ClickObject(DICE_STOP_BUTTON)
        }
        if (DetectObject(DICE_FIGHT_BUTTON))
        {
            ClickObject(DICE_FIGHT_BUTTON)
        }
        if (DetectObject(DICE_RESULTS_TITLE))
        {
            if (DetectObject(DICE_WARPBONUSBOARDYES_BUTTON))
            {
                ClickObject(DICE_WARPBONUSBOARDYES_BUTTON)
            }
            else if (DetectObject(DICE_TOBOARD_BUTTON))
            {
                ClickObject(DICE_TOBOARD_BUTTON)
            }
            else if (DetectObject(DICE_NEXT_BUTTON))
            {
                ClickObject(DICE_NEXT_BUTTON)
            }
        }
       if (DetectObject(DICE_LEFT_BUTTON))
       {
            coord := WaitObject(DICE_LEFT_BUTTON)
            ClickAt(coord[1], coord[2])
       }
       else if (DetectObject(DICE_RIGHT_BUTTON))
       {
            coord := WaitObject(DICE_RIGHT_BUTTON)
            Clickat(coord[1], coord[2])
       }
       else if (DetectObject(DICE_UP_BUTTON))
       {
            coord := WaitObject(DICE_UP_BUTTON)
            ClickAt(coord[1], coord[2])
       }
       else if (DetectObject(DICE_DOWN_BUTTON))
       {
            coord := WaitObject(DICE_DOWN_BUTTON)
            ClickAt(coord[1], coord[2])
       }
   }
    ; ==========================================================================
	; **************************************************************************
	; ------------------------------- INBOX ------------------------------------
	; **************************************************************************
	; ==========================================================================
    if (DetectObject(INBOX_TITLE))
    {
        if (DetectObject(INBOX_ALL_BUTTON))
        {
            ClickObject(INBOX_ALL_BUTTON)
        }
        else if (DetectObject(INBOX_ITEMS_BUTTON))
        {
            ClickObject(INBOX_ITEMS_BUTTON)
        }
        else if (DetectObject(INBOX_RECEIVE_BUTTON))
        {
            ClickObject(INBOX_RECEIVE_BUTTON)
        }
        else
        {
            ClickObject(BACK_BUTTON)
        }
    }
}
; ==============================================================================
; ******************************************************************************
; --------------------------------- LABELS -------------------------------------
; ******************************************************************************
; ==============================================================================
Dice:
RollTheDiceEvent = 1
RollTheDiceDoEvent = 1
return

Inbox:
CheckInbox = 1
return
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::ClickAt(800,500)
