class DatabaseQuestBattlePoints {

  __New() {
    global QUEST_DB_PATH
    this.dbPath := QUEST_DB_PATH
    this.db := new SQLiteDB

    this.index := 0
    this.key := ""
    this.keys := []
    this.points := {}
    this.priorities := {}
  }

  makeTowerName(theFloor) {
  }

; =================================================================================================
; METHOD readFromTable - Reads key, x, y, priority values from the database into this object's members
; @param theEpisode    - The table's episode
; @param theQuest      - The table's quest
; @return              - True if no error in retrieving the values. Exits the app on failure
; =================================================================================================
  readFromTable(theEpisode, theQuest) {
    table := "QUEST_" . theEpisode . "_" . theQuest
    sql := strReplace("SELECT * from #QUEST# ORDER BY priority DESC;", "#QUEST#", table)

    if (!this.db.openDb(this.dbPath)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (!this.db.query(sql, rs)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (rs.hasRows) {
      while (rs.next(row) > 0) {
        key := row[1]
        x := row[2]
        y := row[3]
        priority := row[4]

        this.keys.push(key)
        this.points[key] := [x, y]
        this.priorities[key] := priority
      }
    }
    
    if (!this.db.closeDb()) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    return true
  }

; =================================================================================================
; METHOD writeToTable - Writes key, x, y, priority values from this object's members into the database
; @param theEpisode - The table's episode
; @param theQuest   - The table's quest
; @return           - True if no error in writing the values. Exits the app on failure
; =================================================================================================
  writeToTable(theEpisode, theQuest) {
    quest := "Quest_" . theEpisode . "_" . theQuest ; i.e. Quest_1_1
    __sql := "INSERT OR REPLACE INTO #QUEST# VALUES#EXPR#;"
    _sql := strReplace(__sql, "#QUEST#", quest) ; "INSERT OR REPLACE INTO #QUEST# VALUES#EXPR#;"
    
    _expr := "(#EXPR#),"
    loop % this.getKeySetSize() {
      key := this.keys[A_Index]
      point := this.points[key]
      x := point[1]
      y := point[2]
      priority := this.priorities[key]
      valueStr := encloseInSingleQuotes(key) . ", " 
              . encloseInSingleQuotes(x) . ", " 
              . encloseInSingleQuotes(y) . ", " 
              . encloseInSingleQuotes(priority)
      expr := expr . strReplace(_expr, "#EXPR#", valueStr)
    }
    expr := subStr(expr, 1, -1) ; omit the last comma
    sql := strReplace(_sql, "#EXPR#", expr)
  
    if (!this.db.openDb(this.dbPath)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (!this.db.exec(sql)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (!this.db.closeDb()) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    return true
  }

  incrementPriority(key) {
    this.priorities[key]++
    prettyPrintAssociativeArraySubset(this.keys, this.priorities, "priorities_output.txt")
  }

  decrementPriority(key) {
    this.priorities[key]--
    prettyPrintAssociativeArraySubset(this.keys, this.priorities, "priorities_output.txt")
  }

  nextKey(ByRef key) {
    if (this.index <  this.getKeySetSize()) {
      this.index++
    }
    else {
      this.reset()
      this.index++
    }
    this.key := this.keys[this.index]
    key := this.key
  }

  getPoint() {
    return this.points[this.key]
  }

  getKeySetSize() {
    return this.keys.length()
  }
; =================================================================================================
; ----------------------------------- PRIVATE MEMBER FUNCTIONS ------------------------------------
; =================================================================================================
  reset() {
    this.index := 0
    this.key := ""
  }

  clear() {
    this.reset()
    this.keys := []
    this.points := {}
    this.priorities := {}
  }
}
