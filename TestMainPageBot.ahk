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

errMsg := ""
state := 1
mainPageBot := new MainPageBot()

test1() {
  global QUEST_TEXT
  mainPageBot.selectMenu(mainPageBot.QUEST)
  sleep 5000
  if (detectObject(QUEST_TEXT, 0, 0)) {
    MsgBox % "Test 1: Quest selection -- PASSED"
  }
  else {
    MsgBox % "Test 1: Quest selection -- FAILED"
  }
}

test2() {
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

test3() {
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



F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::
F8::
F9::
F10::
F11::
F12::
