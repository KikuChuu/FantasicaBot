#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
detector := new Detector(generalConfiguration)
controller := new Controller
maintenanceBot := new MaintenanceBot(detector, controller)

test1() {
  maintenanceBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
