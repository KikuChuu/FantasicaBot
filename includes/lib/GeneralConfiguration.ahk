SetTitleMatchMode, RegEx

class GeneralConfiguration {
  width := 0
  height := 0
  title := ""

  ; Constructor
  __new(theTitle) {
    this.title := theTitle
    regExTitle := "i)^" . theTitle . "$"

    if (winExist(regExTitle)) {
      WinGetPos,,,width, height, %regExTitle%
      this.width := width
      this.height := height
    }
    else {
      exitApp
    }
  }

  ; void function
  setWidth(theWidth) {
    this.width := theWidth
  }

  ; void function
  setHeight(theHeight) {
    this.height := theHeight
  }

  ; void function
  setTitle(theTitle) {
    this.title := theTitle
  }

  ; int function
  getWidth() {
    return this.width
  }

  ; int function
  getHeight() {
    return this.height
  }

  ; string function
  getTitle() {
    return this.title
  }
}
