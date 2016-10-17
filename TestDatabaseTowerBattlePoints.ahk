#NoEnv
SetWorkingDir %A_ScriptDir%

#include includes/IncludeScript.ahk

databaseTowerBattlePoints := new databaseTowerBattlePoints

test1() {
  SB_SetText("Test readFromTable(1)")
  databaseTowerBattlePoints.readFromTable(1)

  if (databaseTowerBattlePoints.getKeySetSize() > 0) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }

  SB_SetText("Tested readFromTable(1) -- " . result)
}

test2() {
  SB_SetText("Test nextKey()")
  key := ""
  databaseTowerBattlePoints.nextKey(key)
  if (key != "") {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested nextKey() -- " . result)
}

test3() {
  SB_SetText("Test incrementPriority()")
  tmp := databaseTowerBattlePoints.priorities["a1"]
  databaseTowerBattlePoints.incrementPriority("a1")
  if (databaseTowerBattlePoints.priorities["a1"] == tmp + 1) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested incrementPriority() -- " . result)
}

test4() {
  SB_SetText("Test decrementPriority()")
  tmp := databaseTowerBattlePoints.priorities["a1"]
  databaseTowerBattlePoints.decrementPriority("a1")
  if (databaseTowerBattlePoints.priorities["a1"] + 1 == tmp) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested decrementPriority() -- " . result)
}

test5() {
  SB_SetText("Test writeToTable(1)")
  databaseTowerBattlePoints.writeToTable(1)
  SB_SetText("Tested writeToTable(1)")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
