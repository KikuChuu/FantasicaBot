class Detector {
  __new() {
    this.foundPoint := ""
    this.generalConfiguration := GeneralConfiguration
  }

  search(path, fromX := 0, fromY := 0, variation := 0) {
    width := this.generalConfiguration.getWidth()
    height := this.generalConfiguration.getHeight()
    path := this.format(path)

    ImageSearch, foundX, foundY, fromX, fromY, width, height, *%variation% %path%
    if (ErrorLevel == 2) {
      msg := "File is missing: " . path
      SB_SetText(msg)
      Log("File is missing: " . path)
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

  getPoint() {
    return this.foundPoint
  }

  format(str)
  {
    extension := "-" . this.generalConfiguration.getWidth . "_" . this.generalConfiguration.getHeight . ".png"
    foundPos := InStr(str, ".png", false, 1)
    length := foundPos - 1
    return SubStr(str, 1, length) . extension
  }
}
