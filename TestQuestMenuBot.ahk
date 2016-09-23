#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

;------- INITIALIZE -------------------------
initGlobals() ; Found in GlobalConstants.ahk
;--------------------------------------------

;========================================================
;=================== QUEST ==============================
;========================================================

questMenuBot := new QuestMenuBot()


test1() {
  SB_SetText("Test isEpisodeSelection()")
  result:= ""
  if (questMenuBot.isEpisodeSelection()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isEpisodeSelection() -- " . result)
}

test2() {
  questMenuBot.selectEpisode(1)
}

test3() {
  questMenuBot.selectEpisode(64)
}

test4() {
  questMenuBot.selectPisode(11)
}

test5() {
  questMenuBot.selectQuest(10, 1)
}

test6() {
  questMenuBot.selectQuest(10, 4)
}

test7() {
  questMenuBot.selectQuest(10, 10)
}

test8() {
  SB_SetText("Test openOrCreateDB()")
  questMenuBot.openOrCreateDB()
  questMenuBot.closeDB()
  SB_SetText("Tested openOrCreateDB()")
}

test9() {
  SB_SetText("Test createQuestDataTable()")
  questMenuBot.openOrCreateDB()
  questMenuBot.createQuestDataTable()
  SB_SetText("Tested createQuestDataTable()")
  questMenuBot.closeDB()
}

test10() {
  SB_SetText("Test dropTable()")
  questMenuBot.openOrCreateDB()
  questMenuBot.dropTable()
  SB_SetText("Tested dropTable()")
  questMenuBot.closeDB()
}

test11() {
  SB_SetText("Test deleteDB()")
  startCount := A_TickCount
  questMenuBot.deleteDB()
  SB_SetText("Tested deleteDB() in " . (A_TickCount - startCount) . " ms")
}

test12() {
  SB_SetText("Test addQuestEntry(int,int)")
  questMenuBot.openOrCreateDB()
  questMenuBot.addQuestEntry(1, 1)
  SB_SetText("Tested addQuestEntry(int,int)")
  questMenuBot.closeDB()
}

test13() {
  SB_SetText("Test isCleared(int,int)")
  questMenuBot.openOrCreateDB()
  if (questMenuBot.isCleared(1, 1)) {
    MsgBox, Quest_1_1 is cleared
  }
  SB_SetText("Tested isCleared(int,int)")
  questMenuBot.closeDB()
}

test14() {
  SB_SetText("Test 25 addQuestEntry(int,int)")
  questMenuBot.openOrCreateDB()
  startCount := A_TickCount
  loop, 5 {
    episode := A_Index
    loop, 5 {
      quest := A_Index
      questMenuBot.addQuestEntry(episode, quest)
    }
  }
  SB_SetText("Tested 25 addQuestEntry(int,int) in " . (A_TickCount - startCount) . " ms")
  questMenuBot.closeDB()
}

test15() {
  SB_SetText("Test isCleared(int,int) for 25 quest entries")
  questMenuBot.openOrCreateDB()
  totalCleared := 0
  totalFailed := 0
  totalTime := 0
  loop, 5 {
    episode := A_Index
    loop, 5 {
      quest := A_Index
      startCount := A_TickCount
      if (questMenuBot.isCleared(episode, quest)) {
        totalCleared++
      }
      else {
        totalFailed++
      }
      totalTime += (A_TickCount - startCount)
      startCount := A_TickCount
    }
  }
  SB_SetText("Tested isClear(int,int) for 25 quest entries in " . totalTime . " ms")
  MsgBox % "Total cleared: `t" . totalCleared . "`nTotal Failed: `t" . totalFailed
  questMenuBot.closeDB()
}

test16() {
  SB_SetText("Test getEpisode(int) 64 times")
  result := ""
  startCount := A_TickCount
  loop, 64 {
    result .= questMenuBot.getEpisode(A_Index) . "`n"
  }
  SB_SetText("Tested getEpisode(int) 64 times in " . (A_TickCount - startCount) . " ms")
  MsgBox % result
}

test17() {
  SB_SetText("Test getQuest(int,int) about 640 times or more")
  result := ""
  startCount := A_TickCount
  loop, 64 {
    episode := A_Index
    questLoop := 0
    if (episode == 1) {
      questLoop := 5
    }
    else if (episode > 1 && episode < 57) {
      questLoop := 10
    }
    else {
      questLoop := 11
    }
    loop,% questLoop {
      quest := A_Index
      result .= questMenuBot.getQuest(episode, quest) . "`n"
    }
  }
  SB_SetText("Tested getQuest(int,int) 64 times in " . (A_TickCount - startCount) . " ms")
  MsgBox % result
}

test18() {
  SB_SetText("Test createAndFillEpisodeDataTable()")
  questMenuBot.openOrCreateDB()
  startCount := A_TickCount
  questMenuBot.createAndFillEpisodeDataTable()
  SB_SetText("Tested createAndFillEpisodeDataTable() in " . (A_TickCount - startCount) . " ms")
  questMenuBot.closeDB()
}

test19() {
  SB_SetText("Test printEpisodeDataTable")
  questMenuBot.openOrCreateDB()
  questMenuBot.printEpisodeDataTable()
  questMenuBot.closeDB()
  SB_SetText("Tested printEpisodeDataTable")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
F9::test6()
F10::test7()
F11::test8()
F12::test9()
^F1::test10()
^F2::test11()
^F3::test12()
^F4::test13()
^F5::test14()
^F6::test15()
^F7::test16()
^F8::test17()
^F9::test18()
^F10::test19()
