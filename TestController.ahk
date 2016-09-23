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

controller := new Controller
questBattlePoints := new QuestBattlePoints

test1() {
  SB_SetText("Test setPoint(int, int)")
  controller.setPoint(100, 100)
  MsgBox % "Point's values are: " . controller.getPoint()[1] . " and " . controller.getPoint()[2]
  SB_SetText("Tested setPoint(int, int)")
}

test2() {
  SB_SetText("Test getPointHistorySize()") 
  MsgBox % "History Size: " . controller.getPointHistorySize()
  SB_SetText("Tested getPointHistorySize()")
}

test3() {
  SB_SetText("Test clickAndUpdateHistory()") 
  controller.clickAndUpdateHistory()
  SB_SetText("Tested clickAndUpdateHistory()") 
}

test4() {
  SB_SetText("Test getHistoryPoint(int)")
  point := controller.getHistoryPoint(1)
  MsgBox % point[1] . " " . point[2] 
  SB_SetText("Tested getHistoryPoint(int)")
}

test5() {
  SB_SetText("Test getHistoryPoint()")
  loop % questBattlePoints.getKeySetSize() {
    key := questBattlePoints.getKey(A_Index)
    point := questBattlePoints.getPoint(key)
    controller.setPoint(point[1], point[2])
    controller.clickAndUpdateHistory()

    output := ""
    loop % controller.getPointHistorySize() {
      point := controller.getHistoryPoint(A_Index)
      output .= "P" . A_Index . "(" . point[1] . ", " . point[2] . "),`n"
    }
    output := subStr(output, 1, strLen(output) - 2)
    MsgBox % "History of Clicks (1 = newest, 10 = oldest)`n" . output
  }

  SB_SetText("Tested getHistoryPoint()")
}

F1::ExitApp
F2::Pause
F3::Reload
F4::test1()
F5::test2()
F6::test3()
F7::test4()
F8::test5()
