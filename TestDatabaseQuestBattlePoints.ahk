#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

databaseQuestBattlePoints := new DatabaseQuestBattlePoints

test1() {
  SB_SetText("Test getKeysFromDatabase(1, 1)")
  keys := databaseQuestBattlePoints.getKeysFromDatabase(1, 1)
  result := ""
  if (keys.length() > 0) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }

  strKeys := ""
  loop % keys.length() {
    strKeys .= keys[A_Index] . "`n"
  }
  MsgBox % "Key list`n" . strKeys
  SB_SetText("Tested getKeysFromDatabase(1, 1)")
}

test2() {
  SB_SetText("Test getKeysFromDatabase(64, 11)")
  keys := databaseQuestBattlePoints.getKeysFromDatabase(64, 11)
  if (keys.length() > 0) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }

  strKeys := ""
  loop % keys.length() {
    strKeys .= keys[A_Index] . "`n"
  }
  MsgBox % "Key list`n" . strKeys
  SB_SetText("Tested getKeysFromDatabase(64, 11)")
}

test3() {
  keys := ["a15", "o1", "b7"]
  SB_SetText("Test incrementPriority(1, 1, keys)")
  databaseQuestBattlePoints.incrementPriority(1, 1, keys)
  SB_SetText("Tested incrementPriority(1, 1, keys)")
}

test4() {
  keys := ["a15", "o1", "b7"]
  SB_SetText("Test decrementPriority(1, 1, keys)")
  databaseQuestBattlePoints.decrementPriority(1, 1, keys)
  SB_SetText("Tested decrementPriority(1, 1, keys)")
}
F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
