#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

class ResultsPageBot {
  TITLE := "FANTASICA IMAGES/Quest/QuestResult/title-" . width . "_" . height . ".png"
  QUEST_MENU := "FANTASICA IMAGES/Quest/QuestResult/quest_menu-" . width . "_" . height . ".png"
  MAIN_PAGE := "FANTASICA IMAGES/Quest/QuestResult/main_page-" . width . "_" . height . ".png"
  CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared-" . width . "_" . height . ".png"
  TOWER_PAGE := "FANTASICA IMAGES/Quest/QuestResult/tower_page-" . width . "_" . height . ".png"
  detector := new Detector

  isResultsPageDetected() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isQuestCleared() {
    if (this.detector.detect(this.CLEARED)) {
      return true
    }
    else {
      return false
    }
  }

  toQuestMenu() {
    if (this.detector.detect(this.QUEST_MENU)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  toMainPage() {
    if (this.detector.detect(this.MAIN_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  toTower() {
    if (this.detector.detect(this.TOWER_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }
}
