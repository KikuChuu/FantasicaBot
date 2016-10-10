SetDefaultMouseSpeed 0

;clickAt() - Performs a left-mouse click at the coordinates specified by the arguments
;@param int - The x coordinate
;@param int - The y coordinate
;@return string - Returns a blank value (empty string) to its caller
clickAt(coordX, coordY)
{
	global SLEEPTIME
	global BLUESTACK_WINDOW_TITLE
	
  if (!winActive(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

  ; We are going to perform an elaborate mouse click. 
  ; Initially, we will click down on the mouse. Then release the mouse (click up).
  ; Before the initial click down, we'll retrieve the hex value in rgb format at the specificied click coordinates.
  ; After the mouse is down and while it is down, we'll retrieve a temporary rgb hex value.
  ; We'll compare the two values immediately and if the values differ, then we'll release the mouse immediately.
  ; If the values do not differ (match), we'll release the mouse after the speficied delay (SLEEPTIME).
  ; In both cases, the mouse will be released, but the former case is intended release the mouse sooner than the latter case.

  PixelGetColor, initialRgbValue, coordX, coordY, alt, RGB ; Retrieve the initial rgb hex value
  Send { Click down %coordX%, %coordY%}
  PixelGetColor, tempRgbValue, coordX, coordY, alt, RGB ; Retrieve the temporary rgb hex value

  ; Compare the two rgb hex values and release the mouse accordingly
  if (initialRgbValue != tempRgbValue) {
    Send { Click up }
  } 
  else {
    sleep SLEEPTIME
    Send { Click up }
  }
  sleep SLEEPTIME
}



;clickObject() - Searchs for the image specified as an argument. If the image
;                is found, performs a click on the image
;@param string - The path of the image to match
;@param int - The allowed number of shades of variation in either direction for
;             the intensity of the red, green, and blue components of each 
;             pixel's color. Specify between 0 to 255 (inclusive)
;@return string - Returns a blank value (empty string) to its caller
clickObject(path, variation := 0)
{
	global SLEEPTIME, X1,X2,Y1,Y2
	global BLUESTACK_WINDOW_TITLE

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
    WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *%variation% %path%
	if (ErrorLevel = 2)
	{
		msg := "File Missing(ClickObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)
	}
	else if (ErrorLevel = 1)
	{
		msg := "Click Failed, " . path . " could not be found."
		SB_SetText(msg)
		Log(msg)
	}
	else
	{
		SB_SetText("Clicking " . path)
		ClickAt(FoundX, FoundY)
	}
}

;detectObject - Scans the window for the image specified by the argument path.
;               If the image is found, set the global buffer coordinates to the
;               coordinates where the matching image within the window is found
;               and return 1. Otherwise, return 0.
;@param string - The path of the image to match
;@param int - The allowed number of shades of variation in either direction for 
;             the intensity of the red, green, and blue components of each 
;             pixel's color. Specify between 0 to 255 (inclusive)
;@return int - Returns 1 if the image matched within the window. 
;              Otherwise, returns 0.
detectObject(path, fromX := 0, fromY := 0, variation := 0)
{
	global X2,Y2, BACK_BUTTON, SLEEEPTIME
	global BLUESTACK_WINDOW_TITLE
	global BUFFER_X, BUFFER_Y

  WinGetPos,,,X2, Y2,%BLUESTACK_WINDOW_TITLE%

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	ImageSearch, FoundX, FoundY, fromX, fromY, X2, Y2, *TransBlack *%variation% %path%
	if (ErrorLevel = 2)
  {
		msg := "File Missing(DetectObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)

		; TODO ADD DRAG n' DROP function here
		Sleep SLEEEPTIME
    return 0
	}
	else if (ErrorLevel = 1)
  {
		msg := "NotFound(DetectObject), Image not detected on the screen: " . path
		SB_SetText(msg)
		;Log(msg)
		return 0
	}
	else
  {
		BUFFER_X := FoundX
		BUFFER_Y := FoundY
		return 1
	}
}

;waitObject - Continuously scans the window for the image specified in the
;               argument until the image is found, then returns a pair object
;               containing the coordinates where the match occurred.
;@param ByRef path - The path of the image which we want to match.
;@return int[2] - If the image is foun, returns a pair object where the first 
;                 element holds the x-coordinate and the second element holds
;                 the y-coordinate. Otherwise, this function never terminates
;                 and loops indefinitely (busy-waiting).
waitObject(ByRef path)
{
	global X1, X2, Y1, Y2, SLEEPTIME
	global WAIT_X, WAIT_Y
	global BLUESTACK_WINDOW_TITLE

  if (winExist(BLUESTACK_WINDOW_TITLE)) {
	  WinActivate, %BLUESTACK_WINDOW_TITLE%
  }

	SB_SetText("Waiting for `n`n" . path)
	ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, %path%
	while (ErrorLevel == 2)
	{
		msg := "File Missing(WaitObject), We can't seem to find this file: " . path
		SB_SetText(msg)
		Log(msg)
		; TODO ADD DRAG n' DROP function here
	}

	x := ""
	y := ""
	waitStatus := ["*", "* *", "* * *"]
	while (ErrorLevel == 1)
	{
    if (winExist(BLUESTACK_WINDOW_TITLE)) {
			WinActivate, %BLUESTACK_WINDOW_TITLE%
    }

		SB_SetText("Waiting for " . path . waitStatus[mod(A_Index,3)])
		SendEvent {Click %WAIT_X%, %WAIT_Y% }
		ImageSearch, x, y, X1, Y1, X2, Y2, %path%
	}

	array := [x, y]
	return array
}
