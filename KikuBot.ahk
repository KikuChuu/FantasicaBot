#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
appPlayerBot := new AppPlayerBot
bingoPageBot := new BingoPageBot
clubRookPageBot := new ClubRookPageBot
connectionErrorBot := new ConnectionErrorBot
loginBonusPageBot := new LoginBonusPageBot
mainPageQuestBot := new MainPageBot("QUEST")
mainPageTrainingBot := new MainPageBot("TRAINING")
maintenanceBot := new MaintenanceBot
questBattleBot := new QuestBattleBot(QUEST_EPISODE, QUEST, DEPLOY_NUMBER)
questMenuBot := new QuestMenuBot(questBattleBot)
questResultsBot := new QuestResultsBot(questBattleBot)
startPageBot := new StartPageBot(questBattleBot)
trainingPageBot := new TrainingPageBot(TRAINING_EPISODE, STAGE)
trainingBot := new TrainingBot(trainingPageBot)


; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  appPlayerBot.play()
  bingoPageBot.play()
  clubRookPageBot.play()
  connectionErrorBot.play()
  loginBonusPageBot.play()
  mainPageQuestBot.play()
  mainPageTrainingBot.play()
  maintenanceBot.play()
  questAllyPageBot.play()
  questBattleBot.play()
  questMenuBot.play()
  questUnitPageBot.play()
  questResultsBot.play(true)
  startPageBot.play()
  trainingBot.play(true)
  trainingPageBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
