class Point {
  _x := 0
  _y := 0

  ; Constructor
  __new(theX, theY) {
    this._x := theX
    this._y := theY
  }

  ; void function
  setX(theX) {
    this._x := theX
  }

  ; void function
  setY(theY) {
    this._y := theY
  }

  ; integer function
  getX() {
    return this._x
  }

  ; integer function
  getY() {
    return this._y
  }
}
