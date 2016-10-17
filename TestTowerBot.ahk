#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

towerBot := new TowerBot

test1() {
  SB_SetText("Test isTower()")
  result := ""
  if (towerBot.isTower()) {
    result := "PASSED"
  }
  else {
    result := "FAILED or INVALID USAGE"
  }
  SB_SetText("Tested isTower() -- " . result)
}

test2() {
  SB_SetText("Test startTower()")
  towerBot.startTower() 
  SB_SetText("Tested startTower()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
