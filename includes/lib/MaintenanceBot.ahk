class MaintenanceBot {
  MAINTENANCE := ""
  TO_START_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.MAINTENANCE := "FANTASICA IMAGES/Maintenance/maintenance.png"
    this.TO_START_PAGE := "FANTASICA IMAGES/Maintenance/yes.png"
    this.detector := theDetector
    this.controller := theController
  }

  isMaintenance() {
    if (this.detector.detect(this.MAINTENANCE, 0, 0, 150)) {
      return true
    }
    else {
      return false
    }
  }

  isStartPage() {
    if (this.detector.detect(this.TO_START_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  startPage() {
    if (this.isStartPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isMaintenance()) {
      if (this.isStartPage()) {
        this.startPage()
      }
    }
  }
}
