#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_ScriptDir%\includes\IncludeScript.ahk

;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================

deployUnitNum := 0
loop,
{
  if (DetectObject(DEPLOYUNIT_BUTTON) && deployUnitNum < DEPLOY_NUMBER) {
    ClickObject(DEPLOYUNIT_BUTTON)
  }

  if (DetectObject(DEPLOY_TEXT)) {
    retval := DeployUnit()
    if (retval) {
      deployUnitNum++
    }
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
