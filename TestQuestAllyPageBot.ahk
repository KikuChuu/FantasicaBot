#NoEnv
SendMode input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

questAllyPageBot := new QuestAllyPageBot

test1() {
  SB_SetText("Test isAllyList()")
  result := ""
  if (questAllyPageBot.isAllyList()) {
    result := "PASSED"
  }
  else {
    result := "INVALID USAGE"
  }
  SB_SetText("Tested isAllyList() -- " . result)
}

test2() {
  SB_SetText("Test isAlly()")
  result := ""
  if (questAllyPageBot.isAlly()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isAlly() -- " . result)
}

test3() {
  SB_SetText("Test deployAlly()")
  questAllyPageBot.deployAlly()
  SB_SetText("Tested deployAlly()")
}

test4() {
  SB_SetText("Test exitList()")
  questAllyPageBot.exitList()
  SB_SetText("Tested exitList()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
