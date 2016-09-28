#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; Define some variables
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
currentEpisode := EPISODE
currentQuest := QUEST


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
    questBattleBot.setUnitUsed(questBattleBot.DEFAULT_UNIT_USED_VALUE)

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
      questBattleBot.cancelPlacement()
    }
    else if (questBattleBot.searchPoint()) {
      questBattleBot.confirmPlacement()
    }
  }
  else if (questBattleBot.isAllyList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployAllyState() == true) {
        if (questBattleBot.isAlly()) {
          questBattleBot.deployAlly()
        }
        else {
          questBattleBot.setDeployAllyOff()
          questBattleBot.exitAllyList()
        } 
      }
      else {
        questBattleBot.exitAllyList()
      }
    }
    else {
      questBattleBot.setDeployAllyOff()
      questBattleBot.exitAllyList()
    } 
  }
  else if (questBattleBot.isUnitList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployUnitState() == true) {
        if (questBattleBot.isUnit()) {
          questBattleBot.deployUnit()
          questBattleBot.unitUsed++
          if (questBattleBot.getUnitUsed() >= questBattleBot.getUnitSize()) {
            questBattleBot.setDeployUnitOff()
          }
        }
        else {
          questBattleBot.exitUnitList()
        }
      }
      else {
        questBattleBot.exitUnitList()
      }
    }
    else {
      questBattleBot.exitUnitList()
    }
  }
  else if (questBattleBot.isQuestBattle()) {
    questBattleBot.skipDialog()

    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployAllyState() == true) {
        if (questBattleBot.isAllyListAvailable()) {
          questBattleBot.allyList()
        }
        else {
          questBattleBot.setDeployAllyOff()
        }
      }
      else if (questBattleBot.getDeployUnitState() == true) {
        if (questBattleBot.isUnitListAvailable()) {
          questBattleBot.unitList()
        }
        else {
          questBattleBot.setDeployUnitOff()
        }
      }
      else {
        questBattleBot.speedUpQuest()
      }
    }
    else {
      questBattleBot.speedUpQuest()
    }
  }
  else if (questMenuBot.isQuestMenuDetected()) {
    questBattleBot.setMapSquareStateOn()
    questBattleBot.setDeployUnitOn()
    questBattleBot.setDeployAllyOn()
    questBattleBot.setUnitUsed(questBattleBot.DEFAULT_UNIT_USED_VALUE)

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
