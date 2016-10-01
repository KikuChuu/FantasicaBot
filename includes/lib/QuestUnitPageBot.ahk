class QuestUnitPageBot {
  UNIT_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/title-" . width . "_" . height . ".png"
  DEPLOY_UNIT := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/deploy_unit-" . width . "_" . height . ".png"
  EXIT_UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/back-" . width . "_" . height . ".png"

  isUnitList() {
    if (detectObject(this.UNIT_LIST_TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isUnit() {
    if (detectObject(this.DEPLOY_UNIT, 0, 0, 100)) {
      return true
    }
    else {
      return false
    }
  }

  deployUnit() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.DEPLOY_UNIT, 0, 0, 100)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 500
      return true
    }
    else {
      return false
    }
  }

  exitList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.EXIT_UNIT_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
    }
  }
}
