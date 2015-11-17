#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

DeployUnit(AllyPower = 0, AllyType = 0)
{
	global
	;global BACKQUEST_BUTTON, CANCELPLACEMENT_BUTTON, CONFIRMUNITPLACEMENT_BUTTON, DEPLOYUNIT_BUTTON, SLEEPTIME
	;global DEPLOYUNIT1_BUTTON, DEPLOYUNIT2_BUTTON, DEPLOYUNIT3_BUTTON, DEPLOYUNIT4_BUTTON
	;global UNIT1_INVISIBLEBUTTON, UNIT2_INVISIBLEBUTTON, UNIT3_INVISIBLEBUTTON, UNIT4_INVISIBLEBUTTON
	;global UNITALL_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON, UNITMELEE_BUTTON, UNITFAVORITEON_BUTTON
	
	WaitObject(KOD_DEPLOYUNIT_BUTTON) ;Waits for the 'Deploy_Unit' button
	ClickObject(KOD_DEPLOYUNIT_BUTTON) ;Click the 'Deploy Unit' button
	WaitObject(BACKQUEST_BUTTON)
	loop  ;Recover unit point until we have enough points to deploy a unit in slot 1
	{
		;Choose a unit to deploy
		if DetectObject(DEPLOYUNIT1_BUTTON)
		{
			WaitObject(DEPLOYUNIT1_BUTTON)
			ClickObject(DEPLOYUNIT1_BUTTON)
			WaitObject(CANCELPLACEMENT_BUTTON) ;Ensure we are ready to place unit on 'BATTLE FIELD'
			break
		}
		else if DetectObject(DEPLOYUNIT2_BUTTON)
		{
			WaitObject(DEPLOYUNIT2_BUTTON)
			ClickObject(DEPLOYUNIT2_BUTTON)
			WaitObject(CANCELPLACEMENT_BUTTON) ;Ensure we are ready to place unit on 'BATTLE FIELD'
			break
		}
		else if DetectObject(DEPLOYUNIT3_BUTTON)
		{
			WaitObject(DEPLOYUNIT3_BUTTON)
			ClickObject(DEPLOYUNIT3_BUTTON)
			WaitObject(CANCELPLACEMENT_BUTTON) ;Ensure we are ready to place unit on 'BATTLE FIELD'
			break
		}
		else if DetectObject(DEPLOYUNIT4_BUTTON)
		{
			WaitObject(DEPLOYUNIT4_BUTTON)
			ClickObject(DEPLOYUNIT4_BUTTON)
			WaitObject(CANCELPLACEMENT_BUTTON) ;Ensure we are ready to place unit on 'BATTLE FIELD'
			break
		}
		else
		{
			ClickObject(BACKQUEST_BUTTON)
			Sleep SLEEPTIME
			if DetectObject(DEPLOYUNIT_BUTTON)
			{
				ClickObject(DEPLOYUNIT_BUTTON) ;Click the 'Deploy Unit' button
				WaitObject(BACKQUEST_BUTTON) 
			}
			else
			{
				return 0
			}
		}
	}
	
	FindCoordinate(MapX, MapY) ;FindCoordinate() modifies MapX and MapY to valid coordinates
	PlaceUnitAt(MapX, MapY)	;Place unit at (MapX, MapY)
	
	while not DetectObject(CONFIRMUNITPLACEMENT_BUTTON)
	{
		FindCoordinate(MapX, MapY) ;Find coordinate modifies MapX and MapY to valid coordinates
		PlaceUnitAt(MapX, MapY)	;Place unit at MapX, MapY
	}
	WaitObject(CONFIRMUNITPLACEMENT_BUTTON)
	ClickObject(CONFIRMUNITPLACEMENT_BUTTON)
	
	while DetectObject(CANCELPLACEMENT_BUTTON) ;busy wait until unit placement is done (in case of lag)
	{
		Sleep SLEEPTIME
	}
}
