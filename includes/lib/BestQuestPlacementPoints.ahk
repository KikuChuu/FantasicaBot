class BestQuestPlacementPoints {
  questPlacementPoints := ""
  numOfPoints := 0
  lastIndexAccessed := 0
  questPointArray := Array()
  intArray := Array()
  boolArray := Array()
  bestIndexArray := Array()
  
  __new(theQuestPlacementPoints) {
    this.questPlacementPoints := theQuestPlacementPoints
    this.numOfPoints := this.questPlacementPoints.size()

    loop % this.numOfPoints {
      this.questPlacementPoints.nextPoint()
      this.questPointArray.push(this.questPlacementPoints.getPoint())
      this.intArray.push(0)
      this.boolArray.push(false) 
    }
  } 

  getPoint() {
    point := ""
    i := 0
    max := -1
    loop % this.numOfPoints {
      if (this.boolArray[A_Index] == false) {
        if (this.intArray[A_Index] > max) {
          e := this.questPointArray[A_Index]
          i := A_Index
          max := this.intArray[A_Index]
          this.boolArray[A_Index] := true
        }
      }
    }
    this.lastIndexAccessed := i
    return e
  }

  getLastIndexAccessed() {
    return this.lastIndexAccessed
  }

  upValue() {
    loop % this.bestIndexArray.length() {
      i := this.bestIndexArray[A_Index]
      if (this.intArray[i] < 10) {
        this.intArray[i] := this.intArray[i] + 1
      }
    }
  }

  downValue() {
    loop % this.bestIndexArray.length() {
      i := this.bestIndexArray[A_Index]
      if (this.intArray[i] < 10) {
        this.intArray[i] := this.intArray[i] - 1
      }
    }
  }

  addBestIndex(i) {
    this.bestIndexArray.push(i)
  }

  clearBoolArray() {
    loop % this.numOfPoints {
      this.boolArray[A_Index] := false
    }
  }

  clearBestIndexArray() {
    this.bestIndexArray := ""
    this.bestIndexArray := Array() 
  }
}
