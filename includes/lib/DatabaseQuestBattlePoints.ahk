#include %A_ScriptDir%\includes\lib\QuestBattlePoints.ahk
#include %A_ScriptDir%\includes\lib\EncloseInSingleQuotes.ahk

class DatabaseQuestBattlePoints {
  db := new SQLiteDB
  dbPath := QUEST_DB_PATH
  questBattlePoints := new QuestBattlePoints
; =================================================================================================
; METHOD getKeys - Performs a database query, populate and returns an array of keys
; @param theEpisode - An integer value for the episode
; @param theQuest   - An integer value for the quest
; @return keys      - An array of keys or an empty array
; =================================================================================================
  getKeysFromDatabase(theEpisode, theQuest) {
    keys := []
    table := "QUEST_" . theEpisode . "_" . theQuest
    _sql := "SELECT * from #QUEST# ORDER BY priority DESC;"
    sql := strReplace(_sql, "#QUEST#", table)

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
        keys.push(row[1])
      }
    }
    return keys
  }

  incrementPriority(theEpisode, theQuest, theKeys) {
    _sql := "SELECT key, priority FROM #QUEST# WHERE #EXPR#;"
    sql := ""
    _quest := "Quest_" . theEpisode . "_" . theQuest
    _sql := strReplace(_sql, "#QUEST#", _quest)
    key := ""
    _expr := "key='#value#'"
    expr := ""
    loop % theKeys.length() {
      key := theKeys[A_Index]
      expr := expr . strReplace(_expr, "#value#", key) . " OR "
    }
    expr := subStr(expr, 1, -4)
    sql := sql . strReplace(_sql, "#EXPR#", expr)

    if (!this.db.openDb(this.dbPath)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (!this.db.query(sql, rs)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    tempMap := {}
    if (rs.hasRows) {
      while (rs.next(row) > 0) {
        tempMap[row[1]] := row[2]
        MsgBox % row[1] . " " . row[2]
      }
    }

    loop % theKeys.length() {
      key := theKeys[A_Index]
      tempMap[key]++
    }

    _sql := "INSERT OR REPLACE INTO #QUEST# VALUES#EXPR#;"
    _sql := strReplace(_sql, "#QUEST#", _quest)
    _expr := "(#EXPR#)"
    expr := "" 
    loop % theKeys.length() {
      key := theKeys[A_Index]
      point := this.questBattlePoints.getPoint(key)
      priority := tempMap[key]
      valueStr := encloseInSingleQuotes(key) . ", " 
                . encloseInSingleQuotes(point[1]) . ", " 
                . encloseInSingleQuotes(point[2]) . ", " 
                . encloseInSingleQuotes(priority)
      expr := expr . strReplace(_expr, "#EXPR#", valueStr) . ", "
    }
    expr := subStr(expr, 1, -2)
    sql := sql . strReplace(_sql, "#EXPR#", expr)
   
    if (!this.db.exec(sql)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }
  }

  decrementPriority(theEpisode, theQuest, theKeys) {
    _sql := "SELECT key, priority FROM #QUEST# WHERE #EXPR#;"
    sql := ""
    _quest := "Quest_" . theEpisode . "_" . theQuest
    _sql := strReplace(_sql, "#QUEST#", _quest)
    key := ""
    _expr := "key='#value#'"
    expr := ""
    loop % theKeys.length() {
      key := theKeys[A_Index]
      expr := expr . strReplace(_expr, "#value#", key) . " OR "
    }
    expr := subStr(expr, 1, -4)
    sql := sql . strReplace(_sql, "#EXPR#", expr)

    if (!this.db.openDb(this.dbPath)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    if (!this.db.query(sql, rs)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }

    tempMap := {}
    if (rs.hasRows) {
      while (rs.next(row) > 0) {
        tempMap[row[1]] := row[2]
        MsgBox % row[1] . " " . row[2]
      }
    }

    loop % theKeys.length() {
      key := theKeys[A_Index]
      tempMap[key]--
    }

    _sql := "INSERT OR REPLACE INTO #QUEST# VALUES#EXPR#;"
    _sql := strReplace(_sql, "#QUEST#", _quest)
    _expr := "(#EXPR#)"
    expr := "" 
    loop % theKeys.length() {
      key := theKeys[A_Index]
      point := this.questBattlePoints.getPoint(key)
      priority := tempMap[key]
      valueStr := encloseInSingleQuotes(key) . ", " 
                . encloseInSingleQuotes(point[1]) . ", " 
                . encloseInSingleQuotes(point[2]) . ", " 
                . encloseInSingleQuotes(priority)
      expr := expr . strReplace(_expr, "#EXPR#", valueStr) . ", "
    }
    expr := subStr(expr, 1, -2)
    sql := sql . strReplace(_sql, "#EXPR#", expr)
   
    if (!this.db.exec(sql)) {
      MsgBox % "Error Message: `t" . this.db.ErrorMsg . "`nError Code: " . this.db.ErrorCode
      ExitApp
    }
  }
}
