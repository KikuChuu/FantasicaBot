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
CLASH_FIGHT := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/fight.png")
CLASH_NO := Decorate("FANTASICA IMAGES/Event/ClashofLegends/selection/no.png")
CLASH_START := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/start.png")
CLASH_YES := Decorate("FANTASICA IMAGES/Event/ClashofLegends/preparation/yes.png")
CLASH_SKIP := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/skip.png")
CLASH_SKIP_ACTIVE := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/skipactive.png")
CLASH_OFFENSIVE_SKILL := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/offensiveskill.png")
CLASH_DEFENSIVE_SKILL := Decorate("FANTASICA IMAGES/Event/ClashofLegends/battle/defensiveskill.png")
CLASH_BATTLE := Decorate("FANTASICA IMAGES/Event/ClashofLegends/result/battle.png")
; ======================
loop
{
  if (DetectObject(CLASH_FIGHT)) {
    ClickObject(CLASH_FIGHT)
  }

  if (DetectObject(CLASH_NO)) {
    ClickObject(CLASH_NO)
  }

  if (DetectObject(CLASH_START)) {
    ClickObject(CLASH_START)
  }

  if (DetectObject(CLASH_YES)) {
    ClickObject(CLASH_YES)
  }

  if (DetectObject(CLASH_SKIP)) {
    ClickObject(CLASH_SKIP)
  }

  if (DetectObject(CLASH_SKIP_ACTIVE)) {
    if (DetectObject(CLASH_OFFENSIVE_SKILL, 50)) {
      ClickObject(CLASH_OFFENSIVE_SKILL, 50)
    }
    else if (DetectObject(CLASH_DEFENSIVE_SKILL, 50)) {
      ClickObject(CLASH_DEFENSIVE_SKILL, 50)
    }
  }

  if (DetectObject(CLASH_BATTLE)) {
    ClickObject(CLASH_BATTLE)
  }
}
; ==============================================================================

F1::ExitApp
F2::Pause
F3::Reload
