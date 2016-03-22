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
TACTICS_EVENTICON := Decorate("FANTASICA IMAGES/Event/Tactics/eventicon.png")
TACTICS_BATTLE := Decorate("FANTASICA IMAGES/Event/Tactics/battle.png")
TACTICS_SQUADINFO := Decorate("FANTASICA IMAGES/Event/Tactics/battle/squadinfo.png")
TACTICS_SKIP:= Decorate("FANTASICA IMAGES/Event/Tactics/battle/skip.png")
TACTICS_NEXT := Decorate("FANTASICA IMAGES/Event/Tactics/results/next.png")
TACTICS_TOP := Decorate("FANTASICA IMAGES/Event/Tactics/results/top.png")
TACTICS_BOSS := Decorate("FANTASICA IMAGES/Event/Tactics/boss.png")
TACTICS_NO := Decorate("FANTASICA IMAGES/Event/Tactics/no.png")
TACTICS_FORMTEAM := Decorate("FANTASICA IMAGES/Event/Tactics/formteam.png")
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

  if (DetectObject(TACTICS_SKIP)) {
    ClickObject(TACTICS_SKIP)
  }

  if (DetectObject(TACTICS_SQUADINFO)) {
    ; Squad ordering
    ; --------------
    ; 1 2 3
    ; 4 5 6
    Sleep 15000
    tempSleepTime = SLEEPTIME
    SLEEPTIME = 500
    ClickAt(130, 850) ; Squad 4
    ClickAt(340, 850) ; Squad 5
    ClickAt(130, 700) ; Squad 1
    ClickAt(340, 700) ; Squad 2
    ClickAt(550, 700) ; Squad 3
    ClickAt(550, 850) ; Squad 6
    SLEEPTIME = tempSleepTime
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
