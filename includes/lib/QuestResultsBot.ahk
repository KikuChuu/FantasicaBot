class QuestResultsBot {
  TITLE :=  ""
  QUEST_MENU := "" 
  MAIN_PAGE := "" 
  CLEARED := "" 
  detector := ""
  controller := ""
  bestQuestBattlePoints := ""

  __new(theDetector, theController, theBestQuestBattlePoints) {
    this.TITLE := "FANTASICA IMAGES/Quest/QuestResult/title.png"
    this.QUEST_MENU := "FANTASICA IMAGES/Quest/QuestResult/quest_menu.png"
    this.MAIN_PAGE := "FANTASICA IMAGES/Quest/QuestResult/main_page.png"
    this.CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared.png"
    this.detector := theDetector
    this.controller := theController
    this.bestQuestBattlePoints := theBestQuestBattlePoints
  }

  isQuestResults() {
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

  isQuestMenu() {
    if (this.detector.detect(this.QUEST_MENU)) {
      return true
    }
    else {
      return false
    }
  }

  isMainPage() {
    if (this.detector.detect(this.MAIN_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  questMenu() {
    if (this.isQuestMenu()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  mainPage() {
    if (this.isMainPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isQuestResults()) {
      if (this.isCleared()) {
        if (this.isQuestMenu()) {
          this.bestQuestBattlePoints.upValue()
          this.questMenu()
        }
      }
      else {
        if (this.isMainPage()) {
          this.bestQuestBattlePoints.downValue()
          this.mainPage()
        }
      }
    }
  }
}
