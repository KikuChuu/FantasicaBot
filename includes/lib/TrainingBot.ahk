class TrainingBot {
  TITLE := "FANTASICA IMAGES/Training/Stage/title-" . width . "_" . height . ".png"
  _ADVANCE := "FANTASICA IMAGES/Training/Stage/advance-" . width . "_" . height . ".png"
  _FIGHT := "FANTASICA IMAGES/Training/Stage/fight-" . width . "_" . height . ".png"
  SUMMON_ALLY := "FANTASICA IMAGES/Training/Stage/summon_ally-" . width . "_" . height . ".png"
  CONTINUE_TRAINING := "FANTASICA IMAGES/Training/Stage/continue_training-" . width . "_" . height . ".png"
  SEND_BRAVE := "FANTASICA IMAGES/Training/Stage/brave-" . width . "_" . height . ".png"
  VIEW_PROFILE := "FANTASICA IMAGES/Training/Stage/view_profile-" . width . "_" . height . ".png"
  VIEW_BACK := "FANTASICA IMAGES/Training/Stage/view_back-" . width . "_" . height . ".png"
  VIEW_FRONT := "FANTASICA IMAGES/Training/Stage/view_front-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/Training/Stage/my_page-" . width . "_" . height . ".png"
  

  isTraining() {
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isExitTraining() {
    if (detectObject(this.MY_PAGE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isCard() {
    if (detectObject(this.VIEW_BACK, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isFriend() {
    if (detectObject(this.VIEW_PROFILE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  advance() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this._ADVANCE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      return true
    }
    else {
      return false
    }
  }

  continueTraining() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CONTINUE_TRAINING, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      return true
    }
  }

  fight() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this._FIGHT, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      return true
    }
    else {
      return false
    }
  }

  summonAlly() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.SUMMON_ALLY, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      return true
    }
    else {
      return false
    }
  }

  sendBrave() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.SEND_BRAVE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  viewProfile() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.VIEW_PROFILE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  viewBack() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.VIEW_BACK, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  viewFront() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.VIEW_FRONT, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  exitTraining() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.MY_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      return true
    }
    else {
      return false
    }
  }
}
