#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_WorkingDir%\includes\IncludeScript.ahk

;============================================
;Init Global by invoking the following 
;GlobalConstants.ahk function.

Init_globals() ; Found in GlobalConstants.ahk
;============================================

deployCnt := 0
loop,
{
  if (DetectObject(DEPLOY_UNIT) && deployCnt < DEPLOY_NUMBER) {
    ClickObject(DEPLOY_UNIT)
  }

  if (DetectObject(DEPLOY_TEXT)) {
    if (DetectObject(DEPLOYUNIT1_BUTTON)) {
      ClickObject(DEPLOYUNIT1_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT2_BUTTON)) {
      ClickObject(DEPLOYUNIT2_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT3_BUTTON)) {
      ClickObject(DEPLOYUNIT2_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT4_BUTTON)) {
      ClickObject(DEPLOYUNIT2_BUTTON)
    }
    else {
      ClickObject(BACKQUEST_BUTTON)
    }
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
