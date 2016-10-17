class AllyApprovalPageBot {
  TITLE := "FANTASICA IMAGES/AllyPage/PendingApprovals/title-" . width . "_" . height . ".png"
  ALLY_PAGE := "FANTASICA IMAGES/AllyPage/PendingApprovals/exit-" . width . "_" . height . ".png"
  detector := new Detector

  isAllyApprovalPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  allyPage() {
    if (this.detector.detect(this.ALLY_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }
}
