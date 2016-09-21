#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

class ResultsPageBot {
  TITLE := "FANTASICA IMAGES/Quest/QuestResult/title-" . width . "_" . height . ".png"
  QUEST_MENU := "FANTASICA IMAGES/Quest/QuestResult/quest_menu-" . width . "_" . height . ".png"
  MAIN_PAGE := "FANTASICA IMAGES/Quest/QuestResult/main_page-" . width . "_" . height . ".png"
  CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared-" . width . "_" . height . ".png"

  isResultsPageDetected() {
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isQuestCleared() {
    if (detectObject(this.CLEARED, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  toQuestMenu() {
    global BUFFER_X, BUFFER_Y

    if (detectObject(this.QUEST_MENU, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
    }
  }

  toMainPage() {
    global BUFFER_X, BUFFER_Y

    if (detectObject(this.MAIN_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
    }
  }
}
