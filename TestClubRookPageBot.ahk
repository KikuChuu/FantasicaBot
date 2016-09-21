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

clubRookPageBot := new ClubRookPageBot

test1() {
  SB_SetText("Test isClubRookPage()")
  result := ""
  if (clubRookPageBot.isClubRookPage()) {
    result := "PASSED"
    MsgBox % "Detected club rook page"
  }
  else {
    result := "INVALID USAGE or FAILED"
    MsgBox % "Failed to detect club rook page"
  }
  SB_SetText("Tested isClubRookPage() -- " . result)
}

test2() {
  SB_SetText("Test exitPage()")
  clubRookPageBot.exitPage()
  SB_SetText("Test exitPage()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
