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
TACTICS_EVENTICON := Decorate("FANTASICA IMAGES/Event/Tactics/eventicon.png")
TACTICS_BATTLE := Decorate("FANTASICA IMAGES/Event/Tactics/battle.png")
TACTICS_SKIP_PRESSED := Decorate("FANTASICA IMAGES/Event/Tactics/battle/skippressed.png")
TACTICS_SKIP:= Decorate("FANTASICA IMAGES/Event/Tactics/battle/skip.png")
TACTICS_NEXT := Decorate("FANTASICA IMAGES/Event/Tactics/results/next.png")
TACTICS_TOP := Decorate("FANTASICA IMAGES/Event/Tactics/results/top.png")
TACTICS_BOSS := Decorate("FANTASICA IMAGES/Event/Tactics/boss.png")
TACTICS_NO := Decorate("FANTASICA IMAGES/Event/Tactics/no.png")
TACTICS_FORMTEAM := Decorate("FANTASICA IMAGES/Event/Tactics/formteam.png")
TACTICS_ALL := Decorate("FANTASICA IMAGES/Event/Tactics/battle/all.png")
TACTICS_AUTO := Decorate("FANTASICA IMAGES/Event/Tactics/battle/auto.png")
; ======================
loop
{
  if (DetectObject(TACTICS_EVENTICON)) {
    ClickObject(TACTICS_EVENTICON)
  }  

  if (DetectObject(TACTICS_FORMTEAM)) {
    ClickObject(TACTICS_FORMTEAM)
  }

  if (DetectObject(TACTICS_BATTLE)) {
    ClickObject(TACTICS_BATTLE)
  }

  if (DetectObject(TACTICS_BOSS)) {
    ClickObject(TACTICS_BOSS)
  }

  if (DetectObject(TACTICS_NO)) {
    ClickObject(TACTICS_NO)
  }

  if (DetectObject(TACTICS_AUTO)) {
    ClickObject(TACTICS_AUTO)
  }

  if (DetectObject(TACTICS_SKIP)) {
    ClickObject(TACTICS_SKIP)
  }

  if (DetectObject(TACTICS_ALL, 75)) {
    ; Sometimes bosses are large and clicking on the icon won't 'target' them. So we need to add an offset to the buffer coord.
    ClickAt(BufferX - 50, BufferY + 100)
  }

  if (DetectObject(TACTICS_TOP)) {
    ClickObject(TACTICS_TOP)
  }

  if (DetectObject(TACTICS_NEXT)) {
    ClickObject(TACTICS_NEXT)
  }
}

F1::ExitApp
F2::Pause
F3::Reload
