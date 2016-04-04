#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include %A_WorkingDir%\includes\IncludeScript.ahk

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
    if (DetectObject(DEPLOYUNIT1_BUTTON)) {
      ClickObject(DEPLOYUNIT1_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT2_BUTTON)) {
      ClickObject(DEPLOYUNIT2_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT3_BUTTON)) {
      ClickObject(DEPLOYUNIT3_BUTTON)
    }
    else if (DetectObject(DEPLOYUNIT4_BUTTON)) {
      ClickObject(DEPLOYUNIT4_BUTTON)
    }
    else {
      ClickObject(BACKQUEST_BUTTON)
    }
  }

  if (DetectObject(CANCELPLACEMENT_BUTTON)) {
    ClickObject(CANCELPLACEMENT_BUTTON)
  }
}

F1::ExitApp
F2::PAUSE
F3::Reload
