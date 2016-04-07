#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk
SetDefaultMouseSpeed 0
;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================


; ===========================================
; ------------ Variables here ---------------
; PATH_OF_FATE_BATTLE := ""
; PATH_OF_FATE_OPPSEL := ""
; PATH_OF_FATE_6FP := ""
; PATH_OF_FATE_NO := ""
; PATH_OF_FATE_DEPLOY := ""
; PATH_OF_FATE_SINGLE := ""
; PATH_OF_FATE_BEGIN := ""
; PATH_OF_FATE_SKIP := ""
; PATH_OF_FATE_POT := ""
; PATH_OF_FATE_POT_YES := ""
; PATH_OF_FATE_BACK := ""
; ===========================================

loop,
{
  if (DetectObject(PATH_OF_FATE_BATTLE)) {
    ClickObject(PATH_OF_FATE_BATTLE)
  }

  if (DetectObject(PATH_OF_FATE_OPPSEL)) {
    ClickObject(PATH_OF_FATE_OPPSEL)
  }

  if (DetectObject(PATH_OF_FATE_6FP)) {
    ClickObject(PATH_OF_FATE_OPPSEL)
  }

  if (DetectObject(PATH_OF_FATE_NO)) {
    ClickObject(PATH_OF_FATE_NO)
  }
  
  if (DetectObject(PATH_OF_FATE_DEPLOY)) {
    ClickObject(PATH_OF_FATE_DEPLOY)
  }

  if (DetectObject(PATH_OF_FATE_SINGLE)) {
    ClickObject(PATH_OF_FATE_SINGLE)
  }

  if (DetectObject(PATH_OF_FATE_BEGIN)) {
    ClickObject(PATH_OF_FATE_BEGIN)
  }

  if (DetectObject(PATH_OF_FATE_SKIP)) {
    ClickObject(PATH_OF_FATE_SKIP)
  }

  if (DetectObject(PATH_OF_FATE_POT)) {
    ClickObject(PATH_OF_FATE_POT)
  }

  if (DetectObject(PATH_OF_FATE_POT_YES)) {
    ClickObject(PATH_OF_FATE_POT_YES)
  }

  if (DetectObject(PATH_OF_FATE_BACK)) {
    ClickObject(PATH_OF_FATE_BACK)
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
