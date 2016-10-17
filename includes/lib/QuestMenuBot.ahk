class QuestMenuBot {
  dbFileName := "./QUEST_DATA.DB"
  questDataTableName := "QuestData"
  DB := ""

  __New() {
    global width, height
    if (width == 436 && height == 718) {
      this.EPISODE_X1 := 200
      this.EPISODE_Y1 := 415
      this.EPISODE_X2 := 200
      this.EPISODE_Y2 := 530

      this.QUEST_X1 := 200
      this.QUEST_Y1 := 380
      this.QUEST_X2 := 200
      this.QUEST_Y2 := 530
    }
    else {
      this.EPISODE_X1 := 200
      this.EPISODE_Y1 := 380
      this.EPISODE_X2 := 200
      this.EPISODE_Y2 := 530

      this.QUEST_X1 := 200
      this.QUEST_Y1 := 340
      this.QUEST_X2 := 200
      this.QUEST_Y2 := 530
    }
  }

  openOrCreateDB() {
    this.DB := new SQLiteDB
    if (this.DB.openDB(this.dbFileName) == false) {
     MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  createQuestDataTable() {
    SQL := "CREATE TABLE " this.questDataTableName . "(episode, quest, PRIMARY KEY(episode ASC, quest ASC));"
    if (this.DB.exec(SQL) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  createAndFillEpisodeDataTable() {
    SQL := "CREATE TABLE IF NOT EXISTS EpisodeData(episode, path, PRIMARY KEY(episode ASC));"
    if (this.DB.exec(SQL) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
    _SQL := "INSERT OR IGNORE INTO EpisodeData VALUES('#', '" 
    SQLStr := ""
    loop, 64 {
      StringReplace, SQL, _SQL, #, %A_Index%, All
      SQLStr .= SQL . this.getEpisode(A_Index) . "');"
    }
    if (this.DB.exec(SQLStr) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  printEpisodeDataTable() {
    SQL := "SELECT * FROM EpisodeData;"
    if (this.DB.getTable(SQL, recordSet) == false) {
      MsgBox, 16, SQLite Error: GetTable, % "Msg: `t" . this.DB.ErrorMsg . "`nCode: `t" . this.DB.ErrorCode
      ExitApp
    }

    result := ""
    if (recordSet.hasRows) {
      while (recordSet.next(row) == true) {
        result := result . row[1] . ", " . row[2] . "`n"
      }
      MsgBox % result
      return true
    }
    else {
      return false
    }
  }

  createAndFillQuestTable() {
    SQL := 
  }
  
  dropTable() {
    SQL := "DROP TABLE IF EXISTS " . this.questDataTableName . ";"
    if (this.DB.exec(SQL) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  addQuestEntry(episode, quest) {
    SQL := "INSERT INTO " . this.questDataTableName . " VALUES('" . episode . "', '" . quest . "');"
    if (this.DB.exec(SQL) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  isCleared(episode, quest) {
    SQL := "SELECT * FROM " . this.questDataTableName . " WHERE (episode == '" . episode . "' AND quest == '" . quest . "');"
    if (this.DB.getTable(SQL, recordSet) == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
    if (recordSet.hasRows) {
      if (recordSet.next(row) == true) {
        if (row[1] == episode && row[2] == quest) {
          return true
        }
      }
      else {
        MsgBox, 16, %A_ThisFunc%, % "Msg:`t" . RecordSet.ErrorMsg . "`nCode:`t" . RecordSet.ErrorCode
        ExitApp
      }
    }
    return false
  }

  deleteDB() {
    If (fileExist(this.dbFileName)) {
      tempFileName := this.dbFileName
      FileDelete, %tempFileName%
    } 
  }

  closeDB() {
    if (this.DB.closeDB() == false) {
      MsgBox, 16, SQLite Error, % "Msg: `t" . this.DB.errorMsg . "`nCode: `t" . this.DB.errorCode
      ExitApp
    }
  }

  QUEST_MENU_TITLE := "FANTASICA IMAGES/Quest/QuestSelection/textquest-" . width . "_" . height . ".png"
  START_QUEST := "FANTASICA IMAGES/Quest/QuestMenu/start_quest-" . width . "_" . height . ".png"
  START_QUEST_USING_TIME_ELIXIR := "FANTASICA IMAGES/Quest/QuestMenu/start_quest_using_time_elixir-" . width . "_" . height . ".png"
  SELECT_EPISODE := "FANTASICA IMAGES/Quest/QuestMenu/select_episode-" . width . "_" . height . ".png"
  CONFIRM_ALLIES := "FANTASICA IMAGES/Quest/QuestMenu/confirm_allies-" . width . "_" . height . ".png"
  EXIT_QUEST_MENU := "FANTASICA IMAGES/Quest/QuestMenu/exit_quest_menu-" . width . "_" . height . ".png"
  EXIT_ALLY_LIST := "FANTASICA IMAGES/Quest/QuestMenu/exit_ally_list-" . width . "_" . height . ".png"
  EXIT_EPISODE_LIST := "FANTASICA IMAGES/Quest/QuestMenu/exit_episode_list-" . width . "_" . height . ".png"
  SELECT := "FANTASICA IMAGES/Quest/QuestMenu/select-" . width . "_" . height . ".png"
  PREVIOUS_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/previous_page-" . width . "_" . height . ".png"
  NEXT_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/next_page-" . width . "_" . height . ".png"
  FIRST_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/first_page-" . width . "_" . height . ".png"
  LAST_PAGE :=  "FANTASICA IMAGES/Quest/QuestMenu/last_page-" . width . "_" . height . ".png"

  EPISODE_1 := "FANTASICA IMAGES/Quest/QuestMenu/episode_1-" . width . "_" . height . ".png"
  EPISODE_2 := "FANTASICA IMAGES/Quest/QuestMenu/episode_2-" . width . "_" . height . ".png"
  EPISODE_3 := "FANTASICA IMAGES/Quest/QuestMenu/episode_3-" . width . "_" . height . ".png"
  EPISODE_4 := "FANTASICA IMAGES/Quest/QuestMenu/episode_4-" . width . "_" . height . ".png"
  EPISODE_5 := "FANTASICA IMAGES/Quest/QuestMenu/episode_5-" . width . "_" . height . ".png"
  EPISODE_6 := "FANTASICA IMAGES/Quest/QuestMenu/episode_6-" . width . "_" . height . ".png"
  EPISODE_7 := "FANTASICA IMAGES/Quest/QuestMenu/episode_7-" . width . "_" . height . ".png"
  EPISODE_8 := "FANTASICA IMAGES/Quest/QuestMenu/episode_8-" . width . "_" . height . ".png"
  EPISODE_9 := "FANTASICA IMAGES/Quest/QuestMenu/episode_9-" . width . "_" . height . ".png"
  EPISODE_10 := "FANTASICA IMAGES/Quest/QuestMenu/episode_10-" . width . "_" . height . ".png"
  EPISODE_11 := "FANTASICA IMAGES/Quest/QuestMenu/episode_11-" . width . "_" . height . ".png" 
  EPISODE_12 := "FANTASICA IMAGES/Quest/QuestMenu/episode_12-" . width . "_" . height . ".png"
  EPISODE_13 := "FANTASICA IMAGES/Quest/QuestMenu/episode_13-" . width . "_" . height . ".png"
  EPISODE_14 := "FANTASICA IMAGES/Quest/QuestMenu/episode_14-" . width . "_" . height . ".png"
  EPISODE_15 := "FANTASICA IMAGES/Quest/QuestMenu/episode_15-" . width . "_" . height . ".png"
  EPISODE_16 := "FANTASICA IMAGES/Quest/QuestMenu/episode_16-" . width . "_" . height . ".png"
  EPISODE_17 := "FANTASICA IMAGES/Quest/QuestMenu/episode_17-" . width . "_" . height . ".png"
  EPISODE_18 := "FANTASICA IMAGES/Quest/QuestMenu/episode_18-" . width . "_" . height . ".png"
  EPISODE_19 := "FANTASICA IMAGES/Quest/QuestMenu/episode_19-" . width . "_" . height . ".png"
  EPISODE_20 := "FANTASICA IMAGES/Quest/QuestMenu/episode_20-" . width . "_" . height . ".png"
  EPISODE_21 := "FANTASICA IMAGES/Quest/QuestMenu/episode_21-" . width . "_" . height . ".png"
  EPISODE_22 := "FANTASICA IMAGES/Quest/QuestMenu/episode_22-" . width . "_" . height . ".png"
  EPISODE_23 := "FANTASICA IMAGES/Quest/QuestMenu/episode_23-" . width . "_" . height . ".png"
  EPISODE_24 := "FANTASICA IMAGES/Quest/QuestMenu/episode_24-" . width . "_" . height . ".png"
  EPISODE_25 := "FANTASICA IMAGES/Quest/QuestMenu/episode_25-" . width . "_" . height . ".png"
  EPISODE_26 := "FANTASICA IMAGES/Quest/QuestMenu/episode_26-" . width . "_" . height . ".png"
  EPISODE_27 := "FANTASICA IMAGES/Quest/QuestMenu/episode_27-" . width . "_" . height . ".png"
  EPISODE_28 := "FANTASICA IMAGES/Quest/QuestMenu/episode_28-" . width . "_" . height . ".png"
  EPISODE_29 := "FANTASICA IMAGES/Quest/QuestMenu/episode_29-" . width . "_" . height . ".png"
  EPISODE_30 := "FANTASICA IMAGES/Quest/QuestMenu/episode_30-" . width . "_" . height . ".png"
  EPISODE_31 := "FANTASICA IMAGES/Quest/QuestMenu/episode_31-" . width . "_" . height . ".png"
  EPISODE_32 := "FANTASICA IMAGES/Quest/QuestMenu/episode_32-" . width . "_" . height . ".png"
  EPISODE_33 := "FANTASICA IMAGES/Quest/QuestMenu/episode_33-" . width . "_" . height . ".png"
  EPISODE_34 := "FANTASICA IMAGES/Quest/QuestMenu/episode_34-" . width . "_" . height . ".png"
  EPISODE_35 := "FANTASICA IMAGES/Quest/QuestMenu/episode_35-" . width . "_" . height . ".png"
  EPISODE_36 := "FANTASICA IMAGES/Quest/QuestMenu/episode_36-" . width . "_" . height . ".png"
  EPISODE_37 := "FANTASICA IMAGES/Quest/QuestMenu/episode_37-" . width . "_" . height . ".png"
  EPISODE_38 := "FANTASICA IMAGES/Quest/QuestMenu/episode_38-" . width . "_" . height . ".png"
  EPISODE_39 := "FANTASICA IMAGES/Quest/QuestMenu/episode_39-" . width . "_" . height . ".png"
  EPISODE_40 := "FANTASICA IMAGES/Quest/QuestMenu/episode_40-" . width . "_" . height . ".png"
  EPISODE_41 := "FANTASICA IMAGES/Quest/QuestMenu/episode_41-" . width . "_" . height . ".png"
  EPISODE_42 := "FANTASICA IMAGES/Quest/QuestMenu/episode_42-" . width . "_" . height . ".png"
  EPISODE_43 := "FANTASICA IMAGES/Quest/QuestMenu/episode_43-" . width . "_" . height . ".png"
  EPISODE_44 := "FANTASICA IMAGES/Quest/QuestMenu/episode_44-" . width . "_" . height . ".png"
  EPISODE_45 := "FANTASICA IMAGES/Quest/QuestMenu/episode_45-" . width . "_" . height . ".png"
  EPISODE_46 := "FANTASICA IMAGES/Quest/QuestMenu/episode_46-" . width . "_" . height . ".png"
  EPISODE_47 := "FANTASICA IMAGES/Quest/QuestMenu/episode_47-" . width . "_" . height . ".png"
  EPISODE_48 := "FANTASICA IMAGES/Quest/QuestMenu/episode_48-" . width . "_" . height . ".png"
  EPISODE_49 := "FANTASICA IMAGES/Quest/QuestMenu/episode_49-" . width . "_" . height . ".png"
  EPISODE_50 := "FANTASICA IMAGES/Quest/QuestMenu/episode_50-" . width . "_" . height . ".png"
  EPISODE_51 := "FANTASICA IMAGES/Quest/QuestMenu/episode_51-" . width . "_" . height . ".png"
  EPISODE_52 := "FANTASICA IMAGES/Quest/QuestMenu/episode_52-" . width . "_" . height . ".png"
  EPISODE_53 := "FANTASICA IMAGES/Quest/QuestMenu/episode_53-" . width . "_" . height . ".png"
  EPISODE_54 := "FANTASICA IMAGES/Quest/QuestMenu/episode_54-" . width . "_" . height . ".png"
  EPISODE_55 := "FANTASICA IMAGES/Quest/QuestMenu/episode_55-" . width . "_" . height . ".png"
  EPISODE_56 := "FANTASICA IMAGES/Quest/QuestMenu/episode_56-" . width . "_" . height . ".png"
  EPISODE_57 := "FANTASICA IMAGES/Quest/QuestMenu/episode_57-" . width . "_" . height . ".png"
  EPISODE_58 := "FANTASICA IMAGES/Quest/QuestMenu/episode_58-" . width . "_" . height . ".png"
  EPISODE_59 := "FANTASICA IMAGES/Quest/QuestMenu/episode_59-" . width . "_" . height . ".png"
  EPISODE_60 := "FANTASICA IMAGES/Quest/QuestMenu/episode_60-" . width . "_" . height . ".png"
  EPISODE_61 := "FANTASICA IMAGES/Quest/QuestMenu/episode_61-" . width . "_" . height . ".png"
  EPISODE_62 := "FANTASICA IMAGES/Quest/QuestMenu/episode_62-" . width . "_" . height . ".png"
  EPISODE_63 := "FANTASICA IMAGES/Quest/QuestMenu/episode_63-" . width . "_" . height . ".png"
  EPISODE_64 := "FANTASICA IMAGES/Quest/QuestMenu/episode_64-" . width . "_" . height . ".png"

  ; Episode 1 Quests
  ; ----------------
  QUEST_1_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_1-" . width . "_" . height . ".png"
  QUEST_1_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_2-" . width . "_" . height . ".png"  
  QUEST_1_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_3-" . width . "_" . height . ".png"
  QUEST_1_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_4-" . width . "_" . height . ".png"
  QUEST_1_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_5-" . width . "_" . height . ".png"

  ; Episode 2 Quests
  ; ----------------
  QUEST_2_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_1-" . width . "_" . height . ".png"
  QUEST_2_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_2-" . width . "_" . height . ".png"
  QUEST_2_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_3-" . width . "_" . height . ".png"
  QUEST_2_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_4-" . width . "_" . height . ".png"
  QUEST_2_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_5-" . width . "_" . height . ".png"
  QUEST_2_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_6-" . width . "_" . height . ".png"
  QUEST_2_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_7-" . width . "_" . height . ".png"
  QUEST_2_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_8-" . width . "_" . height . ".png"
  QUEST_2_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_9-" . width . "_" . height . ".png"
  QUEST_2_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_10-" . width . "_" . height . ".png"

  ; Episode 3 Quests
  ; ----------------
  QUEST_3_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_1-" . width . "_" . height . ".png"
  QUEST_3_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_2-" . width . "_" . height . ".png"
  QUEST_3_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_3-" . width . "_" . height . ".png"
  QUEST_3_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_4-" . width . "_" . height . ".png"
  QUEST_3_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_5-" . width . "_" . height . ".png"
  QUEST_3_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_6-" . width . "_" . height . ".png"
  QUEST_3_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_7-" . width . "_" . height . ".png"
  QUEST_3_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_8-" . width . "_" . height . ".png"
  QUEST_3_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_9-" . width . "_" . height . ".png"
  QUEST_3_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_10-" . width . "_" . height . ".png"

  ; Episode 4 Quests
  ; ----------------
  QUEST_4_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_1-" . width . "_" . height . ".png"
  QUEST_4_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_2-" . width . "_" . height . ".png"
  QUEST_4_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_3-" . width . "_" . height . ".png"
  QUEST_4_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_4-" . width . "_" . height . ".png"
  QUEST_4_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_5-" . width . "_" . height . ".png"
  QUEST_4_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_6-" . width . "_" . height . ".png"
  QUEST_4_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_7-" . width . "_" . height . ".png"
  QUEST_4_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_8-" . width . "_" . height . ".png"
  QUEST_4_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_9-" . width . "_" . height . ".png"
  QUEST_4_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_10-" . width . "_" . height . ".png"

  ; Episode 5 Quests
  ; ----------------
  QUEST_5_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_1-" . width . "_" . height . ".png"
  QUEST_5_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_2-" . width . "_" . height . ".png"
  QUEST_5_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_3-" . width . "_" . height . ".png"
  QUEST_5_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_4-" . width . "_" . height . ".png"
  QUEST_5_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_5-" . width . "_" . height . ".png"
  QUEST_5_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_6-" . width . "_" . height . ".png"
  QUEST_5_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_7-" . width . "_" . height . ".png"
  QUEST_5_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_8-" . width . "_" . height . ".png"
  QUEST_5_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_9-" . width . "_" . height . ".png"
  QUEST_5_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_10-" . width . "_" . height . ".png"

  ; Episode 6 Quests
  ; ----------------
  QUEST_6_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_1-" . width . "_" . height . ".png" 
  QUEST_6_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_2-" . width . "_" . height . ".png" 
  QUEST_6_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_3-" . width . "_" . height . ".png" 
  QUEST_6_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_4-" . width . "_" . height . ".png" 
  QUEST_6_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_5-" . width . "_" . height . ".png" 
  QUEST_6_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_6-" . width . "_" . height . ".png" 
  QUEST_6_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_7-" . width . "_" . height . ".png" 
  QUEST_6_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_8-" . width . "_" . height . ".png" 
  QUEST_6_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_9-" . width . "_" . height . ".png" 
  QUEST_6_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_10-" . width . "_" . height . ".png" 

  ; Episode 7 Quests
  ; ----------------
  QUEST_7_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_1-" . width . "_" . height . ".png" 
  QUEST_7_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_2-" . width . "_" . height . ".png" 
  QUEST_7_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_3-" . width . "_" . height . ".png" 
  QUEST_7_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_4-" . width . "_" . height . ".png" 
  QUEST_7_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_5-" . width . "_" . height . ".png" 
  QUEST_7_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_6-" . width . "_" . height . ".png" 
  QUEST_7_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_7-" . width . "_" . height . ".png" 
  QUEST_7_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_8-" . width . "_" . height . ".png" 
  QUEST_7_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_9-" . width . "_" . height . ".png" 
  QUEST_7_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_10-" . width . "_" . height . ".png" 

  ; Episode 8 Quests
  ; ----------------
  QUEST_8_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_1-" . width . "_" . height . ".png" 
  QUEST_8_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_2-" . width . "_" . height . ".png" 
  QUEST_8_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_3-" . width . "_" . height . ".png" 
  QUEST_8_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_4-" . width . "_" . height . ".png" 
  QUEST_8_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_5-" . width . "_" . height . ".png" 
  QUEST_8_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_6-" . width . "_" . height . ".png" 
  QUEST_8_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_7-" . width . "_" . height . ".png" 
  QUEST_8_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_8-" . width . "_" . height . ".png" 
  QUEST_8_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_9-" . width . "_" . height . ".png" 
  QUEST_8_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_10-" . width . "_" . height . ".png" 

  ; Episode 9 Quests
  ; ----------------
  QUEST_9_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_1-" . width . "_" . height . ".png"
  QUEST_9_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_2-" . width . "_" . height . ".png"
  QUEST_9_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_3-" . width . "_" . height . ".png"
  QUEST_9_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_4-" . width . "_" . height . ".png"
  QUEST_9_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_5-" . width . "_" . height . ".png"
  QUEST_9_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_6-" . width . "_" . height . ".png"
  QUEST_9_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_7-" . width . "_" . height . ".png"
  QUEST_9_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_8-" . width . "_" . height . ".png"
  QUEST_9_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_9-" . width . "_" . height . ".png"
  QUEST_9_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_10-" . width . "_" . height . ".png"

  ; episode 10 quests
  ; ----------------
  quest_10_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_1-" . width . "_" . height . ".png"
  quest_10_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_2-" . width . "_" . height . ".png"
  quest_10_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_3-" . width . "_" . height . ".png"
  quest_10_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_4-" . width . "_" . height . ".png"
  quest_10_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_5-" . width . "_" . height . ".png"
  quest_10_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_6-" . width . "_" . height . ".png"
  quest_10_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_7-" . width . "_" . height . ".png"
  quest_10_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_8-" . width . "_" . height . ".png"
  quest_10_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_9-" . width . "_" . height . ".png" 
  quest_10_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_10-" . width . "_" . height . ".png"

  ; episode 11 quests
  ; ----------------
  quest_11_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_1-" . width . "_" . height . ".png"
  quest_11_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_2-" . width . "_" . height . ".png"
  quest_11_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_3-" . width . "_" . height . ".png"
  quest_11_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_4-" . width . "_" . height . ".png"
  quest_11_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_5-" . width . "_" . height . ".png"
  quest_11_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_6-" . width . "_" . height . ".png"
  quest_11_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_7-" . width . "_" . height . ".png"
  quest_11_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_8-" . width . "_" . height . ".png"
  quest_11_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_9-" . width . "_" . height . ".png"
  quest_11_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_10-" . width . "_" . height . ".png"

  ; episode 12 quests
  ; ----------------
  quest_12_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_1-" . width . "_" . height . ".png"
  quest_12_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_2-" . width . "_" . height . ".png"
  quest_12_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_3-" . width . "_" . height . ".png"
  quest_12_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_4-" . width . "_" . height . ".png"
  quest_12_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_5-" . width . "_" . height . ".png"
  quest_12_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_6-" . width . "_" . height . ".png"
  quest_12_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_7-" . width . "_" . height . ".png"
  quest_12_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_8-" . width . "_" . height . ".png"
  quest_12_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_9-" . width . "_" . height . ".png"
  quest_12_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_10-" . width . "_" . height . ".png"

  ; episode 13 quests
  ; ----------------
  quest_13_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_1-" . width . "_" . height . ".png"
  quest_13_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_2-" . width . "_" . height . ".png"
  quest_13_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_3-" . width . "_" . height . ".png"
  quest_13_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_4-" . width . "_" . height . ".png"
  quest_13_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_5-" . width . "_" . height . ".png"
  quest_13_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_6-" . width . "_" . height . ".png"
  quest_13_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_7-" . width . "_" . height . ".png"
  quest_13_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_8-" . width . "_" . height . ".png"
  quest_13_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_9-" . width . "_" . height . ".png"
  quest_13_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_10-" . width . "_" . height . ".png"

  ; episode 14 quests
  ; ----------------
  quest_14_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_1-" . width . "_" . height . ".png"
  quest_14_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_2-" . width . "_" . height . ".png"
  quest_14_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_3-" . width . "_" . height . ".png"
  quest_14_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_4-" . width . "_" . height . ".png"
  quest_14_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_5-" . width . "_" . height . ".png"
  quest_14_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_6-" . width . "_" . height . ".png"
  quest_14_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_7-" . width . "_" . height . ".png"
  quest_14_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_8-" . width . "_" . height . ".png"
  quest_14_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_9-" . width . "_" . height . ".png"
  quest_14_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14-10-" . width . "_" . height . ".png"

  ; episode 15 quests
  ; ----------------
  quest_15_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_1-" . width . "_" . height . ".png"
  quest_15_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_2-" . width . "_" . height . ".png"
  quest_15_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_3-" . width . "_" . height . ".png"
  quest_15_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_4-" . width . "_" . height . ".png"
  quest_15_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_5-" . width . "_" . height . ".png"
  quest_15_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_6-" . width . "_" . height . ".png"
  quest_15_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_7-" . width . "_" . height . ".png"
  quest_15_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_8-" . width . "_" . height . ".png"
  quest_15_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_9-" . width . "_" . height . ".png"
  quest_15_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_10-" . width . "_" . height . ".png"

  ; episode 16 quests
  ; ----------------
  quest_16_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_1-" . width . "_" . height . ".png"
  quest_16_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_2-" . width . "_" . height . ".png"
  quest_16_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_3-" . width . "_" . height . ".png"
  quest_16_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_4-" . width . "_" . height . ".png"
  quest_16_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_5-" . width . "_" . height . ".png"
  quest_16_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_6-" . width . "_" . height . ".png"
  quest_16_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_7-" . width . "_" . height . ".png"
  quest_16_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_8-" . width . "_" . height . ".png"
  quest_16_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_9-" . width . "_" . height . ".png"
  quest_16_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_10-" . width . "_" . height . ".png"

  ; episode 17 quests
  ; ----------------
  quest_17_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_1-" . width . "_" . height . ".png"
  quest_17_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_2-" . width . "_" . height . ".png"
  quest_17_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_3-" . width . "_" . height . ".png"
  quest_17_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_4-" . width . "_" . height . ".png"
  quest_17_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_5-" . width . "_" . height . ".png"
  quest_17_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_6-" . width . "_" . height . ".png"
  quest_17_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_7-" . width . "_" . height . ".png"
  quest_17_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_8-" . width . "_" . height . ".png"
  quest_17_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_9-" . width . "_" . height . ".png"
  quest_17_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_10-" . width . "_" . height . ".png"

  ; Episode 18 Quests
  ; ----------------
  QUEST_18_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_1-" . width . "_" . height . ".png"
  QUEST_18_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_2-" . width . "_" . height . ".png"
  QUEST_18_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_3-" . width . "_" . height . ".png"
  QUEST_18_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_4-" . width . "_" . height . ".png"
  QUEST_18_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_5-" . width . "_" . height . ".png"
  QUEST_18_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_6-" . width . "_" . height . ".png"
  QUEST_18_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_7-" . width . "_" . height . ".png"
  QUEST_18_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_8-" . width . "_" . height . ".png"
  QUEST_18_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_9-" . width . "_" . height . ".png"
  QUEST_18_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_18_10-" . width . "_" . height . ".png"

  ; Episode 19 Quests
  ; ----------------
  QUEST_19_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_1-" . width . "_" . height . ".png"
  QUEST_19_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_2-" . width . "_" . height . ".png"
  QUEST_19_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_3-" . width . "_" . height . ".png"
  QUEST_19_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_4-" . width . "_" . height . ".png"
  QUEST_19_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_5-" . width . "_" . height . ".png"
  QUEST_19_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_6-" . width . "_" . height . ".png"
  QUEST_19_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_7-" . width . "_" . height . ".png"
  QUEST_19_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_8-" . width . "_" . height . ".png"
  QUEST_19_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_9-" . width . "_" . height . ".png"
  QUEST_19_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_19_10-" . width . "_" . height . ".png"

  ; episode 20 quests
  ; ----------------
  quest_20_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_1-" . width . "_" . height . ".png"
  quest_20_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_2-" . width . "_" . height . ".png"
  quest_20_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_3-" . width . "_" . height . ".png"
  quest_20_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_4-" . width . "_" . height . ".png"
  quest_20_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_5-" . width . "_" . height . ".png"
  quest_20_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_6-" . width . "_" . height . ".png"
  quest_20_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_7-" . width . "_" . height . ".png"
  quest_20_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_8-" . width . "_" . height . ".png"
  quest_20_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_9-" . width . "_" . height . ".png"
  quest_20_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_10-" . width . "_" . height . ".png"

  ; episode 21 quests
  ; ----------------
  quest_21_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_1-" . width . "_" . height . ".png"
  quest_21_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_2-" . width . "_" . height . ".png"
  quest_21_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_3-" . width . "_" . height . ".png"
  quest_21_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_4-" . width . "_" . height . ".png"
  quest_21_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_5-" . width . "_" . height . ".png"
  quest_21_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_6-" . width . "_" . height . ".png"
  quest_21_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_7-" . width . "_" . height . ".png"
  quest_21_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_8-" . width . "_" . height . ".png"
  quest_21_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_9-" . width . "_" . height . ".png"
  quest_21_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_10-" . width . "_" . height . ".png"

  ; episode 22 quests
  ; ----------------
  quest_22_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_1-" . width . "_" . height . ".png"
  quest_22_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_2-" . width . "_" . height . ".png"
  quest_22_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_3-" . width . "_" . height . ".png"
  quest_22_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_4-" . width . "_" . height . ".png"
  quest_22_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_5-" . width . "_" . height . ".png"
  quest_22_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_6-" . width . "_" . height . ".png"
  quest_22_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_7-" . width . "_" . height . ".png"
  quest_22_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_8-" . width . "_" . height . ".png"
  quest_22_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_9-" . width . "_" . height . ".png"
  quest_22_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_10-" . width . "_" . height . ".png"

  ; episode 23 quests
  ; ----------------
  quest_23_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_1-" . width . "_" . height . ".png"
  quest_23_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_2-" . width . "_" . height . ".png"
  quest_23_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_3-" . width . "_" . height . ".png"
  quest_23_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_4-" . width . "_" . height . ".png"
  quest_23_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_5-" . width . "_" . height . ".png"
  quest_23_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_6-" . width . "_" . height . ".png"
  quest_23_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_7-" . width . "_" . height . ".png"
  quest_23_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_8-" . width . "_" . height . ".png"
  quest_23_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_9-" . width . "_" . height . ".png"
  quest_23_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_10-" . width . "_" . height . ".png"

  ; episode 24 quests
  ; ----------------
  quest_24_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_1-" . width . "_" . height . ".png"
  quest_24_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_2-" . width . "_" . height . ".png"
  quest_24_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_3-" . width . "_" . height . ".png"
  quest_24_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_4-" . width . "_" . height . ".png"
  quest_24_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_5-" . width . "_" . height . ".png"
  quest_24_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_6-" . width . "_" . height . ".png"
  quest_24_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_7-" . width . "_" . height . ".png"
  quest_24_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_8-" . width . "_" . height . ".png"
  quest_24_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_9-" . width . "_" . height . ".png"
  quest_24_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_10-" . width . "_" . height . ".png"

  ; episode 25 quests
  ; ----------------
  quest_25_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_1-" . width . "_" . height . ".png"
  quest_25_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_2-" . width . "_" . height . ".png"
  quest_25_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_3-" . width . "_" . height . ".png"
  quest_25_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_4-" . width . "_" . height . ".png"
  quest_25_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_5-" . width . "_" . height . ".png"
  quest_25_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_6-" . width . "_" . height . ".png"
  quest_25_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_7-" . width . "_" . height . ".png"
  quest_25_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_8-" . width . "_" . height . ".png"
  quest_25_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_9-" . width . "_" . height . ".png"
  quest_25_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_10-" . width . "_" . height . ".png"

  ; episode 26 quests
  ; ----------------
  quest_26_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_1-" . width . "_" . height . ".png" 
  quest_26_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_2-" . width . "_" . height . ".png" 
  quest_26_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_3-" . width . "_" . height . ".png" 
  quest_26_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_4-" . width . "_" . height . ".png" 
  quest_26_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_5-" . width . "_" . height . ".png" 
  quest_26_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_6-" . width . "_" . height . ".png" 
  quest_26_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_7-" . width . "_" . height . ".png" 
  quest_26_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_8-" . width . "_" . height . ".png" 
  quest_26_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_9-" . width . "_" . height . ".png" 
  quest_26_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_10-" . width . "_" . height . ".png" 

  ; episode 27 quests
  ; ----------------
  quest_27_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_1-" . width . "_" . height . ".png" 
  quest_27_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_2-" . width . "_" . height . ".png" 
  quest_27_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_3-" . width . "_" . height . ".png" 
  quest_27_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_4-" . width . "_" . height . ".png" 
  quest_27_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_5-" . width . "_" . height . ".png" 
  quest_27_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_6-" . width . "_" . height . ".png" 
  quest_27_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_7-" . width . "_" . height . ".png" 
  quest_27_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_8-" . width . "_" . height . ".png" 
  quest_27_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_9-" . width . "_" . height . ".png" 
  quest_27_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_10-" . width . "_" . height . ".png" 

  ; episode 28 quests
  ; ----------------
  quest_28_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_1-" . width . "_" . height . ".png" 
  quest_28_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_2-" . width . "_" . height . ".png" 
  quest_28_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_3-" . width . "_" . height . ".png" 
  quest_28_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_4-" . width . "_" . height . ".png" 
  quest_28_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_5-" . width . "_" . height . ".png" 
  quest_28_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_6-" . width . "_" . height . ".png" 
  quest_28_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_7-" . width . "_" . height . ".png" 
  quest_28_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_8-" . width . "_" . height . ".png" 
  quest_28_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_9-" . width . "_" . height . ".png" 
  quest_28_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_10-" . width . "_" . height . ".png" 

  ; episode 29 quests
  ; ----------------
  quest_29_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_1-" . width . "_" . height . ".png" 
  quest_29_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_2-" . width . "_" . height . ".png" 
  quest_29_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_3-" . width . "_" . height . ".png" 
  quest_29_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_4-" . width . "_" . height . ".png" 
  quest_29_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_5-" . width . "_" . height . ".png" 
  quest_29_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_6-" . width . "_" . height . ".png" 
  quest_29_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_7-" . width . "_" . height . ".png" 
  quest_29_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_8-" . width . "_" . height . ".png" 
  quest_29_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_9-" . width . "_" . height . ".png" 
  quest_29_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_10-" . width . "_" . height . ".png" 

  ; episode 30 quests
  ; ----------------
  quest_30_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_1-" . width . "_" . height . ".png" 
  quest_30_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_2-" . width . "_" . height . ".png" 
  quest_30_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_3-" . width . "_" . height . ".png" 
  quest_30_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_4-" . width . "_" . height . ".png" 
  quest_30_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_5-" . width . "_" . height . ".png" 
  quest_30_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_6-" . width . "_" . height . ".png" 
  quest_30_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_7-" . width . "_" . height . ".png" 
  quest_30_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_8-" . width . "_" . height . ".png" 
  quest_30_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_9-" . width . "_" . height . ".png" 
  quest_30_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_10-" . width . "_" . height . ".png" 

  ; episode 31 quests
  ; ----------------
  quest_31_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_1-" . width . "_" . height . ".png" 
  quest_31_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_2-" . width . "_" . height . ".png" 
  quest_31_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_3-" . width . "_" . height . ".png" 
  quest_31_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_4-" . width . "_" . height . ".png" 
  quest_31_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_5-" . width . "_" . height . ".png" 
  quest_31_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_6-" . width . "_" . height . ".png" 
  quest_31_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_7-" . width . "_" . height . ".png" 
  quest_31_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_8-" . width . "_" . height . ".png" 
  quest_31_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_9-" . width . "_" . height . ".png" 
  quest_31_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_10-" . width . "_" . height . ".png" 

  ; episode 32 quests
  ; ----------------
  quest_32_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_1-" . width . "_" . height . ".png" 
  quest_32_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_2-" . width . "_" . height . ".png" 
  quest_32_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_3-" . width . "_" . height . ".png" 
  quest_32_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_4-" . width . "_" . height . ".png" 
  quest_32_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_5-" . width . "_" . height . ".png" 
  quest_32_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_6-" . width . "_" . height . ".png" 
  quest_32_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_7-" . width . "_" . height . ".png" 
  quest_32_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_8-" . width . "_" . height . ".png" 
  quest_32_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_9-" . width . "_" . height . ".png" 
  quest_32_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_10-" . width . "_" . height . ".png" 

  ; episode 33 quests
  ; ----------------
  quest_33_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_1-" . width . "_" . height . ".png" 
  quest_33_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_2-" . width . "_" . height . ".png" 
  quest_33_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_3-" . width . "_" . height . ".png" 
  quest_33_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_4-" . width . "_" . height . ".png" 
  quest_33_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_5-" . width . "_" . height . ".png" 
  quest_33_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_6-" . width . "_" . height . ".png" 
  quest_33_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_7-" . width . "_" . height . ".png" 
  quest_33_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_8-" . width . "_" . height . ".png" 
  quest_33_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_9-" . width . "_" . height . ".png" 
  quest_33_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_10-" . width . "_" . height . ".png" 

  ; episode 34 quests
  ; ----------------
  quest_34_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_1-" . width . "_" . height . ".png" 
  quest_34_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_2-" . width . "_" . height . ".png" 
  quest_34_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_3-" . width . "_" . height . ".png" 
  quest_34_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_4-" . width . "_" . height . ".png" 
  quest_34_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_5-" . width . "_" . height . ".png" 
  quest_34_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_6-" . width . "_" . height . ".png" 
  quest_34_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_7-" . width . "_" . height . ".png" 
  quest_34_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_8-" . width . "_" . height . ".png" 
  quest_34_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_9-" . width . "_" . height . ".png" 
  quest_34_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_10-" . width . "_" . height . ".png" 

  ; episode 35 quests
  ; ----------------
  quest_35_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_1-" . width . "_" . height . ".png" 
  quest_35_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_2-" . width . "_" . height . ".png" 
  quest_35_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_3-" . width . "_" . height . ".png" 
  quest_35_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_4-" . width . "_" . height . ".png" 
  quest_35_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_5-" . width . "_" . height . ".png" 
  quest_35_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_6-" . width . "_" . height . ".png" 
  quest_35_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_7-" . width . "_" . height . ".png" 
  quest_35_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_8-" . width . "_" . height . ".png" 
  quest_35_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_9-" . width . "_" . height . ".png" 
  quest_35_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_10-" . width . "_" . height . ".png" 

  ; episode 36 quests
  ; ----------------
  quest_36_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_1-" . width . "_" . height . ".png" 
  quest_36_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_2-" . width . "_" . height . ".png" 
  quest_36_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_3-" . width . "_" . height . ".png" 
  quest_36_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_4-" . width . "_" . height . ".png" 
  quest_36_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_5-" . width . "_" . height . ".png" 
  quest_36_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_6-" . width . "_" . height . ".png" 
  quest_36_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_7-" . width . "_" . height . ".png" 
  quest_36_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_8-" . width . "_" . height . ".png" 
  quest_36_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_9-" . width . "_" . height . ".png" 
  quest_36_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_10-" . width . "_" . height . ".png" 

  ; episode 37 quests
  ; ----------------
  quest_37_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_1-" . width . "_" . height . ".png" 
  quest_37_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_2-" . width . "_" . height . ".png" 
  quest_37_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_3-" . width . "_" . height . ".png" 
  quest_37_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_4-" . width . "_" . height . ".png" 
  quest_37_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_5-" . width . "_" . height . ".png" 
  quest_37_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_6-" . width . "_" . height . ".png" 
  quest_37_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_7-" . width . "_" . height . ".png" 
  quest_37_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_8-" . width . "_" . height . ".png" 
  quest_37_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_9-" . width . "_" . height . ".png" 
  quest_37_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_10-" . width . "_" . height . ".png" 

  ; episode 38 quests
  ; ----------------
  quest_38_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_1-" . width . "_" . height . ".png" 
  quest_38_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_2-" . width . "_" . height . ".png" 
  quest_38_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_3-" . width . "_" . height . ".png" 
  quest_38_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_4-" . width . "_" . height . ".png" 
  quest_38_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_5-" . width . "_" . height . ".png" 
  quest_38_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_6-" . width . "_" . height . ".png" 
  quest_38_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_7-" . width . "_" . height . ".png" 
  quest_38_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_8-" . width . "_" . height . ".png" 
  quest_38_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_9-" . width . "_" . height . ".png" 
  quest_38_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_10-" . width . "_" . height . ".png" 

  ; episode 39 quests
  ; ----------------
  quest_39_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_1-" . width . "_" . height . ".png" 
  quest_39_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_2-" . width . "_" . height . ".png" 
  quest_39_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_3-" . width . "_" . height . ".png" 
  quest_39_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_4-" . width . "_" . height . ".png" 
  quest_39_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_5-" . width . "_" . height . ".png" 
  quest_39_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_6-" . width . "_" . height . ".png" 
  quest_39_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_7-" . width . "_" . height . ".png" 
  quest_39_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_8-" . width . "_" . height . ".png" 
  quest_39_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_9-" . width . "_" . height . ".png" 
  quest_39_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_10-" . width . "_" . height . ".png" 

  ; episode 40 quests
  ; ----------------
  quest_40_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_1-" . width . "_" . height . ".png" 
  quest_40_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_2-" . width . "_" . height . ".png" 
  quest_40_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_3-" . width . "_" . height . ".png" 
  quest_40_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_4-" . width . "_" . height . ".png" 
  quest_40_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_5-" . width . "_" . height . ".png" 
  quest_40_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_6-" . width . "_" . height . ".png" 
  quest_40_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_7-" . width . "_" . height . ".png" 
  quest_40_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_8-" . width . "_" . height . ".png" 
  quest_40_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_9-" . width . "_" . height . ".png" 
  quest_40_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_10-" . width . "_" . height . ".png" 

  ; episode 41 quests
  ; ----------------
  quest_41_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_1-" . width . "_" . height . ".png" 
  quest_41_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_2-" . width . "_" . height . ".png" 
  quest_41_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_3-" . width . "_" . height . ".png" 
  quest_41_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_4-" . width . "_" . height . ".png" 
  quest_41_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_5-" . width . "_" . height . ".png" 
  quest_41_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_6-" . width . "_" . height . ".png" 
  quest_41_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_7-" . width . "_" . height . ".png" 
  quest_41_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_8-" . width . "_" . height . ".png" 
  quest_41_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_9-" . width . "_" . height . ".png" 
  quest_41_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_10-" . width . "_" . height . ".png" 

  ; episode 42 quests
  ; ----------------
  quest_42_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_1-" . width . "_" . height . ".png" 
  quest_42_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_2-" . width . "_" . height . ".png" 
  quest_42_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_3-" . width . "_" . height . ".png" 
  quest_42_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_4-" . width . "_" . height . ".png" 
  quest_42_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_5-" . width . "_" . height . ".png" 
  quest_42_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_6-" . width . "_" . height . ".png" 
  quest_42_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_7-" . width . "_" . height . ".png" 
  quest_42_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_8-" . width . "_" . height . ".png" 
  quest_42_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_9-" . width . "_" . height . ".png" 
  quest_42_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_10-" . width . "_" . height . ".png" 

  ; episode 43 quests
  ; ----------------
  quest_43_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_1-" . width . "_" . height . ".png" 
  quest_43_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_2-" . width . "_" . height . ".png" 
  quest_43_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_3-" . width . "_" . height . ".png" 
  quest_43_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_4-" . width . "_" . height . ".png" 
  quest_43_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_5-" . width . "_" . height . ".png" 
  quest_43_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_6-" . width . "_" . height . ".png" 
  quest_43_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_7-" . width . "_" . height . ".png" 
  quest_43_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_8-" . width . "_" . height . ".png" 
  quest_43_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_9-" . width . "_" . height . ".png" 
  quest_43_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_10-" . width . "_" . height . ".png" 

  ; episode 44 quests
  ; ----------------
  quest_44_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_1-" . width . "_" . height . ".png" 
  quest_44_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_2-" . width . "_" . height . ".png" 
  quest_44_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_3-" . width . "_" . height . ".png" 
  quest_44_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_4-" . width . "_" . height . ".png" 
  quest_44_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_5-" . width . "_" . height . ".png" 
  quest_44_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_6-" . width . "_" . height . ".png" 
  quest_44_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_7-" . width . "_" . height . ".png" 
  quest_44_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_8-" . width . "_" . height . ".png" 
  quest_44_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_9-" . width . "_" . height . ".png" 
  quest_44_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_10-" . width . "_" . height . ".png" 

  ; episode 45 quests
  ; ----------------
  quest_45_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_1-" . width . "_" . height . ".png" 
  quest_45_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_2-" . width . "_" . height . ".png" 
  quest_45_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_3-" . width . "_" . height . ".png" 
  quest_45_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_4-" . width . "_" . height . ".png" 
  quest_45_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_5-" . width . "_" . height . ".png" 
  quest_45_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_6-" . width . "_" . height . ".png" 
  quest_45_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_7-" . width . "_" . height . ".png" 
  quest_45_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_8-" . width . "_" . height . ".png" 
  quest_45_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_9-" . width . "_" . height . ".png" 
  quest_45_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_10-" . width . "_" . height . ".png" 

  ; episode 46 quests
  ; ----------------
  quest_46_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_1-" . width . "_" . height . ".png" 
  quest_46_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_2-" . width . "_" . height . ".png" 
  quest_46_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_3-" . width . "_" . height . ".png" 
  quest_46_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_4-" . width . "_" . height . ".png" 
  quest_46_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_5-" . width . "_" . height . ".png" 
  quest_46_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_6-" . width . "_" . height . ".png" 
  quest_46_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_7-" . width . "_" . height . ".png" 
  quest_46_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_8-" . width . "_" . height . ".png" 
  quest_46_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_9-" . width . "_" . height . ".png" 
  quest_46_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_10-" . width . "_" . height . ".png" 

  ; episode 47 quests
  ; ----------------
  quest_47_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_1-" . width . "_" . height . ".png" 
  quest_47_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_2-" . width . "_" . height . ".png" 
  quest_47_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_3-" . width . "_" . height . ".png" 
  quest_47_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_4-" . width . "_" . height . ".png" 
  quest_47_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_5-" . width . "_" . height . ".png" 
  quest_47_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_6-" . width . "_" . height . ".png" 
  quest_47_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_7-" . width . "_" . height . ".png" 
  quest_47_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_8-" . width . "_" . height . ".png" 
  quest_47_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_9-" . width . "_" . height . ".png" 
  quest_47_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_10-" . width . "_" . height . ".png" 

  ; episode 48 quests
  ; ----------------
  quest_48_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_1-" . width . "_" . height . ".png" 
  quest_48_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_2-" . width . "_" . height . ".png" 
  quest_48_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_3-" . width . "_" . height . ".png" 
  quest_48_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_4-" . width . "_" . height . ".png" 
  quest_48_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_5-" . width . "_" . height . ".png" 
  quest_48_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_6-" . width . "_" . height . ".png" 
  quest_48_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_7-" . width . "_" . height . ".png" 
  quest_48_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_8-" . width . "_" . height . ".png" 
  quest_48_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_9-" . width . "_" . height . ".png" 
  quest_48_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_10-" . width . "_" . height . ".png" 

  ; episode 49 quests
  ; ----------------
  quest_49_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_1-" . width . "_" . height . ".png" 
  quest_49_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_2-" . width . "_" . height . ".png" 
  quest_49_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_3-" . width . "_" . height . ".png" 
  quest_49_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_4-" . width . "_" . height . ".png" 
  quest_49_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_5-" . width . "_" . height . ".png" 
  quest_49_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_6-" . width . "_" . height . ".png" 
  quest_49_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_7-" . width . "_" . height . ".png" 
  quest_49_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_8-" . width . "_" . height . ".png" 
  quest_49_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_9-" . width . "_" . height . ".png" 
  quest_49_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_10-" . width . "_" . height . ".png" 

  ; episode 50 quests
  ; ----------------
  quest_50_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_1-" . width . "_" . height . ".png" 
  quest_50_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_2-" . width . "_" . height . ".png" 
  quest_50_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_3-" . width . "_" . height . ".png" 
  quest_50_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_4-" . width . "_" . height . ".png" 
  quest_50_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_5-" . width . "_" . height . ".png" 
  quest_50_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_6-" . width . "_" . height . ".png" 
  quest_50_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_7-" . width . "_" . height . ".png" 
  quest_50_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_8-" . width . "_" . height . ".png" 
  quest_50_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_9-" . width . "_" . height . ".png" 
  quest_50_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_10-" . width . "_" . height . ".png" 

  ; episode 51 quests
  ; ----------------
  quest_51_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_1-" . width . "_" . height . ".png" 
  quest_51_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_2-" . width . "_" . height . ".png" 
  quest_51_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_3-" . width . "_" . height . ".png" 
  quest_51_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_4-" . width . "_" . height . ".png" 
  quest_51_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_5-" . width . "_" . height . ".png" 
  quest_51_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_6-" . width . "_" . height . ".png" 
  quest_51_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_7-" . width . "_" . height . ".png" 
  quest_51_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_8-" . width . "_" . height . ".png" 
  quest_51_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_9-" . width . "_" . height . ".png" 
  quest_51_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_10-" . width . "_" . height . ".png" 

  ; episode 52 quests
  ; ----------------
  quest_52_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_1-" . width . "_" . height . ".png" 
  quest_52_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_2-" . width . "_" . height . ".png" 
  quest_52_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_3-" . width . "_" . height . ".png" 
  quest_52_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_4-" . width . "_" . height . ".png" 
  quest_52_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_5-" . width . "_" . height . ".png" 
  quest_52_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_6-" . width . "_" . height . ".png" 
  quest_52_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_7-" . width . "_" . height . ".png" 
  quest_52_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_8-" . width . "_" . height . ".png" 
  quest_52_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_9-" . width . "_" . height . ".png" 
  quest_52_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_10-" . width . "_" . height . ".png" 

  ; episode 53 quests
  ; ----------------
  quest_53_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_1-" . width . "_" . height . ".png" 
  quest_53_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_2-" . width . "_" . height . ".png" 
  quest_53_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_3-" . width . "_" . height . ".png" 
  quest_53_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_4-" . width . "_" . height . ".png" 
  quest_53_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_5-" . width . "_" . height . ".png" 
  quest_53_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_6-" . width . "_" . height . ".png" 
  quest_53_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_7-" . width . "_" . height . ".png" 
  quest_53_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_8-" . width . "_" . height . ".png" 
  quest_53_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_9-" . width . "_" . height . ".png" 
  quest_53_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_10-" . width . "_" . height . ".png" 

  ; episode 54 quests
  ; ----------------
  quest_54_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_1-" . width . "_" . height . ".png" 
  quest_54_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_2-" . width . "_" . height . ".png" 
  quest_54_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_3-" . width . "_" . height . ".png" 
  quest_54_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_4-" . width . "_" . height . ".png" 
  quest_54_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_5-" . width . "_" . height . ".png" 
  quest_54_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_6-" . width . "_" . height . ".png" 
  quest_54_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_7-" . width . "_" . height . ".png" 
  quest_54_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_8-" . width . "_" . height . ".png" 
  quest_54_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_9-" . width . "_" . height . ".png" 
  quest_54_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_10-" . width . "_" . height . ".png" 

  ; episode 55 quests
  ; ----------------
  quest_55_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_1-" . width . "_" . height . ".png" 
  quest_55_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_2-" . width . "_" . height . ".png" 
  quest_55_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_3-" . width . "_" . height . ".png" 
  quest_55_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_4-" . width . "_" . height . ".png" 
  quest_55_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_5-" . width . "_" . height . ".png" 
  quest_55_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_6-" . width . "_" . height . ".png" 
  quest_55_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_7-" . width . "_" . height . ".png" 
  quest_55_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_8-" . width . "_" . height . ".png" 
  quest_55_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_9-" . width . "_" . height . ".png" 
  quest_55_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_10-" . width . "_" . height . ".png" 

  ; episode 56 quests
  ; ----------------
  quest_56_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_1-" . width . "_" . height . ".png" 
  quest_56_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_2-" . width . "_" . height . ".png" 
  quest_56_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_3-" . width . "_" . height . ".png" 
  quest_56_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_4-" . width . "_" . height . ".png" 
  quest_56_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_5-" . width . "_" . height . ".png" 
  quest_56_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_6-" . width . "_" . height . ".png" 
  quest_56_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_7-" . width . "_" . height . ".png" 
  quest_56_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_8-" . width . "_" . height . ".png" 
  quest_56_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_9-" . width . "_" . height . ".png" 
  quest_56_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_10-" . width . "_" . height . ".png" 

  ; episode 57 quests
  ; ----------------
  quest_57_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_1-" . width . "_" . height . ".png" 
  quest_57_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_2-" . width . "_" . height . ".png" 
  quest_57_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_3-" . width . "_" . height . ".png" 
  quest_57_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_4-" . width . "_" . height . ".png" 
  quest_57_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_5-" . width . "_" . height . ".png" 
  quest_57_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_6-" . width . "_" . height . ".png" 
  quest_57_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_7-" . width . "_" . height . ".png" 
  quest_57_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_8-" . width . "_" . height . ".png" 
  quest_57_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_9-" . width . "_" . height . ".png" 
  quest_57_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_10-" . width . "_" . height . ".png" 
  quest_57_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_11-" . width . "_" . height . ".png" 

  ; episode 58 quests
  ; ----------------
  quest_58_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_1-" . width . "_" . height . ".png" 
  quest_58_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_2-" . width . "_" . height . ".png" 
  quest_58_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_3-" . width . "_" . height . ".png" 
  quest_58_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_4-" . width . "_" . height . ".png" 
  quest_58_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_5-" . width . "_" . height . ".png" 
  quest_58_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_6-" . width . "_" . height . ".png" 
  quest_58_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_7-" . width . "_" . height . ".png" 
  quest_58_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_8-" . width . "_" . height . ".png" 
  quest_58_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_9-" . width . "_" . height . ".png" 
  quest_58_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_10-" . width . "_" . height . ".png" 
  quest_58_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_11-" . width . "_" . height . ".png" 

  ; episode 59 quests
  ; ----------------
  quest_59_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_1-" . width . "_" . height . ".png" 
  quest_59_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_2-" . width . "_" . height . ".png" 
  quest_59_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_3-" . width . "_" . height . ".png" 
  quest_59_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_4-" . width . "_" . height . ".png" 
  quest_59_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_5-" . width . "_" . height . ".png" 
  quest_59_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_6-" . width . "_" . height . ".png" 
  quest_59_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_7-" . width . "_" . height . ".png" 
  quest_59_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_8-" . width . "_" . height . ".png" 
  quest_59_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_9-" . width . "_" . height . ".png" 
  quest_59_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_10-" . width . "_" . height . ".png" 
  quest_59_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_11-" . width . "_" . height . ".png" 

  ; episode 60 quests
  ; ----------------
  quest_60_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_1-" . width . "_" . height . ".png" 
  quest_60_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_2-" . width . "_" . height . ".png" 
  quest_60_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_3-" . width . "_" . height . ".png" 
  quest_60_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_4-" . width . "_" . height . ".png" 
  quest_60_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_5-" . width . "_" . height . ".png" 
  quest_60_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_6-" . width . "_" . height . ".png" 
  quest_60_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_7-" . width . "_" . height . ".png" 
  quest_60_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_8-" . width . "_" . height . ".png" 
  quest_60_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_9-" . width . "_" . height . ".png" 
  quest_60_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_10-" . width . "_" . height . ".png" 
  quest_60_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_11-" . width . "_" . height . ".png" 

  ; episode 61 quests
  ; ----------------
  quest_61_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_1-" . width . "_" . height . ".png" 
  quest_61_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_2-" . width . "_" . height . ".png" 
  quest_61_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_3-" . width . "_" . height . ".png" 
  quest_61_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_4-" . width . "_" . height . ".png" 
  quest_61_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_5-" . width . "_" . height . ".png" 
  quest_61_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_6-" . width . "_" . height . ".png" 
  quest_61_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_7-" . width . "_" . height . ".png" 
  quest_61_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_8-" . width . "_" . height . ".png" 
  quest_61_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_9-" . width . "_" . height . ".png" 
  quest_61_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_10-" . width . "_" . height . ".png" 
  quest_61_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_11-" . width . "_" . height . ".png" 

  ; episode 62 quests
  ; ----------------
  quest_62_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_1-" . width . "_" . height . ".png" 
  quest_62_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_2-" . width . "_" . height . ".png" 
  quest_62_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_3-" . width . "_" . height . ".png" 
  quest_62_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_4-" . width . "_" . height . ".png" 
  quest_62_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_5-" . width . "_" . height . ".png" 
  quest_62_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_6-" . width . "_" . height . ".png" 
  quest_62_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_7-" . width . "_" . height . ".png" 
  quest_62_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_8-" . width . "_" . height . ".png" 
  quest_62_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_9-" . width . "_" . height . ".png" 
  quest_62_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_10-" . width . "_" . height . ".png" 
  quest_62_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_11-" . width . "_" . height . ".png" 

  ; episode 63 quests
  ; ----------------
  quest_63_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_1-" . width . "_" . height . ".png" 
  quest_63_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_2-" . width . "_" . height . ".png" 
  quest_63_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_3-" . width . "_" . height . ".png" 
  quest_63_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_4-" . width . "_" . height . ".png" 
  quest_63_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_5-" . width . "_" . height . ".png" 
  quest_63_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_6-" . width . "_" . height . ".png" 
  quest_63_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_7-" . width . "_" . height . ".png" 
  quest_63_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_8-" . width . "_" . height . ".png" 
  quest_63_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_9-" . width . "_" . height . ".png" 
  quest_63_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_10-" . width . "_" . height . ".png" 
  quest_63_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_11-" . width . "_" . height . ".png" 

  ; episode 64 quests
  ; ----------------
  quest_64_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_1-" . width . "_" . height . ".png" 
  quest_64_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_2-" . width . "_" . height . ".png" 
  quest_64_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_3-" . width . "_" . height . ".png" 
  quest_64_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_4-" . width . "_" . height . ".png" 
  quest_64_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_5-" . width . "_" . height . ".png" 
  quest_64_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_6-" . width . "_" . height . ".png" 
  quest_64_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_7-" . width . "_" . height . ".png" 
  quest_64_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_8-" . width . "_" . height . ".png" 
  quest_64_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_9-" . width . "_" . height . ".png" 
  quest_64_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_10-" . width . "_" . height . ".png" 
  quest_64_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_11-" . width . "_" . height . ".png" 


  detector := new Detector

  isQuestMenuDetected() {
    if (this.detector.detect(this.QUEST_MENU_TITLE)) {
      return true
    } else {
      return false
    }
  }

  nextPage() {
    if (this.detector.detect(this.NEXT_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  previousPage() {
    if (this.detector.detect(this.PREVIOUS_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  firstPage() {
    if (this.detector.detect(this.PREVIOUS_PAGE)) { 
      loop, 10 {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      }
    }
  }

  lastPage() {
    if (this.detector.detect(this.NEXT_PAGE)) {
      loop, 10 {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      }
    }
  }

  scrollDownEpisode() {
    episodeX1 := this.EPISODE_X1
    episodeY1 := this.EPISODE_Y1
    episodeX2 := this.EPISODE_X2
    episodeY2 := this.EPISODE_Y2 
    MouseMove, this.EPISODE_X2, this.EPISODE_Y2

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent {click, %episodeX2%, %episodeY2%, down}{click, %episodeX1%, %episodeY1%, up}
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollUpEpisode() {
    episodeX1 := this.EPISODE_X1
    episodeY1 := this.EPISODE_Y1
    episodeX2 := this.EPISODE_X2
    episodeY2 := this.EPISODE_Y2 
    MouseMove, this.EPISODE_X1, this.EPISODE_Y1

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent {click, %episodeX1%, %episodeY1%, down}{click, %episodeX2%, %episodeY2%, up}
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollTopEpisode() {

    episodeX1 := this.EPISODE_X1
    episodeY1 := this.EPISODE_Y1
    episodeX2 := this.EPISODE_X2
    episodeY2 := this.EPISODE_Y2 
    MouseMove, this.EPISODE_X1, this.EPISODE_Y1

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 5 {
      SendEvent {click, %episodeX1%, %episodeY1%, down}{click, %episodeX2%, %episodeY2%, up}
    }
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollBottomEpisode() {
    episodeX1 := this.EPISODE_X1
    episodeY1 := this.EPISODE_Y1
    episodeX2 := this.EPISODE_X2
    episodeY2 := this.EPISODE_Y2 
    MouseMove, this.EPISODE_X2, this.EPISODE_Y2

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 5 {
      SendEvent {click, %episodeX2%, %episodeY2%, down}{click, %episodeX1%, %episodeY1%, up}
    }
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollDownQuest() {
    questX1 := this.QUEST_X1
    questY1 := this.QUEST_Y1
    questX2 := this.QUEST_X2
    questY2 := this.QUEST_Y2

    MouseMove, this.QUEST_X2, this.QUEST_Y2

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click, %questX2%, %questY2%, down}{ click, %questX1%, %questY1%, up}
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollUpQuest() {
    questX1 := this.QUEST_X1
    questY1 := this.QUEST_Y1
    questX2 := this.QUEST_X2
    questY2 := this.QUEST_Y2

    MouseMove, this.QUEST_X1, this.QUEST_Y1

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click, %questX1%, %questY1%, down}{ click, %questX2%, %questY2%, up}
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollBottomQuest() {
    questX1 := this.QUEST_X1
    questY1 := this.QUEST_Y1
    questX2 := this.QUEST_X2
    questY2 := this.QUEST_Y2

    MouseMove, this.QUEST_X2, this.QUEST_Y2

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 5 {
      SendEvent { click, %questX2%, %questY2%, down}{ click, %questX1%, %questY1%, up}
    }
    SetDefaultMouseSpeed %tempSpeed%
  }

  scrollTopQuest() {
    questX1 := this.QUEST_X1
    questY1 := this.QUEST_Y1
    questX2 := this.QUEST_X2
    questY2 := this.QUEST_Y2

    MouseMove, this.QUEST_X1, this.QUEST_Y1

    tempSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 5 {
      SendEvent { click, %questX1%, %questY1%, down}{ click, %questX2%, %questY2%, up}
    }
    SetDefaultMouseSpeed %tempSpeed%
  }

  episodeList() {
    if (this.detector.detect(this.SELECT_EPISODE, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 1000
    }
  }

  getQuestCount(theEpisode) {
    if (theEpisode == 1) {
      return 5
    } else if (theEpisode >= 2 && theEpisode <= 56) {
      return 10
    } else if (theEpisode >= 57) {
      return 11
    }
  }

  isEpisodeSelection() {
    if (this.detector.detect(this.SELECT)) {
      return true
    }
    else {
      return false
    }
  }

  selectEpisode(theEpisode) {
    episodePath := this.getEpisode(theEpisode)
    loop, {
      loop, 5 {
        if (this.detector.detect(episodePath, 0, 0, 150)) {
          fromX := this.detector.foundPoint[1]
          fromY := this.detector.foundPoint[2]
          if (this.detector.detect(this.SELECT, fromX, fromY, 150)) {
            clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
            sleep 1000
            return ""
          }
        }
        else if (A_Index < 5) {
          this.scrollDownEpisode()
        } 
        else if (this.detector.detect(this.NEXT_PAGE)) {
          clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
          sleep 1000
        }
        else if (this.detector.detect(this.LAST_PAGE)) {
          this.firstPage()
        }
      }
    }
  }

  getMaxScrollCountForQuest(theEpisode) {
    if (theEpisode == 1) {
      return 3
    }
    else if (theEpisode >= 2 && theEpisode <= 56) {
      return 8
    }
    else if (theEpisode >= 57 && theEpisode <= 64) {
      return 9
    }
    else {
      return 11
    }
  }

  selectQuest(theEpisode, theQuest) {
    questPath := this.getQuest(theEpisode, theQuest)
    
    while (this.isQuestMenuDetected() && A_Index <= this.getMaxScrollCountForQuest(theEpisode)) {
      if (this.detector.detect(questPath, 0, 0, 175)) {
        fromX := this.detector.foundPoint[1]
        fromY := this.detector.foundPoint[2]

        if (this.detector.detect(this.START_QUEST, fromX, fromY, 150)) {
          clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
          sleep 500
          return true
        }
        else if (this.detector.detect(this.START_QUEST_USING_TIME_ELIXIR, fromX, fromY, 150)) {
          if (this.detector.detect(this.EXIT_QUEST_MENU)) {
            clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
            sleep 500
            return true
          } 
        }
      }
      else {
        this.scrollDownQuest()
        sleep 500
      }
    }
    return false
  }

  getEpisode(episode) {
    if (episode == 1) {
      return this.EPISODE_1
    } 
    else if (episode == 2) {
      return this.EPISODE_2
    } 
    else if (episode == 3) {
      return this.EPISODE_3
    }
    else if (episode == 4) {
      return this.EPISODE_4
    }
    else if (episode == 5) {
      return this.EPISODE_5
    }
    else if (episode == 6) {
      return this.EPISODE_6
    }
    else if (episode == 7) {
      return this.EPISODE_7
    }
    else if (episode == 8) {
      return this.EPISODE_8
    }
    else if (episode == 9) {
      return this.EPISODE_9
    }
    else if (episode == 10) {
      return this.EPISODE_10
    }
    else if (episode == 11) {
      return this.EPISODE_11
    }
    else if (episode == 12) {
      return this.EPISODE_12
    }
    else if (episode == 13) {
      return this.EPISODE_13
    }
    else if (episode == 14) {
      return this.EPISODE_14
    }
    else if (episode == 15) {
      return this.EPISODE_15
    }
    else if (episode == 16) {
      return this.EPISODE_16
    }
    else if (episode == 17) {
      return this.EPISODE_17
    }
    else if (episode == 18) {
      return this.EPISODE_18
    }
    else if (episode == 19) {
      return this.EPISODE_19
    }
    else if (episode == 20) {
      return this.EPISODE_20
    }
    else if (episode == 21) {
      return this.EPISODE_21
    }
    else if (episode == 22) {
      return this.EPISODE_22
    }
    else if (episode == 23) {
      return this.EPISODE_23
    }
    else if (episode == 24) {
      return this.EPISODE_24
    }
    else if (episode == 25) {
      return this.EPISODE_25
    }
    else if (episode == 26) {
      return this.EPISODE_26
    }
    else if (episode == 27) {
      return this.EPISODE_27
    }
    else if (episode == 28) {
      return this.EPISODE_28
    }
    else if (episode == 29) {
      return this.EPISODE_29
    }
    else if (episode == 30) {
      return this.EPISODE_30
    }
    else if (episode == 31) {
      return this.EPISODE_31
    }
    else if (episode == 32) {
      return this.EPISODE_32
    }
    else if (episode == 33) {
      return this.EPISODE_33
    }
    else if (episode == 34) {
      return this.EPISODE_34
    }
    else if (episode == 35) {
      return this.EPISODE_35
    }
    else if (episode == 36) {
      return this.EPISODE_36
    }
    else if (episode == 37) {
      return this.EPISODE_37
    }
    else if (episode == 38) {
      return this.EPISODE_38
    }
    else if (episode == 39) {
      return this.EPISODE_39
    }
    else if (episode == 40) {
      return this.EPISODE_40
    }
    else if (episode == 41) {
      return this.EPISODE_41
    }
    else if (episode == 42) {
      return this.EPISODE_42
    }
    else if (episode == 43) {
      return this.EPISODE_43
    }
    else if (episode == 44) {
      return this.EPISODE_44
    }
    else if (episode == 45) {
      return this.EPISODE_45
    }
    else if (episode == 46) {
      return this.EPISODE_46
    }
    else if (episode == 47) {
      return this.EPISODE_47
    }
    else if (episode == 48) {
      return this.EPISODE_48
    }
    else if (episode == 49) {
      return this.EPISODE_49
    }
    else if (episode == 50) {
      return this.EPISODE_50
    }
    else if (episode == 51) {
      return this.EPISODE_51
    }
    else if (episode == 52) {
      return this.EPISODE_52
    }
    else if (episode == 53) {
      return this.EPISODE_53
    }
    else if (episode == 54) {
      return this.EPISODE_54
    }
    else if (episode == 55) {
      return this.EPISODE_55
    }
    else if (episode == 56) {
      return this.EPISODE_56
    }
    else if (episode == 57) {
      return this.EPISODE_57
    }
    else if (episode == 58) {
      return this.EPISODE_58
    }
    else if (episode == 59) {
      return this.EPISODE_59
    }
    else if (episode == 60) {
      return this.EPISODE_60
    }
    else if (episode == 61) {
      return this.EPISODE_61
    }
    else if (episode == 62) {
      return this.EPISODE_62
    }
    else if (episode == 63) {
      return this.EPISODE_63
    }
    else if (episode == 64) {
      return this.EPISODE_64
    }
  }

  getQuest(episode, quest) {
    if (episode == 1) {
      if (quest == 1) {
        return this.QUEST_1_1
      }
      else if (quest == 2) {
        return this.QUEST_1_2
      }
      else if (quest == 3) {
        return this.QUEST_1_3
      }
      else if (quest == 4) {
        return this.QUEST_1_4
      }
      else if (quest == 5) {
        return this.QUEST_1_5
      }
    }  
    else if (episode == 2) {
      if (quest == 1) {
        return this.QUEST_2_1
      }
      else if (quest == 2) {
        return this.QUEST_2_2
      }
      else if (quest == 3) {
        return this.QUEST_2_3
      }
      else if (quest == 4) {
        return this.QUEST_2_4
      }
      else if (quest == 5) {
        return this.QUEST_2_5
      }
      else if (quest == 6) {
        return this.QUEST_2_6
      }
      else if (quest == 7) {
        return this.QUEST_2_7
      }
      else if (quest == 8) {
        return this.QUEST_2_8
      }
      else if (quest == 9) {
        return this.QUEST_2_9
      }
      else if (quest == 10) {
        return this.QUEST_2_10
      }
    }
    else if (episode == 3) {
      if (quest == 1) {
        return this.QUEST_3_1
      }
      else if (quest == 2) {
        return this.QUEST_3_2
      }
      else if (quest == 3) {
        return this.QUEST_3_3
      }
      else if (quest == 4) {
        return this.QUEST_3_4
      }
      else if (quest == 5) {
        return this.QUEST_3_5
      }
      else if (quest == 6) {
        return this.QUEST_3_6
      }
      else if (quest == 7) {
        return this.QUEST_3_7
      }
      else if (quest == 8) {
        return this.QUEST_3_8
      }
      else if (quest == 9) {
        return this.QUEST_3_9
      }
      else if (quest == 10) {
        return this.QUEST_3_10
      }
    }
    else if (episode == 4) {
      if (quest == 1) {
        return this.QUEST_4_1
      }
      else if (quest == 2) {
        return this.QUEST_4_2
      }
      else if (quest == 3) {
        return this.QUEST_4_3
      }
      else if (quest == 4) {
        return this.QUEST_4_4
      }
      else if (quest == 5) {
        return this.QUEST_4_5
      }
      else if (quest == 6) {
        return this.QUEST_4_6
      }
      else if (quest == 7) {
        return this.QUEST_4_7
      }
      else if (quest == 8) {
        return this.QUEST_4_8
      }
      else if (quest == 9) {
        return this.QUEST_4_9
      }
      else if (quest == 10) {
        return this.QUEST_4_10
      }
    }
    else if (episode == 5) {
      if (quest == 1) {
        return this.QUEST_5_1
      }
      else if (quest == 2) {
        return this.QUEST_5_2
      }
      else if (quest == 3) {
        return this.QUEST_5_3
      }
      else if (quest == 4) {
        return this.QUEST_5_4
      }
      else if (quest == 5) {
        return this.QUEST_5_5
      }
      else if (quest == 6) {
        return this.QUEST_5_6
      }
      else if (quest == 7) {
        return this.QUEST_5_7
      }
      else if (quest == 8) {
        return this.QUEST_5_8
      }
      else if (quest == 9) {
        return this.QUEST_5_9
      }
      else if (quest == 10) {
        return this.QUEST_5_10
      }
    }
    else if (episode == 6) {
      if (quest == 1) {
        return this.QUEST_6_1
      }
      else if (quest == 2) {
        return this.QUEST_6_2
      }
      else if (quest == 3) {
        return this.QUEST_6_3
      }
      else if (quest == 4) {
        return this.QUEST_6_4
      }
      else if (quest == 5) {
        return this.QUEST_6_5
      }
      else if (quest == 6) {
        return this.QUEST_6_6
      }
      else if (quest == 7) {
        return this.QUEST_6_7
      }
      else if (quest == 8) {
        return this.QUEST_6_8
      }
      else if (quest == 9) {
        return this.QUEST_6_9
      }
      else if (quest == 10) {
        return this.QUEST_6_10
      }
    }
    else if (episode == 7) {
      if (quest == 1) {
        return this.QUEST_7_1
      }
      else if (quest == 2) {
        return this.QUEST_7_2
      }
      else if (quest == 3) {
        return this.QUEST_7_3
      }
      else if (quest == 4) {
        return this.QUEST_7_4
      }
      else if (quest == 5) {
        return this.QUEST_7_5
      }
      else if (quest == 6) {
        return this.QUEST_7_6
      }
      else if (quest == 7) {
        return this.QUEST_7_7
      }
      else if (quest == 8) {
        return this.QUEST_7_8
      }
      else if (quest == 9) {
        return this.QUEST_7_9
      }
      else if (quest == 10) {
        return this.QUEST_7_10
      }
    }
    else if (episode == 8) {
      if (quest == 1) {
        return this.QUEST_8_1
      }
      else if (quest == 2) {
        return this.QUEST_8_2
      }
      else if (quest == 3) {
        return this.QUEST_8_3
      }
      else if (quest == 4) {
        return this.QUEST_8_4
      }
      else if (quest == 5) {
        return this.QUEST_8_5
      }
      else if (quest == 6) {
        return this.QUEST_8_6
      }
      else if (quest == 7) {
        return this.QUEST_8_7
      }
      else if (quest == 8) {
        return this.QUEST_8_8
      }
      else if (quest == 9) {
        return this.QUEST_8_9
      }
      else if (quest == 10) {
        return this.QUEST_8_10
      }
    }
    else if (episode == 9) {
      if (quest == 1) {
        return this.QUEST_9_1
      }
      else if (quest == 2) {
        return this.QUEST_9_2
      }
      else if (quest == 3) {
        return this.QUEST_9_3
      }
      else if (quest == 4) {
        return this.QUEST_9_4
      }
      else if (quest == 5) {
        return this.QUEST_9_5
      }
      else if (quest == 6) {
        return this.QUEST_9_6
      }
      else if (quest == 7) {
        return this.QUEST_9_7
      }
      else if (quest == 8) {
        return this.QUEST_9_8
      }
      else if (quest == 9) {
        return this.QUEST_9_9
      }
      else if (quest == 10) {
        return this.QUEST_9_10
      }
    }
    else if (episode == 10) {
      if (quest == 1) {
        return this.QUEST_10_1
      }
      else if (quest == 2) {
        return this.QUEST_10_2
      }
      else if (quest == 3) {
        return this.QUEST_10_3
      }
      else if (quest == 4) {
        return this.QUEST_10_4
      }
      else if (quest == 5) {
        return this.QUEST_10_5
      }
      else if (quest == 6) {
        return this.QUEST_10_6
      }
      else if (quest == 7) {
        return this.QUEST_10_7
      }
      else if (quest == 8) {
        return this.QUEST_10_8
      }
      else if (quest == 9) {
        return this.QUEST_10_9
      }
      else if (quest == 10) {
        return this.QUEST_10_10
      }
    }
    else if (episode == 11) {
      if (quest == 1) {
        return this.QUEST_11_1
      }
      else if (quest == 2) {
        return this.QUEST_11_2
      }
      else if (quest == 3) {
        return this.QUEST_11_3
      }
      else if (quest == 4) {
        return this.QUEST_11_4
      }
      else if (quest == 5) {
        return this.QUEST_11_5
      }
      else if (quest == 6) {
        return this.QUEST_11_6
      }
      else if (quest == 7) {
        return this.QUEST_11_7
      }
      else if (quest == 8) {
        return this.QUEST_11_8
      }
      else if (quest == 9) {
        return this.QUEST_11_9
      }
      else if (quest == 10) {
        return this.QUEST_11_10
      }
    }
    else if (episode == 12) {
      if (quest == 1) {
        return this.QUEST_12_1
      }
      else if (quest == 2) {
        return this.QUEST_12_2
      }
      else if (quest == 3) {
        return this.QUEST_12_3
      }
      else if (quest == 4) {
        return this.QUEST_12_4
      }
      else if (quest == 5) {
        return this.QUEST_12_5
      }
      else if (quest == 6) {
        return this.QUEST_12_6
      }
      else if (quest == 7) {
        return this.QUEST_12_7
      }
      else if (quest == 8) {
        return this.QUEST_12_8
      }
      else if (quest == 9) {
        return this.QUEST_12_9
      }
      else if (quest == 10) {
        return this.QUEST_12_10
      }
    }
    else if (episode == 13) {
      if (quest == 1) {
        return this.QUEST_13_1
      }
      else if (quest == 2) {
        return this.QUEST_13_2
      }
      else if (quest == 3) {
        return this.QUEST_13_3
      }
      else if (quest == 4) {
        return this.QUEST_13_4
      }
      else if (quest == 5) {
        return this.QUEST_13_5
      }
      else if (quest == 6) {
        return this.QUEST_13_6
      }
      else if (quest == 7) {
        return this.QUEST_13_7
      }
      else if (quest == 8) {
        return this.QUEST_13_8
      }
      else if (quest == 9) {
        return this.QUEST_13_9
      }
      else if (quest == 10) {
        return this.QUEST_13_10
      }
    }
    else if (episode == 14) {
      if (quest == 1) {
        return this.QUEST_14_1
      }
      else if (quest == 2) {
        return this.QUEST_14_2
      }
      else if (quest == 3) {
        return this.QUEST_14_3
      }
      else if (quest == 4) {
        return this.QUEST_14_4
      }
      else if (quest == 5) {
        return this.QUEST_14_5
      }
      else if (quest == 6) {
        return this.QUEST_14_6
      }
      else if (quest == 7) {
        return this.QUEST_14_7
      }
      else if (quest == 8) {
        return this.QUEST_14_8
      }
      else if (quest == 9) {
        return this.QUEST_14_9
      }
      else if (quest == 10) {
        return this.QUEST_14_10
      }
    }
    else if (episode == 15) {
      if (quest == 1) {
        return this.QUEST_15_1
      }
      else if (quest == 2) {
        return this.QUEST_15_2
      }
      else if (quest == 3) {
        return this.QUEST_15_3
      }
      else if (quest == 4) {
        return this.QUEST_15_4
      }
      else if (quest == 5) {
        return this.QUEST_15_5
      }
      else if (quest == 6) {
        return this.QUEST_15_6
      }
      else if (quest == 7) {
        return this.QUEST_15_7
      }
      else if (quest == 8) {
        return this.QUEST_15_8
      }
      else if (quest == 9) {
        return this.QUEST_15_9
      }
      else if (quest == 10) {
        return this.QUEST_15_10
      }
    }
    else if (episode == 16) {
      if (quest == 1) {
        return this.QUEST_16_1
      }
      else if (quest == 2) {
        return this.QUEST_16_2
      }
      else if (quest == 3) {
        return this.QUEST_16_3
      }
      else if (quest == 4) {
        return this.QUEST_16_4
      }
      else if (quest == 5) {
        return this.QUEST_16_5
      }
      else if (quest == 6) {
        return this.QUEST_16_6
      }
      else if (quest == 7) {
        return this.QUEST_16_7
      }
      else if (quest == 8) {
        return this.QUEST_16_8
      }
      else if (quest == 9) {
        return this.QUEST_16_9
      }
      else if (quest == 10) {
        return this.QUEST_16_10
      }
    }
    else if (episode == 17) {
      if (quest == 1) {
        return this.QUEST_17_1
      }
      else if (quest == 2) {
        return this.QUEST_17_2
      }
      else if (quest == 3) {
        return this.QUEST_17_3
      }
      else if (quest == 4) {
        return this.QUEST_17_4
      }
      else if (quest == 5) {
        return this.QUEST_17_5
      }
      else if (quest == 6) {
        return this.QUEST_17_6
      }
      else if (quest == 7) {
        return this.QUEST_17_7
      }
      else if (quest == 8) {
        return this.QUEST_17_8
      }
      else if (quest == 9) {
        return this.QUEST_17_9
      }
      else if (quest == 10) {
        return this.QUEST_17_10
      }
    }
    else if (episode == 18) {
      if (quest == 1) {
        return this.QUEST_18_1
      }
      else if (quest == 2) {
        return this.QUEST_18_2
      }
      else if (quest == 3) {
        return this.QUEST_18_3
      }
      else if (quest == 4) {
        return this.QUEST_18_4
      }
      else if (quest == 5) {
        return this.QUEST_18_5
      }
      else if (quest == 6) {
        return this.QUEST_18_6
      }
      else if (quest == 7) {
        return this.QUEST_18_7
      }
      else if (quest == 8) {
        return this.QUEST_18_8
      }
      else if (quest == 9) {
        return this.QUEST_18_9
      }
      else if (quest == 10) {
        return this.QUEST_18_10
      }
    }
    else if (episode == 19) {
      if (quest == 1) {
        return this.QUEST_19_1
      }
      else if (quest == 2) {
        return this.QUEST_19_2
      }
      else if (quest == 3) {
        return this.QUEST_19_3
      }
      else if (quest == 4) {
        return this.QUEST_19_4
      }
      else if (quest == 5) {
        return this.QUEST_19_5
      }
      else if (quest == 6) {
        return this.QUEST_19_6
      }
      else if (quest == 7) {
        return this.QUEST_19_7
      }
      else if (quest == 8) {
        return this.QUEST_19_8
      }
      else if (quest == 9) {
        return this.QUEST_19_9
      }
      else if (quest == 10) {
        return this.QUEST_19_10
      }
    }
    else if (episode == 20) {
      if (quest == 1) {
        return this.QUEST_20_1
      }
      else if (quest == 2) {
        return this.QUEST_20_2
      }
      else if (quest == 3) {
        return this.QUEST_20_3
      }
      else if (quest == 4) {
        return this.QUEST_20_4
      }
      else if (quest == 5) {
        return this.QUEST_20_5
      }
      else if (quest == 6) {
        return this.QUEST_20_6
      }
      else if (quest == 7) {
        return this.QUEST_20_7
      }
      else if (quest == 8) {
        return this.QUEST_20_8
      }
      else if (quest == 9) {
        return this.QUEST_20_9
      }
      else if (quest == 10) {
        return this.QUEST_20_10
      }
    }
    else if (episode == 21) {
      if (quest == 1) {
        return this.QUEST_21_1
      }
      else if (quest == 2) {
        return this.QUEST_21_2
      }
      else if (quest == 3) {
        return this.QUEST_21_3
      }
      else if (quest == 4) {
        return this.QUEST_21_4
      }
      else if (quest == 5) {
        return this.QUEST_21_5
      }
      else if (quest == 6) {
        return this.QUEST_21_6
      }
      else if (quest == 7) {
        return this.QUEST_21_7
      }
      else if (quest == 8) {
        return this.QUEST_21_8
      }
      else if (quest == 9) {
        return this.QUEST_21_9
      }
      else if (quest == 10) {
        return this.QUEST_21_10
      }
    }
    else if (episode == 22) {
      if (quest == 1) {
        return this.QUEST_22_1
      }
      else if (quest == 2) {
        return this.QUEST_22_2
      }
      else if (quest == 3) {
        return this.QUEST_22_3
      }
      else if (quest == 4) {
        return this.QUEST_22_4
      }
      else if (quest == 5) {
        return this.QUEST_22_5
      }
      else if (quest == 6) {
        return this.QUEST_22_6
      }
      else if (quest == 7) {
        return this.QUEST_22_7
      }
      else if (quest == 8) {
        return this.QUEST_22_8
      }
      else if (quest == 9) {
        return this.QUEST_22_9
      }
      else if (quest == 10) {
        return this.QUEST_22_10
      }
    }
    else if (episode == 23) {
      if (quest == 1) {
        return this.QUEST_23_1
      }
      else if (quest == 2) {
        return this.QUEST_23_2
      }
      else if (quest == 3) {
        return this.QUEST_23_3
      }
      else if (quest == 4) {
        return this.QUEST_23_4
      }
      else if (quest == 5) {
        return this.QUEST_23_5
      }
      else if (quest == 6) {
        return this.QUEST_23_6
      }
      else if (quest == 7) {
        return this.QUEST_23_7
      }
      else if (quest == 8) {
        return this.QUEST_23_8
      }
      else if (quest == 9) {
        return this.QUEST_23_9
      }
      else if (quest == 10) {
        return this.QUEST_23_10
      }
    }
    else if (episode == 24) {
      if (quest == 1) {
        return this.QUEST_24_1
      }
      else if (quest == 2) {
        return this.QUEST_24_2
      }
      else if (quest == 3) {
        return this.QUEST_24_3
      }
      else if (quest == 4) {
        return this.QUEST_24_4
      }
      else if (quest == 5) {
        return this.QUEST_24_5
      }
      else if (quest == 6) {
        return this.QUEST_24_6
      }
      else if (quest == 7) {
        return this.QUEST_24_7
      }
      else if (quest == 8) {
        return this.QUEST_24_8
      }
      else if (quest == 9) {
        return this.QUEST_24_9
      }
      else if (quest == 10) {
        return this.QUEST_24_10
      }
    }
    else if (episode == 25) {
      if (quest == 1) {
        return this.QUEST_25_1
      }
      else if (quest == 2) {
        return this.QUEST_25_2
      }
      else if (quest == 3) {
        return this.QUEST_25_3
      }
      else if (quest == 4) {
        return this.QUEST_25_4
      }
      else if (quest == 5) {
        return this.QUEST_25_5
      }
      else if (quest == 6) {
        return this.QUEST_25_6
      }
      else if (quest == 7) {
        return this.QUEST_25_7
      }
      else if (quest == 8) {
        return this.QUEST_25_8
      }
      else if (quest == 9) {
        return this.QUEST_25_9
      }
      else if (quest == 10) {
        return this.QUEST_25_10
      }
    }
    else if (episode == 26) {
      if (quest == 1) {
        return this.QUEST_26_1
      }
      else if (quest == 2) {
        return this.QUEST_26_2
      }
      else if (quest == 3) {
        return this.QUEST_26_3
      }
      else if (quest == 4) {
        return this.QUEST_26_4
      }
      else if (quest == 5) {
        return this.QUEST_26_5
      }
      else if (quest == 6) {
        return this.QUEST_26_6
      }
      else if (quest == 7) {
        return this.QUEST_26_7
      }
      else if (quest == 8) {
        return this.QUEST_26_8
      }
      else if (quest == 9) {
        return this.QUEST_26_9
      }
      else if (quest == 10) {
        return this.QUEST_26_10
      }
    }
    else if (episode == 27) {
      if (quest == 1) {
        return this.QUEST_27_1
      }
      else if (quest == 2) {
        return this.QUEST_27_2
      }
      else if (quest == 3) {
        return this.QUEST_27_3
      }
      else if (quest == 4) {
        return this.QUEST_27_4
      }
      else if (quest == 5) {
        return this.QUEST_27_5
      }
      else if (quest == 6) {
        return this.QUEST_27_6
      }
      else if (quest == 7) {
        return this.QUEST_27_7
      }
      else if (quest == 8) {
        return this.QUEST_27_8
      }
      else if (quest == 9) {
        return this.QUEST_27_9
      }
      else if (quest == 10) {
        return this.QUEST_27_10
      }
    }
    else if (episode == 28) {
      if (quest == 1) {
        return this.QUEST_28_1
      }
      else if (quest == 2) {
        return this.QUEST_28_2
      }
      else if (quest == 3) {
        return this.QUEST_28_3
      }
      else if (quest == 4) {
        return this.QUEST_28_4
      }
      else if (quest == 5) {
        return this.QUEST_28_5
      }
      else if (quest == 6) {
        return this.QUEST_28_6
      }
      else if (quest == 7) {
        return this.QUEST_28_7
      }
      else if (quest == 8) {
        return this.QUEST_28_8
      }
      else if (quest == 9) {
        return this.QUEST_28_9
      }
      else if (quest == 10) {
        return this.QUEST_28_10
      }
    }
    else if (episode == 29) {
      if (quest == 1) {
        return this.QUEST_29_1
      }
      else if (quest == 2) {
        return this.QUEST_29_2
      }
      else if (quest == 3) {
        return this.QUEST_29_3
      }
      else if (quest == 4) {
        return this.QUEST_29_4
      }
      else if (quest == 5) {
        return this.QUEST_29_5
      }
      else if (quest == 6) {
        return this.QUEST_29_6
      }
      else if (quest == 7) {
        return this.QUEST_29_7
      }
      else if (quest == 8) {
        return this.QUEST_29_8
      }
      else if (quest == 9) {
        return this.QUEST_29_9
      }
      else if (quest == 10) {
        return this.QUEST_29_10
      }
    }
    else if (episode == 30) {
      if (quest == 1) {
        return this.QUEST_30_1
      }
      else if (quest == 2) {
        return this.QUEST_30_2
      }
      else if (quest == 3) {
        return this.QUEST_30_3
      }
      else if (quest == 4) {
        return this.QUEST_30_4
      }
      else if (quest == 5) {
        return this.QUEST_30_5
      }
      else if (quest == 6) {
        return this.QUEST_30_6
      }
      else if (quest == 7) {
        return this.QUEST_30_7
      }
      else if (quest == 8) {
        return this.QUEST_30_8
      }
      else if (quest == 9) {
        return this.QUEST_30_9
      }
      else if (quest == 10) {
        return this.QUEST_30_10
      }
    }
    else if (episode == 31) {
      if (quest == 1) {
        return this.QUEST_31_1
      }
      else if (quest == 2) {
        return this.QUEST_31_2
      }
      else if (quest == 3) {
        return this.QUEST_31_3
      }
      else if (quest == 4) {
        return this.QUEST_31_4
      }
      else if (quest == 5) {
        return this.QUEST_31_5
      }
      else if (quest == 6) {
        return this.QUEST_31_6
      }
      else if (quest == 7) {
        return this.QUEST_31_7
      }
      else if (quest == 8) {
        return this.QUEST_31_8
      }
      else if (quest == 9) {
        return this.QUEST_31_9
      }
      else if (quest == 10) {
        return this.QUEST_31_10
      }
    }
    else if (episode == 32) {
      if (quest == 1) {
        return this.QUEST_32_1
      }
      else if (quest == 2) {
        return this.QUEST_32_2
      }
      else if (quest == 3) {
        return this.QUEST_32_3
      }
      else if (quest == 4) {
        return this.QUEST_32_4
      }
      else if (quest == 5) {
        return this.QUEST_32_5
      }
      else if (quest == 6) {
        return this.QUEST_32_6
      }
      else if (quest == 7) {
        return this.QUEST_32_7
      }
      else if (quest == 8) {
        return this.QUEST_32_8
      }
      else if (quest == 9) {
        return this.QUEST_32_9
      }
      else if (quest == 10) {
        return this.QUEST_32_10
      }
    }
    else if (episode == 33) {
      if (quest == 1) {
        return this.QUEST_33_1
      }
      else if (quest == 2) {
        return this.QUEST_33_2
      }
      else if (quest == 3) {
        return this.QUEST_33_3
      }
      else if (quest == 4) {
        return this.QUEST_33_4
      }
      else if (quest == 5) {
        return this.QUEST_33_5
      }
      else if (quest == 6) {
        return this.QUEST_33_6
      }
      else if (quest == 7) {
        return this.QUEST_33_7
      }
      else if (quest == 8) {
        return this.QUEST_33_8
      }
      else if (quest == 9) {
        return this.QUEST_33_9
      }
      else if (quest == 10) {
        return this.QUEST_33_10
      }
    }
    else if (episode == 34) {
      if (quest == 1) {
        return this.QUEST_34_1
      }
      else if (quest == 2) {
        return this.QUEST_34_2
      }
      else if (quest == 3) {
        return this.QUEST_34_3
      }
      else if (quest == 4) {
        return this.QUEST_34_4
      }
      else if (quest == 5) {
        return this.QUEST_34_5
      }
      else if (quest == 6) {
        return this.QUEST_34_6
      }
      else if (quest == 7) {
        return this.QUEST_34_7
      }
      else if (quest == 8) {
        return this.QUEST_34_8
      }
      else if (quest == 9) {
        return this.QUEST_34_9
      }
      else if (quest == 10) {
        return this.QUEST_34_10
      }
    }
    else if (episode == 35) {
      if (quest == 1) {
        return this.QUEST_35_1
      }
      else if (quest == 2) {
        return this.QUEST_35_2
      }
      else if (quest == 3) {
        return this.QUEST_35_3
      }
      else if (quest == 4) {
        return this.QUEST_35_4
      }
      else if (quest == 5) {
        return this.QUEST_35_5
      }
      else if (quest == 6) {
        return this.QUEST_35_6
      }
      else if (quest == 7) {
        return this.QUEST_35_7
      }
      else if (quest == 8) {
        return this.QUEST_35_8
      }
      else if (quest == 9) {
        return this.QUEST_35_9
      }
      else if (quest == 10) {
        return this.QUEST_35_10
      }
    }
    else if (episode == 36) {
      if (quest == 1) {
        return this.QUEST_36_1
      }
      else if (quest == 2) {
        return this.QUEST_36_2
      }
      else if (quest == 3) {
        return this.QUEST_36_3
      }
      else if (quest == 4) {
        return this.QUEST_36_4
      }
      else if (quest == 5) {
        return this.QUEST_36_5
      }
      else if (quest == 6) {
        return this.QUEST_36_6
      }
      else if (quest == 7) {
        return this.QUEST_36_7
      }
      else if (quest == 8) {
        return this.QUEST_36_8
      }
      else if (quest == 9) {
        return this.QUEST_36_9
      }
      else if (quest == 10) {
        return this.QUEST_36_10
      }
    }
    else if (episode == 37) {
      if (quest == 1) {
        return this.QUEST_37_1
      }
      else if (quest == 2) {
        return this.QUEST_37_2
      }
      else if (quest == 3) {
        return this.QUEST_37_3
      }
      else if (quest == 4) {
        return this.QUEST_37_4
      }
      else if (quest == 5) {
        return this.QUEST_37_5
      }
      else if (quest == 6) {
        return this.QUEST_37_6
      }
      else if (quest == 7) {
        return this.QUEST_37_7
      }
      else if (quest == 8) {
        return this.QUEST_37_8
      }
      else if (quest == 9) {
        return this.QUEST_37_9
      }
      else if (quest == 10) {
        return this.QUEST_37_10
      }
    }
    else if (episode == 38) {
      if (quest == 1) {
        return this.QUEST_38_1
      }
      else if (quest == 2) {
        return this.QUEST_38_2
      }
      else if (quest == 3) {
        return this.QUEST_38_3
      }
      else if (quest == 4) {
        return this.QUEST_38_4
      }
      else if (quest == 5) {
        return this.QUEST_38_5
      }
      else if (quest == 6) {
        return this.QUEST_38_6
      }
      else if (quest == 7) {
        return this.QUEST_38_7
      }
      else if (quest == 8) {
        return this.QUEST_38_8
      }
      else if (quest == 9) {
        return this.QUEST_38_9
      }
      else if (quest == 10) {
        return this.QUEST_38_10
      }
    }
    else if (episode == 39) {
      if (quest == 1) {
        return this.QUEST_39_1
      }
      else if (quest == 2) {
        return this.QUEST_39_2
      }
      else if (quest == 3) {
        return this.QUEST_39_3
      }
      else if (quest == 4) {
        return this.QUEST_39_4
      }
      else if (quest == 5) {
        return this.QUEST_39_5
      }
      else if (quest == 6) {
        return this.QUEST_39_6
      }
      else if (quest == 7) {
        return this.QUEST_39_7
      }
      else if (quest == 8) {
        return this.QUEST_39_8
      }
      else if (quest == 9) {
        return this.QUEST_39_9
      }
      else if (quest == 10) {
        return this.QUEST_39_10
      }
    }
    else if (episode == 40) {
      if (quest == 1) {
        return this.QUEST_40_1
      }
      else if (quest == 2) {
        return this.QUEST_40_2
      }
      else if (quest == 3) {
        return this.QUEST_40_3
      }
      else if (quest == 4) {
        return this.QUEST_40_4
      }
      else if (quest == 5) {
        return this.QUEST_40_5
      }
      else if (quest == 6) {
        return this.QUEST_40_6
      }
      else if (quest == 7) {
        return this.QUEST_40_7
      }
      else if (quest == 8) {
        return this.QUEST_40_8
      }
      else if (quest == 9) {
        return this.QUEST_40_9
      }
      else if (quest == 10) {
        return this.QUEST_40_10
      }
    }
    else if (episode == 41) {
      if (quest == 1) {
        return this.QUEST_41_1
      }
      else if (quest == 2) {
        return this.QUEST_41_2
      }
      else if (quest == 3) {
        return this.QUEST_41_3
      }
      else if (quest == 4) {
        return this.QUEST_41_4
      }
      else if (quest == 5) {
        return this.QUEST_41_5
      }
      else if (quest == 6) {
        return this.QUEST_41_6
      }
      else if (quest == 7) {
        return this.QUEST_41_7
      }
      else if (quest == 8) {
        return this.QUEST_41_8
      }
      else if (quest == 9) {
        return this.QUEST_41_9
      }
      else if (quest == 10) {
        return this.QUEST_41_10
      }
    }
    else if (episode == 42) {
      if (quest == 1) {
        return this.QUEST_42_1
      }
      else if (quest == 2) {
        return this.QUEST_42_2
      }
      else if (quest == 3) {
        return this.QUEST_42_3
      }
      else if (quest == 4) {
        return this.QUEST_42_4
      }
      else if (quest == 5) {
        return this.QUEST_42_5
      }
      else if (quest == 6) {
        return this.QUEST_42_6
      }
      else if (quest == 7) {
        return this.QUEST_42_7
      }
      else if (quest == 8) {
        return this.QUEST_42_8
      }
      else if (quest == 9) {
        return this.QUEST_42_9
      }
      else if (quest == 10) {
        return this.QUEST_42_10
      }
    }
    else if (episode == 43) {
      if (quest == 1) {
        return this.QUEST_43_1
      }
      else if (quest == 2) {
        return this.QUEST_43_2
      }
      else if (quest == 3) {
        return this.QUEST_43_3
      }
      else if (quest == 4) {
        return this.QUEST_43_4
      }
      else if (quest == 5) {
        return this.QUEST_43_5
      }
      else if (quest == 6) {
        return this.QUEST_43_6
      }
      else if (quest == 7) {
        return this.QUEST_43_7
      }
      else if (quest == 8) {
        return this.QUEST_43_8
      }
      else if (quest == 9) {
        return this.QUEST_43_9
      }
      else if (quest == 10) {
        return this.QUEST_43_10
      }
    }
    else if (episode == 44) {
      if (quest == 1) {
        return this.QUEST_44_1
      }
      else if (quest == 2) {
        return this.QUEST_44_2
      }
      else if (quest == 3) {
        return this.QUEST_44_3
      }
      else if (quest == 4) {
        return this.QUEST_44_4
      }
      else if (quest == 5) {
        return this.QUEST_44_5
      }
      else if (quest == 6) {
        return this.QUEST_44_6
      }
      else if (quest == 7) {
        return this.QUEST_44_7
      }
      else if (quest == 8) {
        return this.QUEST_44_8
      }
      else if (quest == 9) {
        return this.QUEST_44_9
      }
      else if (quest == 10) {
        return this.QUEST_44_10
      }
    }
    else if (episode == 45) {
      if (quest == 1) {
        return this.QUEST_45_1
      }
      else if (quest == 2) {
        return this.QUEST_45_2
      }
      else if (quest == 3) {
        return this.QUEST_45_3
      }
      else if (quest == 4) {
        return this.QUEST_45_4
      }
      else if (quest == 5) {
        return this.QUEST_45_5
      }
      else if (quest == 6) {
        return this.QUEST_45_6
      }
      else if (quest == 7) {
        return this.QUEST_45_7
      }
      else if (quest == 8) {
        return this.QUEST_45_8
      }
      else if (quest == 9) {
        return this.QUEST_45_9
      }
      else if (quest == 10) {
        return this.QUEST_45_10
      }
    }
    else if (episode == 46) {
      if (quest == 1) {
        return this.QUEST_46_1
      }
      else if (quest == 2) {
        return this.QUEST_46_2
      }
      else if (quest == 3) {
        return this.QUEST_46_3
      }
      else if (quest == 4) {
        return this.QUEST_46_4
      }
      else if (quest == 5) {
        return this.QUEST_46_5
      }
      else if (quest == 6) {
        return this.QUEST_46_6
      }
      else if (quest == 7) {
        return this.QUEST_46_7
      }
      else if (quest == 8) {
        return this.QUEST_46_8
      }
      else if (quest == 9) {
        return this.QUEST_46_9
      }
      else if (quest == 10) {
        return this.QUEST_46_10
      }
    }
    else if (episode == 47) {
      if (quest == 1) {
        return this.QUEST_47_1
      }
      else if (quest == 2) {
        return this.QUEST_47_2
      }
      else if (quest == 3) {
        return this.QUEST_47_3
      }
      else if (quest == 4) {
        return this.QUEST_47_4
      }
      else if (quest == 5) {
        return this.QUEST_47_5
      }
      else if (quest == 6) {
        return this.QUEST_47_6
      }
      else if (quest == 7) {
        return this.QUEST_47_7
      }
      else if (quest == 8) {
        return this.QUEST_47_8
      }
      else if (quest == 9) {
        return this.QUEST_47_9
      }
      else if (quest == 10) {
        return this.QUEST_47_10
      }
    }
    else if (episode == 48) {
      if (quest == 1) {
        return this.QUEST_48_1
      }
      else if (quest == 2) {
        return this.QUEST_48_2
      }
      else if (quest == 3) {
        return this.QUEST_48_3
      }
      else if (quest == 4) {
        return this.QUEST_48_4
      }
      else if (quest == 5) {
        return this.QUEST_48_5
      }
      else if (quest == 6) {
        return this.QUEST_48_6
      }
      else if (quest == 7) {
        return this.QUEST_48_7
      }
      else if (quest == 8) {
        return this.QUEST_48_8
      }
      else if (quest == 9) {
        return this.QUEST_48_9
      }
      else if (quest == 10) {
        return this.QUEST_48_10
      }
    }
    else if (episode == 49) {
      if (quest == 1) {
        return this.QUEST_49_1
      }
      else if (quest == 2) {
        return this.QUEST_49_2
      }
      else if (quest == 3) {
        return this.QUEST_49_3
      }
      else if (quest == 4) {
        return this.QUEST_49_4
      }
      else if (quest == 5) {
        return this.QUEST_49_5
      }
      else if (quest == 6) {
        return this.QUEST_49_6
      }
      else if (quest == 7) {
        return this.QUEST_49_7
      }
      else if (quest == 8) {
        return this.QUEST_49_8
      }
      else if (quest == 9) {
        return this.QUEST_49_9
      }
      else if (quest == 10) {
        return this.QUEST_49_10
      }
    }
    else if (episode == 50) {
      if (quest == 1) {
        return this.QUEST_50_1
      }
      else if (quest == 2) {
        return this.QUEST_50_2
      }
      else if (quest == 3) {
        return this.QUEST_50_3
      }
      else if (quest == 4) {
        return this.QUEST_50_4
      }
      else if (quest == 5) {
        return this.QUEST_50_5
      }
      else if (quest == 6) {
        return this.QUEST_50_6
      }
      else if (quest == 7) {
        return this.QUEST_50_7
      }
      else if (quest == 8) {
        return this.QUEST_50_8
      }
      else if (quest == 9) {
        return this.QUEST_50_9
      }
      else if (quest == 10) {
        return this.QUEST_50_10
      }
    }
    else if (episode == 51) {
      if (quest == 1) {
        return this.QUEST_51_1
      }
      else if (quest == 2) {
        return this.QUEST_51_2
      }
      else if (quest == 3) {
        return this.QUEST_51_3
      }
      else if (quest == 4) {
        return this.QUEST_51_4
      }
      else if (quest == 5) {
        return this.QUEST_51_5
      }
      else if (quest == 6) {
        return this.QUEST_51_6
      }
      else if (quest == 7) {
        return this.QUEST_51_7
      }
      else if (quest == 8) {
        return this.QUEST_51_8
      }
      else if (quest == 9) {
        return this.QUEST_51_9
      }
      else if (quest == 10) {
        return this.QUEST_51_10
      }
    }
    else if (episode == 52) {
      if (quest == 1) {
        return this.QUEST_52_1
      }
      else if (quest == 2) {
        return this.QUEST_52_2
      }
      else if (quest == 3) {
        return this.QUEST_52_3
      }
      else if (quest == 4) {
        return this.QUEST_52_4
      }
      else if (quest == 5) {
        return this.QUEST_52_5
      }
      else if (quest == 6) {
        return this.QUEST_52_6
      }
      else if (quest == 7) {
        return this.QUEST_52_7
      }
      else if (quest == 8) {
        return this.QUEST_52_8
      }
      else if (quest == 9) {
        return this.QUEST_52_9
      }
      else if (quest == 10) {
        return this.QUEST_52_10
      }
    }
    else if (episode == 53) {
      if (quest == 1) {
        return this.QUEST_53_1
      }
      else if (quest == 2) {
        return this.QUEST_53_2
      }
      else if (quest == 3) {
        return this.QUEST_53_3
      }
      else if (quest == 4) {
        return this.QUEST_53_4
      }
      else if (quest == 5) {
        return this.QUEST_53_5
      }
      else if (quest == 6) {
        return this.QUEST_53_6
      }
      else if (quest == 7) {
        return this.QUEST_53_7
      }
      else if (quest == 8) {
        return this.QUEST_53_8
      }
      else if (quest == 9) {
        return this.QUEST_53_9
      }
      else if (quest == 10) {
        return this.QUEST_53_10
      }
    }
    else if (episode == 54) {
      if (quest == 1) {
        return this.QUEST_54_1
      }
      else if (quest == 2) {
        return this.QUEST_54_2
      }
      else if (quest == 3) {
        return this.QUEST_54_3
      }
      else if (quest == 4) {
        return this.QUEST_54_4
      }
      else if (quest == 5) {
        return this.QUEST_54_5
      }
      else if (quest == 6) {
        return this.QUEST_54_6
      }
      else if (quest == 7) {
        return this.QUEST_54_7
      }
      else if (quest == 8) {
        return this.QUEST_54_8
      }
      else if (quest == 9) {
        return this.QUEST_54_9
      }
      else if (quest == 10) {
        return this.QUEST_54_10
      }
    }
    else if (episode == 55) {
      if (quest == 1) {
        return this.QUEST_55_1
      }
      else if (quest == 2) {
        return this.QUEST_55_2
      }
      else if (quest == 3) {
        return this.QUEST_55_3
      }
      else if (quest == 4) {
        return this.QUEST_55_4
      }
      else if (quest == 5) {
        return this.QUEST_55_5
      }
      else if (quest == 6) {
        return this.QUEST_55_6
      }
      else if (quest == 7) {
        return this.QUEST_55_7
      }
      else if (quest == 8) {
        return this.QUEST_55_8
      }
      else if (quest == 9) {
        return this.QUEST_55_9
      }
      else if (quest == 10) {
        return this.QUEST_55_10
      }
    }
    else if (episode == 56) {
      if (quest == 1) {
        return this.QUEST_56_1
      }
      else if (quest == 2) {
        return this.QUEST_56_2
      }
      else if (quest == 3) {
        return this.QUEST_56_3
      }
      else if (quest == 4) {
        return this.QUEST_56_4
      }
      else if (quest == 5) {
        return this.QUEST_56_5
      }
      else if (quest == 6) {
        return this.QUEST_56_6
      }
      else if (quest == 7) {
        return this.QUEST_56_7
      }
      else if (quest == 8) {
        return this.QUEST_56_8
      }
      else if (quest == 9) {
        return this.QUEST_56_9
      }
      else if (quest == 10) {
        return this.QUEST_56_10
      }
    }
    else if (episode == 57) {
      if (quest == 1) {
        return this.QUEST_57_1
      }
      else if (quest == 2) {
        return this.QUEST_57_2
      }
      else if (quest == 3) {
        return this.QUEST_57_3
      }
      else if (quest == 4) {
        return this.QUEST_57_4
      }
      else if (quest == 5) {
        return this.QUEST_57_5
      }
      else if (quest == 6) {
        return this.QUEST_57_6
      }
      else if (quest == 7) {
        return this.QUEST_57_7
      }
      else if (quest == 8) {
        return this.QUEST_57_8
      }
      else if (quest == 9) {
        return this.QUEST_57_9
      }
      else if (quest == 10) {
        return this.QUEST_57_10
      }
      else if (quest == 11) {
        return this.QUEST_57_11
      }
    }
    else if (episode == 58) {
      if (quest == 1) {
        return this.QUEST_58_1
      }
      else if (quest == 2) {
        return this.QUEST_58_2
      }
      else if (quest == 3) {
        return this.QUEST_58_3
      }
      else if (quest == 4) {
        return this.QUEST_58_4
      }
      else if (quest == 5) {
        return this.QUEST_58_5
      }
      else if (quest == 6) {
        return this.QUEST_58_6
      }
      else if (quest == 7) {
        return this.QUEST_58_7
      }
      else if (quest == 8) {
        return this.QUEST_58_8
      }
      else if (quest == 9) {
        return this.QUEST_58_9
      }
      else if (quest == 10) {
        return this.QUEST_58_10
      }
      else if (quest == 11) {
        return this.QUEST_58_11
      }
    }
    else if (episode == 59) {
      if (quest == 1) {
        return this.QUEST_59_1
      }
      else if (quest == 2) {
        return this.QUEST_59_2
      }
      else if (quest == 3) {
        return this.QUEST_59_3
      }
      else if (quest == 4) {
        return this.QUEST_59_4
      }
      else if (quest == 5) {
        return this.QUEST_59_5
      }
      else if (quest == 6) {
        return this.QUEST_59_6
      }
      else if (quest == 7) {
        return this.QUEST_59_7
      }
      else if (quest == 8) {
        return this.QUEST_59_8
      }
      else if (quest == 9) {
        return this.QUEST_59_9
      }
      else if (quest == 10) {
        return this.QUEST_59_10
      }
      else if (quest == 11) {
        return this.QUEST_59_11
      }
    }
    else if (episode == 60) {
      if (quest == 1) {
        return this.QUEST_60_1
      }
      else if (quest == 2) {
        return this.QUEST_60_2
      }
      else if (quest == 3) {
        return this.QUEST_60_3
      }
      else if (quest == 4) {
        return this.QUEST_60_4
      }
      else if (quest == 5) {
        return this.QUEST_60_5
      }
      else if (quest == 6) {
        return this.QUEST_60_6
      }
      else if (quest == 7) {
        return this.QUEST_60_7
      }
      else if (quest == 8) {
        return this.QUEST_60_8
      }
      else if (quest == 9) {
        return this.QUEST_60_9
      }
      else if (quest == 10) {
        return this.QUEST_60_10
      }
      else if (quest == 11) {
        return this.QUEST_60_11
      }
    }
    else if (episode == 61) {
      if (quest == 1) {
        return this.QUEST_61_1
      }
      else if (quest == 2) {
        return this.QUEST_61_2
      }
      else if (quest == 3) {
        return this.QUEST_61_3
      }
      else if (quest == 4) {
        return this.QUEST_61_4
      }
      else if (quest == 5) {
        return this.QUEST_61_5
      }
      else if (quest == 6) {
        return this.QUEST_61_6
      }
      else if (quest == 7) {
        return this.QUEST_61_7
      }
      else if (quest == 8) {
        return this.QUEST_61_8
      }
      else if (quest == 9) {
        return this.QUEST_61_9
      }
      else if (quest == 10) {
        return this.QUEST_61_10
      }
      else if (quest == 11) {
        return this.QUEST_61_11
      }
    }
    else if (episode == 62) {
      if (quest == 1) {
        return this.QUEST_62_1
      }
      else if (quest == 2) {
        return this.QUEST_62_2
      }
      else if (quest == 3) {
        return this.QUEST_62_3
      }
      else if (quest == 4) {
        return this.QUEST_62_4
      }
      else if (quest == 5) {
        return this.QUEST_62_5
      }
      else if (quest == 6) {
        return this.QUEST_62_6
      }
      else if (quest == 7) {
        return this.QUEST_62_7
      }
      else if (quest == 8) {
        return this.QUEST_62_8
      }
      else if (quest == 9) {
        return this.QUEST_62_9
      }
      else if (quest == 10) {
        return this.QUEST_62_10
      }
      else if (quest == 11) {
        return this.QUEST_62_11
      }
    }
    else if (episode == 63) {
      if (quest == 1) {
        return this.QUEST_63_1
      }
      else if (quest == 2) {
        return this.QUEST_63_2
      }
      else if (quest == 3) {
        return this.QUEST_63_3
      }
      else if (quest == 4) {
        return this.QUEST_63_4
      }
      else if (quest == 5) {
        return this.QUEST_63_5
      }
      else if (quest == 6) {
        return this.QUEST_63_6
      }
      else if (quest == 7) {
        return this.QUEST_63_7
      }
      else if (quest == 8) {
        return this.QUEST_63_8
      }
      else if (quest == 9) {
        return this.QUEST_63_9
      }
      else if (quest == 10) {
        return this.QUEST_63_10
      }
      else if (quest == 11) {
        return this.QUEST_63_11
      }
    }
    else if (episode == 64) {
      if (quest == 1) {
        return this.QUEST_64_1
      }
      else if (quest == 2) {
        return this.QUEST_64_2
      }
      else if (quest == 3) {
        return this.QUEST_64_3
      }
      else if (quest == 4) {
        return this.QUEST_64_4
      }
      else if (quest == 5) {
        return this.QUEST_64_5
      }
      else if (quest == 6) {
        return this.QUEST_64_6
      }
      else if (quest == 7) {
        return this.QUEST_64_7
      }
      else if (quest == 8) {
        return this.QUEST_64_8
      }
      else if (quest == 9) {
        return this.QUEST_64_9
      }
      else if (quest == 10) {
        return this.QUEST_64_10
      }
      else if (quest == 11) {
        return this.QUEST_64_11
      }
    }
  }
}
