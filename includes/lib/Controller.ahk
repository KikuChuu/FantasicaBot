class Controller {
  generalConfiguration := ""

  __new(theGeneralConfiguration) {
    this.generalConfiguration := theGeneralConfiguration    
  }

  click(thePoint) {
    if (this.isWindow()) {
      this.window()

      x := thePoint.getX()
      y := thePoint.getY()
      Send { Click down %x%, %y% }
      Sleep 200
      Send { Click up }
      Sleep 200
    }
  }

  drag(theInitialPoint, theFinalPoint, theSpeed, theDragNum := 1) {
    if (this.isWindow()) {
      this.window()

      x1 := theInitialPoint.getX()
      y1 := theInitialPoint.getY()
      x2 := theFinalPoint.getX()
      y2 := theFinalPoint.getY()

      tmpSpeed := A_DefaultMouseSpeed
      
      if (tmpSpeed != 0) {
        SetDefaultMouseSpeed, 0
        SendEvent {Click  %x1%, %y1%, 0}
        SetDefaultMouseSpeed, tmpSpeed
      } 
      else {
        SendEvent {Click  %x1%, %y1%, 0}
      }

      SetDefaultMouseSpeed, theSpeed
      loop, %theDragNum% {
        SendEvent {Click %x1%, %y1%, down}{click %x2%, %y2%, up}
        sleep, 50
      }
      SetDefaultMouseSpeed, tmpSpeed
    }
  }

  isWindow() {
    title := this.generalConfiguration.getTitle()
    regExTitle := "i)^" . title . "$"
    if (winExist(regExTitle)) {
      return true
    }
    else {
      return false
    }
  }

  window() {
    if (this.isWindow()) {
      title := this.generalConfiguration.getTitle()
      regExTitle := "i)^" . title . "$"
      if (!winActive(regExTitle)) {
        WinActivate ; WinActivate is an expensive operation, so we try to avoid invoking it when possible
      }
    }
  }
}
