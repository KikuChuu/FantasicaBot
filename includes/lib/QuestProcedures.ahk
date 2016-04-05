#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Takes a int and returns the relative STARTQUEST#_BUTTON constant
AssignQuest(QuestNum)
{
	Global STARTQUEST1_BUTTON, STARTQUEST2_BUTTON, STARTQUEST3_BUTTON, STARTQUEST4_BUTTON, STARTQUEST5_BUTTON, STARTQUEST6_BUTTON, STARTQUEST7_BUTTON
    global STARTQUEST8_BUTTON, STARTQUEST9_BUTTON, STARTQUEST10_BUTTON
	
	if QuestNum = 1
		return %STARTQUEST1_BUTTON%
	else if QuestNum = 2
		return %STARTQUEST2_BUTTON%
	else if QuestNum = 3
		return %STARTQUEST3_BUTTON%
	else if QuestNum = 4
		return %STARTQUEST4_BUTTON%
	else if QuestNum = 5
		return %STARTQUEST5_BUTTON%
	else if QuestNum = 6
		return %STARTQUEST6_BUTTON%
	else if QuestNum  = 7
		return %STARTQUEST7_BUTTON%
    else if QuestNum  = 8
		return %STARTQUEST8_BUTTON%
    else if QuestNum  = 9
		return %STARTQUEST9_BUTTON%
    else if QuestNum  = 10
		return %STARTQUEST10_BUTTON%    
	else
		MsgBox, 0, Invalid Quest Assignment, Soooorrrry, we don't support quest %QuestNum%.
}

