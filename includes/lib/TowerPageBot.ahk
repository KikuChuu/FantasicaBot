class TowerPageBot {
  TITLE := ""
  _START := ""
  deploymentConfiguration := ""
  detector := ""
  controller := ""

  __new(theDeploymentConfiguration, theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/Tower/rules.png"
    this._START := "FANTASICA IMAGES/Tower/start.png"
    this.deploymentConfiguration := theDeploymentConfiguration
    this.detector := theDetector
    this.controller := theController
  }
  
  isTower() {
    if (this.detector.detect(this.TITLE, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }

  isStart() {
    if (this.detector.detect(this._START)) {
      return true
    }
    else {
      return false
    }
  }

  start() {
    if (this.isStart()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  updateDeploymentConfiguration() {
    updatedUnitNumber := 0
    updatedAllyNumber := 0
    this.deploymentConfiguration.setDeployNumber(updatedUnitNumber)
    this.deploymentConfiguration.setAllyNumber(updatedAllyNumber)
  }

  play() {
    if (this.isTower()) {
      if (this.isStart()) {
        this.start()
        this.updateDeploymentConfiguration()
      }
    }
  }
}
