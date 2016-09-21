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

loginBonusPageBot := new LoginBonusPageBot

test1() {
  SB_SetText("Test isLoginBonusPage()")
  if (loginBonusPageBot.isLoginBonusPage()) {
    MsgBox % "test1() -- PASSED"
  }
  else {
    MsgBox % "test1() -- FAILED"
  }
  SB_SetText("Tested isLoginBonusPage()")
}

test2() {
  SB_SetText("Test details()")
  loginBonusPageBot.selectDetails()
  SB_SetText("Tested details()")
}

test3() {
  SB_SetText("Test selectInbox()")
  loginBonusPageBot.selectInbox()
  SB_SetText("Tested selectInbox()")
}

test4() {
  SB_SetText("Test selectMyPage()")
  loginBonusPageBot.selectMyPage()
  SB_SetText("Test selectMyPage()")
}

test5() {
  SB_SetText("Test selectBack()")
  loginBonusPageBot.selectBack()
  SB_SetText("Test selectBack()")
}


F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
