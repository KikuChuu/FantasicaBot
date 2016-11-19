class ClubRookBot {
  TITLE := ""
  EXIT_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/ClubRookPage/title.png"
    this.EXIT_PAGE := "FANTASICA IMAGES/ClubRookPage/back.png"
    this.detector := theDetector
    this.controller := theController
  }

  isClubRookPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isMainPage() {
    if (this.detector.detect(this.EXIT_PAGE)) {
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
    if (this.isClubRookPage()) {
      if (this.isMainPage()) {
        this.mainPage()
      }
    }
  }
}
