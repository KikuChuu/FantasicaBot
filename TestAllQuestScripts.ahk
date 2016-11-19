#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
questConfiguration := new QuestConfiguration(QUEST_EPISODE, QUEST)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller
questPlacementPoints := new QuestPlacementPoints(generalConfiguration)
questMenuBot := new QuestMenuBot(generalConfiguration, questConfiguration, deploymentConfiguration, detector, controller)
questBattleBot := new QuestBattleBot(deploymentConfiguration, detector, controller)
questUnitListBot := new QuestUnitListBot(deploymentConfiguration, detector, controller)
questAllyListBot := new QuestAllyListBot(deploymentConfiguration, detector, controller)
questPlacementBot := new QuestPlacementBot(deploymentConfiguration, detector, controller, questPlacementPoints)
questResultsBot := new QuestResultsBot(detector, controller)


test1() {
  questBattleBot.play()
}

test2() {
  questUnitListBot.play()
}

test3() {
  questAllyListBot.play()
}

test4() {
  questPlacementBot.play()
}

test5() {
  questMenuBot.play()
}

test6() {
  questResultsBot.play()
}
F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
F9::test6()
