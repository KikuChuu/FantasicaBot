#NoEnv
Sendmode Input
SetWorkingDir %A_ScriptDir%

#include includes/IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller
questPlacementPoints := new QuestPlacementPoints(generalConfiguration)
questPlacementBot := new QuestPlacementBot(deploymentConfiguration, detector, controller, questPlacementPoints)

test1() {
  questPlacementBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
