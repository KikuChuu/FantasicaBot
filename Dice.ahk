#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk
;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------
SetDefaultMouseSpeed 0

; ======================
; === Variables here ===
DICE_ROLL := Decorate("FANTASICA IMAGES/Event/Dice/board/roll.png")
DICE_STOP := Decorate("FANTASICA IMAGES/Event/Dice/board/stop.png")
DICE_FIGHT := Decorate("FANTASICA IMAGES/Event/Dice/board/fight.png")
DICE_NEXT := Decorate("FANTASICA IMAGES/Event/Dice/result/next.png")
DICE_BOARD := Decorate("FANTASICA IMAGES/Event/Dice/result/board.png")
DICE_CLOSE := Decorate("FANTASICA IMAGES/Event/Dice/board/close.png")
DICE_MOVE := Decorate("FANTASICA IMAGES/Event/Dice/board/move.png")
DICE_ARROW := Decorate("FANTASICA IMAGES/Event/Dice/board/arrow.png")
DICE_OPEN := Decorate("FANTASICA IMAGES/Event/Dice/board/open.png")
DICE_DICEMENU := Decorate("FANTASICA IMAGES/Event/Dice/board/dice.png")
DICE_DOUBLEDIE := Decorate("FANTASICA IMAGES/Event/Dice/board/doubledie.png")
DICE_CLOSEDIEMENU := Decorate("FANTASICA IMAGES/Event/Dice/board/closediemenu.png")
; ======================
loop
{ 
  if (DetectObject(DICE_DOUBLEDIE)) {
	ClickObject(DICE_DOUBLEDIE)
  }
	
  if (DetectObject(DICE_CLOSEDIEMENU)) {
	ClickObject(DICE_CLOSEDIEMENU)
  }

  if (DetectObject(DICE_DICEMENU, 20)) {
	ClickObject(DICE_DICEMENU, 20)
  }
  
  if (DetectObject(DICE_ROLL)) {
    ClickObject(DICE_ROLL)
  }

  if (DetectObject(DICE_STOP)) {
    ClickObject(DICE_STOP)
  }

  if (DetectObject(DICE_FIGHT)) {
    ClickObject(DICE_FIGHT)
  }

  if (DetectObject(DICE_NEXT)) {
    ClickObject(DICE_NEXT)
  }

  if (DetectObject(DICE_BOARD)) {
    ClickObject(DICE_BOARD)
  }

  if (DetectObject(DICE_CLOSE)) {
    ClickObject(DICE_CLOSE)
  }

  if (DetectObject(DICE_MOVE)) {
    ClickObject(DICE_MOVE)
  }
  
  if (DetectObject(DICE_ARROW,50)) {
	ClickObject(DICE_ARROW, 50)
  }
  
  if (DetectObject(DICE_OPEN)) {
	ClickObject(DICE_OPEN)
  }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
