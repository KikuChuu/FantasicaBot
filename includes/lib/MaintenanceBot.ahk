class MaintenanceBot {
  MAINTENANCE := "FANTASICA IMAGES/Maintenance/maintenance-" . width . "_" . height . ".png"
  TO_START_PAGE := "FANTASICA IMAGES/Maintenance/yes-" . width . "_" . height . ".png"
  detector := new Detector

  isMaintenance() {
    if (this.detector.detect(this.MAINTENANCE, 0, 0, 150)) {
      return true
    }
    else {
      return false
    }
  }

  startPage() {
    if (this.detector.detect(this.TO_START_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isMaintenance()) {
      this.startPage()
    }
  }
}