;Call ally
;AllyPower sort by damage (land = 1, air = 2, sea = 3, no sort = 0 (default))
;AllyType is sort by type (melee = 1, missile = 2, magic = 3, no specific type = 0 (default))
CallAlly(AllyPower=0, AllyType=0) 
{
	global SLEEPTIME
    global BACKQUEST_BUTTON, BACKTOEVENT_BUTTON, CALLALLY_BUTTON, CARDBACK_BUTTON, DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON, CHOOSEQUESTCOMPLETED_BUTTON 
	global CALLALLYPAGE_TEXT, CANCELPLACEMENT_BUTTON, CONFIRMUNITPLACEMENT_BUTTON, EVENT_ICON, NEXTPAGE_BUTTON, PAGE10ALLYLIST_TEXT, RESTRICTPLACMENTON_COL1, RESTRICTPLACMENTON_COL2, STARTBATTLE_BUTTON
	global SORTBYAIRATK_BUTTON, SORTBYDEFAULT_BUTTON, SORTBYGROUNDATK_BUTTON, SORTBYSEAATK_BUTTON
	global UNITALL_BUTTON, UNITMELEE_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON
	global RR_BACK_BUTTON
	static hasFilteredAllyListByType := 0
	
	;WaitObject(CALLALLY_BUTTON) ;wait on ally button
	;ClickObject(CALLALLY_BUTTON) ;go to ally list
	
	while not DetectObject(CALLALLY_BUTTON)
	{
		if DetectObject(BACKQUEST_BUTTON) ;some useful code to break out of forever loop
		{
			break
		}
		else if (DetectObject(CHOOSEQUESTCOMPLETED_BUTTON)) ;if some small chance that quest ends (returns to my page) and leaves bot stuck in clicking ally button
		{
			return
		}
		else if (DetectObject(RR_BACK_BUTTON)) 
		{
			return
		}
	}
	;if no allies, exit ally list and skip body
	if AllyPower = 0
	{
		;SORT BY DEFAULT
		while not DetectObject(SORTBYDEFAULT_BUTTON)
		{
			if DetectObject(SORTBYSEAATK_BUTTON)
			{
				WaitObject(SORTBYSEAATK_BUTTON)
				ClickObject(SORTBYSEAATK_BUTTON)
			}
			if DetectObject(SORTBYGROUNDATK_BUTTON)
			{
				WaitObject(SORTBYGROUNDATK_BUTTON)
				ClickObject(SORTBYGROUNDATK_BUTTON)
			}
			if DetectObject(SORTBYAIRATK_BUTTON)
			{
				WaitObject(SORTBYAIRATK_BUTTON)
				ClickObject(SORTBYAIRATK_BUTTON)
			}
		}
	}
	else if AllyPower = 1
	{
		;SORT BY GROUND ATK
		while not DetectObject(SORTBYGROUNDATK_BUTTON)
		{
			if DetectObject(SORTBYDEFAULT_BUTTON)
			{
				WaitObject(SORTBYDEFAULT_BUTTON)
				ClickObject(SORTBYDEFAULT_BUTTON)
			}
			if DetectObject(SORTBYAIRATK_BUTTON)
			{
				WaitObject(SORTBYAIRATK_BUTTON)
				ClickObject(SORTBYAIRATK_BUTTON)
			}
			if DetectObject(SORTBYSEAATK_BUTTON)
			{
				WaitObject(SORTBYSEAATK_BUTTON)
				ClickObject(SORTBYSEAATK_BUTTON)
			}
		}
	}
	
	else if AllyPower = 2
	{
		;SORT BY AIR ATK
		while not DetectObject(SORTBYAIRATK_BUTTON)
		{
			if DetectObject(SORTBYGROUNDATK_BUTTON)
			{
				WaitObject(SORTBYGROUNDATK_BUTTON)
				ClickObject(SORTBYGROUNDATK_BUTTON)
			}
			if DetectObject(SORTBYSEAATK_BUTTON)
			{
				WaitObject(SORTBYSEAATK_BUTTON)
				ClickObject(SORTBYSEAATK_BUTTON)
			}
			if DetectObject(SORTBYDEFAULT_BUTTON)
			{
				WaitObject(SORTBYDEFAULT_BUTTON)
				ClickObject(SORTBYDEFAULT_BUTTON)
			}
		}
	}
	else if AllyPower = 3
	{
		;SORT BY SEA ATK
		while not DetectObject(SORTBYSEAATK_BUTTON)
		{
			if DetectObject(SORTBYAIRATK_BUTTON)
			{
				WaitObject(SORTBYAIRATK_BUTTON)
				ClickObject(SORTBYAIRATK_BUTTON)
			}
			if DetectObject(SORTBYDEFAULT_BUTTON)
			{
				WaitObject(SORTBYDEFAULT_BUTTON)
				ClickObject(SORTBYDEFAULT_BUTTON)
			}
			if DetectObject(SORTBYGROUNDATK_BUTTON)
			{
				WaitObject(SORTBYGROUNDATK_BUTTON)
				ClickObject(SORTBYGROUNDATK_BUTTON)
			}
		}
	}
	
	if (!hasFilteredAllyListByType)
	{
	    hasFilteredAllyListByType := 1
		if (AllyType == 0)
		{
			while not DetectObject(UNITAll_BUTTON)
			{
				if DetectObject(UNITMAGIC_BUTTON)
				{
					WaitObject(UNITMAGIC_BUTTON)
					ClickObject(UNITMAGIC_BUTTON)
				}
				if (DetectObject(UNITMELEE_BUTTON))
				{
					WaitObject(UNITMELEE_BUTTON)
					ClickObject(UNITMELEE_BUTTON)
				}
				if DetectObject(UNITMISSILE_BUTTON)
				{
					WaitObject(UNITMISSILE_BUTTON)
					ClickObject(UNITMISSILE_BUTTON)
				}
			}
		}
		else if (AllyType == 1)
		{
			while not DetectObject(UNITMELEE_BUTTON)
			{
				if DetectObject(UNITALL_BUTTON)
				{
					WaitObject(UNITALL_BUTTON)
					ClickObject(UNITALL_BUTTON)
				}
				if (DetectObject(UNITMISSILE_BUTTON))
				{
					WaitObject(UNITMISSILE_BUTTON)
					ClickObject(UNITMISSILE_BUTTON)
				}
				if DetectObject(UNITMAGIC_BUTTON)
				{
					WaitObject(UNITMAGIC_BUTTON)
					ClickObject(UNITMAGIC_BUTTON)
				}
			}
		}
		else if (AllyType == 2)
		{
			while not DetectObject(UNITMISSILE_BUTTON)
			{
				if DetectObject(UNITMELEE_BUTTON)
				{
					WaitObject(UNITMELEE_BUTTON)
					ClickObject(UNITMELEE_BUTTON)
				}
				if (DetectObject(UNITMAGIC_BUTTON))
				{
					WaitObject(UNITMAGIC_BUTTON)
					ClickObject(UNITMAGIC_BUTTON)
				}
				if DetectObject(UNITALL_BUTTON)
				{
					WaitObject(UNITALL_BUTTON)
					ClickObject(UNITALL_BUTTON)
				}
			}
		}
		else if (AllyType == 3)
		{
			while not DetectObject(UNITMAGIC_BUTTON)
			{
				if DetectObject(UNITMISSILE_BUTTON)
				{
					WaitObject(UNITMISSILE_BUTTON)
					ClickObject(UNITMISSILE_BUTTON)
				}
				if (DetectObject(UNITALL_BUTTON))
				{
					WaitObject(UNITALL_BUTTON)
					ClickObject(UNITALL_BUTTON)
				}
				if DetectObject(UNITMELEE_BUTTON)
				{
					WaitObject(UNITMELEE_BUTTON)
					ClickObject(UNITMELEE_BUTTON)
				}
			}
		}
	}
	
	if not ChooseAlly() ;if no ally was chosen, exit out of ally list
	{
		while not DetectObject(UNITAll_BUTTON)
		{
			if DetectObject(UNITMAGIC_BUTTON)
			{
				WaitObject(UNITMAGIC_BUTTON)
				ClickObject(UNITMAGIC_BUTTON)
			}
			if (DetectObject(UNITMELEE_BUTTON))
			{
				WaitObject(UNITMELEE_BUTTON)
				ClickObject(UNITMELEE_BUTTON)
			}
			if DetectObject(UNITMISSILE_BUTTON)
			{
				WaitObject(UNITMISSILE_BUTTON)
				ClickObject(UNITMISSILE_BUTTON)
			}
		}
		if not ChooseAlly()
		{
			ClickObject(BACKQUEST_BUTTON)
			WaitObject(CALLALLY_BUTTON)
			hasFilteredAllyListByType := 0
			return 0
		}
	}
	
    numOfPasses := 0
    
	;Find valid coordinates and place unit
	while not DetectObject(CONFIRMUNITPLACEMENT_BUTTON)
	{
		if (FindCoordinate(MapX, MapY, numOfPasses) == 0) ;modifies MapX and MapY to valid coordinates
        {
            ClickObject(CANCELPLACEMENT_BUTTON)
            WaitObject(BACKQUEST_BUTTON)
            ClickObject(BACKQUEST_BUTTON)
            return 0
        }
		else
        {
            PlaceUnitAt(MapX, MapY)	;Place unit at (MapX, MapY)
        }
	}
	WaitObject(CONFIRMUNITPLACEMENT_BUTTON)
	ClickObject(CONFIRMUNITPLACEMENT_BUTTON)
	
    FindCoordinate(MapX, MapY, numOfPasses, 1)
    
	while DetectObject(CANCELPLACEMENT_BUTTON) 
	{
		Sleep SLEEPTIME
	}
	return 1
}

