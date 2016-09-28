#NoEnv
SendMode input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%/includes/IncludeScript.ahk

screenBot := new ScreenBot

test1() {
  SB_SetText("Test getTitle()")
  title := screenBot.getTitle()
  result := ""
  if (title == "") {
    result := "FAILED"
  }
  else if (title == "Bluestacks App Player" || title == "BlueStacks App Player") {
    result := "PASSED"
    MsgBox % "The title is " . title
  }
  SB_SetText("Tested getTitle() -- " . result)
}


F1::ExitApp
F2::Pause
F3::Reload
