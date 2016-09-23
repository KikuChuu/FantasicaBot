#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
initGlobals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;=================== QUEST ==============================
;========================================================

questBattleBot := new QuestBattleBot

test1() {
  SB_SetText("Test isQuestBattle()")
  if (questBattleBot.isQuestBattle()) {
    MsgBox % "Unit Pts detected" 
  }
  else {
    MsgBox % "Did not detect Unit Pts"
  }
  SB_SetText("Tested isQuestBattle()")
}

test2() {
  SB_SetText("Test speedUpQuest()")
  questBattleBot.speedUpQuest()
  SB_SetText("Tested speedUpQuest()")
}

test3() {
  SB_SetText("Test unitList()")
  questBattleBot.unitList()
  SB_SetText("Tested unitList()")
}

test4() {
  SB_SetText("Test allyList()")
  questBattleBot.allyList()
  SB_SetText("Tested allyList()")
}

test5() {
  SB_SetText("Test isUnitList()")
  if (questBattleBot.isUnitList()) {
    MsgBox % "The unit list is detected"
  }
  else {
    MsgBox % "Did not detect the unit list"
  }
  SB_SetText("Tested isUnitList()")
}

test6() {
  SB_SetText("Test deployUnit()")
  questBattleBot.deployUnit()
  SB_SetText("Tested deployUnit()")
}

test7() {
  SB_SetText("Test searchPoint()")
  questBattleBot.searchPoint()
  SB_SetText("Tested searchPoint()")
}
  
test8() {
  SB_SetText("Test confirmPlacement()")
  questBattleBot.confirmPlacement()
  SB_SetText("Tested confirmPlacement()")
}

test9() {
  SB_SetText("Test cancelPlacement()")
  questBattleBot.cancelPlacement()
  SB_SetText("Test cancelPlacement()")
}

test10() {
  SB_SetText("Test skipDialog()")
  questBattleBot.skipDialog()
  SB_SetText("Tested skipDialog()")
}

test11() {
  SB_SetText("Test isPlacingUnit()")
  if (questBattleBot.isPlacingUnit()) {
    MsgBox % "Test 8 -- PASSED"
  }
  else {
    MsgBox % "Test 8 -- INVALID USAGE"
  }
  SB_SetText("Tested isPlacingUnit()")
}

test12() {
  SB_SetText("Test isAllyList()")
  result := ""
  if (questBattleBot.isAllyList()) {
    result := "PASSED"
  }
  else {
    result := "INVALID USAGE"
  }
  SB_SetText("Tested isAllyList() -- " . result)
}

test13() {
  SB_SetText("Test deployAlly()")
  questBattleBot.deployAlly()
  SB_SetText("Tested deployAlly()")
}

test14() {
  SB_SetText("Test exitUnitList()")
  questBattleBot.exitUnitList()
  SB_SetText("Tested exitUnitList()")
}

test15() {
  SB_SetText("Test exitAllyList()")
  questBattleBot.exitAllyList()
  SB_SetText("Tested exitAllyList()")
}

test16() {
  SB_SetText("Test setDeployUnitOff()")
  result := ""
  questBattleBot.setDeployUnitOff()
  if (questBattleBot.getDeployUnitState() == false) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested setDeployUnitOff() -- " . result)
}

test17() {
  SB_SetText("Test setDeployUnitOn()")
  result := ""
  questBattleBot.setDeployUnitOn()
  if (questBattleBot.getDeployUnitState() == true) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested setDeployUnitOn() -- " . result)
}

test18() {
  SB_SetText("Test setDeployAllyOff()")
  result := ""
  questBattleBot.setDeployAllyOff()
  if (questBattleBot.getDeployAllyState() == false) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested setDeployAllyOff() -- " . result)
}

test19() {
  SB_SetText("Test setDeployAllyOn()")
  result := ""
  questBattleBot.setDeployAllyOn()
  if (questBattleBot.getDeployAllyState() == true) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested setDeployAllyOn() -- " . result)
}

test20() {
  SB_SetText("Test cancelDeployUnit()")
  questBattleBot.cancelDeployUnit()
  SB_SetText("Tested cancelDeployUnit()")
}

test21() {
  SB_SetText("Test cancelDeployAlly()")
  questBattleBot.cancelDeployAlly()
  SB_SetText("Tested cancelDeployAlly()")
}

test22() {
  SB_SetText("Test setMapSquareStateOff()")
  result := ""
  questBattleBot.setMapSquareStateOff()
  if (questBattleBot.getMapSquareState() == false) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested setMapSquareStateOff() -- " . result)
}

test23() {
  SB_SetText("Test setMapSquareStateOn()")
  result := ""
  questBattleBot.setMapSquareStateOn()
  if (questBattleBot.getMapSquareState() == true) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Test setMapSquareStateOn() -- " . result)
}

test24() {
  SB_SetText("Test isMapFull()")
  result := ""
  questBattleBot.setMapSquareStateOff()
  if (questBattleBot.isMapFull() == true) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isMapFull() -- " . result)
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
F9::test6()
F10::test7()
F11::test8()
F12::test9()
^F1::test10()
^F2::test11()
^F3::test12()
^F4::test13()
^F5::test14()
^F6::test15()
^F7::test16()
^F8::test17()
^F9::test18()
^F10::test19()
^F11::test20()
^F12::test21()
!F1::test22()
!F2::test23()
!F3::test24()

