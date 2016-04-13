; =============================================================================
; QuestProcedures.ahk
;
; - A series of functions designed to perform quest-related operations
;
;
; The MIT License
;
; Copyright (c) 2016 Ricky Tran <rickytran991@gmail.com>
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; 
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.
; =============================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;assignQuest() - A helper function that maps an integer to the path of the 
;                corresponding quest's start button.
;@param int - An integer which is used to determine which path it should return
;@return string - If the argument is valid, returns the path to the quest's 
;                 start button. Otheriwse, force the app to exit
assignQuest(questNum)
{
	global STARTQUEST1_BUTTON, STARTQUEST2_BUTTON, STARTQUEST3_BUTTON
  global STARTQUEST4_BUTTON, STARTQUEST5_BUTTON, STARTQUEST6_BUTTON
  global STARTQUEST7_BUTTON, STARTQUEST8_BUTTON, STARTQUEST9_BUTTON 
  global STARTQUEST10_BUTTON
	
	if (questNum == 1) {
		return %STARTQUEST1_BUTTON%
  }
	else if (questNum == 2) {
		return %STARTQUEST2_BUTTON%
  }
	else if (questNum == 3) {
		return %STARTQUEST3_BUTTON%
  }
	else if (questNum == 4) {
		return %STARTQUEST4_BUTTON%
  }
	else if (questNum == 5) {
		return %STARTQUEST5_BUTTON%
  }
	else if (questNum == 6) {
		return %STARTQUEST6_BUTTON%
  }
	else if (questNum  == 7) {
		return %STARTQUEST7_BUTTON%
  }
  else if (questNum  == 8) {
		return %STARTQUEST8_BUTTON%
  }
  else if (questNum  == 9) {
		return %STARTQUEST9_BUTTON%
  }
  else if (questNum  == 10) {
		return %STARTQUEST10_BUTTON%
  }
	else {
		MsgBox, 0, Invalid Quest Assignment, Soooorrrry, we don't support quest %QuestNum%.
    ExitApp
  }
}

;Call ally
;AllyPower sort by damage (land = 1, air = 2, sea = 3, no sort = 0 (default))
;AllyType is sort by type (melee = 1, missile = 2, magic = 3, no specific type = 0 (default))
CallAlly(attackType = 0, attribType = 0) 
{
	global SLEEPTIME
  global BACKQUEST_BUTTON, BACKTOEVENT_BUTTON, CALLALLY_BUTTON, CARDBACK_BUTTON
  global DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON
  global CHOOSEQUESTCOMPLETED_BUTTON, CALLALLYPAGE_TEXT, CANCELPLACEMENT_BUTTON
  global CONFIRMUNITPLACEMENT_BUTTON, EVENT_ICON, NEXTPAGE_BUTTON
  global PAGE10ALLYLIST_TEXT, RESTRICTPLACMENTON_COL1, RESTRICTPLACMENTON_COL2
  global STARTBATTLE_BUTTON, SORTBYAIRATK_BUTTON, SORTBYDEFAULT_BUTTON
  global SORTBYGROUNDATK_BUTTON, SORTBYSEAATK_BUTTON, UNITALL_BUTTON
  global UNITMELEE_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON, RR_BACK_BUTTON

  invariantCheck := ChooseAlly()
	
	if (!invariantCheck) ;if the invariant check fails...
	{
    toggleAttackType(0)
    invariantCheck := ChooseAlly()
		if (invariantCheck != 1)
		{
			clickObject(BACKQUEST_BUTTON)
			waitObject(CALLALLY_BUTTON)
			hasFilteredAllyListByType := 0
			return 0
		}
	}
	
  numOfPasses := 0
  
	;Find valid coordinates and place unit
  if (FindCoordinate(MapX, MapY, numOfPasses) == 0) ;modifies MapX and MapY to valid coordinates
  {
    ClickObject(CANCELPLACEMENT_BUTTON)
    WaitObject(BACKQUEST_BUTTON)
    ClickObject(BACKQUEST_BUTTON)
    return 0
  }
	if (DetectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
    ClickObject(CONFIRMUNITPLACEMENT_BUTTON)
  }
	
  FindCoordinate(MapX, MapY, numOfPasses, 1)
    
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

  ; Locate a tile to place the unit
  if (FindCoordinate() == 0)
  {
    ClickObject(CANCELPLACEMENT_BUTTON)
    WaitObject(BACKQUEST_BUTTON)
    ClickObject(BACKQUEST_BUTTON)
    return 0
  }

  if (DetectObject(CONFIRMUNITPLACEMENT_BUTTON)) {
    ClickObject(CONFIRMUNITPLACEMENT_BUTTON)
  }
 
  Sleep 500
	return 1
}

;findCoordinate() - Performs a tile-by-tile placement on the map until a valid position is found.
;@return int - If a valid position is found, return 1. Otherwise, return 0
findCoordinate()
{
	global BLUESTACK_WINDOW_TITLE, SLEEPTIME, LEVELBOT, SCAN_START_X
  global SCAN_START_Y, SCAN_TILE_SIZE, CONFIRMPLACEMENT_BUTTON
	global maxPasses

	;declare our static variables
	static currRow:= 0
	static currCol:= 0
  static mapMaxRow := 0
  static mapMaxCol := 0
  static tileSize := 0
  static currPass := 0

  if (mapMaxRow == 0) {
    if (LEVELBOT == 1) 
    {
      mapMaxRow = 7 ; This number 7 came from counting the tiles in the game
      mapMaxCol = mapMaxRow
      tileSize = SCAN_TILE_SIZE
    }
    else
    {
      mapMaxRow = 7*2 ; Since we scan at half-a-tile, we double the tile count
      mapMaxCol = mapMaxRow
      tileSize = SCAN_TILE_SIZE // 2
    }
  }
  
  while (currPass < maxPasses) {
    if (winExist(BLUESTACK_WINDOW_TITLE)) {
      WinActivate, %BLUESTACK_WINDOW_TITLE%
    }

    while (currRow < mapMaxRow) {
      if (currRow == 0 && currCol == 0) {
        col++
        continue
      }

      ; Compute the y-coordinate
      currYCoord := SCAN_START_Y + (tileSize * currRow) 
      while (currCol < mapMaxCol) {

        ; Compute the x-coordinate
        currXCoord := SCAN_START_X + (tileSize * currCol)

        placeUnitAt(currXCoord, currYCoord)
        if (DetectObject(CONFIRMPLACEMENT_BUTTON)) 
        {
          if (!LEVELBOT) {
            currCol += 2
          } 
          else {
            currCol++
          }
          return 1
        }
        else 
        {
          currCol++
        }
      }
      row++
      currCol = 0
    }
    currPass++
    row = 0
  }
  currPass = 0
  
  return 0
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
