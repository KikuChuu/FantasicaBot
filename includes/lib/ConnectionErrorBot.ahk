class ConnectionErrorBot {
  CONNECTION_ERROR_START_PAGE := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_start_page-" . width . "_" . height . ".png"
  CONNECTION_ERROR_RESTART_APP := "FANTASICA IMAGES/ConnectionError/connection_error_has_occurred_restart_app-" . width . "_" . height . ".png"
  LOST_CONNECTION_ERROR := "FANTASICA IMAGES/ConnectionError/lost_connection_error-" . width . "_" . height . ".png"
  START_PAGE := "FANTASICA IMAGES/ConnectionError/return_to_start_page-" . width . "_" . height . ".png"

  isConnectionError() {
    if (detectObject(this.CONNECTION_ERROR_START_PAGE, 0, 0) || detectObject(this.LOST_CONNECTION_ERROR, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isConnectionErrorRequiresRestart() {
    if (detectObject(this.CONNECTION_ERROR_RESTART_APP, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  startPage() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.START_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  exitGame() {
    if (detectObject(this.CONNECTION_ERROR_RESTART_APP, 0, 0)) {
      Send {ESC down}
      sleep 1000
      Send {ESC up}
    }
  }
}
