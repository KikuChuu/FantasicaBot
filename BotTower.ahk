#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
mainPageConfiguration := new MainPageConfiguration(MAIN_PAGE_MENU)
deploymentConfiguration := new DeploymentConfiguration(UNIT_LIMIT, ALLY_LIMIT)
detector := new Detector(generalConfiguration)
controller := new Controller(generalConfiguration)
mainPageBot := new MainPageBot(generalConfiguration, mainPageConfiguration, detector, controller)
questPlacementPoints := new QuestPlacementPoints(generalConfiguration)
towerPageBot := new TowerPageBot(deploymentConfiguration, detector, controller)
questBattleBot := new QuestBattleBot(deploymentConfiguration, detector, controller)
questUnitListBot := new QuestUnitListBot(deploymentConfiguration, detector, controller)
questAllyListBot := new QuestAllyListBot(deploymentConfiguration, detector, controller)
questPlacementBot := new QuestPlacementBot(deploymentConfiguration, detector, controller, questPlacementPoints)
towerResultsBot := new TowerResultsBot(detector, controller)
;clubRookBot := new ClubRookBot(detector, controller)
maintenanceBot := new MaintenanceBot(detector, controller)
connectionErrorBot := new ConnectionErrorBot(detector, controller)
allyApprovalBot := new AllyApprovalBot(detector, controller)
allyPageBot := new AllyPageBot(detector, controller)
appPlayerBot := new AppPlayerBot(detector, controller)
bingoBot := new BingoBot(detector, controller)
loginBonusBot := new LoginBonusBot(detector, controller)
startPageBot := new StartPageBot(deploymentConfiguration, detector, controller)

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop {
  mainPageBot.play()
  towerPageBot.play()
  questBattleBot.play()
  questUnitListBot.play()
  questAllyListBot.play()
  questPlacementBot.play()
  towerResultsBot.play()
 ; clubRookBot.play()
  maintenanceBot.play()
  connectionErrorBot.play()
  allyApprovalBot.play()
  allyPageBot.play()
  appPlayerBot.play()
  bingoBot.play()
  loginBonusBot.play()
  startPageBot.play()
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
