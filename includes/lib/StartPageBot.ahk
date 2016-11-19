class StartPageBot {
  START_GAME := "FANTASICA IMAGES/StartPage/start_game.png"
  ANNOUNCEMENT := "FANTASICA IMAGES/StartPage/announcement.png"
  NOTICE := "FANTASICA IMAGES/StartPage/notice.png"
  QUIT_GAME := "FANTASICA IMAGES/StartPage/quit_game.png"
  CONFIRM_EXIT := "FANTASICA IMAGES/StartPage/confirm_quit.png"
  QUEST_INTERRUPTED := "FANTASICA IMAGES/StartPage/quest_interrupted.png"
  ACCEPT_RESUME_QUEST := "FANTASICA IMAGES/StartPage/resume_quest.png"
;  REJECT_RESUME_QUEST := "FANTASICA IMAGES/StartPage/do_not_resume_quest.png"
;  OPTIONS := "FANTASICA IMAGES/StartPage/options.png"
  deploymentConfiguration := ""
  detector := ""
  controller := ""

  __new(theDeploymentConfiguration, theDetector, theController) {
    this.deploymentConfiguration := theDeploymentConfiguration
    this.detector := theDetector
    this.controller := theController
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

  isStartGame() {
    if (this.detector.detect(this.START_GAME)) {
      return true
    }
    else {
      return false
    }
  }

  startGame() {
    if (this.isStartGame()) {
      this.controller.click(this.detector.getPoint())
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
        this.controller.click(this.detector.getPoint())
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

  isResumeQuest() {
    if (this.isQuestInterrupted()) {
      fromX := this.detector.getPoint().getX()
      fromY := this.detector.getPoint().getY()
      if (this.detector.detect(this.ACCEPT_RESUME_QUEST, fromX, fromY)) {
        return true
      }
    }
  }

  resumeQuest() {
    if (this.isQuestInterrupted()) {
      fromX := this.detector.getPoint().getX()
      fromY := this.detector.getPoint().getY()
      if (this.detector.detect(this.ACCEPT_RESUME_QUEST, fromX, fromY)) {
        this.updateDeploymentConfiguration()     
        this.controller.click(this.detector.getPoint())
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

;  doNotResumeQuest() {
;    if (this.isQuestInterrupted()) {
;      fromX := this.detector.foundPoint[1]
;      fromY := this.detector.foundPoint[2]
;      if (this.detector.detect(this.REJECT_RESUME_QUEST, fromX, fromY)) {
;        this.controller.click(this.detector.getPoint())
;        sleep 1000
;        return true
;      }
;      else {
;        return false
;      }
;    }
;    else {
;      return false
;    }
;  }

;  openOrCloseAnnouncement() {
;    if (this.detector.detect(this.ANNOUNCEMENT)) {
;      this.controller.click(this.detector.getPoint())
;      sleep 1000
;      return true
;    }
;    else {
;      return false
;    }
;  }
;  
;  openOrCloseNotice() {
;    if (this.detector.detect(this.NOTICE)) {
;      this.controller.click(this.detector.getPoint())
;      sleep 1000
;      return true
;    }
;    else {
;      return false
;    }
;  }

;  selectOptions() {
;    if (this.detector.detect(this.OPTIONS)) {
;      this.controller.click(this.detector.getPoint())
;    }
;  }

  updateDeploymentConfiguration() {
    updatedUnitNumber := 0
    updatedAllyNumber := 0
    this.deploymentConfiguration.setDeployNumber(updatedUnitNumber)
    this.deploymentConfiguration.setAllyNumber(updatedAllyNumber)
  }

  play() {
    if (this.isStartPage()) {
      if (this.isMaintenance()) {
        this.homeScreen()
      }
      else if (this.isQuestInterrupted()) {
        if (this.isResumeQuest()) {
          this.resumeQuest()
        }
      }
      else {
        this.startGame()
      }
    }
  }
}
