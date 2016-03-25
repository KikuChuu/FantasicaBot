#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
Init_globals() ; Found in GlobalConstants.ahk
;--------------------------------------------
SetDefaultMouseSpeed 0

MsgBox % A_WinDelay

; ======================
; === Variables here ===
LEGION_SEAAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/seaarea.png")
LEGION_YES := Decorate("FANTASICA IMAGES/Event/LegionBattle/yes.png")
; ======================
loop
{
  if (DetectObject(LEGION_SEAAREA)) {
    ClickObject(LEGION_SEAAREA)
  }

  if (DetectObject(LEGION_YES)) {
    ClickObject(LEGION_YES)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
