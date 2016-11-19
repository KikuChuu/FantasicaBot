class TowerConfiguration {
  lap := 0
  floor := 0
  __new(theLap, theFloor) {
    this.lap := theLap
    this.floor := theFloor
  }

  setLap(theLap) {
    this.lap := theLap
  }

  setFloor(theFloor) {
    this.floor := theFloor
  }

  getLap() {
    return this.lap
  }

  getFloor() {
    return this.floor
  }
}