;Chooses an ally from the ally list
;returns 0 if no ally is available
ChooseAlly()
{
	global DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON, NEXTPAGE_BUTTON, NONEXTPAGE_BUTTON
	while not DetectObject(NONEXTPAGE_BUTTON)
	{
		if DetectObject(DEPLOYALLY1_BUTTON)
		{
			WaitObject(DEPLOYALLY1_BUTTON)
			ClickObject(DEPLOYALLY1_BUTTON)
			return 1
		}
		else if DetectObject(DEPLOYALLY2_BUTTON)
		{
			WaitObject(DEPLOYALLY2_BUTTON)
			ClickObject(DEPLOYALLY2_BUTTON)
			return 1
		}
		else if DetectObject(DEPLOYALLY3_BUTTON)
		{
			WaitObject(DEPLOYALLY3_BUTTON)
			ClickObject(DEPLOYALLY3_BUTTON)
			return 1
		}
		else if DetectObject(NEXTPAGE_BUTTON)
		{
			WaitObject(NEXTPAGE_BUTTON)
			ClickObject(NEXTPAGE_BUTTON)
			;some lag may occur here which ends the loop
		}
	}
	
	if DetectObject(DEPLOYALLY1_BUTTON)
	{
		WaitObject(DEPLOYALLY1_BUTTON)
		ClickObject(DEPLOYALLY1_BUTTON)
		return 1
	}
	else if DetectObject(DEPLOYALLY2_BUTTON)
	{
		WaitObject(DEPLOYALLY2_BUTTON)
		ClickObject(DEPLOYALLY2_BUTTON)
		return 1
	}
	else if DetectObject(DEPLOYALLY3_BUTTON)
	{
		WaitObject(DEPLOYALLY3_BUTTON)
		ClickObject(DEPLOYALLY3_BUTTON)
		return 1
	}
	
	return 0
}

