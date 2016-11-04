class AllyApprovalBot{
  TITLE := ""
  ALLY_PAGE := ""
  detector := ""

  __new(theDetector) {
    this.TITLE := "FANTASICA IMAGES/AllyPage/PendingApprovals/title.png"
    this.ALLY_PAGE := "FANTASICA IMAGES/AllyPage/PendingApprovals/exit.png"
    this.detector := theDetector
  }

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

  play() {
    if (this.isAllyApprovalPage()) {
      this.allyPage()
    }
  }
}
