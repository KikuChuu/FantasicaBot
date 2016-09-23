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

test3() {
  SB_SetText("Test setSavedKey(theKey)")
  result := ""
  key := "a15"
  questBattlePoints.setSavedKey(key)
  if (questBattlePoints.getSavedKey() == key) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  MsgBox % "The saved key: " . questBattlePoints.getSavedKey()
  SB_SetText("Tested setSavedKey(theKey) -- " . result)
}

test4() {
  SB_SetText("Test setSavedIndex(theIndex)")
  result := ""
  index := 1
  questBattlePoints.setSavedIndex(index)
  if (questBattlePoints.getSavedIndex() == index) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  MsgBox % "The saved index: " . questBattlePoints.getSavedIndex()
  SB_SetText("Tested setSavedIndex(theIndex) -- " . result)
}

test5() {
  SB_SetText("Test isKeyValid(key) with valid keys")
  
  loop % questBattlePoints.getKeySetSize() {
    key := questBattlePoints.getKey(A_Index)

    if (questBattlePoints.isKeyValid(key)) {
      result := "PASSED"
    }
    else {
      result := "FAILED"
    }
  }
  
  SB_SetText("Tested isKeyValid(key) with valid keys-- " . result)
}

test6() {
  SB_SetText("Test isKeyValid(key) with an invalid key")
  result := ""
  invalidKey := "a100"
  if (questBattlePoints.isKeyValid(invalidKey)) {
    result := "FAILED"
  }
  else {
    result := "PASSED"
  }
  
  SB_SetText("Tested isKeyValid(key) with an invalid key -- " . result)
}

test7() {
  SB_SetText("Test isIndexValid(index)")
  result := ""
  invalidIndex1 := -1
  invalidIndex2 := questBattlePoints.getKeySetSize() + 1
  if (questBattlePoints.isIndexValid(invalidIndex1)) {
    result := "FAILED"
  }
  else if (questBattlePoints.isIndexValid(invalidIndex2)) {
    result := "FAILED"
  }
  else {
    result := "PASSED"
  }
  SB_SetText("Tested isIndexValid(index) -- " . result)
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

