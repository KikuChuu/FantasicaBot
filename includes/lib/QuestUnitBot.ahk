class QuestUnitBot {
  UNIT_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/title-" . width . "_" . height . ".png"
  DEPLOY_UNIT := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/deploy_unit-" . width . "_" . height . ".png"
  EXIT_UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/back-" . width . "_" . height . ".png"
  detector := new Detector

  isUnitList() {
    if (this.detector.detect(this.UNIT_LIST_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isUnit() {
    if (this.detector.detect(this.DEPLOY_UNIT, 0, 0, 100)) {
      return true
    }
    else {
      return false
    }
  }

  deployUnit() {
    if (this.detector.detect(this.DEPLOY_UNIT, 0, 0, 100)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 500
      return true
    }
    else {
      return false
    }
  }

  exitList() {
    if (this.detector.detect(this.EXIT_UNIT_LIST)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  play(ByRef theBot) {
    if (this.isUnitList()) {
      if (theBot.isMapFull() == false) {
        if (theBot.getDeployUnitState() == true) {
          if (this.isUnit()) {
            this.deployUnit()
            theBot.unitUsed++
            if (theBot.getUnitUsed() >= theBot.getUnitSize()) {
              theBot.setDeployUnitOff()
            }
          }
          else {
            this.exitList()
          }
        }
        else {
          this.exitList()
        }
      }
      else {
        this.exitList()
      }
    }
  }
}
