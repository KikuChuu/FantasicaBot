class QuestConfiguration {
  episode := 0
  quest := 0

  __new(theEpisode, theQuest) {
    this.episode := theEpisode
    this.quest := theQuest
  }

  ; void function
  setEpisode(theEpisode) {
    this.episode := theEpisode
  }

  ; void function
  setQuest(theQuest) {
    this.quest := theQuest
  }

  ; int function 
  getEpisode() {
    return this.episode
  }

  ; int function
  getQuest() {
    return this.quest
  }
}
