class QuestBattleBot {
  deploymentConfiguration := ""
  controller := ""
  detector := ""
  TITLE := ""
  UNIT_LIST := ""
  ALLY_LIST := ""
  FAST_FORWARD := ""
  MINA_DIALOG := ""
 
  __new(theDeploymentConfiguration, theDetector, theController) {
    this.deploymentConfiguration := theDeploymentConfiguration
    this.controller := theController
    this.detector := theDetector
    this.TITLE := "FANTASICA IMAGES/Quest/QuestBattle/unit_points.png"
    this.UNIT_LIST := "FANTASICA IMAGES/Quest/QuestBattle/unit_list.png"
    this.ALLY_LIST := "FANTASICA IMAGES/Quest/QuestBattle/ally_list.png"
    this.FAST_FORWARD := "FANTASICA IMAGES/Quest/QuestBattle/speed_up_quest.png"
    this.MINA_DIALOG := "FANTASICA IMAGES/Quest/QuestBattle/mina_dialog.png"
  }

  isQuest() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isUnitList() {
    if (this.detector.detect(this.UNIT_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  isAllyList() {
    if (this.detector.detect(this.ALLY_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  isFastForward() {
    if (this.detector.detect(this.FAST_FORWARD)) {
      return true
    }
    else {
      return false
    }
  }

  isMinaDialog() {
    if (this.detector.detect(this.MINA_DIALOG)) {
      return true
    }
    else {
      return false
    }
  }

  unitList() {
    if (this.isUnitList()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  allyList() {
    if (this.isAllyList()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  fastForward() {
    if (this.detector.detect(this.FAST_FORWARD)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  minaDialog() {
    if (this.detector.detect(this.MINA_DIALOG)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  isUnitDeployable() {
    unitNumber := this.deploymentConfiguration.getDeployNumber()
    unitLimit := this.deploymentConfiguration.getDeployLimit()
    if (unitNumber < unitLimit) {
      return true
    }
    else {
      return false
    }
  }

  isAllyDeployable() {
    allyNumber := this.deploymentConfiguration.getAllyNumber()
    allyLimit := this.deploymentConfiguration.getAllyLimit()
    if (allyNumber < allyLimit) {
      return true
    }
    else {
      return false
    }
  }

  play() {
    if (this.isQuest()) {
      if (this.isMinaDialog()) {
        this.minaDialog()
      }
      else if (this.isAllyDeployable()) {
        if (this.isAllyList()) {
          this.allyList()
        }
        else if (this.isUnitDeployable()) {
          if (this.isUnitList()) {
            this.unitList()
          }
          else if (this.isFastForward()) {
            this.fastForward()
          }
        }
        else if (this.isFastForward()) {
          this.fastForward()
        }
      }
      else if (this.isUnitDeployable()) {
        if (this.isUnitList()) {
          this.unitList()
        }
        else if (this.isFastForward()) {
          this.fastForward()
        }
      }
      else if (this.isFastForward()) {
        this.fastForward()
      }
    }
  }
}
