class TowerResultsBot {
  TITLE := ""
;  CLEARED := ""
  TOWER_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/Quest/QuestResult/title.png"
;    this.CLEARED := "FANTASICA IMAGES/Quest/QuestResult/100_percent_cleared.png"
    this.TOWER_PAGE := "FANTASICA IMAGES/Quest/QuestResult/tower_page.png"
    this.detector := theDetector
    this.controller := theController
  }

  isResults() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

;  isCleared() {
;    if (this.detector.detect(this.CLEARED)) {
;      return true
;    }
;    else {
;      return false
;    }
;  }

  isTowerPage() {
    if (this.detector.detect(this.TOWER_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  towerPage() {
    if (this.isTowerPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isResults()) {
      if (this.isTowerPage()) {
        this.towerPage()
      }
    }
  }
}
