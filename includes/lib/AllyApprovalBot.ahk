class AllyApprovalBot{
  TITLE := ""
  ALLY_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/AllyPage/PendingApprovals/title.png"
    this.ALLY_PAGE := "FANTASICA IMAGES/AllyPage/PendingApprovals/exit.png"
    this.detector := theDetector
    this.controller := theController

  }

  isAllyApprovalPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isAllyPage() {
    if (this.detector.detect(this.ALLY_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  allyPage() {
    if (this.isAllyPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isAllyApprovalPage()) {
      if (this.isAllyPage()) {
        this.allyPage()
      }
    }
  }
}
