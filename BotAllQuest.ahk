#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
allyApprovalPageBot := new AllyApprovalPageBot
allyPageBot := new AllyPageBot
appPlayerBot := new AppPlayerBot
bingoBot := new BingoBot
clubRookBot := new ClubRookBot
connectionErrorBot := new ConnectionErrorBot
loginBonusBot := new LoginBonusBot
mainPageBot := new MainPageBot
maintenanceBot := new MaintenanceBot
questBattleBot := new QuestBattleBot(QUEST_EPISODE, QUEST, DEPLOY_NUMBER)
questMenuBot := new QuestMenuBot
questResultsBot := new QuestResultsBot(questBattleBot)
startPageBot := new StartPageBot

; =================================================================================================
; --------------------------------- Non-member functions defs -------------------------------------
; =================================================================================================

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  allyApprovalPageBot.play()
  allyPageBot.play()
  appPlayerBot.play()
  bingoBot.play()
  clubRookBot.play()
  connectionErrorBot.play()
  mainPageBot.play(mainPageBot.QUEST)
  maintenanceBot.play()
  loginBonusBot.play()
  questBattleBot.play()
  questMenuBot.play(questBattleBot, currentEpisode, currentQuest)
  questResultsBot.play(questBattleBot)
  startPageBot.play(questBattleBot)

}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
