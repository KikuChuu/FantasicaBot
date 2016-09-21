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

startPageBot := new StartPageBot

test1() {
  SB_SetText("Test startGame()")
  startPageBot.startGame()
  SB_SetText("Tested startGame()")
}

test2() {
  SB_SetText("Test openOrCloseAnnouncement()")
  startPageBot.openOrCloseAnnouncement()
  SB_SetText("Tested openOrCloseAnnouncement()")
}

test3() {
  SB_SetText("Test openOrCloseNotice()")
  startPageBot.openOrCloseNotice()
  SB_SetText("Tested openOrCloseNotice()")
}

test4() {
  SB_SetText("Test isStartPage()")
  if (startPageBot.isStartPage()) {
    MsgBox % "Start page is detected"
  }
  else {
    MsgBox % "Currently not on start page"
  }
  SB_SetText("Tested isStartPage()")
}

test5() {
  SB_SetText("Test isGameUnderMaintenance()")
  if (startPageBot.isGameUnderMaintenance()) {
    MsgBox % "Fantasica is under maintenance"
  }
  else {
    MsgBox % "Fantasica is online"
  }
  SB_SetText("Tested isGameUnderMaintenance()")
}

test6() {
  SB_SetText("Test isQuestInterrupted()")
  if (startPageBot.isQuestInterrupted()) {
    MsgBox % "Determined that the quest was interrupted"
  }
  else {
    MsgBox % "Did not detect quest interruption"
  }
  SB_SetText("Tested isQuestInterrupted()")
}

test7() {
  SB_SetText("Test resumeQuest()")
  startPageBot.resumeQuest()
  SB_SetText("Test resumeQuest()")
}

test8() {
  SB_SetText("Test doNotResumeQuest()")
  startPageBot.doNotResumeQuest()
  SB_SetText("Tested doNotResumeQuest()")
}

test9() {
  SB_SetText("Test quitGame()")
  startPageBot.quitGame()
  SB_SetText("Tested quitGame()")
}

test10() {
  SB_SetText("Test options()")
  startPageBot.selectOptions()
  SB_SetText("Tested options()")
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
