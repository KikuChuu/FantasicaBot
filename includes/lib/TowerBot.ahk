class TowerBot {
  START := "FANTASICA IMAGES/Tower/start-" . width . "_" . height . ".png"
  RULES := "FANTASICA IMAGES/Tower/rules-" . width . "_" . height . ".png" 
  RANKING := "FANTASICA IMAGES/Tower/ranking-" . width . "_" . height . ".png" 
  MAIN_PAGE := "FANTASICA IMAGES/Tower/my_page-" . width . "_" . height . ".png" 
  detector := new Detector
  
  isTower() {
    if (this.detector.detect(this.RULES)) {
      if (this.detector.detect(this.RANKING)) {
        if (this.detector.detect(this.MAIN_PAGE)) {
          return true
        }
        else {
          return false
        }
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  startTower() {
    if (this.detector.detect(this.START, 0, 0, 100)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }
}
