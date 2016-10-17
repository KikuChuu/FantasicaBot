#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#include %A_ScriptDir%\includes\IncludeScript.ahk

mainPageBot := new MainPageBot
trainingBot := new TrainingBot
trainingPageBot := new TrainingPageBot

test1() {
  SB_SetText("Test isTrainingPage()")
  result := ""
  if (trainingPageBot.isTrainingPage()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isTrainingPage() -- " . result)
}

test2() {
  SB_SetText("Test scrollDownMenu()")
  trainingPageBot.scrollDownMenu()
  SB_SetText("Tested scrollDownMenu()")
}

test3() {
  SB_SetText("Test scrollUpMenu()")
  trainingPageBot.scrollUpMenu()
  SB_SetText("Tested scrollDownMenu()")
}

test4() {
  SB_SetText("Test scrollBottomMenu()")
  trainingPageBot.scrollBottomMenu()
  SB_SetText("Tested scrollBottomMenu()")
}

test5() {
  SB_SetText("Test scrollTopMenu()")
  trainingPageBot.scrollTopMenu()
  SB_SetText("Tested scrollTopMenu()")
}

test6() {
  SB_SetText("Test episodeList()")
  trainingPageBot.episodeList()
  SB_SetText("Tested episodeList()")
}

test7() {
  SB_SetText("Test scrollDownEpisode()")
  trainingPageBot.scrollDownEpisode()
  SB_SetText("Tested scrollDownEpisode()")
}

test8() {
  SB_SetText("Test scrollUpEpisode()")
  trainingPageBot.scrollUpEpisode()
  SB_SetText("Tested scrollUpEpisode()")
}

test9() {
  SB_SetText("Test scrollBottomEpisode()")
  trainingPageBot.scrollBottomEpisode()
  SB_SetText("Tested scrollBottomEpisode()")
}

test10() {
  SB_SetText("Test scrollTopEpisode()")
  trainingPageBot.scrollTopEpisode()
  SB_SetText("Tested scrollTopEpisode()")
}

test11() {
  SB_SetText("Test nextPage()")
  trainingPageBot.nextPage()
  SB_SetText("Tested nextPage()")
}

test12() {
  SB_SetText("Test previousPage()")
  trainingPageBot.previousPage()
  SB_SetText("Tested previousPage()")
}

test13() {
  SB_SetText("Test firstPage()")
  trainingPageBot.firstPage()
  SB_SetText("Tested firstPage()")
}

test14() {
  SB_SetText("Test isFirstPage()")
  if (trainingPageBot.isFirstPage()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isFirstPage() -- " . result)
}

test15() {
  SB_SetText("Test lastPage()")
  trainingPageBot.lastPage()
  SB_SetText("Tested lastPage()")
}

test16() {
  SB_SetText("Test isLastPage()")
  if (trainingPageBot.isLastPage()) {
    result := "PASSED"
  }
  else {
    result := "FAILED"
  }
  SB_SetText("Tested isLastPage() -- " . result)
}

test17() {
  SB_SetText("Test getEpisodePath(theEpisode)")
  output := ""
  loop, 44 {
    output .= A_Index . ": " . trainingPageBot.getEpisodePath(A_Index) . "`n"
  }
  MsgBox % output
  SB_SetText("Tested getEpisodePath(theEpisode)")
}

test18() {
  SB_SetText("Test selectEpisode(theEpisode)")
  output := ""
  loop, 42 {
    trainingPageBot.episodeList()
    if (trainingPageBot.selectEpisode(A_Index)) {
      output .= A_Index . ": PASSED`n"
    }
    else {
      output .= A_Index . ": FAILED`n"
    }
  }
  FileAppend, %output%, EpisodeTestResults.txt
  SB_SetText("Tested selectEpisode(theEpisde)")
}

test19() {
  SB_SetText("Test getStagePath(theEpisode, theStage)")
  theEpisode := 0
  theStage := 0
  output := ""
  loop, 42 {
    theEpisode := A_Index
    loop, 6 {
      theStage := A_Index
      label := "(" . theEpisode . ", " . theStage . ")"
      output .= label . ": " . trainingPageBot.getStagePath(theEpisode, theStage) . "`n"
    }
  }
  FileAppend, %output%, TestTrainingOutput.txt
  SB_SetText("Tested getStagePath(theEpisode, theStage) -- Output written to TestTrainingOutput.txt")
}

test20() {
  SB_SetText("Test selectStage(theEpisode, theStage)")  

  ; TrainingOutput.txt
  output := ""
  loop, 42 {
    episode := A_Index
    loop, 6 {
      if (trainingPageBot.selectStage(episode, A_Index) == true) {
        output := episode . "-" . A_Index . " PASSED`n"
        trainingBot.exitTraining()
        sleep 5000
        mainPageBot.selectMenu(mainPageBot.TRAINING) 
        sleep 5000
      }
      else {
        output := episode . "-" . A_Index . " FAILED`n"
      }
      FileAppend, %output%, TrainingOutput.txt
    }
  }
  if (ErrorLevel == 1) {
    MsgBox "Error Msg: " . A_LastError
  }
  SB_SetText("Tested selectStage(theEpisode, theStage) -- Output written to TrainingOutput.txt")
}

test21() {
  SB_SetText("Test exitEpisodeList()")
  trainingPageBot.exitEpisodeList()
  SB_SetText("Tested exitEpisodeList()")
}

test22() {
  SB_SetText("Test exitTrainingMenu()")
  trainingPageBot.exitTrainingMenu()
  SB_SetText("Tested exitTrainingMenu()")
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
^F5::test14()
^F6::test15()
^F7::test16()
^F8::test17()
^F9::test18()
^F10::test19()
^F11::test20()
^F12::test21()
^!F1::test22()
