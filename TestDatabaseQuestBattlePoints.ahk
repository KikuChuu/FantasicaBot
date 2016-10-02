#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

databaseQuestBattlePoints := new DatabaseQuestBattlePoints

test1() {
  SB_SetText("Test getKeySetSize()")
  MsgBox % databaseQuestBattlePoints.getKeySetSize()
  SB_SetText("Tested getKeySetSize()")
}

test2() {
  SB_SetText("Test readFromTable(1, 1)")
  databaseQuestBattlePoints.readFromTable(1, 1)
  result := ""
  if (databaseQuestBattlePoints.getKeySetSize() > 0) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested readFromTable(1, 1)")
}

test3() {
  SB_SetText("Test clear()")
  result := ""

  databaseQuestBattlePoints.clear()

  if (databaseQuestBattlePoints.index != 0) {
    result := "FAILED"
  }
  else if (databaseQuestBattlePoints.key != "") {
    result := "FAILED"
  }
  else if (databaseQuestBattlePoints.keys.length() != 0) {
    result := "FAILED"
  }
  else if (databaseQuestBattlePoints.points.length() != 0) {
    reuslt := "FAILED"
  }
  else if (databaseQuestBattlePoints.priorities.length() != 0) {
    result := "FAILED"
  }
  else {
    result := "PASSED"
  }
  SB_SetText("Tested clear() -- " . result) 
}

test4() {
  SB_SetText("Test nextKey()")
  output := ""
  loop % databaseQuestBattlePoints.getKeySetSize() {
    databaseQuestBattlePoints.nextKey(key)
    output .= key . "`n"
  }
  MsgBox % output
  SB_SetText("Tested nextKey()")
}

test5() {
  SB_SetText("Test getPoint()")
  output := ""
  loop % databaseQuestBattlePoints.getKeySetSize() {
    databaseQuestBattlePoints.nextKey(key)
    point := databaseQuestBattlePoints.getPoint()
    output .= key . "(" . point[1] . ", " . point[2] . ")" . "`n"
  }
  MsgBox % output
  SB_SetText("Tested getPoint()")
}

test6() {
  SB_SetText("Test priorities")
  output := "Key | Priority`n"
  loop % databaseQuestBattlePoints.getKeySetSize() {
    databaseQuestBattlePoints.nextKey(key)
    priority := databaseQuestBattlePoints.priorities[key]
    output .= key . " | " . priority . "`n"
  }
  MsgBox % output
  SB_SetText("Tested priorities")
}

test7() {
  SB_SetText("Test incrementPriority(keys)")
  result := ""
  keys := ["a15", "o1"]
  priorities := {}
  loop % keys.length() {
    key := keys[A_Index]
    priorities[key] := databaseQuestBattlePoints.priorities[key]
  }

  loop % keys.length() {
    key := keys[A_Index]
    databaseQuestBattlePoints.incrementPriority(key)
  }

  loop % keys.length() {
    key := keys[A_Index]
    if (priorities[key] + 1 == databaseQuestBattlePoints.priorities[key]) {
      result := "PASSED"
    }
    else {
      result := "FAILED"
    }
  }
  SB_SetText("Tested incrementPriorities(keys) -- " . result)
}

test8() {
  SB_SetText("Test decrementPriority(keys)")
  keys := ["a15", "o1"]
  priorities := {}
  loop % keys.length() {
    key := keys[A_Index]
    priorities[key] := databaseQuestBattlePoints.priorities[key]
  }

  loop % keys.length() {
    key := keys[A_Index]
    databaseQuestBattlePoints.decrementPriority(key)
  }

  loop % keys.length() {
    key := keys[A_Index]
    if (databaseQuestBattlePoints.priorities[key] + 1 == priorities[key]) {
      result := "PASSED"
    }
    else {
      result := "FAILED"
    }
  }
  SB_SetText("Tested decrementPriorities(keys) -- " . result)
}

test9() {
  SB_SetText("Test writeToTable(1, 1)")
  databaseQuestBattlePoints.writeToTable(1, 1)
  SB_SetText("Tested writeToTable(1, 1)")
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
