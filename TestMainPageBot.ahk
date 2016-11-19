#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
mainPageConfiguration := new MainPageConfiguration(MAIN_PAGE_MENU)
detector := new Detector(generalConfiguration)
controller := new Controller
mainPageBot := new MainPageBot(generalConfiguration, mainPageConfiguration, detector, controller)

test1() {
  mainPageBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
