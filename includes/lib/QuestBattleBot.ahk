class QuestBattleBot {
  SPEED_UP_QUEST := "FANTASICA IMAGES/Quest/QuestBattle/speed_up_quest-" . width . "_" . height . ".png"
  UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/unit_points-" . width . "_" . height . ".png"
  UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/unit_list-" . width . "_" . height . ".png"
  ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/ally_list-" . width . "_" . height . ".png"
  TOTAL_UNIT_POINTS := "FANTASICA IMAGES/Quest/QuestBattle/total_unit_points-" . width . "_" . height . ".png"
  REMAINING_UNIT_POINTS_45 := "FANTASICA IMAGES/Quest/QuestBattle/45_remaining_points-" . width . "_" . height . ".png"
  DEPLOYABLE_UNITS_4 := "FANTASICA IMAGES/Quest/QuestBattle/four_units_deployable-" . width . "_" . height . ".png"
  DEPLOYABLE_ALLIES_2 := "FANTASICA IMAGES/Quest/QuestBattle/two_deployable_allies-" . width . "_" . height . ".png"
  CONFIRM := "FANTASICA IMAGES/Quest/QuestBattle/confirm-" . width . "_" . height . ".png"
  CANCEL := "FANTASICA IMAGES/Quest/QuestBattle/cancel-" . width . "_" . height . ".png"
  MINA_DIALOG := "FANTASICA IMAGES/Quest/QuestBattle/mina_dialog-" . width . "_" . height . ".png"

  __New() {
    global DEPLOY_NUMBER
    this.questBattlePoints := new QuestBattlePoints
    this.controller := new Controller

    this.deployableMapSquareState := true
    this.deployUnitState := true
    this.deployAllyState := true

    this.DEFAULT_UNIT_USED_VALUE := 0
    this.unitSize := DEPLOY_NUMBER ; DEPLOY_NUMBER is defined in the UserInput.txt file
    this.unitUsed := this.DEFAULT_UNIT_USED_VALUE
  }
 
  getUnitSize() {
    return this.unitSize
  }

  getUnitUsed() {
    return this.unitUsed
  }

  setUnitUsed(theValue) {
    this.unitUsed := theValue
  }

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

  isPlacingUnit() {
    if (detectObject(this.CANCEL, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  searchPoint() {
    loop % this.questBattlePoints.getKeySetSize() {
      this.questBattlePoints.nextKey(key)
      point := this.questBattlePoints.getPoint()
      this.controller.setPoint(point[1], point[2])
      this.controller.clickAndUpdateHistory()

      if (detectObject(this.CONFIRM, 0, 0)) {
        this.questBattlePoints.index--
        return true
      }
    }
    return false
  }

  confirmPlacement() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CONFIRM, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
    }
  }

  cancelPlacement() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CANCEL, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 1000
    }
  }

  speedUpQuest() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.SPEED_UP_QUEST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }


  isUnitListAvailable() {
    if (detectObject(this.UNIT_LIST, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  unitList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.UNIT_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 500
    }
  }

  isAllyListAvailable() {
    if (detectObject(this.ALLY_LIST, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  allyList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.ALLY_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 500
    }
  }
}
