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
mainPageBot := new MainPageBot("QUEST")
maintenanceBot := new MaintenanceBot
questBattleBot := new QuestBattleBot(QUEST_EPISODE, QUEST, DEPLOY_NUMBER)
questMenuBot := new QuestMenuBot(questBattleBot)
questResultsBot := new QuestResultsBot(questBattleBot)
startPageBot := new StartPageBot(questBattleBot)

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
  mainPageBot.play()
  maintenanceBot.play()
  loginBonusBot.play()
  questBattleBot.play()
  questMenuBot.play()
  questResultsBot.play(false)
  startPageBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
