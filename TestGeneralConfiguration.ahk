#NoEnv
Sendmode Input
SetWorkingDir %A_ScriptDir%

#include includes/IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)

test1() {
  msgBox % generalConfiguration.getWidth()
  msgBox % generalConfiguration.getHeight()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
