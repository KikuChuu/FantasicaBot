; =============================================================================
; PathsOfFate.ahk
;
; - Automates the Paths of Fate event
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

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk
;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.
Init_globals() ; Found in GlobalConstants.ahk
;============================================
SetDefaultMouseSpeed 0


; =============================================================================
; -------------------------- Define variables here ----------------------------
PATH_OF_FATE_EVENT := Decorate("FANTASICA IMAGES/Event/PathsOfFate/eventicon.png")
PATH_OF_FATE_BATTLE := Decorate("FANTASICA IMAGES/Event/PathsOfFate/battle.png")
PATH_OF_FATE_OPPSEL := Decorate("FANTASICA IMAGES/Event/PathsOfFate/OpponentSelection/battle.png")
PATH_OF_FATE_6FP := Decorate("FANTASICA IMAGES/Event/PathsOfFate/OpponentSelection/6fp.png")
PATH_OF_FATE_NO := Decorate("FANTASICA IMAGES/Event/PathsOfFate/OpponentSelection/no.png")
PATH_OF_FATE_DEPLOY := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/deploy.png")
PATH_OF_FATE_SINGLE := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/singlepath.png")
PATH_OF_FATE_BEGIN := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/begin.png")
PATH_OF_FATE_SKIP := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/skip.png")
PATH_OF_FATE_POT := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/potion.png")
PATH_OF_FATE_POT_YES := Decorate("FANTASICA IMAGES/Event/PathsOfFate/GameBoard/yes.png")
PATH_OF_FATE_BACK := Decorate("FANTASICA IMAGES/Event/PathsOfFate/result/back.png")
PATH_OF_FATE_ARCHRIVAL := Decorate("FANTASICA IMAGES/Event/PathsOfFate/archrival.png")
PATH_OF_FATE_FLASK := Decorate("FANTASICA IMAGES/Event/PathsOfFate/flask.png")
PATH_OF_FATE_HISTORY := Decorate("FANTASICA IMAGES/Event/PathsOfFate/history.png")
PATH_OF_FATE_RECEIVE_ALL := Decorate("FANTASICA IMAGES/Event/PathsOfFate/History/receiveall.png")
PATH_OF_FATE_DEF_HIST := Decorate("FANTASICA IMAGES/Event/PathsOfFate/History/defensehistory.png")
PATH_OF_FATE_VIEW_DEFEATS := Decorate("FANTASICA IMAGES/Event/PathsOfFate/History/viewdefeats.png")
PATH_OF_FATE_REMATCH := Decorate("FANTASICA IMAGES/Event/PathsOfFate/History/rematch.png")
hasSelectedPath := 0
useFlask := 0
rematch := 0
; =============================================================================


; =============================================================================
; ------------------ Define functions and procedures here ---------------------

; setPathFlag - Sets the by referenced variable to the decimal value 1
; @param ByRef int - The referenced variable to set to 1
; @return string - Returns a blank value (empty string) to its caller
setPathFlag(ByRef var)
{
  var = 1
}

; resetPathFlag - Resets the referenced variable to decimal value 0
; @param ByRef int - The referenced variable to set to 0
; @return string - Returns a blank value (empty string) to its caller
resetPathFlag(ByRef var)
{
  var = 0
}

; toggleFlasKFlag - Sets the referenced variable to either 0 or 1
; @param ByRef int - The referenced variable to toggle between 0 and 1
; @return string - Returns a blank value (empty string) to its caller
toggleFlaskFlag(ByRef var)
{
  static counter := 1
  var := Mod(counter++, 2)

  ; Notify the user of this change
  if (var) {
    SB_SetText("Flask usage turned on")
  }
  else {
    SB_SetText("Flask usage turned off")
  }

  Sleep 1000
}

; toggleRematchFlag - Sets the referenced variable to either 0 or 1
; @param ByRef int - The referenced variable to toggle between 0 and 1
; @return string - Returns a blank value (empty string) to its caller
toggleRematchFlag(ByRef var)
{
  static counter := 1
  var := Mod(counter++, 2)

  ; Notify the user of this change
  if (var) {
    SB_SetText("Rematch turned on")
  }
  else {
    SB_SetText("Rematch turned off")
  }

  Sleep 1000
}
; =============================================================================


loop,
{
  if (detectObject(PATH_OF_FATE_ARCHRIVAL, 15)) {
  	clickObject(PATH_OF_FATE_ARCHRIVAL, 15)
  }
  else if (detectObject(PATH_OF_FATE_HISTORY)) {
    clickObject(PATH_OF_FATE_HISTORY)
  }
  else if (detectObject(PATH_OF_FATE_BATTLE)) {
    clickObject(PATH_OF_FATE_BATTLE)
  }
  
  if (detectObject(PATH_OF_FATE_DEF_HIST)) {
    if (detectObject(PATH_OF_FATE_RECEIVE_ALL)) 
    {
      clickObject(PATH_OF_FATE_RECEIVE_ALL)
    }
    else if (rematch) 
    {
      if (detectObject(PATH_OF_FATE_VIEW_DEFEATS)) {
        clickObject(PATH_OF_FATE_VIEW_DEFEATS)
      }

      if(detectObject(PATH_OF_FATE_REMATCH)) {
        clickObject(PATH_OF_FATE_REMATCH)
      }
    }
    else if (detectObject(BACK_BUTTON)) 
    {
      clickObject(BACK_BUTTON)
    }
  }

  if (detectObject(PATH_OF_FATE_EVENT)) {
    clickObject(PATH_OF_FATE_EVENT)
  }

  if (detectObject(PATH_OF_FATE_OPPSEL)) {
    clickObject(PATH_OF_FATE_OPPSEL)
  }

  if (detectObject(PATH_OF_FATE_6FP)) {
    clickObject(PATH_OF_FATE_6FP)
  }

  if (detectObject(PATH_OF_FATE_FLASK) && useFlask) {
    clickObject(PATH_OF_FATE_FLASK) 
  }
  else if (detectObject(PATH_OF_FATE_NO)) {
    clickObject(PATH_OF_FATE_NO)
  }
  
  ; Begin the game only if a path was choosen
  if (detectObject(PATH_OF_FATE_BEGIN) && hasSelectedPath) 
  {
    clickObject(PATH_OF_FATE_BEGIN)  
    resetPathFlag(hasSelectedPath) ; Lowers the flag indicating that the path needs to be reselected for the next iteration
  }
  else if (detectObject(PATH_OF_FATE_SINGLE)) 
  {
    clickObject(PATH_OF_FATE_SINGLE) ; Select the singles path
    setPathFlag(hasSelectedPath) ; Raises the flag indicating that a path was selected
  }
  else if (detectObject(PATH_OF_FATE_DEPLOY)) {
    clickObject(PATH_OF_FATE_DEPLOY)
  }

  if (detectObject(PATH_OF_FATE_SKIP)) {
    clickObject(PATH_OF_FATE_SKIP)
  }

  if (detectObject(PATH_OF_FATE_POT)) {
    clickObject(PATH_OF_FATE_POT)
  }

  if (detectObject(PATH_OF_FATE_POT_YES)) {
    clickObject(PATH_OF_FATE_POT_YES)
  }

  if (detectObject(PATH_OF_FATE_BACK)) {
    clickObject(PATH_OF_FATE_BACK)
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
F4::toggleFlaskFlag(useFlask)
F5::toggleRematchFlag(rematch)
