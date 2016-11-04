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
mainPageBot := new MainPageBot("TOWER")
maintenanceBot := new MaintenanceBot
towerBattleBot := new TowerBattleBot(TOWER_FLOOR, DEPLOY_NUMBER)
towerBot := new TowerBot
towerResultsBot := new TowerResultsBot(towerBattleBot)
startPageBot := new StartPageBot(towerBattleBot)

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
  questResultsBot.play(true)
  startPageBot.play()
  towerBattleBot.play()
  towerBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
