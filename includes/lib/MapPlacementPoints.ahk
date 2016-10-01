class MapPlacementPoints {
  points := []
  DB := new SQLiteDB
  DBFileName := "MapPlacement.DB"

  openOrCreateDB() {
    if (!this.DB.OpenDB(this.DBFileName)) {
       MsgBox, 16, SQLite Error, % "Msg:`t" . this.DB.ErrorMsg . "`nCode:`t" . this.DB.ErrorCode
       ExitApp
    }
  }

  createTable() {
    SQL := "CREATE TABLE IF NOT EXISTS QuestPlacement(Episode, Quest, X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7, Y7, X8, Y8, X9, Y9, X10, Y10, X11, Y11, X12, Y12, X13, Y13, X14, Y14, PRIMARY KEY(Episode ASC, Quest ASC));"
    if (!this.DB.Exec(SQL)) {
      MsgBox, 16, SQLite Error, % "Msg:`t" . this.DB.ErrorMsg . "`nCode:`t" . this.DB.ErrorCode
    }
  }

  insertIntoDatabase(theEpisode, theQuest) {
    columnNames := "Episode, Quest"
    loop % this.getSize() {
      strX := ", X" . A_Index
      strY := ", Y" . A_Index
      columnNames .= strX . strY
    }
 
    expr := theEpisode . ", " . theQuest
    loop % this.getSize() {
      point := this.getPoint(A_Index)
      strX := ", " . point[1]
      strY := ", " . point[2]
      expr .= strX . strY
    }
    SQL := "INSERT OR REPLACE INTO QuestPlacement(" . columnNames . ") VALUES(" . expr . ");"
    if (!this.DB.Exec(SQL)) {
      MsgBox, 16, SQLite Error, % "Msg:`t" . this.DB.ErrorMsg . "`nCode:`t" . this.DB.ErrorCode
    }
  }

  getRow(theEpisode, theQuest) {
    SQL := "SELECT X1, Y1, X2, Y2, X3, Y3, X4, Y4, X5, Y5, X6, Y6, X7, Y7, X8, Y8, X9, Y9, X10, Y10, X11, Y11, X12, Y12, X13, Y13, X14, Y14 FROM QuestPlacement;"
    RecordSet := ""
    if (!this.DB.Query(SQL, RecordSet)) {
      MsgBox, 16, SQLite Error: Query, % "Msg:`t" . RecordSet.ErrorMsg . "`nCode:`t" . RecordSet.ErrorCode
    }
 
    if (RecordSet.hasRows) {
      RecordSet.next(Row)
      i := 1
      while (i <= 14) {
        indexX := i
        indexY := i + 1
        MsgBox % Row[indexX] Row[indexY]
        i += 2
      }
    }
  }

  addPoint(theX, theY) {
    point := [theX, theY]
    this.points.push(point)
  }

  clearPoints() {
    while (this.getSize() > 0) {
      this.points.pop()
    }
  }

  getPoint(theIndex) {
    return this.points[theIndex]
  }

  displayPoints() {
    output := "List of Points: `n"
    loop % this.getSize() {
      point := this.getPoint(A_Index)
      output .= "(" . point[1] . ", " . point[2] . ")`n"
    }
    MsgBox % output
  }

  getSize() {
    return this.points.length()
  }
}
