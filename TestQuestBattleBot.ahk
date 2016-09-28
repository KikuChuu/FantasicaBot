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
  result := ""
  if (questBattleBot.isQuestBattle()) {
    MsgBox % "Unit Pts detected" 
    result := "PASSED"
  }
  else {
    MsgBox % "Did not detect Unit Pts"
    result := "FAILED"
  }
  SB_SetText("Tested isQuestBattle() . " . result)
}

test2() {
  SB_SetText("Test speedUpQuest()")
  questBattleBot.speedUpQuest()
  SB_SetText("Tested speedUpQuest()")
}

test3() {
  SB_SetText("Test isUnitListAvailable()")
  result := ""
  if (questBattleBot.isUnitListAvailable()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isUnitListAvailable() -- " . result)
}

test4() {
  SB_SetText("Test unitList()")
  questBattleBot.unitList()
  SB_SetText("Tested unitList()")
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
  SB_SetText("Test isUnit()")
  result := ""
  if (questBattleBot.isUnit()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isUnit() -- " . result)
}

test7() {
  SB_SetText("Test deployUnit()")
  questBattleBot.deployUnit()
  SB_SetText("Tested deployUnit()")
}

test8() {
  SB_SetText("Test searchPoint()")
  questBattleBot.searchPoint()
  SB_SetText("Tested searchPoint()")
}
  
test9() {
  SB_SetText("Test confirmPlacement()")
  questBattleBot.confirmPlacement()
  SB_SetText("Tested confirmPlacement()")
}

test10() {
  SB_SetText("Test cancelPlacement()")
  questBattleBot.cancelPlacement()
  SB_SetText("Test cancelPlacement()")
}

test11() {
  SB_SetText("Test isAllyListAvailable()")
  result := ""
  if (questBattleBot.isAllyListAvailable()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isAllyListAvailable() -- " . result)
}

test12() {
  SB_SetText("Test allyList()")
  questBattleBot.allyList()
  SB_SetText("Tested allyList()")
}

test13() {
  SB_SetText("Test skipDialog()")
  questBattleBot.skipDialog()
  SB_SetText("Tested skipDialog()")
}

test14() {
  SB_SetText("Test isPlacingUnit()")
  if (questBattleBot.isPlacingUnit()) {
    MsgBox % "Test 8 -- PASSED"
  }
  else {
    MsgBox % "Test 8 -- INVALID USAGE"
  }
  SB_SetText("Tested isPlacingUnit()")
}

test15() {
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

test16() {
  SB_SetText("Test isAlly()")
  result := ""
  if (questBattleBot.isAlly()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isAlly() -- " . result)
}

test17() {
  SB_SetText("Test deployAlly()")
  questBattleBot.deployAlly()
  SB_SetText("Tested deployAlly()")
}

test18() {
  SB_SetText("Test exitUnitList()")
  questBattleBot.exitUnitList()
  SB_SetText("Tested exitUnitList()")
}

test19() {
  SB_SetText("Test exitAllyList()")
  questBattleBot.exitAllyList()
  SB_SetText("Tested exitAllyList()")
}

test20() {
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

test21() {
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

test22() {
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

test23() {
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

test24() {
  SB_SetText("Test cancelDeployUnit()")
  questBattleBot.cancelDeployUnit()
  SB_SetText("Tested cancelDeployUnit()")
}

test25() {
  SB_SetText("Test cancelDeployAlly()")
  questBattleBot.cancelDeployAlly()
  SB_SetText("Tested cancelDeployAlly()")
}

test26() {
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

test27() {
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

test28() {
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

test29() {
  SB_SetText("Test getUnitSize()")
  MsgBox % questBattleBot.getUnitSize()
  SB_SetText("Tested getUnitSize()")
} 

test30() {
  SB_SetText("Test getUnitUsed()")
  MsgBox % questBattleBot.getUnitUsed()
  SB_SetText("Tested getUnitUsed()")
} 

test31() {
  SB_SetText("Test deployUnitAndUpdateUsed()")
  questBattleBot.deployUnitAndUpdateUsed()
  MsgBox % "Updated unitUsed to " . questBattleBot.getUnitUsed()
  SB_SetText("Tested deployUnitAndUpdateUsed()")
}

test32() {
  SB_SetText("Test resetUnitUsed()")
  questBattleBot.resetUnitUsed()
  result := questBattleBot.getUnitUsed()
  SB_SetText("Tested resetUnitUed() -- Resetted to " . result)
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
!F4::test25()
!F5::test26()
!F6::test27()
!F7::test28()
!F8::test29()
!F9::test30()
!F10::test31()
!F11::test32()
