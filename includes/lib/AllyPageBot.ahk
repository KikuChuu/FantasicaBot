class AllyPageBot {
  TITLE := "FANTASICA IMAGES/AllyPage/title-" . width . "_" . height . ".png"
  MAIN_PAGE := "FANTASICA IMAGES/AllyPage/exit-" . width . "_" . height . ".png"
  detector := new Detector

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
}
