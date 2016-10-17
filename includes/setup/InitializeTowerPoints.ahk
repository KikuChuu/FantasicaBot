#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

if (!fileExist(TOWER_DB_PATH)) {
  initializeTowerDB(TOWER_DB_PATH)
}

initializeTowerDB(dbPath) {
    MsgBox % "I need to set up some files before you can bot"
    setupMsg := "Setting up some files... "
    SB_SetText(setupMsg)
    sleep 1000
    ; =================================================================================================
    ; ----------------- Initialize a SQLite database object to execute SQL commands -------------------
    ; =================================================================================================
    db := new SQLiteDB
    questBattlePoints := new QuestBattlePoints

    SB_SetText(setupMsg . "10%")
    sleep 1500
    ; =================================================================================================
    ; --- Generate SQL command to create Tower tables. The command will create 20 tables ---
    ; =================================================================================================
    _sql := "CREATE TABLE IF NOT EXISTS tower#(key, x, y, priority INTEGER, PRIMARY KEY(key));" ; template for generating sql statements
    sql := "" ; variable to store our generated sql statements

    loop, 20 {
        tableSuffix := "_" . A_Index
        sql := sql . StrReplace(_sql, "#", tableSuffix)
    }

    SB_SetText(setupMsg . "30%")
    sleep 500
    ; =================================================================================================
    ; ---------- Opens or creates a SQLite database file with the filename defined by dbPath ----------
    ; =================================================================================================
    if (!db.openDb(dbPath)) {
      MsgBox % "Error Message: `t" . db.ErrorMsg . "`nError Code: `t" . db.ErrorCode
      ExitApp
    }

    SB_SetText(setupMsg . "35%")
    ; =================================================================================================
    ; -------------------- Execute the sql statements to create 643 tables ----------------------------
    ; =================================================================================================
    if (!db.exec(sql)) {
      MsgBox % "Error Message: `t" . db.ErrorMsg . "`nError Code: `t" . db.ErrorCode
    }

    SB_SetText(setupMsg . "60%")
    sleep 500
    ; =================================================================================================
    ; ------------- Generates the SQL command to insert rows into each of the 20 tables --------------
    ; =================================================================================================
    __sql := "INSERT OR IGNORE INTO #TOWER# VALUES#EXPR#;"
    _sql := "" ; Will store the value after replacing the pattern #QUEST#
    sql := "" ; Will store the sql command to execute
    loop, 20 {
      table := "tower_" . A_Index
      _sql := StrReplace(__sql, "#TOWER#", table)
      expr := ""
      loop % questBattlePoints.getKeySetSize() {
        questBattlePoints.nextKey(key)
        point := questBattlePoints.getPoint()
        x := point[1]
        y := point[2]
        default_priority := 0

        _expr := "("
              . encloseInSingleQuotes(key) . ", "
              . encloseInSingleQuotes(x) . ", "
              . encloseInSingleQuotes(y) . ", "
              . encloseInSingleQuotes(default_priority)
              . ")"
        expr := expr . _expr . ","
      }
      expr := subStr(expr, 1, -1) ; Omit the last comma before substituting expr into the sql command
      sql := sql . strReplace(_sql, "#EXPR#", expr)
    }

    SB_SetText(setupMsg . "65%")
    sleep 500
    ; =================================================================================================
    ; ------ Execute the SQL command to insert 225 rows into each one of the 643 distinct tables ------
    ; =================================================================================================
    if (!db.exec(sql)) {
      MsgBox % "Error Message: `t" . db.ErrorMsg . "`n" . "Error Code: `t" . db.ErrorCode
    }

    SB_SetText(setupMsg . "95%")
    sleep 500
    ; =================================================================================================
    ; -------------- Close the database so that further SQL commands may be executed ------------------
    ; =================================================================================================
    if (!db.closeDb()) {
      MsgBox % "Error Message: `t" . db.ErrorMsg . "`nError Code: `t" . db.ErrorCode
    }

    SB_SetText(setupMsg . "100%")
    sleep 100
    MsgBox % "Okay, you're all set!"
    SB_SetText("Setting up some files......DONE")
  }
