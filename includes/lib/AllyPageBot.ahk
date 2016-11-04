class AllyPageBot {
  TITLE := ""
  MAIN_PAGE := ""
  detector := ""

  __new(theDetector) {
    this.TITLE := "FANTASICA IMAGES/AllyPage/title.png"
    this.MAIN_PAGE := "FANTASICA IMAGES/AllyPage/exit.png"
    this.detector := theDetector
  }

  isAllyPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  mainPage() {
    if (this.detector.detect(this.MAIN_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isAllyPage()) {
      this.mainPage()
    }
  }
}
