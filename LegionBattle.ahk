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
LEGION_SPECIAL_AREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/specialarea.png")
LEGION_YESAREA := Decorate("FANTASICA IMAGES/Event/LegionBattle/yes.png")
LEGION_WALK := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/walk.png")
LEGION_HEAL := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/heal.png")
LEGION_SENDBRAVE := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/sendbrave.png")
LEGION_WALK_AFTER_SENT_BRAVE := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/walk_after_sent_brave.png")
LEGION_FIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/fight.png")
LEGION_YESFIGHT := Decorate("FANTASICA IMAGES/Event/LegionBattle/area/yes.png")
LEGION_AUTOBATTLE := Decorate("FANTASICA IMAGES/Event/LegionBattle/battle/autobattle.png")
LEGION_FIELD_CLEARED_BACK := Decorate("FANTASICA IMAGES/Event/LegionBattle/arearesult/back.png")
LEGION_FIELD_CLEARED := Decorate("FANTASICA IMAGES/Event/LegionBattle/arearesult/fieldcleared.png")
LEGION_BACK := Decorate("FANTASICA IMAGES/Event/LegionBattle/result/back.png")
LEGION_ARCH_ENEMY_LIST := Decorate("FANTASICA IMAGES/Event/LegionBattle/archenemylist/archenemylist.png")
LEGION_RESULT := Decorate("FANTASICA IMAGES/Event/LegionBattle/result/result.png")
; ======================
loop
{
  if (DetectObject(LEGION_RESULT)) {
    ClickObject(LEGION_FIELD_CLEARED_BACK)
  }

  if (DetectObject(LEGION_SPECIAL_AREA)) {
    ClickObject(LEGION_SPECIAL_AREA)
  } 
  else if (DetectObject(LEGION_SEAAREA)) {
    ClickObject(LEGION_SEAAREA)
  }

  if (DetectObject(LEGION_YESAREA)) {
    ClickObject(LEGION_YESAREA)
  }

  if (DetectObject(LEGION_WALK)) {
    ClickObject(LEGION_WALK)
  }

  if (DetectObject(LEGION_HEAL)) {
    ClickObject(LEGION_FIELD_CLEARED_BACK)
  }

  if (DetectObject(LEGION_ARCH_ENEMY_LIST)) {
    ClickObject(LEGION_FIELD_CLEARED_BACK)
  }

  if (DetectObject(LEGION_WALK_AFTER_SENT_BRAVE)) {
    ClickObject(LEGION_WALK_AFTER_SENT_BRAVE)
  }

  if (DetectObject(LEGION_SENDBRAVE)) {
    ClickObject(LEGION_SENDBRAVE)
  }

  if (DetectObject(LEGION_FIGHT)) {
    ClickObject(LEGION_FIGHT)
  }

  if (DetectObject(LEGION_YESFIGHT)) {
    ClickObject(LEGION_YESFIGHT)
  }

  if (DetectObject(LEGION_AUTOBATTLE)) {
    ClickObject(LEGION_AUTOBATTLE)
  }

  if (DetectObject(LEGION_FIELD_CLEARED)) {
    ClickObject(LEGION_FIELD_CLEARED_BACK)
  }

  if (DetectObject(LEGION_BACK)) {
    ClickObject(LEGION_BACK)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
