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

connectionErrorBot := new ConnectionErrorBot

test1() {
  SB_SetText("Test isConnectionError()")
  if (connectionErrorBot.isConnectionError()) {
    MsgBox % "Connection error detected"
  }
  else {
    MsgBox % "Failed to detect a connection error or there is no error"
  }
  SB_SetText("Tested isConnectionError()")
}

test2() {
  SB_SetText("Test isConnectionErrorRequiresRestart()")
  result := ""
  if (connectionErrorBot.isConnectionErrorRequiresRestart()) {
    result := "PASSED"
    MsgBox % "Connection error detected."
  }
  else {
    result := "INVALID USAGE or FAILED"
    MsgBox % "Failed to detect connection error"
  }
  SB_SetText("Tested isConnectionErrorRequiresRestart() -- " . result)
}

test3() {
  SB_SetText("Test startPage()")
  connectionErrorBot.startPage()
  SB_SetText("Tested startPage()")
}

test4() {
  SB_SetText("Test exitGame()")
  connectionErrorBot.exitGame()
  SB_SetText("Tested exitGame()")
}



F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
