#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
towerBot := new TowerBot
questBattleBot := new QuestBattleBot
resultsPageBot := new ResultsPageBot
connectionErrorBot := new connectionErrorBot
appPlayerBot := new AppPlayerBot
startPageBot := new StartPageBot
mainPageBot := new MainPageBot
bingoPageBot := new BingoPageBot
loginBonusPageBot := new LoginBonusPageBot
clubRookPageBot := new ClubRookPageBot
questAllyPageBot := new QuestAllyPageBot
questUnitPageBot := new QuestUnitPageBot

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  if (resultsPageBot.isResultsPageDetected()) {
    resultsPageBot.toTower()
  }
  else if (clubRookPageBot.isClubRookPage()) {
    clubRookPageBot.exitPage()
  }
  else if (questBattleBot.isPlacingUnit()) {
    if (questBattleBot.isMapFull() == true) {
      questBattleBot.cancelPlacement()
    }
    else if (questBattleBot.searchPoint()) {
      questBattleBot.confirmPlacement()
    }
    else {
      questBattleBot.setMapSquareStateOff()
      questBattleBot.setDeployUnitOff()
      questBattleBot.setDeployAllyOff()
    }
  }
  else if (questAllyPageBot.isAllyList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployAllyState() == true) {
        if (questAllyPageBot.isAlly()) {
          questAllyPageBot.deployAlly()
        }
        else {
          questBattleBot.setDeployAllyOff()
          questAllyPageBot.exitList()
        } 
      }
      else {
        questAllyPageBot.exitList()
      }
    }
    else {
      questBattleBot.setDeployAllyOff()
      questAllyPageBot.exitList()
    } 
  }
  else if (questUnitPageBot.isUnitList()) {
    if (questBattleBot.isMapFull() == false) {
      if (questBattleBot.getDeployUnitState() == true) {
        if (questUnitPageBot.isUnit()) {
          questUnitPageBot.deployUnit()
          questBattleBot.unitUsed++
          if (questBattleBot.getUnitUsed() >= questBattleBot.getUnitSize()) {
            questBattleBot.setDeployUnitOff()
          }
        }
        else {
          questUnitPageBot.exitList()
        }
      }
      else {
        questUnitPageBot.exitList()
      }
    }
    else {
      questUnitPageBot.exitList()
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

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================

F1::ExitApp
F2::Pause
F3::Reload
