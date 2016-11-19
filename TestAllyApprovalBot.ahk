#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include includes/IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
detector := new Detector(generalConfiguration)
controller := new Controller
allyApprovalBot := new AllyApprovalBot(detector, controller)

test1() {
  allyApprovalBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
