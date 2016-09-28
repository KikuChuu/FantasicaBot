#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk


errMsg := ""
state := 1
mainPageBot := new MainPageBot()


test1() {
  SB_SetText("Test isMainPage()")
  results := ""
  if (mainPageBot.isMainPage()) {
    results := "PASSED"
  }
  else {
    results := "FAILED"
  }
  SB_SetText("Tested isMainPage() -- " . results)
}

test2() {
  SB_SetText("Test scrollRight()")
  mainPageBot.scrollRight()
  SB_SetText("Tested scrollRight()")
}

test3() {
  SB_SetText("Test scrollLeft()")
  mainPageBot.scrollLeft()
  SB_SetText("Tested scrollLeft()")
}

test4() {
  SB_SetText("Test scrollLast()")
  mainPageBot.scrollLast()
  SB_SetText("Tested scrollLast()")
}

test5() {
  SB_SetText("Test scrollFirst()")
  mainPageBot.scrollFirst()
  SB_SetText("Tested scrollFirst()")
}

test6() {
  SB_SetText("Test selectMenu(quest)")
  questMenuBot := new QuestMenuBot
  mainPageBot.selectMenu(mainPageBot.QUEST)
  sleep 5000
  result := ""
  if (questMenuBot.isQuestMenuDetected()) {
    MsgBox % "Test 1: Quest selection -- PASSED"
    result := "PASSED"
  }
  else {
    MsgBox % "Test 1: Quest selection -- FAILED"
    result := "FAILED"
  }
  SB_SetText("Tested selectMenu(quest) -- " . result)
}

test7() {
  global TRAINING_TEXT
  mainPageBot.selectMenu(mainPageBot.TRAINING)
  sleep 5000
  if (detectObject(TRAINING_TEXT, 0, 0)) {
    MsgBox % "Test 2: Training selection -- PASSED"
  }
  else {
    MsgBox % "Test 2: Training selection -- FAILED"
  }
}

test8() {
  global QUEST_TEXT
  mainPageBot.closeAnnouncement()
  mainPageBot.selectMenu(mainPageBot.QUEST)
  sleep 5000
  if (detectObject(QUEST_TEXT, 0, 0)) {
    MsgBox % "Test 3: Close announcement -- PASSED"
  }
  else {
    MsgBox % "Test 3: Close announcement -- FAILED"
  }
}

test9() {
  SB_SetText("Test isAnnouncement()")
  results := ""
  if (mainPageBot.isAnnouncement()) {
    results := "PASSED"
  }
  else {
    results := "FAILED"
  }
  SB_SetText("Tested isAnnouncement() -- " . result)
}

test10() {
  SB_SetText("Test closeAnnouncement()")
  mainPageBot.closeAnnouncement()
  SB_SetText("Tested closeAnnouncement()")
}

test11() {
  SB_SetText("Test selectMenu(tower)")
  mainPageBot.selectMenu(mainPageBot.TOWER)
  sleep 5000
  towerBot := new TowerBot
  result := ""
  if (towerBot.isTower()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested selectMenu(tower) -- " . result)
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
