#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk


towerBot := new TowerBot
questBattleBot := new QuestBattleBot
resultsPageBot := new ResultsPageBot
connectionErrorBot := new connectionErrorBot
appPlayerBot := new AppPlayerBot
startPageBot := new StartPageBot
mainPageBot := new MainPageBot
bingoPageBot := new BingoPageBot
loginBonusPageBot := new LoginBonusPageBot

loop
{
  if (resultsPageBot.isResultsPageDetected()) {
    resultsPageBot.toTower()
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
  else if (towerBot.isTower()) {
    questBattleBot.setDeployUnitOn()
    questBattleBot.setDeployAllyOn()
    questBattleBot.setMapSquareStateOn()
    questBattleBot.setUnitUsed(questBattleBot.DEFAULT_UNIT_USED_VALUE)
    towerBot.startTower() 
  }
  else if (appPlayerBot.isAppPlayerHomePage()) {
    if (appPlayerBot.isFantasicaRecentlyPlayed()) {
      appPlayerBot.startGame() 
    }
  }
  else if (connectionErrorBot.isConnectionError()) {
    connectionErrorBot.startPage()  
  }
  else if (connectionErrorBot.isConnectionErrorRequiresRestart()) {
    connectionErrorBot.exitGame()
  }
  else if (startPageBot.isQuestInterrupted()) {
    startPageBot.resumeQuest()
  } 
  else if (startPageBot.isStartPage()) {
    if (startPageBot.isGameUnderMaintenance()) {
      startPageBot.quitGame()
    }
    else {
      questBattleBot.setDeployUnitOn()
      questBattleBot.setDeployAllyOn()
      questBattleBot.setMapSquareStateOn()
      questBattleBot.setUnitUsed(questBattleBot.DEFAULT_UNIT_USED_VALUE)
      startPageBot.startGame()
    }
  }
  else if (mainPageBot.isAnnouncement()) {
    mainPageBot.closeAnnouncement()
  }
  else if (mainPageBot.isMainPage()) {
    mainPageBot.selectMenu(mainPageBot.TOWER)
  }
  else if (bingoPageBot.isBingoPage()) {
    bingoPageBot.doBingo()
  }
  else if (loginBonusPageBot.isLoginBonusPage()) {
    loginBonusPageBot.selectMyPage()
  }
}


F1::ExitApp
F2::Pause
F3::Reload