ToggleAttackType(attackType := 0)
{
  global
  checkInvariant := DetectObject(SORTBYDEFAULT_BUTTON) || DetectObject(SORTBYGROUNDATK_BUTTON) || DetectObject(SORTBYAIRATK_BUTTON) || DetectObject(SORTBYSEAATK_BUTTON)
  if (checkInvariant == 1)
  {
    if (attackType == 0)
    {
      ;SORT BY DEFAULT
      while not DetectObject(SORTBYDEFAULT_BUTTON)
      {
        if DetectObject(SORTBYSEAATK_BUTTON)
        {
          WaitObject(SORTBYSEAATK_BUTTON)
          ClickObject(SORTBYSEAATK_BUTTON)
        }
        if DetectObject(SORTBYGROUNDATK_BUTTON)
        {
          WaitObject(SORTBYGROUNDATK_BUTTON)
          ClickObject(SORTBYGROUNDATK_BUTTON)
        }
        if DetectObject(SORTBYAIRATK_BUTTON)
        {
          WaitObject(SORTBYAIRATK_BUTTON)
          ClickObject(SORTBYAIRATK_BUTTON)
        }
      }
    }
    else if (attackType == 1)
    {
      ;SORT BY GROUND ATK
      while not DetectObject(SORTBYGROUNDATK_BUTTON)
      {
        if DetectObject(SORTBYDEFAULT_BUTTON)
        {
          WaitObject(SORTBYDEFAULT_BUTTON)
          ClickObject(SORTBYDEFAULT_BUTTON)
        }
        if DetectObject(SORTBYAIRATK_BUTTON)
        {
          WaitObject(SORTBYAIRATK_BUTTON)
          ClickObject(SORTBYAIRATK_BUTTON)
        }
        if DetectObject(SORTBYSEAATK_BUTTON)
        {
          WaitObject(SORTBYSEAATK_BUTTON)
          ClickObject(SORTBYSEAATK_BUTTON)
        }
      }
    }
    else if (attackType == 2)
    {
      ;SORT BY AIR ATK
      while not DetectObject(SORTBYAIRATK_BUTTON)
      {
        if DetectObject(SORTBYGROUNDATK_BUTTON)
        {
          WaitObject(SORTBYGROUNDATK_BUTTON)
          ClickObject(SORTBYGROUNDATK_BUTTON)
        }
        if DetectObject(SORTBYSEAATK_BUTTON)
        {
          WaitObject(SORTBYSEAATK_BUTTON)
          ClickObject(SORTBYSEAATK_BUTTON)
        }
        if DetectObject(SORTBYDEFAULT_BUTTON)
        {
          WaitObject(SORTBYDEFAULT_BUTTON)
          ClickObject(SORTBYDEFAULT_BUTTON)
        }
      }
    }
    else if (attackType == 3)
    {
      ;SORT BY SEA ATK
      while not DetectObject(SORTBYSEAATK_BUTTON)
      {
        if DetectObject(SORTBYAIRATK_BUTTON)
        {
          WaitObject(SORTBYAIRATK_BUTTON)
          ClickObject(SORTBYAIRATK_BUTTON)
        }
        if DetectObject(SORTBYDEFAULT_BUTTON)
        {
          WaitObject(SORTBYDEFAULT_BUTTON)
          ClickObject(SORTBYDEFAULT_BUTTON)
        }
        if DetectObject(SORTBYGROUNDATK_BUTTON)
        {
          WaitObject(SORTBYGROUNDATK_BUTTON)
          ClickObject(SORTBYGROUNDATK_BUTTON)
        }
      }
    }
  }
}

