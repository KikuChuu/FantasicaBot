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

bingoPageBot := new BingoPageBot()

test1() {
  SB_SetText("Test isBingoPage()")
  if (bingoPageBot.isBingoPage()) {
    MsgBox % "Bingo page is detected"
  }
  else {
    MsgBox % "Failed to detect bingo page"
  }
  SB_SetText("Tested isBingoPage()")
}

test2() {
  SB_SetText("Test selectSquare()")
  bingoPageBot.selectSquare()
  SB_SetText("Tested selectSquare()")
}

test3() {
  SB_SetText("Test receiveItem()")
  bingoPageBot.receiveItem()
  SB_SetText("Tested receiveItem()")
}

test4() {
  SB_SetText("Test selectMyPage()")
  bingoPageBot.selectMyPage()
  SB_SetText("Tested selectMyPage()")
}


F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
