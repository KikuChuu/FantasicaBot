#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include includes\IncludeScript.ahk

maintenanceBot := new MaintenanceBot

test1() {
  SB_SetText("Test isMaintenance()")
  if (maintenanceBot.isMaintenance()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isMaintenance() -- " . result)
}

test2() {
  SB_SetText("Test startPage()")
  maintenanceBot.startPage()
  SB_SetText("Tested startPage()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
