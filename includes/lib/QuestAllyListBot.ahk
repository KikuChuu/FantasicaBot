class QuestAllyListBot {
  deploymentConfiguration := ""
  detector := theDetector
  controller := theController
  TITLE := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/title.png"
  _DEPLOY := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/deploy_ally.png"
  _EXIT := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/back.png"

  __new(theDeploymentConfiguration, theDetector, theController) {
    this.deploymentConfiguration := theDeploymentConfiguration
    this.detector := theDetector
    this.controller := theController
    this.TITLE := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/title.png"
    this._DEPLOY := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/deploy_ally.png"
    this._EXIT := "FANTASICA IMAGES/Quest/QuestBattle/AllyList/back.png"
  }

  isAllyList() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isDeploy() {
    if (this.detector.detect(this._DEPLOY)) {
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
    updatedAllyNumber := this.deploymentConfiguration.getAllyNumber() + 1
    this.deploymentConfiguration.setAllyNumber(updatedAllyNumber)
  }

  play() {
    if (this.isAllyList()) {
      if (this.isDeploy()) {
        this.deploy()
        this.updatedDeploymentConfiguration()
      }
      else {
        this.exit()
        this.deploymentConfiguration.setAllyNumber(this.deploymentConfiguration.getAllyLimit())
      }
    }
  }
}
