class AllQuestResultsBot extends QuestResultsBot {
  questConfiguration := ""

  __new(theQuestConfiguration, theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/Quest/QuestResult/title.png"
    this.QUEST_MENU := "FANTASICA IMAGES/Quest/QuestResult/quest_menu.png"
    this.MAIN_PAGE := "FANTASICA IMAGES/Quest/QuestResult/main_page.png"
    this.CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared.png"
    this.questConfiguration := theQuestConfiguration
    this.detector := theDetector
    this.controller := theController
  }

  updateQuestConfiguration() {
    updatedEpisode := this.questConfiguration.getEpisode()
    updatedQuest := this.questConfiguration.getQuest() + 1
    if (updatedQuest > 7) {
      updatedQuest := 1
      updatedEpisode++
      this.questConfiguration.setEpisode(updatedEpisode)
      this.questConfiguration.setQuest(updatedQuest)
    }
    else {
      this.questConfiguration.setQuest(updatedQuest)
    }
  }

  play() {
    if (this.isQuestResults()) {
      if (this.isCleared()) {
        if (this.isQuestMenu()) {
          this.questMenu()
          this.updateQuestConfiguration()
        }
      }
      else {
        if (this.isMainPage()) {
          this.mainPage()
        }
      }
    }
  }
}
