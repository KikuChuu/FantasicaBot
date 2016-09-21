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

questBattlePoints := new QuestBattlePoints

test1() {
  SB_SetText("Test getKey(int)")
  output := ""
  loop, % questBattlePoints.getKeySetSize() {
    output .= questBattlePoints.getKey(A_Index) . "`n"
  }
  MsgBox % output
  SB_SetText("Tested getKey(int)")
}

test2() {
  SB_SetText("Test getPoint(string)")
  loop % questBattlePoints.getKeySetSize() {
    key := questBattlePoints.getKey(A_Index)
    point := questBattlePoints.getPoint(key)
    SB_SetText("Clicking at " . key . " located at (" . point[1] . ", " . point[2] . ")")
    clickAt(point[1], point[2])
    clickAt(point[1], point[2])
    clickAt(point[1], point[2])
    clickAt(point[1], point[2])
    clickAt(point[1], point[2])
    clickAt(point[1], point[2])
    sleep 1000
  }
  SB_SetText("Tested getPoint(string)")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
