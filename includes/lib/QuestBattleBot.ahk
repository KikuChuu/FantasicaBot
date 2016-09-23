class QuestBattleBot {
  SPEED_UP_QUEST := "FANTASICA IMAGES/Quest/QuestBattle/speed_up_quest-" . width . "_" . height . ".png"
  UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/unit_points-" . width . "_" . height . ".png"
  UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/unit_list-" . width . "_" . height . ".png"
  ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/ally_list-" . width . "_" . height . ".png"
  TOTAL_UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/total_unit_points-" . width . "_" . height . ".png"
  REMAINING_UNIT_POINTS_45 := "FANTASICA IMAGES/Quest/QuestBattle/45_remaining_points-" . width . "_" . height . ".png"
  DEPLOYABLE_UNITS_4 := "FANTASICA IMAGES/Quest/QuestBattle/four_units_deployable-" . width . "_" . height . ".png"
  DEPLOYABLE_ALLIES_2 := "FANTASICA IMAGES/Quest/QuestBattle/two_deployable_allies-" . width . "_" . height . ".png"
  UNIT_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/title-" . width . "_" . height . ".png"
  DEPLOY_UNIT := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/deploy_unit-" . width . "_" . height . ".png"
  CONFIRM := "FANTASICA IMAGES/Quest/QuestBattle/confirm-" . width . "_" . height . ".png"
  CANCEL := "FANTASICA IMAGES/Quest/QuestBattle/cancel-" . width . "_" . height . ".png"
  MINA_DIALOG := "FANTASICA IMAGES/Quest/QuestBattle/mina_dialog-" . width . "_" . height . ".png"
  ALLY_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/title-" . width . "_" . height . ".png"
  DEPLOY_ALLY := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/deploy_ally-" . width . "_" . height . ".png" 
  EXIT_UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/back-" . width . "_" . height . ".png"
  EXIT_ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/back-" . width . "_" . height . ".png"
  questBattlePoints := new QuestBattlePoints
  
  deployableMapSquareState := true
  deployUnitState := true
  deployAllyState := true

  setMapSquareStateOff() {
    this.deployableMapSquareState := false
  }

  setMapSquareStateOn() {
    this.deployableMapSquareState := true
  }

  getMapSquareState() {
    return this.deployableMapSquareState
  }

  isMapFull() {
    if (this.getMapSquareState() == false) {
      return true
    }
    else {
      return false
    }
  }

  setDeployUnitOff() {
    this.deployUnitState := false
  }

  setDeployUnitOn() {
    this.deployUnitState := true
  }

  getDeployUnitState() {
    return this.deployUnitState
  }

  setDeployAllyOff() {
    this.deployAllyState := false
  }

  setDeployAllyOn() {
    this.deployAllyState := true
  }

  getDeployAllyState() {
    return this.deployAllyState
  }

  skipDialog() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.MINA_DIALOG, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  isQuestBattle() {
    if (detectObject(this.UNIT_POINTS, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isAllyList() {
    if (detectObject(this.ALLY_LIST_TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  deployAlly() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.DEPLOY_ALLY, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 500
    }
  }

  isUnitList() {
    if (detectObject(this.UNIT_LIST_TITLE, 0, 0)) {
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
    }
  }

  isPlacingUnit() {
    if (detectObject(this.CANCEL, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  cancelDeployUnit() {
    if (this.isPlacingUnit()) {
      this.cancelPlacement()
    }
    else if (this.isUnitList()) {
      this.exitUnitList()
    }
  }

  cancelDeployAlly() {
    if (this.isPlacingUnit()) {
      this.cancelPlacement()
    }
    else if (this.isAllyList()) {
      this.exitAllyList()
    }
  }

  searchPoint() {
    index := "" 
    if (!this.questBattlePoints.isIndexValid(this.questBattlePoints.getSavedIndex())) {
      index := 1
    }
    else {
      index := this.questBattlePoints.getSavedIndex()
    }

    loop % this.questBattlePoints.getKeySetSize() {
      key := this.questBattlePoints.getKey(index)
      point := this.questBattlePoints.getPoint(key)
      controller := new Controller
      controller.setPoint(point[1], point[2])
      controller.clickAndUpdateHistory()
      if (detectObject(this.CONFIRM, 0, 0)) {
        this.questBattlePoints.setSavedIndex(index)
        return true
      }

      index++
      if (index > this.questBattlePoints.getKeySetSize()) {
        index := 1
      }
    }
    
    this.setMapSquareStateOff()  
    return false
  }

  confirmPlacement() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CONFIRM, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  cancelPlacement() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CANCEL, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  speedUpQuest() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.SPEED_UP_QUEST, 0, 0, 50)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  exitUnitList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.EXIT_UNIT_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  unitList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.UNIT_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 500
    }
  }

  allyList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.ALLY_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  exitAllyList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.EXIT_ALLY_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
