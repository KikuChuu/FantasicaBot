#NoEnv
SendMode input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

questUnitPageBot := new QuestUnitPageBot

test1() {
  SB_SetText("Test isUnitList()")
  if (questUnitPageBot.isUnitList()) {
    MsgBox % "The unit list is detected"
  }
  else {
    MsgBox % "Did not detect the unit list"
  }
  SB_SetText("Tested isUnitList()")
}

test2() {
  SB_SetText("Test isUnit()")
  result := ""
  if (questUnitPageBot.isUnit()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isUnit() -- " . result)
}

test3() {
  SB_SetText("Test deployUnit()")
  questUnitPageBot.deployUnit()
  SB_SetText("Tested deployUnit()")
}

test4() {
  SB_SetText("Test exitList()")
  questUnitPageBot.exitList()
  SB_SetText("Tested exitList()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
