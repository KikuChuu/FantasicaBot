class LoginBonusPageBot {
  LOGIN_BONUS := "FANTASICA IMAGES/LoginBonusPage/login_bonus-" . width . "_" . height . ".png"
  DETAILS := "FANTASICA IMAGES/LoginBonusPage/details-" . width . "_" . height . ".png"
  INBOX := "FANTASICA IMAGES/LoginBonusPage/inbox-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/LoginBonusPage/my_page-" . width . "_" . height . ".png"
  BACK := "FANTASICA IMAGES/LoginBonusPage/back-" . width . "_" . height . ".png"

  isLoginBonusPage() {
    if (detectObject(this.LOGIN_BONUS, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  selectDetails() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.DETAILS, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  selectInbox() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.INBOX, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  selectMyPage() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.MY_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  selectBack() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.BACK, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
