class ConnectionErrorBot {
  CONNECTION_ERROR_START_PAGE := ""
  CONNECTION_ERROR_RESTART_APP := ""
  LOST_CONNECTION_ERROR := ""
  START_PAGE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.CONNECTION_ERROR_START_PAGE := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_start_page.png"
    this.CONNECTION_ERROR_RESTART_APP := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_restart_app.png"
    this.LOST_CONNECTION_ERROR := "FANTASICA IMAGES/ConnectionError/lost_connection_error.png"
    this.START_PAGE := "FANTASICA IMAGES/ConnectionError/return_to_start_page.png"
    this.detector := theDetector
    this.controller := theController
  }

  isConnectionError() {
    if (this.detector.detect(this.CONNECTION_ERROR_START_PAGE) || this.detector.detect(this.LOST_CONNECTION_ERROR)) {
      return true
    }
    else {
      return false
    }
  }

  isConnectionErrorRequiresRestart() {
    if (this.detector.detect(this.CONNECTION_ERROR_RESTART_APP)) {
      return true
    }
    else {
      return false
    }
  }

  isStartPage() {
    if (this.detector.detect(this.START_PAGE)) {
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

  exitGame() {
    Send {ESC down}
    sleep 1000
    Send {ESC up}
  }

  play() {
    if (this.isConnectionError()) {
      if (this.isStartPage()) {
        this.startPage()
      }
    }
    else if (this.isConnectionErrorRequiresRestart()) {
      this.exitGame()
    }
  }
}
