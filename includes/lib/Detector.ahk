class Detector {
  foundPoint := ""
  generalConfiguration := ""

  __new(theGeneralConfiguration) {
    this.foundPoint := ""
    this.generalConfiguration := theGeneralConfiguration
  }

  detect(path, fromX := 0, fromY := 0, variation := 0) {
    width := this.generalConfiguration.getWidth()
    height := this.generalConfiguration.getHeight()
    path := this.format(path)

    if (this.isWindow()) {
      this.window()

      ImageSearch, foundX, foundY, fromX, fromY, width, height, *%variation% %path%
      if (ErrorLevel == 2) {
        msg := "File is missing: " . path
        SB_SetText(msg)
        Log(msg)
        return false
      }
      else if (ErrorLevel == 1) {
        msg := "Image not detected on the screen: " . path
        SB_SetText(msg)
        return false
      }
      else {
        msg := "Image detected: " . path
        SB_SetText(msg)

        this.foundPoint := new Point(foundX, foundY)
        return true
      }
    }
    else {
      return false
    }
  }

  getPoint() {
    return this.foundPoint
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

  format(str)
  {
    extension := "-" . this.generalConfiguration.getWidth() . "_" . this.generalConfiguration.getHeight() . ".png"
    foundPos := InStr(str, ".png", false, 1)
    length := foundPos - 1
    return SubStr(str, 1, length) . extension
  }
}
