class DeploymentConfiguration {
  deployLimit := 0
  deployNumber := 0
  allyLimit := 0
  allyNumber := 0

  __new(theDeployLimit, theAllyLimit) {
    this.deployLimit := theDeployLimit
    this.deployNumber := 0
    this.allyLimit := theAllyLimit
    this.allyNumber := 0
  }

  setDeployLimit(theDeployLimit) {
    this.deployLimit := theDeployLimit
  }

  setDeployNumber(theDeployNumber) {
    this.deployNumber := theDeployNumber
  }

  setAllyLimit(theAllyLimit) {
    this.allyLimit := theAllyLimit
  }

  setAllyNumber(theAllyNumber) {
    this.allyNumber := theAllyNumber
  }

  getDeployLimit() {
    return this.deployLimit
  }

  getDeployNumber() {
    return this.deployNumber
  }

  getAllyLimit() {
    return this.allyLimit
  }

  getAllyNumber() {
    return this.allyNumber
  }
}
