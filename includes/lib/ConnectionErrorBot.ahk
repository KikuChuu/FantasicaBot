class ConnectionErrorBot {
  CONNECTION_ERROR_START_PAGE := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_start_page-" . width . "_" . height . ".png"
  CONNECTION_ERROR_RESTART_APP := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_restart_app-" . width . "_" . height . ".png"
  LOST_CONNECTION_ERROR := "FANTASICA IMAGES/ConnectionError/lost_connection_error-" . width . "_" . height . ".png"
  START_PAGE := "FANTASICA IMAGES/ConnectionError/return_to_start_page-" . width . "_" . height . ".png"
  detector := new Detector

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

  startPage() {
    if (this.detector.detect(this.START_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  exitGame() {
    if (this.detector.detect(this.CONNECTION_ERROR_RESTART_APP)) {
      Send {ESC down}
      sleep 1000
      Send {ESC up}
    }
  }

  play() {
    if (this.isConnectionError()) {
      this.startPage()
    }
    else if (this.isConnectionErrorRequiresRestart()) {
      this.exitGame()
    }
  }
}
