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

  clickAndUpdateHistory() {
    global SLEEPTIME

    x := this.point[1]
    y := this.point[2]
    Send { Click down %x%, %y% }
    Sleep SLEEPTIME
    Send { Click up }
    Sleep SLEEPTIME
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
