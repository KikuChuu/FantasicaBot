class TrainingBot {
  TITLE := "FANTASICA IMAGES/Training/Stage/title-" . width . "_" . height . ".png"
  _ADVANCE := "FANTASICA IMAGES/Training/Stage/advance-" . width . "_" . height . ".png"
  _FIGHT := "FANTASICA IMAGES/Training/Stage/fight-" . width . "_" . height . ".png"
  SUMMON_ALLY := "FANTASICA IMAGES/Training/Stage/summon_ally-" . width . "_" . height . ".png"
  CONTINUE_TRAINING := "FANTASICA IMAGES/Training/Stage/continue_training-" . width . "_" . height . ".png"
  SEND_BRAVE := "FANTASICA IMAGES/Training/Stage/send_brave-" . width . "_" . height . ".png"
  VIEW_PROFILE := "FANTASICA IMAGES/Training/Stage/view_profile-" . width . "_" . height . ".png"
  VIEW_BACK := "FANTASICA IMAGES/Training/Stage/view_back-" . width . "_" . height . ".png"
  VIEW_FRONT := "FANTASICA IMAGES/Training/Stage/view_front-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/Training/Stage/my_page-" . width . "_" . height . ".png"
  STAGE_COMPLETE := "FANTASICA IMAGES/Training/Stage/full_progress_bar-" . width . "_" . height . ".png"  

  __new(ByRef theBot) {
    this.trainingPageBot := theBot
    this.detector := Detector.getInstance()
  }

  isTraining() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isStageComplete() {
    if (this.detector.detect(this.STAGE_COMPLETE, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }

  isExitTraining() {
    if (this.detector.detect(this.MY_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  isCard() {
    if (this.detector.detect(this.VIEW_BACK)) {
      return true
    }
    else {
      return false
    }
  }

  isFriend() {
    if (this.detector.detect(this.VIEW_PROFILE)) {
      return true
    }
    else {
      return false
    }
  }

  isAdvance() {
    if (this.detector.detect(this._ADVANCE)) {
      return true
    }
    else {
      return false
    }
  }

  advance() {
    if (this.detector.detect(this._ADVANCE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  continueTraining() {
    if (this.detector.detect(this.CONTINUE_TRAINING)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  fight() {
    if (this.detector.detect(this._FIGHT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  summonAlly() {
    if (this.detector.detect(this.SUMMON_ALLY)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  sendBrave() {
    if (this.detector.detect(this.SEND_BRAVE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  viewProfile() {
    if (this.detector.detect(this.VIEW_PROFILE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  viewBack() {
    if (this.detector.detect(this.VIEW_BACK)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  viewFront() {
    if (this.detector.detect(this.VIEW_FRONT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  exitTraining() {
    if (this.detector.detect(this.MY_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 2000
    }
  }

  play(botAllTraining := false) {
    if (this.isTraining()) {
      if (botAllTraining) {
        while (this.isTraining()) {
          if (this.isExitTraining()) {
            if (this.isStageComplete()) {
              this.trainingPageBot.updateProgress()
              this.exitTraining()
            }
            else if (this.isFriend()) {
              this.sendBrave()
              this.continueTraining()
            }
            else if (this.isAdvance()) {
              this.advance()
            }
            else {
              this.exitTraining()
            }
          }
        }
      }
      else {
        while (this.isTraining()) {
          if (this.isFriend()) {
            this.sendBrave()
            this.continueTraining()
          }
          else if (this.isAdvance()) {
            this.advance()
          }
          else {
            this.exitTraining()
          }
        }
      }
    }
    else if (this.isCard()) {
      this.continueTraining()
    }
  }
}
