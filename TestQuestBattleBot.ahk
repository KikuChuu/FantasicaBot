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
  questBattleBot.searchPoint()
  questBattleBot.placeUnit()
  SB_SetText("Tested deployUnit()")
}

test7() {
  SB_SetText("Test skipDialog()")
  questBattleBot.skipDialog()
  SB_SetText("Tested skipDialog()")
}

test8() {
  SB_SetText("Test isPlacingUnit()")
  if (questBattleBot.isPlacingUnit()) {
    MsgBox % "Test 8 -- PASSED"
  }
  else {
    MsgBox % "Test 8 -- INVALID USAGE"
  }
  SB_SetText("Tested isPlacingUnit()")
}

test9() {
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

test10() {
  SB_SetText("Test deployAlly()")
  questBattleBot.deployAlly()
  SB_SetText("Tested deployAlly()")
}

test11() {
  SB_SetText("Test exitUnitList()")
  questBattleBot.exitUnitList()
  SB_SetText("Tested exitUnitList()")
}

test12() {
  SB_SetText("Test exitAllyList()")
  questBattleBot.exitAllyList()
  SB_SetText("Tested exitAllyList()")
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
