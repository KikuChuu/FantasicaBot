#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

controller := new Controller

test1() {
  point := new Point(100, 100)
  controller.click(point)
}

test2() {
  p1 := new Point(100, 100)
  p2 := new Point(300, 300)
  speed := 50
  controller.drag(p1, p2, speed)
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
