class Database {
  DB := new SQLiteDB
  dbPath := %A_ScriptDir% . "\DATA\FANTASICA.DB"
  tables := ["quests"]
  
  getDbPath() {
    return this.dbPath
  }

  openOrCreateDB() {
    if (!this.DB.openDB(this.getDbPath())) {
      MsgBox, 16, SQLite Error, % "Msg:`t" . DB.ErrorMsg . "`nCode:`t" . DB.ErrorCode
      ExitApp
    }
  }

  createTables() {
    SQL := "CREATE TABLE IF NOT EXISTS quests(episode, quest, name);"
    
  }
}
