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
LEGION_SEAAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/seaarea.png")
LEGION_YESAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/yes.png")
LEGION_WALK := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/walk.png")
LEGION_FIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/fight.png")
LEGION_YESFIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/yes.png")
; ======================
loop
{
  if (DetectObject(LEGION_SEAAREA)) {
    ClickObject(LEGION_SEAAREA)
  }

  if (DetectObject(LEGION_YESAREA)) {
    ClickObject(LEGION_YESAREA)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
