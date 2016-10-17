class LoginBonusPageBot {
  LOGIN_BONUS := "FANTASICA IMAGES/LoginBonusPage/login_bonus-" . width . "_" . height . ".png"
  DETAILS := "FANTASICA IMAGES/LoginBonusPage/details-" . width . "_" . height . ".png"
  INBOX := "FANTASICA IMAGES/LoginBonusPage/inbox-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/LoginBonusPage/my_page-" . width . "_" . height . ".png"
  BACK := "FANTASICA IMAGES/LoginBonusPage/back-" . width . "_" . height . ".png"
  detector := new Detector

  isLoginBonusPage() {
    if (this.detector.detect(this.LOGIN_BONUS)) {
      return true
    }
    else {
      return false
    }
  }

  selectDetails() {
    if (this.detector.detect(this.DETAILS, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  selectInbox() {
    if (this.detector.detect(this.INBOX, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  selectMyPage() {
    if (this.detector.detect(this.MY_PAGE, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  selectBack() {
    if (this.detector.detect(this.BACK, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }
}
