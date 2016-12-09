#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

generalConfiguration := new GeneralConfiguration(APP_PLAYER_TITLE)
detector := new Detector(generalConfiguration)
controller := new Controller(generalConfiguration)
loginBonusBot := new LoginBonusBot(detector, controller)

test1() {
  loginBonusBot.play()
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
