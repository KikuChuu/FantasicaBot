#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LoginBingo()
{
	global LOGINBINGO_TEXT, LOGINBINGOMYPAGE_BUTTON, LOGINBINGORECEIVE_BUTTON, MYPAGEID_TEXT
	if DetectObject(LOGINBINGO_TEXT)
	{
		LoginBingoHelperClicker()
		
		while not DetectObject(LOGINBINGOMYPAGE_BUTTON)
		{
			if DetectObject(LOGINBINGORECEIVE_BUTTON)
			{
				WaitObject(LOGINBINGORECEIVE_BUTTON)
				ClickObject(LOGINBINGORECEIVE_BUTTON)
			}
			else
			{
				LoginBingoHelperClicker()
			}
		}
		
		while DetectObject(LOGINBINGO_TEXT)
		{
			WaitObject(LOGINBINGOMYPAGE_BUTTON)
			ClickObject(LOGINBINGOMYPAGE_BUTTON)
		}
	}
}

;A helper function for the LoginBingo()
LoginBingoHelperClicker()
{
	global LOGINBINGO_TEXT, LOGINBINGOMYPAGE_BUTTON, LOGINBINGORECEIVE_BUTTON
	global BINGO_START_X, BINGO_START_Y, BINGO_TILE_SIZE
	
	startX := BINGO_START_X ;pixel coord
	startY := BINGO_START_Y ;pixel coord
	panelDimension := BINGO_TILE_SIZE ;pixels
	
	bingoBoardDimension := 5 ; 5x5 board
	loop, %bingoBoardDimension%
	{
		row := A_index - 1 ;current row to click
		loop, %bingoBoardDimension%
		{
			if not DetectObject(LOGINBINGORECEIVE_BUTTON)
			{
				col := A_index - 1 ;current col to click
				currentCoordX := startX + (panelDimension * col) ;calculate pixel coord of col
				currentCoordY := startY + (panelDimension * row) ;calculate pixel coord of row
				SB_SetText("Clicking at (x, y): " . currentCoordX . ", " . currentCoordY . "`n")
				;use the coordX and coordY to locate and click the panel
				SendEvent {Click down %currentCoordX%, %currentCoordY%}
				Sleep 500
				SendEvent {Click up}
			}
			else
			{
				WaitObject(LOGINBINGORECEIVE_BUTTON)
				return
			}
		}
	}
}

Roulette()
{
	global ROULETTESTART_BUTTON, ROULETTESTOP_BUTTON, ROULETTENINE7_TEXT, SLEEPTIME, ROULETTETHREE_TEXT, ROULETTENINEBLUE3_TEXT, ROULETTENINEBLUE4_TEXT
	if DetectObject(ROULETTESTART_BUTTON)
	{
		WaitObject(ROULETTESTART_BUTTON)
		ClickObject(ROULETTESTART_BUTTON)
		WaitObject(ROULETTESTOP_BUTTON)
		ClickObject(ROULETTESTOP_BUTTON)
	}
	; tempSleepTime = SLEEPTIME
	; SLEEPTIME = 0
	; loop
	; {
		; if DetectObject(ROULETTENINEBLUE3_TEXT)
		; {
			; WaitObject(ROULETTENINEBLUE3_TEXT)
			; Sleep 10
			; ClickObject(ROULETTESTOP_BUTTON)
			; break
		; }
		; else if DetectObject(ROULETTENINEBLUE4_TEXT)
		; {
			; WaitObject(ROULETTENINEBLUE4_TEXT)
			; Sleep 10
			; ClickObject(ROULETTESTOP_BUTTON)
			; break
		; }
	; }
	; SLEEPTIME = tempSleeptime

}