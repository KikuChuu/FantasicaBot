class QuestPlacementBot {
  deploymentConfiguration := ""
  detector := ""
  controller := ""
  _CONFIRM := ""
  _CANCEL := ""
  questPlacementPoints := ""
  bestQuestPlacementPoints := ""
  
  __new(theDeploymentConfiguration, theDetector, theController, theQuestPlacementPoints, theBestQuestPlacementPoints) {
    this.deploymentConfiguration := theDeploymentConfiguration
    this.detector := theDetector
    this.controller := theController
    this._CANCEL := "FANTASICA IMAGES/Quest/QuestBattle/cancel.png"
    this._CONFIRM := "FANTASICA IMAGES/Quest/QuestBattle/confirm.png"
    this.questPlacementPoints := theQuestPlacementPoints
    this.bestQuestPlacementPoints := theBestQuestPlacementPoints
  }

  isCancel() {
    if (this.detector.detect(this._CANCEL)) {
      return true
    }
    else {
      return false
    }
  }

  isConfirm() {
    if (this.detector.detect(this._CONFIRM)) {
      return true
    }
    else {
      return false
    }
  }

  searchPoint() {
    loop % this.questPlacementPoints.size() {
      this.questPlacementPoints.nextPoint()
      ;point := this.questPlacementPoints.getPoint()
      point := this.bestQuestPlacementPoints.getPoint()
      this.controller.click(point)

      if (this.isConfirm()) {
        this.bestQuestPlacementPoints.addBestIndex(bestQuestPlacementPoints.getLastIndexAccessed())
        return true
      }
    }

    return false
  }

  cancel() {
    if (this.isCancel()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  confirm() {
    if (this.isConfirm()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  updateDeploymentConfiguration() {
    updatedDeployNumber := this.deploymentConfiguration.getDeployLimit()
    updatedAllyNumber := this.deploymentConfiguration.getAllyLimit()
    this.deploymentConfiguration.setDeployNumber(updatedDeployNumber)
    this.deploymentConfiguration.setAllyNumber(updatedAllyNumber)
  }

  play() {
    if (this.isCancel()) {
      if (this.searchPoint()) {
        this.confirm()
      }
      else {
        this.cancel()
        this.updateDeploymentConfiguration()
      }
    }
  }
}
