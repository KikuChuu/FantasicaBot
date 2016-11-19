#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller
towerPageBot := new TowerPageBot(deploymentConfiguration, detector, controller)

test1() {
  towerPageBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