ToggleAttribType(attribType := 0)
{
  global
  checkInvariant := DetectObject(UNITALL_BUTTON) || DetectObject(UNITMELEE_BUTTON) || DetectObject(UNITMISSILE_BUTTON) || DetectObject(UNITMAGIC_BUTTON)
  if (checkInvariant == 1)
  {
    if (attribType == 0)
    {
      while not DetectObject(UNITAll_BUTTON)
      {
        if DetectObject(UNITMAGIC_BUTTON)
        {
          WaitObject(UNITMAGIC_BUTTON)
          ClickObject(UNITMAGIC_BUTTON)
        }
        if (DetectObject(UNITMELEE_BUTTON))
        {
          WaitObject(UNITMELEE_BUTTON)
          ClickObject(UNITMELEE_BUTTON)
        }
        if DetectObject(UNITMISSILE_BUTTON)
        {
          WaitObject(UNITMISSILE_BUTTON)
          ClickObject(UNITMISSILE_BUTTON)
        }
      }
    }
    else if (attribType == 1)
    {
      while not DetectObject(UNITMELEE_BUTTON)
      {
        if DetectObject(UNITALL_BUTTON)
        {
          WaitObject(UNITALL_BUTTON)
          ClickObject(UNITALL_BUTTON)
        }
        if (DetectObject(UNITMISSILE_BUTTON))
        {
          WaitObject(UNITMISSILE_BUTTON)
          ClickObject(UNITMISSILE_BUTTON)
        }
        if DetectObject(UNITMAGIC_BUTTON)
        {
          WaitObject(UNITMAGIC_BUTTON)
          ClickObject(UNITMAGIC_BUTTON)
        }
      }
    }
    else if (attribType == 2)
    {
      while not DetectObject(UNITMISSILE_BUTTON)
      {
        if DetectObject(UNITMELEE_BUTTON)
        {
          WaitObject(UNITMELEE_BUTTON)
          ClickObject(UNITMELEE_BUTTON)
        }
        if (DetectObject(UNITMAGIC_BUTTON))
        {
          WaitObject(UNITMAGIC_BUTTON)
          ClickObject(UNITMAGIC_BUTTON)
        }
        if DetectObject(UNITALL_BUTTON)
        {
          WaitObject(UNITALL_BUTTON)
          ClickObject(UNITALL_BUTTON)
        }
      }
    }
    else if (attribType == 3)
    {
      while not DetectObject(UNITMAGIC_BUTTON)
      {
        if DetectObject(UNITMISSILE_BUTTON)
        {
          WaitObject(UNITMISSILE_BUTTON)
          ClickObject(UNITMISSILE_BUTTON)
        }
        if (DetectObject(UNITALL_BUTTON))
        {
          WaitObject(UNITALL_BUTTON)
          ClickObject(UNITALL_BUTTON)
        }
        if DetectObject(UNITMELEE_BUTTON)
        {
          WaitObject(UNITMELEE_BUTTON)
          ClickObject(UNITMELEE_BUTTON)
        }
      }
    }
  }
}

ChooseUnit()
{
  global
	if (DetectObject(DEPLOYUNIT1_BUTTON))
	{
		ClickObject(DEPLOYUNIT1_BUTTON)
	}
	else if (DetectObject(DEPLOYUNIT2_BUTTON))
	{
		ClickObject(DEPLOYUNIT2_BUTTON)
	}
	else if (DetectObject(DEPLOYUNIT3_BUTTON))
	{
		ClickObject(DEPLOYUNIT3_BUTTON)
	}
	else if (DetectObject(DEPLOYUNIT4_BUTTON))
	{
		ClickObject(DEPLOYUNIT4_BUTTON)
	}
	else if (DetectObject(BACKQUEST_BUTTON))
	{
		ClickObject(BACKQUEST_BUTTON)
		return 0
	}
}

