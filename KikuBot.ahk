#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;==================== QUEST START =======================
;========================================================


GoToTrainingPage()
{
	global
	WaitObject(GWTF_TRAIN_BUTTON)
	ClickObject(GWTF_TRAIN_BUTTON)
	WaitObject(BACK_BUTTON)
	Sleep 2000
}

SelectAndStartLatestTraining()
{
	global
	if (DetectObject(TRAININGCHALLENGE_BUTTON))
	{
		WaitObject(TRAININGCHALLENGE_BUTTON)
		ClickObject(TRAININGCHALLENGE_BUTTON)
	}
	; else if (DetectObject(STARTTRAINING5_BUTTON))
	; {
		; WaitObject(STARTTRAINING5_BUTTON)
		; ClickObject(STARTTRAINING5_BUTTON)
	; }
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
	SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}
	if (DetectObject(QUEST1_ICON))
	{
		WaitObject(QUEST1_ICON)
		ClickObject(QUEST1_ICON)
	}
	else if (DetectObject(QUEST2_ICON))
	{
		WaitObject(QUEST2_ICON)
		ClickObject(QUEST2_ICON)
	}
	else if (DetectObject(QUEST_TEXT))
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

			questindex := assignquest(quest)
			WaitObject(questindex)
			ClickObject(questindex)
		}
		
	}
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
	
	; if (DetectObject(GWTF_EVENTTITLE_IMAGE))
	; {
		; if (training == 0)
		; {
			; training--
			; GoToTrainingPage()
		; }
	; }
	if (DetectObject(TRAINING_TEXT))
	{
		SelectAndStartLatestTraining()
	}
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
	if (DetectObject(HEAL_BUTTON))
	{
		WaitObject(TRAININGMYPAGE_BUTTON)
		ClickObject(TRAININGMYPAGE_BUTTON)
		switch++
	}
	else if (DetectObject(USEPOTIONYES_BUTTON))
	{
		WaitObject(USEPOTIONYES_BUTTON)
		ClickObject(USEPOTIONYES_BUTTON)
		Sleep 2000
	}
	; if DetectObject(GWTF_TRAININGFIGHT_BUTTON)
	; {
		; WaitObject(GWTF_TRAININGFIGHT_BUTTON)
		; ClickObject(GWTF_TRAININGFIGHT_BUTTON)
	; }
	else if (DetectObject(TRAININGFIGHT_BUTTON))
	{
		if (DetectObject(TRAININGSUMMONALLY_BUTTON))
		{
			WaitObject(TRAININGSUMMONALLY_BUTTON)
			ClickObject(TRAININGSUMMONALLY_BUTTON)
			sleep 5000
		}
		
		if (DetectObject(TRAININGFIGHT_BUTTON))
		{
			WaitObject(TRAININGFIGHT_BUTTON)
			ClickObject(TRAININGFIGHT_BUTTON)
			sleep 5000
		}
		
		SelectAndStartLatestTraining()
	}
	else if (DetectObject(QUESTCLEAR_TEXT) || DetectObject(QUESTRESULT_TEXT))
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
		if (DetectObject(BACKTOEVENT_BUTTON))
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
	else if (DetectObject(EVENT_ICON))
	{
		WaitObject(EVENT_ICON)
		ClickObject(EVENT_ICON)
	}
	; else if (DetectObject(GWTF_ASISTLIST_BUTTON))
	; {
		; if (training < 0)
		; {
			; training++
			; WaitObject(GWTF_ASISTLIST_BUTTON)
			; ClickObject(GWTF_ASISTLIST_BUTTON)
		; }
	; }
	
	; if (DetectObject(GWTF_ASSISTALLIES_TEXT))
	; {
		; if (DetectObject(GWTF_SENDFLAMEBERGE_BUTTON))
		; {
			; WaitObject(GWTF_SENDFLAMEBERGE_BUTTON)
			; ClickObject(GWTF_SENDFLAMEBERGE_BUTTON)
		; }
		; else if (DetectObject(GWTF_ASSISTALLY_BUTTON))
		; {
			; WaitObject(GWTF_ASSISTALLY_BUTTON)
			; ClickObject(GWTF_ASSISTALLY_BUTTON)
		; }
		; else if (DetectObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON))
		; {
			; WaitObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON)
			; ClickObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON)
		; }
	; }
	; if (DetectObject(GWTF_BOSSLIST_TEXT))
	; {
		; if (DetectObject(GWTF_REQUESTASSIST_BUTTON))
		; {
			; WaitObject(GWTF_REQUESTASSIST_BUTTON)
			; ClickObject(GWTF_REQUESTASSIST_BUTTON)
		; }
		; else if (DetectObject(GWTF_FIGHT_BUTTON))
		; {
			; training--
			; WaitObject(GWTF_FIGHT_BUTTON)
			; ClickObject(GWTF_FIGHT_BUTTON)
		; }
		; else if (DetectObject(GWTF_POTIONFIGHT_BUTTON))
		; {
			; training--
			; WaitObject(GWTF_POTIONFIGHT_BUTTON)
			; ClickObject(GWTF_POTIONFIGHT_BUTTON)
		; }
		; else if (DetectObject(GWTF_EVENT_BUTTON))
		; {
			; WaitObject(GWTF_EVENT_BUTTON)
			; ClickObject(GWTF_EVENT_BUTTON)
		; }
	; }
	; else if (DetectObject(GWTF_ASSISTLIST2_BUTTON))
	; {
		; WaitObject(GWTF_ASSISTLIST2_BUTTON)
		; ClickObject(GWTF_ASSISTLIST2_BUTTON)
	; }
}

Reload


RandomPopupOrCrash:
if (LaunchGame() || ConnectionError() || Maintenance())
	Reload
else
	Advertisement()
return

InitGlobals:
  Init_globals() ; Found in GlobalConstants.ahk
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