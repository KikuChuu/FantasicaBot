#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%/includes/lib/QuestBattlePoints.ahk
#include %A_ScriptDir%/includes/lib/SQLiteDB.ahk
#include %A_ScriptDir%/includes/lib/EncloseInSingleQuotes.ahk
#include %A_ScriptDir%/includes/lib/SB.ahk

if (!fileExist(QUEST_DB_PATH)) {
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
  ; --- Generate SQL command to create a table for each quest. The command will create 643 tables ---
  ; =================================================================================================
  _sql := "CREATE Table IF NOT EXISTS quest#(key, x, y, priority, PRIMARY KEY(key));" ; template for generating sql statements
  sql := "" ; variable to store our generated sql statements

  loop, 64 {
    quest := 0
    if (A_Index == 1) {
      quest := 5
    }
    else if (A_Index < 57) {
      quest := 10
    }
    else {
      quest := 11
    }

    _tableSuffix := "_" . A_Index
    loop, %quest% {
      tableSuffix := _tableSuffix . "_" . A_Index
      sql := sql . StrReplace(_sql, "#", tableSuffix)
    }
  }

  SB_SetText(setupMsg . "30%")
  sleep 500
  ; =================================================================================================
  ; ---------- Opens or creates a SQLite database file with the filename defined by dbPath ----------
  ; =================================================================================================
  dbPath := QUEST_DB_PATH ; QUEST_DB_PATH can be set in UserInput.txt
  if (!db.openDb(dbPath)) {
    MsgBox % "Error Message: `t" . db.ErrorMsg . "`nError Code: `t" . db.ErrorCode
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
  ; ------------- Generates the SQL command to insert rows into each of the 643 tables --------------
  ; =================================================================================================
  __sql := "INSERT OR IGNORE INTO #QUEST# VALUES#EXPR#;"
  _sql := "" ; Will store the value after replacing the pattern #QUEST#
  sql := "" ; Will store the sql command to execute
  episode := 64
  loop, %episode% {
    quest := 0
    if (A_Index == 1) {
      quest := 5
    }
    else if (A_Index < 57) {
      quest := 10
    }
    else {
      quest := 11
    }

    _table := "Quest_" . A_Index
    loop, %quest% {
      table := _table . "_" . A_Index
      _sql := StrReplace(__sql, "#QUEST#", table)
      expr := ""
      loop % questBattlePoints.getKeySetSize() {
        key := questBattlePoints.getKey(A_Index)
        point := questBattlePoints.getPoint(key)
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