; DeployUnit - Performs a sequence of steps to deploy a unit. Filters units as
;              according to input parameters.
; attackType  - Controls how to filter the list by unit attack points.
;               0 = Default, 1 = Ground, 2 = Air, 3 = Sea
; attribType   - Controls how to filter the list by unit type
;               0 = Default, 1 = Melee, 2 = Missile, 3 = Magic
; Return     - Returns 1 if a unit was deployed, 0 otherwise.
DeployUnit(attackType = 0, attribType = 0)
{
	global CONFIRMUNITPLACEMENT_BUTTON, CANCELPLACEMENT_BUTTON, BACKQUEST_BUTTON

  ; Toggle attack and attribute type
;  ToggleAttackType(attackType)
;  ToggleAttribType(attribType)

	;Choose a unit to deploy
;  ChooseUnit()

  ; Locate a tile to place the unit
  numOfPasses := 0
;	FindCoordinate(MapX, MapY, numOfPasses)
; PlaceUnitAt(MapX, MapY)	;Place unit at (MapX, MapY)
  while not (DetectObject(CONFIRMUNITPLACEMENT_BUTTON))
  {
    if (FindCoordinate(MapX, MapY, numOfPasses) == 0) ;modifies MapX and MapY to valid coordinates
    {
      ClickObject(CANCELPLACEMENT_BUTTON)
      WaitObject(BACKQUEST_BUTTON)
      ClickObject(BACKQUEST_BUTTON)
      return 0
    }
  }

  if (DetectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
    ClickObject(CONFIRMUNITPLACEMENT_BUTTON)
  }
  
  FindCoordinate(MapX, MapY, numOfPasses, 1) ; Advance the search index by 1 column
	return 1
}

FindCoordinate(Byref X, Byref Y, Byref numOfPasses := 0, incrementCol := 0)
{
	global SLEEPTIME, RESTRICTPLACEMENTON_COL1, RESTRICTPLACEMENTON_COL2, QUICKSCAN, REVELATIONTOWER, LEVELBOT
	global BLUESTACK_WINDOW_TITLE, maxPasses

	;declare our static vars here
	static row:= 0
	static col:= 0
    
  if (incrementCol)
  {
      if (LEVELBOT == 0) {
        col++
      }
  }
  else
  {
    if (LEVELBOT == 1)
    {
      global SCAN_START_X, SCAN_START_Y, SCAN_TILE_SIZE, CONFIRMUNITPLACEMENT_BUTTON
      MapMaxRow := 7 ;starting with row 0
      MapMaxCol := 7 ;starting with col 0	
      
      if (QUICKSCAN == 2)
      {
          SLEEPTEMP := 1 ; Set sleep variable to .001 seconds 
      }
      else if (QUICKSCAN == 1)
      {
          SLEEPTEMP := SLEEPTIME // 2
      }
      else
      {
          SLEEPTEMP := SLEEPTIME
      }
      
      while (numOfPasses < maxPasses)
      {
        IfWinNotActive, %BLUESTACK_WINDOW_TITLE%
        {
          WinActivate, %BLUESTACK_WINDOW_TITLE%
        }
        while (row <= MapMaxRow)
        {
          CurrentRowCoord := SCAN_START_Y + (row * SCAN_TILE_SIZE)
          while (col <= MapMaxCol)
          {
            if (row == 0 && col == 0) 
            {
              col++
              continue
            }

            CurrentColCoord := SCAN_START_X + (col * SCAN_TILE_SIZE)

            PlaceUnitAt(CurrentColCoord, CurrentRowCoord)
            if (DetectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
              col++
              return 1
            }
            else
            {
              col++
            }
           ; PixelGetColor, tileColor, %CurrentColCoord%, %CurrentRowCoord%
           ; comparisonColor := tileColor
           ; Sleep, SLEEPTEMP
           ; PixelGetColor, tileColor, %CurrentColCoord%, %CurrentRowCoord%
           ; SB_SetText("Scanning for available coordinates (x" . CurrentColCoord . ", y" . CurrentRowCoord . ")" )
           ; if (tileColor <> comparisonColor)
           ; {
           ;     X := CurrentColCoord
           ;     Y := CurrentRowCoord
           ;     col++
           ;     return 1
           ; }
           ; else 
           ; {
           ;   col++
           ; }
          }
          row++
          col := 0
        }
        row := 0 ;scanned the entire map, starting from beginning
        numOfPasses++
      }
    }
    else
    {
      global SCAN_START_X, SCAN_START_Y, SCAN_TILE_SIZE, CONFIRMUNITPLACEMENT_BUTTON
      MapMaxRow := 14 ;starting with row 0
      MapMaxCol := 14 ;starting with col 0
      
      if (QUICKSCAN == 2)
      {
          SLEEPTEMP := 1
      }
      else if (QUICKSCAN == 1)
      {
          SLEEPTEMP := SLEEPTIME // 2
      }
      else
      {
          SLEEPTEMP := SLEEPTIME
      }
      
      while (numOfPasses < maxPasses)
      {
          IfWinNotActive, %BLUESTACK_WINDOW_TITLE%
          {
              WinActivate, %BLUESTACK_WINDOW_TITLE%
          }
          while row <= MapMaxRow
          {
              CurrentRowCoord := SCAN_START_Y + (row * SCAN_TILE_SIZE)
              while col <= (MapMaxCol)
              {
                if (row == 0 && col == 0) 
                {
                  col++
                  continue
                }

                CurrentColCoord := SCAN_START_X + (col * SCAN_TILE_SIZE)
                PlaceUnitAt(CurrentColCoord, CurrentRowCoord)
                if (DetectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
                  col++
                  return 1
                }
                else
                {
                  col++
                }
                  
           ;       PixelGetColor, tileColor, %CurrentColCoord%, %CurrentRowCoord%
           ;       comparisonColor := tileColor
           ;       Sleep SLEEPTEMP
           ;       PixelGetColor, tileColor, %CurrentColCoord%, %CurrentRowCoord%
           ;       SB_SetText("Scanning for available coordinates (" . CurrentColCoord . "x" . CurrentRowCoord . ")")
           ;       if (tileColor <> comparisonColor)
           ;       {
           ;           X := CurrentColCoord
           ;           Y := CurrentRowCoord
           ;           col++
           ;           return 1
           ;       }
           ;       col++
              }
              row++
              col := 0
              switch++
          }
          row := 0 ;scanned the entire map, starting from beginning
          numOfPasses++
      }
    }
    return 0
  }
}

