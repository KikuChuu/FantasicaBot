class BestQuestBattlePoints {
  lastIndex := 0
  questPlacementPoints := ""
  numOfPoints := 0
  points := Array()
  value := Array()
  checked := Array()
  bestPointsIndices := Array()
  
  __new(theQuestPlacementPoints) {
    this.questPlacementPoints := theQuestPlacementPoints
    this.numOfPoints := this.questPlacementPoints.size()
    this.points := []
    loop % this.numOfPoints {
      this.questPlacementPoints.nextPoint()
      this.points.push(this.questPlacementPoints.getPoint())
      this.value.push(0)
      this.checked.push(false)  
    }
  } 

  getPoint() {
    e := ""
    i := 0
    max := -1
    loop % this.numOfPoints {
      if (this.checked[A_Index] == false) {
        if (this.value[A_Index] > max) {
          e := this.points[A_Index]
          i := A_Index
          max := this.value[A_Index]
          this.checked[A_Index] := true
        }
      }
    }
    this.lastIndex := i
    return e
  }

  getLastIndex() {
    return this.lastIndex
  }

  upValue() {
    loop % this.bestPointsIndices.length() {
      i := this.bestPointsIndices[A_Index]
      if (this.value[i] < 10) {
        this.value[i] := this.value[i] + 1
      }
    }
  }

  downValue() {
    loop % this.bestPointsIndices.length() {
      i := this.bestPointsIndices[A_Index]
      if (this.value[i] < 10) {
        this.value[i] := this.value[i] - 1
      }
    }
  }

  addBestPointIndex(i) {
    this.bestPointsIndices.push(i)
  }

  clearCheck() {
    loop % this.numOfPoints {
      this.checked[A_Index] := false
    }
  }

  clearBestPointIndices() {
    this.bestPointsIndices := ""
    this.bestPointsIndices := Array() 
  }
}
