class Controller {
  pointHistoryLimit := 10 ; Limit the number of points to record
  pointHistory := []
  point := []

  setPoint(theX, theY) {
    this.point := [theX, theY]
  }

  getPoint() {
    return this.point
  }

  clickAt(theX, theY) {
    global SLEEPTIME 
    Send { Click down %theX%, %theY% }
    Sleep SLEEPTIME
    Send { Click up }
    Sleep SLEEPTIME
  }

  clickAndUpdateHistory() {
    global SLEEPTIME
    this.clickAt(this.point[1], this.point[2])
    this.updatePointHistory()
  }

  getPointHistorySize() {
    return this.pointHistory.length()
  }

  updatePointHistory() {
    while (this.getPointHistorySize() >= 10) {
      this.pointHistory.pop()
    }
    this.pointHistory.insertAt(1, this.point)
  }

  getHistoryPoint(theIndex) {
    return this.pointHistory[theIndex]
  }
}
