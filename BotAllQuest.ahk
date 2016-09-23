#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
initGlobals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;=================== QUEST ==============================
;========================================================

appPlayerBot := new AppPlayerBot
clubRookPageBot := new ClubRookPageBot
loginBonusPageBot := new LoginBonusPageBot
bingoPageBot := new BingoPageBot
connectionErrorBot := new ConnectionErrorBot
mainPageBot := new MainPageBot
questMenuBot := new QuestMenuBot
questBattleBot := new QuestBattleBot
resultsPageBot := new ResultsPageBot
startPageBot := new StartPageBot
currentEpisode := 1
currentQuest := 1

updateQuestProgress() {
  global currentEpisode, currentQuest
  
  currentQuest++
  x := currentQuest // (questMenuBot.getQuestCount(currentEpisode) + 1)
  y := Mod(currentQuest, (questMenuBot.getQuestCount(currentEpisode) + 1))
  currentEpisode += x
  if (y == 0) {
    currentQuest := 1
  }
  else {
    currentQuest := y
  }
}

; Initialize some variables
loop
{
  mainPageBot.closeAnnouncement()

  if (connectionErrorBot.isConnectionError()) {
    connectionErrorBot.startPage()
  }
  else if (connectionError.isConnectionErrorRequiresRestart()) {
    connectionErrorBot.exitGame()
  }
  else if (appPlayerBot.isAppPlayerHomePage()) {
    if (appPlayerBot.isFantasicaRecentlyPlayed()) {
      appPlayerBot.startGame()
    }
    else {
      appPlayerBot.openAppDrawer()
      appPlayerBot.startGame()
    }
  }
  else if (startPageBot.isStartPage()) {
    questBattleBot.setMapSquareStateOn()
    questBattleBot.setDeployUnitOn()
    questBattleBot.setDeployAllyOn()
    startPageBot.startGame()
    startPageBot.resumeQuest()
  }
  else if (clubRookPageBot.isClubRookPage()) {
    clubRookPageBot.exitPage()
  }
  else if (loginBonusPageBot.isLoginBonusPage()) {
    loginBonusPageBot.selectMyPage()
  }
  else if (bingoPageBot.isBingoPage()) {
    bingoPageBot.doBingo()
  }
  else if (resultsPageBot.isResultsPageDetected()) {
    if (resultsPageBot.isQuestCleared()) {
      updateQuestProgress()
      resultsPageBot.toQuestMenu() 
    }
    else {
      resultsPageBot.toMainPage()
    }
  }
  else if (questBattleBot.isPlacingUnit()) {
    if (questBattleBot.isMapFull() == true) {
      questBattleBot.cancelDeployUnit()
      questBattleBot.cancelDeployAlly()
    }
    else if (questBattleBot.searchPoint()) {
      questBattleBot.confirmPlacement()
    }
  }
  else if (questBattleBot.isUnitList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployUnitState() == true) {
        questBattleBot.deployUnit()
      }
    }
    questBattleBot.exitUnitList()
  }
  else if (questBattleBot.isAllyList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployAllyState() == true) {
        questBattleBot.deployAlly()
      } 
    }
    questBattleBot.exitAllyList()
  }
  else if (questBattleBot.isQuestBattle()) {
    questBattleBot.skipDialog()
    
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployUnitState() == true) {
        questBattleBot.unitList()
      }
      if (questBattleBot.getDeployAllyState() == true) {
        questBattleBot.allyList()
      }
    }
  }
  else if (questMenuBot.isQuestMenuDetected()) {
    questBattleBot.setMapSquareStateOn()
    questBattleBot.setDeployUnitOn()
    questBattleBot.setDeployAllyOn()

    if (questMenuBot.isEpisodeSelection()) {
      questMenuBot.selectEpisode(currentEpisode)
    }
    else if (questMenuBot.selectQuest(currentEpisode, currentQuest) == false) {
      questMenuBot.episodeList()
    }
  }
  else if (mainPageBot.isQuestCooldownDone()) {
    mainPageBot.selectMenu(mainPageBot.QUEST)
  }
}


F1::ExitApp
F2::Pause
F3::Reload
