class AllyPageBot {
  TITLE := ""
  MAIN_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/AllyPage/title.png"
    this.MAIN_PAGE := "FANTASICA IMAGES/AllyPage/exit.png"
    this.detector := theDetector
    this.controller := theController
  }

  isAllyPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isMainPage() {
    if (this.detector.detect(this.MAIN_PAGE)) {
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

  play() {
    if (this.isAllyPage()) {
      if (this.isMainPage()) {
        this.mainPage()
      }
    }
  }
}
