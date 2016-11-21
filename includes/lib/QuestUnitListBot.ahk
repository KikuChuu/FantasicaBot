class QuestUnitListBot {
  deploymentConfiguration := ""
  detector := ""
  controller := ""
  TITLE := ""
  _DEPLOY := ""
  _EXIT := ""

  __new(theDeploymentConfiguration, theDetector, theController) {
    this.deploymentConfiguration := theDeploymentConfiguration 
    this.detector := theDetector
    this.controller := theController
    this.TITLE := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/title.png"
    this._DEPLOY := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/deploy_unit.png"
    this._EXIT := "FANTASICA IMAGES/Quest/QuestBattle/UnitList/back.png"
  }

  isUnitList() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isDeploy() {
    if (this.detector.detect(this._DEPLOY, 0, 0, 100)) {
      return true
    }
    else {
      return false
    }
  }

  isExit() {
    if (this.detector.detect(this._EXIT)) {
      return true
    }
    else {
      return false
    }
  }

  deploy() {
    if (this.isDeploy()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  exit() {
    if (this.isExit()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  updateDeploymentConfiguration() {
    updatedUnitNumber := this.deploymentConfiguration.getDeployNumber() + 1
    this.deploymentConfiguration.setDeployNumber(updatedUnitNumber)
  }

  isAllUnitDeployed() {
    unitNumber := this.deploymentConfiguration.getDeployNumber()
    unitLimit := this.deploymentConfiguration.getDeployLimit()
    if (unitNumber >= unitLimit) {
      return true
    }
    else {
      return false
    }
  }

  play() {
    if (this.isUnitList()) {
      if (!this.isAllUnitDeployed()) {
        if (this.isDeploy()) {
            this.deploy()
            this.updateDeploymentConfiguration()
        }
        else {
          this.exit()
        }
      }
      else {
        this.exit()
      }
    }
  }
}
