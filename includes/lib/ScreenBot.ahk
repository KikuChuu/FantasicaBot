class ScreenBot {
  title := "" 

  __New() {
    if (winExist("BlueStacks App Player")) {
      this.title := "BlueStacks App Player"
      WinActivate, this.title
      WinWaitActive, this.title,, 2
    }
    else if (winExist("Bluestacks App Player")) {
      this.title := "Bluestacks App Player"
      WinActive, %this.title%
      WinWaitActive, %this.title%,, 2
    }
    else {
      ExitApp
    }
  }

  getTitle() {
    return this.title
  }

  variation := 0
  x := 0
  y := 0
  width := 0
  height := 0
  point := []

  setVariation(theVariation) {
    this.variation := theVariation
  }

  getVariation() {
    return this.variation
  }

  setPoint(theX, theY) {
    this.point := [theX, theY]
  }

  getPoint() {
    return this.point
  }

  isVisible(thePath) {
    WinGetPos, this.x, this.y, this.width, this.height,
    
  }
}
