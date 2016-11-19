#NoEnv
SendMode input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller
questAllyListBot := new QuestAllyListBot(deploymentConfiguration, detector, controller)

test1() {
  questAllyListBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
