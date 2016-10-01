class QuestAllyPageBot {
  ALLY_LIST_TITLE := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/title-" . width . "_" . height . ".png"
  DEPLOY_ALLY := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/deploy_ally-" . width . "_" . height . ".png"
  EXIT_ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/back-" . width . "_" . height . ".png"

  isAllyList() {
    if (detectObject(this.ALLY_LIST_TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isAlly() {
    if (detectObject(this.DEPLOY_ALLY, 0, 0)) {
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

  exitList() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.EXIT_ALLY_LIST, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      this.setDeployAllyOff()
      sleep 500
    }
  }
}
