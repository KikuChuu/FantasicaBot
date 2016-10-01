#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk


; =================================================================================================
; ---------------------------------- Variable declarations ----------------------------------------
; =================================================================================================
appPlayerBot := new AppPlayerBot
clubRookPageBot := new ClubRookPageBot
loginBonusPageBot := new LoginBonusPageBot
bingoPageBot := new BingoPageBot
connectionErrorBot := new ConnectionErrorBot
mainPageBot := new MainPageBot
questMenuBot := new QuestMenuBot
questBattleBot := new QuestBattleBot
questAllyPageBot := new QuestAllyPageBot
questUnitPageBot := new QuestUnitPageBot
resultsPageBot := new ResultsPageBot
startPageBot := new StartPageBot
currentEpisode := EPISODE
currentQuest := QUEST

; =================================================================================================
; -------------------------------------------- Main loop ------------------------------------------
; =================================================================================================
loop
{
  if (connectionErrorBot.isConnectionError()) {
    connectionErrorBot.startPage()
  }
  else if (mainPageBot.isAnnouncement()) {
    mainPageBot.closeAnnouncement()
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
  }
  else if (resultsPageBot.isResultsPageDetected()) {
    if (resultsPageBot.isQuestCleared()) {
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

; =================================================================================================
; -------------------------------------------- Hotkeys --------------------------------------------
; =================================================================================================
F1::ExitApp
F2::Pause
F3::Reload
