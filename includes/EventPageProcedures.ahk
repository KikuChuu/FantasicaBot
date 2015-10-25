#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

RunTrainingEventPageProcedure()
{
	global ALLYASSISTZERO_TEXT, ASSISTALLIES_TEXT, ASSISTALLYRESULT_TEXT, ASSISTALLY_BUTTON, BACKTOASSISTALLIES_BUTTON, BOSSLIST_BUTTON, EVENTBACK_BUTTON 
	global RESUMEPREVIOUSBATTLE_BUTTON, REQUESTASSISTANCE_BUTTON, RETRYBOSS_BUTTON, RETRYBOSSPOTION_BUTTON, SELECTBOSS_TEXT, SENDANDVIEWASSISTS_BUTTON, TRAINEVENT_BUTTON
	
	
	WaitObject(TRAINEVENT_BUTTON)
	
	WaitObject(RESUMEPREVIOUSBATTLE_BUTTON) ; 
	ClickObject(RESUMEPREVIOUSBATTLE_BUTTON)

	;wait til we are in the boss list                
	while not DetectObject(SELECTBOSS_TEXT)
	{
		if DetectObject(BOSSLIST_BUTTON) ;This appear when a boss has 'fled!'
		{
			WaitObject(BOSSLIST_BUTTON)
			ClickObject(BOSSLIST_BUTTON)
		}
	}

	if DetectObject(REQUESTASSISTANCE_BUTTON)
	{
		if DetectObject(ALLYASSISTZERO_TEXT)
		{
			WaitObject(REQUESTASSISTANCE_BUTTON)
			ClickObject(REQUESTASSISTANCE_BUTTON)
			
			while DetectObject(REQUESTASSISTANCE_BUTTON)
			{
				Gui, Add, Text, x20 y20 h100 w400 , Waiting request assist to process
			}
			Sleep 5000
		}
	}
	
	if DetectObject(RETRYBOSS_BUTTON)
	{
		WaitObject(RETRYBOSS_BUTTON)
		ClickObject(RETRYBOSS_BUTTON)
		EventBoss(5)
		Reload
	}
	else if DetectObject(RETRYBOSSPOTION_BUTTON)
	{
		while DetectObject(RETRYBOSSPOTION_BUTTON)
		{
			Gui, Add, Text, x20 y20 h100 w400 , Waiting for `n`n RETRYBOSSPOTION_BUTTON
		}
		if DetectObject(RETRYBOSS_BUTTON)
		{
			WaitObject(RETRYBOSS_BUTTON)
			ClickObject(RETRYBOSS_BUTTON)
			EventBoss(5)
			Reload
		}
	}
	
	WaitObject(EVENTBACK_BUTTON)
	ClickObject(EVENTBACK_BUTTON)
	
	WaitObject(TRAINEVENT_BUTTON) ;ensure we're on the event page
	
	WaitObject(SENDANDVIEWASSISTS_BUTTON)
	ClickObject(SENDANDVIEWASSISTS_BUTTON)
	
	WaitObject(ASSISTALLIES_TEXT)	;ensure we are on the assist allies page
	
	while (DetectObject(ASSISTALLY_BUTTON))
	{
		WaitObject(ASSISTALLY_BUTTON)
		ClickObject(ASSISTALLY_BUTTON)
		
		WaitObject(ASSISTALLYRESULT_TEXT) ;Not the 'Assist Ally" button to assist an ally, but the 'Assist Ally' button to return to the assist ally list page. 
										;This is on the 'Result Page'
		WaitObject(BACKTOASSISTALLIES_BUTTON)
		ClickObject(BACKTOASSISTALLIES_BUTTON)
		WaitObject(ASSISTALLIES_TEXT) ;ensure we are on the assist allies page
	}
	
	WaitObject(EVENTBACK_BUTTON)
	ClickObject(EVENTBACK_BUTTON)
	
	WaitObject(TRAINEVENT_BUTTON) ;ensure we're on the event page
	ClickObject(TRAINEVENT_BUTTON)
}