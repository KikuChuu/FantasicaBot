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

questBattleBot := new QuestBattleBot

test1() {
  global SLEEPTIME

  SB_SetText("Test clickAt(int, int)")
  if (clickAt(340, 158)) {
    MsgBox % "Mouse click was released early"
  }
  else {
    MsgBox % "Mouse click was released after " . SLEEPTIME " ms"
  }
  SB_SetText("Tested clickAt(int, int)")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
