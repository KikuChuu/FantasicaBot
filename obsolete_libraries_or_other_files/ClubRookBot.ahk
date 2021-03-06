class ClubRookPageBot {
  TITLE := "FANTASICA IMAGES/ClubRookPage/title-" . width . "_" . height . ".png"
  EXIT_PAGE := "FANTASICA IMAGES/ClubRookPage/back-" . width . "_" . height . ".png"

  __new() {
    this.detector := Detector.getInstance()
  }

  isClubRookPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  mainPage() {
    if (this.detector.detect(this.EXIT_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isClubRookPage()) {
      this.mainPage()
    }
  }
}
