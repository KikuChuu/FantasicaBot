class QuestResultsBot {
  TITLE := "FANTASICA IMAGES/Quest/QuestResult/title-" . width . "_" . height . ".png"
  QUEST_MENU := "FANTASICA IMAGES/Quest/QuestResult/quest_menu-" . width . "_" . height . ".png"
  MAIN_PAGE := "FANTASICA IMAGES/Quest/QuestResult/main_page-" . width . "_" . height . ".png"
  CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared-" . width . "_" . height . ".png"
  TOWER_PAGE := "FANTASICA IMAGES/Quest/QuestResult/tower_page-" . width . "_" . height . ".png"
  detector := new Detector

  __new(ByRef theBot) {
    this.questBot := theBot
  }

  isResults() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isCleared() {
    if (this.detector.detect(this.CLEARED)) {
      return true
    }
    else {
      return false
    }
  }

  questMenu() {
    if (this.detector.detect(this.QUEST_MENU)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  mainPage() {
    if (this.detector.detect(this.MAIN_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  toTower() {
    if (this.detector.detect(this.TOWER_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  play(isBottingAllQuests := false) {
    if (this.isResults()) {
      if (this.isCleared()) {
        loop % this.questBot.keys.length() {
          key := this.questBot.keys[A_Index]
          this.questBot.databaseQuestBattlePoints.incrementPriority(key)
        }

        if (this.questBot.databaseQuestBattlePoints.getKeySetSize() > 0) {
          this.questBot.databaseQuestBattlePoints.writeToTable(this.questBot.currentEpisode, this.questBot.currentQuest)
        }

        if (isBottingAllQuests) {
          this.questBot.updateQuestProgress()
        }

        this.questBot.clearKeys()
        this.questMenu()

        return true
      }
      else {
        loop % this.questBot.keys.length() {
          key := this.questBot.keys[A_Index]
          this.questBot.databaseQuestBattlePoints.decrementPriority(key)
        }

        if (this.questBot.databaseQuestBattlePoints.getKeySetSize() > 0) {
          this.questBot.databaseQuestBattlePoints.writeToTable(this.questBot.currentEpisode, this.questBot.currentQuest)
        }

        this.questBot.clearKeys()
        this.mainPage()

        return false
      }
    }
  }
}
