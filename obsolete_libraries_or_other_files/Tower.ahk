#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
allyApprovalPageBot := new AllyApprovalPageBot
allyPageBot := new AllyPageBot
appPlayerBot := new AppPlayerBot
bingoPageBot := new BingoPageBot
clubRookPageBot := new ClubRookPageBot
connectionErrorBot := new ConnectionErrorBot
loginBonusPageBot := new LoginBonusPageBot
mainPageBot := new MainPageBot
questMenuBot := new QuestMenuBot
questBattleBot := new QuestBattleBot
questAllyPageBot := new QuestAllyPageBot
questUnitPageBot := new QuestUnitPageBot
resultsPageBot := new ResultsPageBot
startPageBot := new StartPageBot
towerBot := new TowerBot
currentFloor := TOWER_FLOOR

; Start gdi+
If !pToken := Gdip_Startup()
{
  MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
  ExitApp
}
OnExit, Exit

; =================================================================================================
; --------------------------------- Non-member functions defs -------------------------------------
; =================================================================================================
updateTowerProgress() {
  global currentFloor
  
  currentFloor++
  if (currentFloor > 20) {
    currentFloor := 1
  }
}

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  if (allyApprovalPageBot.isAllyApprovalPage()) {
    allyApprovalPageBot.allyPage()
  }
  else if (allyPageBot.isAllyPage()) {
    allyPageBot.mainPage()
  }
  else if (resultsPageBot.isResultsPageDetected()) {
    if (resultsPageBot.isQuestCleared()) {
      loop % questBattleBot.keys.length() {
        key := questBattleBot.keys[A_Index]
        questBattleBot.databaseTowerBattlePoints.incrementPriority(key)
      }

      if (questBattleBot.databaseTowerBattlePoints.getKeySetSize() > 0) {
        questBattleBot.databaseTowerBattlePoints.writeToTable(currentFloor)
      }
      updateTowerProgress()
    }
    else {
      loop % questBattleBot.keys.length() {
        key := questBattleBot.keys[A_Index]
        questBattleBot.databaseTowerBattlePoints.decrementPriority(key)
      }

      if (questBattleBot.databaseTowerBattlePoints.getKeySetSize() > 0) {
        questBattleBot.databaseTowerBattlePoints.writeToTable(currentFloor)
      }
    }

    questBattleBot.clearKeys()
    resultsPageBot.toTower()
  }
  else if (clubRookPageBot.isClubRookPage()) {
    clubRookPageBot.exitPage()
  }
  else if (questBattleBot.isPlacingUnit()) {
    if (questBattleBot.isMapFull() == true) {
      questBattleBot.cancelPlacement()
    }
    else if (questBattleBot.searchTowerDatabasePoint(currentFloor)) {
      questBattleBot.pushKey(questBattleBot.databaseTowerBattlePoints.key)
      questBattleBot.confirmPlacement()
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
        else if (questBattleBot.getDeployUnitState() == true) {
          if (questBattleBot.isUnitListAvailable()) {
            questBattleBot.unitList()
          }
          else {
            questBattleBot.speedUpQuest()
          }
        }
        else {
          questBattleBot.speedUpQuest()
        }
      }
      else if (questBattleBot.getDeployUnitState() == true) {
        if (questBattleBot.isUnitListAvailable()) {
          questBattleBot.unitList()
        }
        else {
          questBattleBot.speedUpQuest()
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

Exit:
; gdi+ may now be shutdown on exiting the program
Gdip_Shutdown(pToken)
ExitApp
Return

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================

F1::ExitApp
F2::Pause
F3::Reload
F4::prettyPrintAssociativeArray(questBattleBot.databaseTowerBattlePoints.priorities, "tower_priority.txt")
