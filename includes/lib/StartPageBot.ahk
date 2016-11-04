class StartPageBot {
  START_GAME := "FANTASICA IMAGES/StartPage/start_game-" . width . "_" . height . ".png"
  ANNOUNCEMENT := "FANTASICA IMAGES/StartPage/announcement-" . width . "_" . height . ".png"
  NOTICE := "FANTASICA IMAGES/StartPage/notice-" . width . "_" . height . ".png"
  QUIT_GAME := "FANTASICA IMAGES/StartPage/quit_game-" . width . "_" . height . ".png"
  CONFIRM_EXIT := "FANTASICA IMAGES/StartPage/confirm_quit-" . width . "_" . height . ".png"
  QUEST_INTERRUPTED := "FANTASICA IMAGES/StartPage/quest_interrupted-" . width . "_" . height . ".png"
  ACCEPT_RESUME_QUEST := "FANTASICA IMAGES/StartPage/resume_quest-" . width . "_" . height . ".png"
  REJECT_RESUME_QUEST := "FANTASICA IMAGES/StartPage/do_not_resume_quest-" . width . "_" . height . ".png"
  OPTIONS := "FANTASICA IMAGES/StartPage/options-" . width . "_" . height . ".png"

  __new(ByRef theBot) {
    this.detector := Detector.getInstance()
    this.questBot := theBot
  }

  isStartPage() {
    if (this.detector.detect(this.ANNOUNCEMENT)) {
      if (this.detector.detect(this.NOTICE)) {
        return true
      }
      else {
        return false
      }
    }
    else if (this.detector.detect(this.NOTICE)) {
      if (this.detector.detect(this.ANNOUNCEMENT)) {
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  isMaintenance() {
    if (this.detector.detect(this.START_GAME)) {
      return false
    }
    else {
      return true
    }
  }

  startGame() {
    if (this.detector.detect(this.START_GAME)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      return true
    }
    else {
      return false
    }
  }

  homeScreen() {
    if (this.isStartPage()) {
      Send {ESC down}
      sleep 2000
      Send {ESC up}
    }

    sleep 1000

    if (this.detector.detect(this.QUIT_GAME, 0, 0, 150)) {
      if (this.detector.detect(this.CONFIRM_EXIT, 0, 0)) {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      }
    }
  }

  isQuestInterrupted() {
    if (this.detector.detect(this.QUEST_INTERRUPTED)) {
      return true 
    }
    else {
      return false
    }
  }

  resumeQuest(ByRef theBot) {
    if (this.isQuestInterrupted()) {
      fromX := this.detector.foundPoint[1]
      fromY := this.detector.foundPoint[2]
      if (this.detector.detect(this.ACCEPT_RESUME_QUEST, fromX, fromY)) {
        theBot.setMapSquareStateOn()
        theBot.setDeployUnitOn()
        theBot.setDeployAllyOn()
        theBot.setUnitUsed(theBot.DEFAULT_UNIT_USED_VALUE)

        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  doNotResumeQuest() {
    if (this.isQuestInterrupted()) {
      fromX := this.detector.foundPoint[1]
      fromY := this.detector.foundPoint[2]
      if (this.detector.detect(this.REJECT_RESUME_QUEST, fromX, fromY)) {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
        sleep 1000
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  openOrCloseAnnouncement() {
    if (this.detector.detect(this.ANNOUNCEMENT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
      return true
    }
    else {
      return false
    }
  }
  
  openOrCloseNotice() {
    if (this.detector.detect(this.NOTICE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
      return true
    }
    else {
      return false
    }
  }

  selectOptions() {
    if (this.detector.detect(this.OPTIONS)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isStartPage()) {
      if (this.isMaintenance()) {
        this.homeScreen()
      }
      else {
        this.startGame()
        this.resumeQuest(this.questBot)
      }
    }
  }
}
