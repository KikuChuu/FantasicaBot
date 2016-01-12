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
;SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes



	; GWTF_TRAIN_BUTTON := "FANTASICA IMAGES\Event\GoWithTheFloe\Training\buttontrain.png"
	; GWTF_BOSSLIST_BUTTON := "FANTASICA IMAGES\Event\Training\GoWithTheFloe\buttonbosslist.png"
	; GWTF_ASIST_BUTTON := "FANTASICA IMAGES\Event\Training\GoWithTheFloe\buttonassist.png"
	; GWTF_TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Event\GoWithTheFloe\Training\buttonfight.png"
	; GWTF_TRAININGFLEE_BUTTON := "FANTASICA IMAGES\Event\GoWithTheFloe\Training\buttonflee.png"
	; GWTF_TRAININGUSEGLOBE_BUTTON := "FANTASICA IMAGES\Event\GoWithTheFloe\Training\buttonuseglacialglobe.png"
	; GWTF_NIEVE_IMAGE :=


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
loop,
{	
	if (SHOULD_CLICK == 1)
	{
		SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
	}
	if (DetectObject(LOGINBONUSMYPAGE_BUTTON))
	{
		ClickObject(LOGINBONUSMYPAGE_BUTTON)
	}
	if (DetectObject(LB_TITLE_IMAGE))
	{
		if (DetectObject(LB_SEAROAD_BUTTON))
		{
			ClickObject(LB_SEAROAD_BUTTON)
		}
		else if (DetectObject(LB_OCEANCALL_BUTTON))
		{
			ClickObject(LB_OCEANCALL_BUTTON)
		}
	}
	if (DetectObject(POPUPCLOSE_BUTTON))
	{
		ClickObject(POPUPCLOSE_BUTTON)
	}
	if (DetectObject(LB_YES_BUTTON))
	{
		ClickObject(LB_YES_BUTTON)
	}
	if (DetectObject(LB_WALK1_BUTTON))
	{
		ClickObject(LB_WALK1_BUTTON)
	}
	else if (DetectObject(LB_WALK2_BUTTON))
	{
		ClickObject(LB_WALK2_BUTTON)
	}
	if (DetectObject(LB_FIGHTYES_BUTTON))
	{
		ClickObject(LB_FIGHTYES_BUTTON)
	}
	else if (DetectObject(LB_FIGHT_BUTTON))
	{
		ClickObject(LB_FIGHT_BUTTON)
	}
	if (DetectObject(LB_AUTOBATTLE_BUTTON))
	{
		ClickObject(LB_AUTOBATTLE_BUTTON)
	}
	if (DetectObject(LB_RESULT1_TEXT))
	{
		ClickObject(LB_RESULTBACK_BUTTON)
	}
	if (DetectObject(LB_ENEMYLIST_TEXT))
	{
		if (DetectObject(LB_FIGHTAGAIN_BUTTON))
		{
			ClickObject(LB_FIGHTAGAIN_BUTTON)
		}
	}
	if (DetectObject(LB_RESULT3_TEXT) || DetectObject(LB_RESULT2_TEXT))
	{
		ClickObject(LB_COMPLETECLEARBACK_BUTTON)
	}
	if (DetectObject(LB_POTION_BUTTON))
	{
		ClickObject(LB_BATTLEFIELDBACK_BUTTON)
		Sleep 2000
		WaitObject(LB_BATTLEFIELDBACK_BUTTON)
		ClickObject(LB_BATTLEFIELDBACK_BUTTON)
	}
	if (DetectObject(FANTASICAAPP_BUTTON))
	{
		LaunchGame()
	}
    if (DetectObject(RESUMEQUESTNO_BUTTON))
    {
        ClickObject(RESUMEQUESTNO_BUTTON)
    }
	else if (DetectObject(STARTGAME_BUTTON))
	{
		ClickObject(STARTGAME_BUTTON)
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
		if (DetectObject(LOGINBINGORECEIVE_BUTTON))
		{
			ClickObject(LOGINBINGORECEIVE_BUTTON)
		}
		else
		{
			LoginBingoHelperClicker()
		}
	}
	if (DetectObject(TOP_TITLE_IMAGE))
	{
		if (DetectObject(TOP_CLIMBTREE_BUTTON) && !DetectObject(TOP_TRAININGPOINTS_TEXT))
		{
			ClickObject(TOP_CLIMBTREE_BUTTON)
		}
		else if (DetectObject(TOP_FIGHTBOSS_BUTTON))
		{
			ClickObject(TOP_FIGHTBOSS_BUTTON)
		}
	}
	if (DetectObject(TOP_ADVANCE1_BUTTON))
	{
		ClickObject(TOP_ADVANCE1_BUTTON)
	}
	if (DetectObject(TOP_ADVANCE2_BUTTON))
	{
		ClickObject(TOP_ADVANCE2_BUTTON)
	}
	if (DetectObject(TOP_FIGHT_BUTTON))
	{
		ClickObject(TOP_FIGHT_BUTTON)
	}
	if (DetectObject(TOP_HEAL_BUTTON))
	{
		ClickObject(TOP_TRAININGBACK_BUTTON)
	}
	if (DetectObject(TOP_TRAININGPOINTS_TEXT))
	{
		ClickObject(TOP_BACKTOMAINPAGE_BUTTON)
	}
	
	; ==============================================
	; **********************************************
	; ---------------- MAIN PAGE -------------------
	; **********************************************
	; ==============================================
    if (DetectObject(MYPAGEID_TEXT))
	{
        scrollCount := QUEST_INDEX // 4
        if (ColiseumEvent && DetectObject(COL_EVENT_ICON))
        {
            ClickObject(COL_EVENT_ICON)
            ColiseumEvent = 0
            SetTimer, Coliseum, 600000
        } ; COLISEUM EVENT
        else if (DetectObject(QUESTTIMER_TEXT))
		{
            loop, %scrollCount%
            {
                Scroll(MENU_X1, MENU_Y1, MENU_X2, MENU_Y2)
            }
            
			if (DetectObject(QUEST3_ICON))
			{
				ClickObject(QUEST3_ICON)
			}
			else if (DetectObject(QUEST4_ICON))
			{
				ClickObject(QUEST4_ICON)
			}
			else if (DetectObject(QUEST5_ICON))
			{
				ClickObject(QUEST5_ICON)
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
                }
            }
		} ; QUESTING
        else if (!DetectObject(DEPLETEDTRAININGPOINTS_TEXT))
        {
            msg := "Searching for Training-Encounter Event Icon"
            SB_SetText(msg)
            
            if (DetectObject(TRNECT_EVENT_ICON))
            {
                ClickObject(TRNECT_EVENT_ICON)
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
                }
            }
            if (DetectObject(TRNECT_EVENT_ICON))
            {
                ClickObject(TRNECT_EVENT_ICON)
            }
        } ; TRAINING-ENCOUNTER
	}
	
	; ==========================================================================
	; **************************************************************************
	; ------------------------ COLISEUM EVENT PAGE -----------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(COL_EVENTTITLE_IMAGE))
    {
        ClickObject(COL_TOEVENT_BUTTON)
    }
    if (DetectObject(COL_SELECTIONPAGETITLE_TEXT))
    {
        if (DetectObject(COL_COOLDOWN_TEXT))
        {
            Scroll(QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2)
            if (DetectObject(COL_AREA2_BUTTON))
            {
                ClickObject(COL_AREA2_BUTTON)
            }
            else if (DetectObject(COL_AREA1_BUTTON))
            {
                ClickObject(COL_AREA1_BUTTON)
            }
        }
        else
        {
            ClickObject(COL_BATTLEMODE_BUTTON)
        }
    }
    if (DetectObject(COL_HEROSELECTIONPAGETITLE_TEXT))
    {
        ClickObject(COL_CHOOSEHERO1_BUTTON)
    }
    if (DetectObject(COL_BATTLETITLE_TEXT))
    {
        if (DetectObject(COL_BATTLECOOLDOWN_TEXT))
        {
            ClickObject(COL_BATTLE_BUTTON)
        }
        else
        {
            ClickObject(BACK_BUTTON)
            WaitObject(COL_HEROSELECTIONPAGETITLE_TEXT)
            ClickObject(BACK_BUTTON)
            WaitObject(COL_SELECTIONPAGETITLE_TEXT)
            ClickObject(BACK_BUTTON)
            WaitObject(COL_EVENTTITLE_IMAGE)
            ClickObject(BACK_BUTTON)
        }
    }
    if (DetectObject(COL_SKIP_BUTTON))
    {
        ClickObject(COL_SKIP_BUTTON)
    }
    if (DetectObject(COL_RESULTSPAGETITLE_TEXT))
    {
        ClickObject(BACK_BUTTON)
    }
	
	; ==========================================================================
	; **************************************************************************
	; --------------------- TRAIN-ENCOUNTER EVENT PAGE -------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(TRNECT_EVENTTITLE_IMAGE))
	{
		deployUnitNum := 0
		pendingAllies := 1
		if (training == 0)
		{
			training--
			WaitObject(TRNECT_TRAIN_BUTTON)
			ClickObject(TRNECT_TRAIN_BUTTON)
			WaitObject(BACK_BUTTON)
			Sleep 2000
		}
		else if (training < 0)
		{
			training++
			WaitObject(TRNECT_ASSISTLIST_BUTTON)
			ClickObject(TRNECT_ASSISTLIST_BUTTON)
		}
	}
	else if (DetectObject(TRNECT_ASSISTALLIES_TEXT))
	{
		if (DetectObject(TRNECT_SENDEVENTITEM_BUTTON))
		{
			WaitObject(TRNECT_SENDEVENTITEM_BUTTON)
			ClickObject(TRNECT_SENDEVENTITEM_BUTTON)
		}
		else if (DetectObject(USEPOTIONYES_BUTTON))
		{
			ClickObject(USEPOTIONYES_BUTTON)
		}
		else if (DetectObject(TRNECT_ASSISTALLY_BUTTON))
		{
			WaitObject(TRNECT_ASSISTALLY_BUTTON)
			ClickObject(TRNECT_ASSISTALLY_BUTTON)
		}
		else if (DetectObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON))
		{
			WaitObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON)
			ClickObject(TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON)
		}
	}
	else if (DetectObject(TRNECT_BOSSLIST_TEXT))
	{
		if (DetectObject(TRNECT_REQUESTASSIST_BUTTON))
		{
			WaitObject(TRNECT_REQUESTASSIST_BUTTON)
			ClickObject(TRNECT_REQUESTASSIST_BUTTON)
		}
		if (TrainEncounterEvent_USEITEM && DetectObject(TRNECT_USEEVENTITEM_BUTTON))
		{
			WaitObject(TRNECT_USEEVENTITEM_BUTTON)
			ClickObject(TRNECT_USEEVENTITEM_BUTTON)
		}
		else if (DetectObject(TRNECT_FIGHT_BUTTON))
		{
			training--
			WaitObject(TRNECT_FIGHT_BUTTON)
			ClickObject(TRNECT_FIGHT_BUTTON)
		}
		else if (DetectObject(TRNECT_POTIONFIGHT_BUTTON))
		{
			training--
			WaitObject(TRNECT_POTIONFIGHT_BUTTON)
			ClickObject(TRNECT_POTIONFIGHT_BUTTON)
		}
		else if (DetectObject(TRNECT_EVENT_BUTTON))
		{
			WaitObject(TRNECT_EVENT_BUTTON)
			ClickObject(TRNECT_EVENT_BUTTON)
		}
	}
	else if (DetectObject(TRNECT_ASSISTLIST2_BUTTON))
	{
		WaitObject(TRNECT_ASSISTLIST2_BUTTON)
		ClickObject(TRNECT_ASSISTLIST2_BUTTON)
	}
	
	
	
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
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- QUEST BATTLE --------------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(SKIPQUEST_BUTTON) && SKIPQUEST == 1)
	{
		ClickObject(SKIPQUEST_BUTTON)
	}
	if (DetectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER)
	{
		ClickObject(DEPLOYUNIT_BUTTON)
	}
	if (DetectObject(DEPLOY_TEXT))
	{
		if (DeployUnit(SORTINDEX, TYPEINDEX))
		{
			deployUnitNum++
		}
	}
	if (DetectObject(CALLALLY_BUTTON) && pendingAllies)
	{
		ClickObject(CALLALLY_BUTTON)
	}

	if (DetectObject(CALLALLYPAGE_TEXT))
	{
		if (CallAlly(SORTINDEX, TYPEINDEX))
		{
			pendingAllies = 1
		}
		else
		{
			pendingAllies = 0
		}
	}
	; ==========================================================================
	; **************************************************************************
	; ------------------------ SELECT TRAINNG PAGE ----------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(TRAINING_TEXT))
	{
		SelectAndStartLatestTraining()
	}
	
	; ==========================================================================
	; **************************************************************************
	; ---------------------------- TRAINING PAGE -------------------------------
	; **************************************************************************
	; ==========================================================================
	if (DetectObject(ADVANCE_BUTTON))
	{
		WaitObject(ADVANCE_BUTTON)
		ClickObject(ADVANCE_BUTTON)
	}
	if (DetectObject(SENDBRAVE_BUTTON))
	{
		WaitObject(SENDBRAVE_BUTTON)
		ClickObject(SENDBRAVE_BUTTON)
	}
	if (DetectObject(CONTINUETRAINING_BUTTON))
	{
		WaitObject(CONTINUETRAINING_BUTTON)
		ClickObject(CONTINUETRAINING_BUTTON)
	}
    
	if (DetectObject(HEAL_BUTTON) || DetectObject(HEALMID_BUTTON) || DetectObject(HEALDARK_BUTTON)
        || DetectObject(HEALMOBACOIN_BUTTON) || DetectObject(HEALMOBACOINDARK_BUTTON) || DetectObject(HEALMOBACOINMID_BUTTON))
	{
		if (USE_POTION)
		{
			coord := WaitObject(HEAL_BUTTON)
			ClickAt(coord[1], coord[2])
		}
		else
		{
			WaitObject(TRAININGMYPAGE_BUTTON)
			ClickObject(TRAININGMYPAGE_BUTTON)
		}
		; switch variable is obsolete
		; switch++ 
	}
	if (DetectObject(USEPOTIONYES_BUTTON))
	{
		WaitObject(USEPOTIONYES_BUTTON)
		ClickObject(USEPOTIONYES_BUTTON)
		Sleep 2000
	}
	; if (DetectObject(TRNECT_REGULARBOSS1_IMAGE) || DetectObject(TRNECT_REGULARBOSS2_IMAGE) || DetectObject(TRNECT_REGULARBOSS3_IMAGE))
	; {
		; msgbox % "Hello"
		; ClickObject(TRNECT_TRAININGFLEE_BUTTON)
	; }
	; else 
	; if (DetectObject(TRNECT_LIMITEDBOSS_IMAGE))
	; {
		; ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	; }
	; else if (DetectObject(TRNECT_SPECIALBOSS_IMAGE) || DetectObject(TRNECT_SPECIALBOSS2_IMAGE))
	; {
		; ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	; }
	; else if (DetectObject(TRNECT_TRAININGFLEE_BUTTON))
	; {
		; ClickObject(TRNECT_TRAININGFLEE_BUTTON)
	; }
    if (DetectObject(TRNECT_TRAININGFIGHT_BUTTON))
	{
		ClickObject(TRNECT_TRAININGFIGHT_BUTTON)
	}
	if (DetectObject(TRAININGSUMMONALLY_BUTTON))
	{
		WaitObject(TRAININGSUMMONALLY_BUTTON)
		ClickObject(TRAININGSUMMONALLY_BUTTON)
	}
	if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		WaitObject(TRAININGFIGHT_BUTTON)
		ClickObject(TRAININGFIGHT_BUTTON)
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

Reload

; ==============================================================================
; ******************************************************************************
; --------------------------------- LABELS -------------------------------------
; ******************************************************************************
; ==============================================================================
Coliseum:
ColiseumEvent = 1
return


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