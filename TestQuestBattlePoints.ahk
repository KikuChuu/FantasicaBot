#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#include %A_ScriptDir%\includes\IncludeScript.ahk

questBattlePoints := new QuestBattlePoints

test1() {
  SB_SetText("Test getKeySetSize()")
  MsgBox % questBattlePoints.getKeySetSize()
  SB_SetText("Tested getKeySetSize()")
}

test2() {
  SB_SetText("Test nextKey()")
  output := ""
  loop, % questBattlePoints.getKeySetSize() {
    questBattlePoints.nextKey(key)
    output .= key . "`n"
  }
  MsgBox % output
  SB_SetText("Tested nextKey()")
}

test3() {
  SB_SetText("Test getPoint()")
  output := ""
  loop % questBattlePoints.getKeySetSize() {
    questBattlePoints.nextKey(key)
    point := questBattlePoints.getPoint()
    output .= key . "(" . point[1] . ", " . point[2] . ")" . "`n"
  }
  MsgBox % output
  SB_SetText("Tested getPoint()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
