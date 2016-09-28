class TowerBot {
  START := "FANTASICA IMAGES/Tower/start-" . width . "_" . height . ".png"
  TITLE := "FANTASICA IMAGES/Tower/title-" . width . "_" . height . ".png"
  
  isTower() {
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  startTower() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.START, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
