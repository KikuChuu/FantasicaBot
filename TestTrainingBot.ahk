#NoEnv
SendMode input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

trainingBot := new TrainingBot

test1() {
  SB_SetText("Test isTraining()")
  if (trainingBot.isTraining()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isTraining() -- " . result)
}

test2() {
  SB_SetText("Test isExitTraining()")
  if (trainingBot.isExitTraining()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isExitTraining() -- " . result)
}

test3() {
  SB_SetText("Test isCard()")
  if (trainingBot.isCard()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isCard() -- " . result)
}

test4() {
  SB_SetText("Test isFriend()")
  if (trainingBot.isFriend()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isFriend() -- " . result)
}

test5() {
  SB_SetText("Test advance()")
  trainingBot.advance()
  SB_SetText("Tested advance()")
}

test6() {
  SB_SetText("Test viewProfile()")
  trainingBot.viewProfile()
  SB_SetText("Tested viewProfile()")
}

test7() { 
  SB_SetText("Test sendBrave()")
  trainingBot.sendBrave()
  SB_SetText("Tested sendBrave()")
}

test8() {
  SB_SetText("Test viewBack()")
  trainingBot.viewBack()
  SB_SetText("Tested viewBack()")
}

test9() {
  SB_SetText("Test viewFront()")
  trainingBot.viewFront()
  SB_SetText("Tested viewFront()")
}

test10() {
  SB_SetText("Test continueTraining()")
  trainingBot.continueTraining()
  SB_SetText("Tested continueTraining()")
}

test11() {
  SB_SetText("Test fight()")
  trainingBot.fight()
  SB_SetText("Tested fight()")
}

test12() {
  SB_SetText("Test summonAlly()")
  trainingBot.summonAlly()
  SB_SetText("Tested summonAlly()")
}

test13() {
  SB_SetText("Test exitTraining()")
  trainingBot.exitTraining()
  SB_SetText("Tested exitTraining()")
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
F11::test8()
F12::test9()
^F1::test10()
^F2::test11()
^F3::test12()
^F4::test13()
