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

appPlayerBot := new AppPlayerBot

test1() {
  SB_SetText("Test isAppPlayerHomePage()")
  if (appPlayerBot.isAppPlayerHomePage()) {
    MsgBox % "Home page is detected" 
  }
  else {
    MsgBox % "Home page is not detected"
  }
  SB_SetText("Tested isAppPlayerHomePage()")
}

test2() {
  SB_SetText("Test isFantasicaRecentlyPlayed()")
  if (appPlayerBot.isFantasicaRecentlyPlayed()) {
    MsgBox % "Fantasica is detected in recently played list"
  }
  else {
    MsgBox % "Fantasica was not detected in recently played list"
  }
  SB_SetText("Tested isFantasicaRecentlyPlayed()")
}

test3() {
  SB_SetText("Test openAppDrawer()")
  appPlayerBot.openAppDrawer()
  SB_SetText("Tested openAppDrawer()")
}

test4() {
  SB_SetText("Test startGame()")
  appPlayerBot.startGame()
  SB_SetText("Tested startGame()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