; Wraps the lower-level function ClickAt with a sensible function name
PlaceUnitAt(CoordX, CoordY)
{
  ClickAt(CoordX, CoordY)
}

;Scrolls down a list
Scroll(X_init, Y_init, X_end, Y_end, mouseSpeed := 100)
{
	global SLEEPTIME
	; SetDefaultMouseSpeed %mouseSpeed%
	 MouseMove %X_init%, %Y_init% 
	; Sleep SLEEPTIME
  ;  MouseClickDrag, Left, %X_init%, %Y_init%, %X_end%, %Y_end%, %mouseSpeed%
	 SetDefaultMouseSpeed 100
	 SendEvent { Click down }{ Click up %X_end%, %Y_end%}
	 SetDefaultMouseSpeed 0
	Sleep SLEEPTIME
}

SelectEpisode(CURRENTEPISODE, EPISODE)
{
	SetDefaultMouseSpeed, 100
	i := CURRENTEPISODE - (EPISODE + 5)
	loop, %i%
	{
		SendEvent {Click 816, 600, down}{click 816, 715, up}
		Sleep 500
	}
	
	if (i = -5)		;current quest
	{
		Click 956, 755 down
		Sleep 500
		Click up
	}
	else if (i = -4)	;1 episode before current quest
	{
		Click 956, 629 down
		Sleep 500
		Click up
	}
	else if (i= -3) 	;2 episodes before current quest
	{
		Click 956, 514 down
		Sleep 500
		Click up
	}
	else if (i= -2)	;3 episodes before current quest
	{
		Click 956, 399 down
		Sleep 500
		Click up
	}
	else if (i= -1)	;4 episodes before current quest
	{
		Click 956, 284 down
		Sleep 500
		Click up
	}
	else			;whichever episode is at the top of the screen
	{
		Click 956, 169 down
		Sleep 500
		Click up
	}
	SetDefaultMouseSpeed, 50
}
