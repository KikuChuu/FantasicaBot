#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk
SetDefaultMouseSpeed 0
;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================


; =================================================================================================
; ------------------------------------------ Variables here ---------------------------------------
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
hasSelectedPath := 0
; =================================================================================================

; setPathFlag - Sets the by referenced variable to the decimal value 1
; ByRef int - The referenced variable to set to 1
; @return string - Returns a blank value (empty string) to its caller
setPathFlag(ByRef var)
{
  var = 1
}

; resetPathFlag - Resets the referenced variable to decimal value 0
; ByRef int - The referenced variable to set to 0
; @return string - Returns a blank value (empty string) to its caller
resetPathFlag(ByRef var)
{
  var = 0
}

loop,
{
  if (DetectObject(PATH_OF_FATE_BATTLE)) {
    ClickObject(PATH_OF_FATE_BATTLE)
  }

  if (DetectObject(PATH_OF_FATE_ARCHRIVAL, 15)) {
  	ClickObject(PATH_OF_FATE_ARCHRIVAL, 15)
  }

  if (DetectObject(PATH_OF_FATE_OPPSEL)) {
    ClickObject(PATH_OF_FATE_OPPSEL)
  }

  if (DetectObject(PATH_OF_FATE_6FP)) {
    ClickObject(PATH_OF_FATE_6FP)
  }

  if (DetectObject(PATH_OF_FATE_NO)) {
    ClickObject(PATH_OF_FATE_NO)
  }
  
  ; Begin the game only if a path was choosen
  if (DetectObject(PATH_OF_FATE_BEGIN) && hasSelectedPath) {
    ClickObject(PATH_OF_FATE_BEGIN)
    
    resetPathFlag(hasSelectedPath) ; Lowers the flag indicating that the path needs to be reselected for the next iteration
  }
  else if (DetectObject(PATH_OF_FATE_SINGLE)) {
    ClickObject(PATH_OF_FATE_SINGLE) ; Select the singles path

    setPathFlag(hasSelectedPath) ; Raises the flag indicating that a path was selected
  }
  else if (DetectObject(PATH_OF_FATE_DEPLOY)) {
    ClickObject(PATH_OF_FATE_DEPLOY)
  }

  if (DetectObject(PATH_OF_FATE_SKIP)) {
    ClickObject(PATH_OF_FATE_SKIP)
  }

  if (DetectObject(PATH_OF_FATE_POT)) {
    ClickObject(PATH_OF_FATE_POT)
  }

  if (DetectObject(PATH_OF_FATE_POT_YES)) {
    ClickObject(PATH_OF_FATE_POT_YES)
  }

  if (DetectObject(PATH_OF_FATE_BACK)) {
    ClickObject(PATH_OF_FATE_BACK)
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
