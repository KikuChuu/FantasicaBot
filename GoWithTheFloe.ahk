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

SetTimer, RandomPopupOrCrash, 300000 ;handles crashes, popup advertisements every 5 minutes



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
deployNum := 0
loop,
{
	SendEvent {ClickAt %WAIT_X%, %WAIT_Y%}

	if (DetectObject(DEPLOYUNIT_BUTTON) && deployNum < DEPLOY_NUMBER)
	{
		WaitObject(DEPLOYUNIT_BUTTON)
		ClickObject(DEPLOYUNIT_BUTTON)
	}
	else if (DetectObject(DEPLOY_TEXT))
	{
		DeployUnit(SORTINDEX, TYPEINDEX)
	}
	
	if (DetectObject(CALLALLY_BUTTON))
	{
		WaitObject(CALLALLY_BUTTON)
		ClickObject(CALLALLY_BUTTON)
	}
	else if (DetectObject(CALLALLYPAGE_TEXT))
	{
		CallAlly(SORTINDEX, TYPEINDEX)
	}
	
	if (DetectObject(GWTF_EVENTTITLE_IMAGE))
	{
		if (training == 0)
		{
			training--
			GoToTrainingPage()
		}
	}
	else if (DetectObject(TRAINING_TEXT))
	{
		SelectAndStartLatestTraining()
	}
	else if (DetectObject(ADVANCE_BUTTON))
	{
		WaitObject(ADVANCE_BUTTON)
		ClickObject(ADVANCE_BUTTON)
	}
	else if (DetectObject(SENDBRAVE_BUTTON))
	{
		WaitObject(SENDBRAVE_BUTTON)
		ClickObject(SENDBRAVE_BUTTON)
	}
	else if (DetectObject(CONTINUETRAINING_BUTTON))
	{
		WaitObject(CONTINUETRAINING_BUTTON)
		ClickObject(CONTINUETRAINING_BUTTON)
	}
	else if (DetectObject(HEAL_BUTTON))
	{
		if (mod(switch,2) == 0)
		{
			msg :=  "Click At " . BufferX . ", " . BufferY
			SB_SetText(msg)
			SendEvent {ClickAt %BufferX%, %BufferY% down}
			sleep 2000
			SendEvent {ClickAt %BufferX%, %BufferY% up}
		}
		else
		{
			WaitObject(TRAININGMYPAGE_BUTTON)
			ClickObject(TRAININGMYPAGE_BUTTON)
		}
		switch++
	}
	else if (DetectObject(USEPOTIONYES_BUTTON))
	{
		WaitObject(USEPOTIONYES_BUTTON)
		ClickObject(USEPOTIONYES_BUTTON)
	}
	if DetectObject(GWTF_TRAININGFIGHT_BUTTON)
	{
		WaitObject(GWTF_TRAININGFIGHT_BUTTON)
		ClickObject(GWTF_TRAININGFIGHT_BUTTON)
	}
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
	else if (DetectObject(QUESTCLEAR_TEXT))
	{
		if (DetectObject(BACKTOEVENT_BUTTON))
		{
			WaitObject(BACKTOEVENT_BUTTON)
			ClickObject(BACKTOEVENT_BUTTON)
		}
	}
	else if (DetectObject(EVENT_ICON))
	{
		WaitObject(EVENT_ICON)
		ClickObject(EVENT_ICON)
	}
	else if (DetectObject(GWTF_ASISTLIST_BUTTON))
	{
		if (training < 0)
		{
			training++
			WaitObject(GWTF_ASISTLIST_BUTTON)
			ClickObject(GWTF_ASISTLIST_BUTTON)
		}
	}
	
	if (DetectObject(GWTF_ASSISTALLIES_TEXT))
	{
		if (DetectObject(GWTF_SENDFLAMEBERGE_BUTTON))
		{
			WaitObject(GWTF_SENDFLAMEBERGE_BUTTON)
			ClickObject(GWTF_SENDFLAMEBERGE_BUTTON)
		}
		else if (DetectObject(GWTF_ASSISTALLY_BUTTON))
		{
			WaitObject(GWTF_ASSISTALLY_BUTTON)
			ClickObject(GWTF_ASSISTALLY_BUTTON)
		}
		else if (DetectObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON))
		{
			WaitObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON)
			ClickObject(GWTF_BOSSLISTFROMASSISTALLIES_BUTTON)
		}
	}
	if (DetectObject(GWTF_BOSSLIST_TEXT))
	{
		if (DetectObject(GWTF_REQUESTASSIST_BUTTON))
		{
			WaitObject(GWTF_REQUESTASSIST_BUTTON)
			ClickObject(GWTF_REQUESTASSIST_BUTTON)
		}
		else if (DetectObject(GWTF_FIGHT_BUTTON))
		{
			training--
			WaitObject(GWTF_FIGHT_BUTTON)
			ClickObject(GWTF_FIGHT_BUTTON)
		}
		else if (DetectObject(GWTF_POTIONFIGHT_BUTTON))
		{
			training--
			WaitObject(GWTF_POTIONFIGHT_BUTTON)
			ClickObject(GWTF_POTIONFIGHT_BUTTON)
		}
		else if (DetectObject(GWTF_EVENT_BUTTON))
		{
			WaitObject(GWTF_EVENT_BUTTON)
			ClickObject(GWTF_EVENT_BUTTON)
		}
	}
	else if (DetectObject(GWTF_ASSISTLIST2_BUTTON))
	{
		WaitObject(GWTF_ASSISTLIST2_BUTTON)
		ClickObject(GWTF_ASSISTLIST2_BUTTON)
	}
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

;QUEST ENDS HERE
;========================================================




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