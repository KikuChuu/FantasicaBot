class Detector {
  recordedPoints := {}
  foundPoint := []

  addPoint(key, point) {
    if (point == "") {
      MsgBox % "Fatal Error that the programmer was too lazy to address."
      return false
    }
    else if (point[1] == "" || point[2] == "") {
      MsgBox % "Somehow, the points contain invalid values"
      return false
    }
    else {
      this.recordedPoints[key] := point
      return true
    }
  }

  getPoint(key) {
    return this.recordedPoints[key]
  }

  isValidKey(key) {
    if (this.recordedPoints[key] == "") {
      return false
    }
    else {
      return true
    }
  }

  detect(path, fromX := 0, fromY := 0, variation := 0) {
    global BLUESTACK_WINDOW_TITLE
    width := -1
    height := -1
    pBitmap := 0

    if (!this.isValidKey(path)) {
;      pBitmap := Gdip_CreateBitmapFromFile(path)
      WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
    }
    else if (fromX == 0) {
      if (fromY == 0) {
        point := this.getPoint(path)

        fromX := point[1]
        fromY := point[2]
        width := point[3]
        height := point[4]
      }
      else {
        ExitApp
      }
    }
    else if (fromY == 0) {
      if (fromX == 0) {
        point := this.getPoint(path)

        fromX := point[1]
        fromY := point[2]
        width := point[3]
        height := point[4]
      }
      else {
        ExitApp
      }
    }
    else {
      WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
    }

    ImageSearch, foundX, foundY, fromX, fromY, width, height, *%variation% %path%
    if (ErrorLevel == 2) {
      Log("Error level 2")
      return false
    }
    else if (ErrorLevel == 1) {
;      if (this.isKeyValid(path)) {
;        ImageSearch, foundX, foundY, 0, 0, width, height, *%variation% %path%
;      }
      msg := "Image not detected on the screen: " . path
      SB_SetText(msg)
      return false
    }
    else {
      msg := "Image detected: " . path
      SB_SetText(msg)

;     if (pBitmap) {
;        Gdip_GetImageDimensions(pBitmap, bitmapWidth, bitmapHeight)
;        point := [foundX, foundY, foundX + bitmapWidth, foundY + bitmapHeight]
;        this.addPoint(path, point)
;      }

      this.foundPoint[1] := foundX
      this.foundPoint[2] := foundY
      return true
    }
  }
}
