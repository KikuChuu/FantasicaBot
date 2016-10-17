#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

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
  SB_SetText("Test searchPoint()")
  questBattleBot.searchPoint()
  SB_SetText("Tested searchPoint()")
}

test6() {
  SB_SetText("Test searchTowerDatabasePoint(1)")
  questBattleBot.searchTowerDatabasePoint(1)
  SB_SetText("Tested searchTowerDatabasePoint(1)")
}

test7() {
  SB_SetText("Test searchDatabasePoint(1,1)")
  questBattleBot.searchDatabasePoint(1,1)
  SB_SetText("Tested searchDatabasePoint(1,1)")
}
  
test8() {
  SB_SetText("Test confirmPlacement()")
  questBattleBot.confirmPlacement()
  SB_SetText("Tested confirmPlacement()")
}

test9() {
  SB_SetText("Test cancelPlacement()")
  questBattleBot.cancelPlacement()
  SB_SetText("Tested cancelPlacement()")
}

test10() {
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

test11() {
  SB_SetText("Test allyList()")
  questBattleBot.allyList()
  SB_SetText("Tested allyList()")
}

test12() {
  SB_SetText("Test skipDialog()")
  questBattleBot.skipDialog()
  SB_SetText("Tested skipDialog()")
}

test13() {
  SB_SetText("Test isPlacingUnit()")
  if (questBattleBot.isPlacingUnit()) {
    MsgBox % "Test 8 -- PASSED"
  }
  else {
    MsgBox % "Test 8 -- INVALID USAGE"
  }
  SB_SetText("Tested isPlacingUnit()")
}

test14() {
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

test15() {
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

test16() {
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

test17() {
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

test18() {
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

test19() {
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

test20() {
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

test21() {
  SB_SetText("Test getUnitSize()")
  MsgBox % questBattleBot.getUnitSize()
  SB_SetText("Tested getUnitSize()")
} 

test22() {
  SB_SetText("Test getUnitUsed()")
  MsgBox % questBattleBot.getUnitUsed()
  SB_SetText("Tested getUnitUsed()")
} 

test23() {
  key := "a15"
  result := ""
  SB_SetText("Test pushKey('a15')")
  questBattleBot.pushKey(key)
  if (questBattleBot.keys[1] == key) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested pushKey('a15') -- " . result)
}

test24() {
  SB_SetText("Test clearKeys()")
  result := ""
  questBattleBot.clearKeys()
  if (questBattleBot.keys.length() == 0) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested clearKeys() -- " . result)
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
^!F1::test22()
^!F2::test23()
^!F3::test24()
