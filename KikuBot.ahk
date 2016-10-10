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
mainPageBot := new MainPageBot
questAllyPageBot := new QuestAllyPageBot
questBattleBot := new QuestBattleBot
questMenuBot := new QuestMenuBot
questUnitPageBot := new QuestUnitPageBot
resultsPageBot := new ResultsPageBot
startPageBot := new StartPageBot
trainingBot := new TrainingBot
trainingPageBot := new TrainingPageBot

currentQuestEpisode := QUEST_EPISODE 
currentQuest := QUEST

currentTrainingEpisode := TRAINING_EPISODE
currentStage := STAGE


; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  if (connectionErrorBot.isConnectionError()) {
    connectionErrorBot.startPage()
  }
  else if (connectionErrorBot.isConnectionErrorRequiresRestart()) {
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
    sleep 5000
  }
  else if (resultsPageBot.isResultsPageDetected()) {
    if (resultsPageBot.isQuestCleared()) {
      loop % questBattleBot.keys.length() {
        key := questBattleBot.keys[A_Index]
        questBattleBot.databaseQuestBattlePoints.incrementPriority(key)
      }

      if (questBattleBot.databaseQuestBattlePoints.getKeySetSize() > 0) {
        questBattleBot.databaseQuestBattlePoints.writeToTable(currentQuestEpisode, currentQuest)
      }

      questBattleBot.clearKeys()
      resultsPageBot.toQuestMenu() 
    }
    else {
      loop % questBattleBot.keys.length() {
        key := questBattleBot.keys[A_Index]
        questBattleBot.databaseQuestBattlePoints.decrementPriority(key)
      }

      if (questBattleBot.databaseQuestBattlePoints.getKeySetSize() > 0) {
        questBattleBot.databaseQuestBattlePoints.writeToTable(currentQuestEpisode, currentQuest)
      }

      questBattleBot.clearKeys()
      resultsPageBot.toMainPage()
    }
  }
  else if (questBattleBot.isPlacingUnit()) {
    if (questBattleBot.isMapFull() == true) {
      questBattleBot.cancelPlacement()
    }
    else if (questBattleBot.searchDatabasePoint(currentQuestEpisode, currentQuest)) {
      questBattleBot.pushKey(questBattleBot.databaseQuestBattlePoints.key)
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
      questMenuBot.selectEpisode(currentQuestEpisode)
    }
    else if (questMenuBot.selectQuest(currentQuestEpisode, currentQuest)) {
      questBattleBot.databaseQuestBattlePoints.clear()
      questBattleBot.databaseQuestBattlePoints.readFromDatabase(currentQuestEpisode, currentQuest)
    }
    else {
      questMenuBot.episodeList()
    }
  }
  else if (trainingBot.isTraining()) {
    if (trainingBot.isExitTraining()) {
      trainingBot.advance()
      trainingBot.summonAlly()
      trainingBot.fight()
      trainingBot.exitTraining()
    }
  }
  else if (trainingBot.isCard()) {
    trainingBot.continueTraining()
  }
  else if (trainingBot.isFriend()) {
    trainingBot.continueTraining()
  }
  else if (trainingPageBot.isTrainingPage()) {
    trainingPageBot.selectStage(currentTrainingEpisode, currentStage)
  }
  else if (mainPageBot.isMainPage()) {
    if (mainPageBot.isQuestCooldownDone()) {
      mainPageBot.selectMenu(mainPageBot.QUEST)
    }
    else {
      mainPageBot.selectMenu(mainPageBot.TRAINING)
    }
  }
  else if (mainPageBot.isAnnouncement()) {
    mainPageBot.closeAnnouncement()
  }
}

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
