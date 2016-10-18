class Detector {
  foundPoint := []

  detect(path, fromX := 0, fromY := 0, variation := 0) {
    global BLUESTACK_WINDOW_TITLE
    width := -1
    height := -1

    WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%

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

      this.foundPoint[1] := foundX
      this.foundPoint[2] := foundY
      return true
    }
  }
}
