class ClubRookPageBot {
  TITLE := "FANTASICA IMAGES/ClubRookPage/title-" . width . "_" . height . ".png"
  EXIT_PAGE := "FANTASICA IMAGES/ClubRookPage/back-" . width . "_" . height . ".png"
  detector := new Detector

  isClubRookPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  exitPage() {
    if (this.detector.detect(this.EXIT_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }
}
