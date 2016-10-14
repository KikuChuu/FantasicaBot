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

  isStartPage() {
    if (detectObject(this.ANNOUNCEMENT, 0, 0) || detectObject(this.NOTICE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isMaintenance() {
    if (detectObject(this.START_GAME, 0, 0)) {
      return false
    }
    else {
      return true
    }
  }

  startGame() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.START_GAME, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 5000
      return true
    }
    else {
      return false
    }
  }

  quitGame() {
    global BUFFER_X, BUFFER_Y
    if (this.isStartPage) {
      Send {ESC down}
      sleep 2000
      Send {ESC up}
    }

    sleep 1000

    if (detectObject(this.QUIT_GAME, 0, 0, 150)) {
      if (detectObject(this.CONFIRM_EXIT, 0, 0)) {
        clickAt(BUFFER_X, BUFFER_Y)
      }
    }
  }

  isQuestInterrupted() {
    global BUFFER_X, BUFFER_Y

    if (detectObject(this.QUEST_INTERRUPTED, 0, 0)) {
      return true 
    }
    else {
      return false
    }
  }

  resumeQuest() {
    global BUFFER_X, BUFFER_Y

    if (this.isQuestInterrupted()) {
      fromX := BUFFER_X
      fromY := BUFFER_Y
      if (detectObject(this.ACCEPT_RESUME_QUEST, 0, 0)) {
        clickAt(BUFFER_X, BUFFER_Y)
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

  doNotResumeQuest() {
    global BUFFER_X, BUFFER_Y
    if (this.isQuestInterrupted()) {
      fromX := BUFFER_X
      fromY := BUFFER_Y
      if (detectObject(this.REJECT_RESUME_QUEST, fromX, fromY)) {
        clickAt(BUFFER_X, BUFFER_Y)
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
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.ANNOUNCEMENT, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
      return true
    }
    else {
      return false
    }
  }
  
  openOrCloseNotice() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.NOTICE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
      return true
    }
    else {
      return false
    }
  }

  selectOptions() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.OPTIONS, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}

