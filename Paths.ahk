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


; ===========================================
; ------------ Variables here ---------------
PATH_OF_FATE_BATTLE := Decorate("FANTASICA IMAGES/Event/PathOfFate/battle.png")
PATH_OF_FATE_OPPSEL := Decorate("FANTASICA IMAGES/Event/PathOfFate/OpponentSelection/battle.png")
PATH_OF_FATE_6FP := Decorate("FANTASICA IMAGES/Event/PathOfFate/OpponentSelection/6fp.png")
PATH_OF_FATE_NO := Decorate("FANTASICA IMAGES/Event/PathOfFate/OpponentSelection/no.png")
PATH_OF_FATE_DEPLOY := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/deploy.png")
PATH_OF_FATE_SINGLE := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/singlepath.png")
PATH_OF_FATE_BEGIN := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/begin.png")
PATH_OF_FATE_SKIP := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/skip.png")
PATH_OF_FATE_POT := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/potion.png")
PATH_OF_FATE_POT_YES := Decorate("FANTASICA IMAGES/Event/PathOfFate/GameBoard/yes.png")
PATH_OF_FATE_BACK := Decorate("FANTASICA IMAGES/Event/PathOfFate/result/back.png")
PATH_OF_FATE_ARCHRIVAL := Decorate("FANTASICA IMAGES/Event/PathsOfFate/archrival.png")
; ===========================================

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
  
  if (DetectObject(PATH_OF_FATE_DEPLOY)) {
    ClickObject(PATH_OF_FATE_DEPLOY)
  }

  if (DetectObject(PATH_OF_FATE_SINGLE)) {
    ClickObject(PATH_OF_FATE_SINGLE)
  }

  if (DetectObject(PATH_OF_FATE_BEGIN)) {
    ClickObject(PATH_OF_FATE_BEGIN)
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
