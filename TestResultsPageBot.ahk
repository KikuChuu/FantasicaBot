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

resultsPageBot := new ResultsPageBot

test1() {
  SB_SetText("Test isResultsPageDetected()")
  results := ""
  if (resultsPageBot.isResultsPageDetected()) {
    results := "PASSED"
  }
  else {
    results := "FAILED"
  }
  SB_SetText("Tested isResultsPageDetected() -- " . results)
}

test2() {
  SB_SetText("Test isQuestCleared()")
  results := ""
  if (resultsPageBot.isQuestCleared()) {
    results := "PASSED"
  }
  else {
    results := "FAILED"
  }
  SB_SetText("Tested isQuestCleared() -- " . results)
}

test3() {
  SB_SetText("Test toQuestMenu()")
  resultsPageBot.toQuestMenu()
  SB_SetText("Tested toQuestMenu()")
}

test4() {
  SB_SetText("Test toMainPage()")
  resultsPageBot.toMainPage()
  SB_SetText("Tested toMainPage()")
}

test5() {
  SB_SetText("Test toTower()")
  resultsPageBot.toTower()
  SB_SetText("Tested toTower()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
