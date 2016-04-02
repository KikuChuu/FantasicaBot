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
DICE_NEXT := Decorate("FANTASICA IMAGES/Event/Dice/board/next.png")
; ======================

loop
{
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
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
