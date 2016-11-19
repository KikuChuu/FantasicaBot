class LoginBonusBot {
  TITLE := ""
  DETAILS := ""
  INBOX := ""
  MY_PAGE := ""
  BACK := ""
  detector := theDetector
  controller := theController

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/LoginBonusPage/login_bonus.png"
    this.DETAILS := "FANTASICA IMAGES/LoginBonusPage/detail.png"
    this.INBOX := "FANTASICA IMAGES/LoginBonusPage/inbox.png"
    this.MY_PAGE := "FANTASICA IMAGES/LoginBonusPage/my_page.png"
    this.BACK := "FANTASICA IMAGES/LoginBonusPage/back.png"
    this.detector := theDetector
    this.controller := theController
  }

  isLoginBonus() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

;  selectDetails() {
;    if (this.detector.detect(this.DETAILS, 0, 0, 50)) {
;      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
;    }
;  }
;
;  selectInbox() {
;    if (this.detector.detect(this.INBOX, 0, 0, 50)) {
;      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
;    }
;  }
;
  isMainPage() {
    if (this.detector.detect(this.MY_PAGE, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }
  
  mainPage() {
    if (this.isMainPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

;  selectBack() {
;    if (this.detector.detect(this.BACK, 0, 0, 50)) {
;      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
;    }
;  }

  play() {
    if (this.isLoginBonus()) {
      if (this.isMainPage()) {
        this.mainPage()
      }
    }
  }
}
