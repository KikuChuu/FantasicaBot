#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
questConfiguration := new QuestConfiguration(QUEST_EPISODE, QUEST)
detector := new Detector(generalConfiguration)
controller := new Controller
allQuestResultsBot := new AllQuestResultsBot(questConfiguration, detector, controller)

test1() {
  allQuestResultsBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
