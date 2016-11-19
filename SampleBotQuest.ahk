#NoEnv
SendMode Input

#include includes/IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
detector := new Detector(generalConfiguration)
controller := new Controller
questBattleBot := new QuestBattleBot(detector, controller)
questUnitListBot := new QuestUnitListBot(detector, controller)
questAllyListBot := new QuestAllyListBot(detector, controller)
questPlacementPoints := new QuestPlacementPoints(generalConfiguration)
questPlacementBot := new QuestPlacementBot(detector, controller, questPlacementPoints)

loop {
  questPlacementBot.play()
  questBattleBot.play()
  questAllyListBot.play()
  questUnitListBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
