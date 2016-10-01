#NoEnv
SendMode Input
SetWorkingDir A_ScriptDir

#include %A_ScriptDir%/includes/IncludeScript.ahk

mapPlacementPoints := new MapPlacementPoints

test1() {
  SB_SetText("Test addPoint(200, 350)")
  mapPlacementPoints.addPoint(200, 350)
  SB_SetText("Tested addPoint(200, 350)")
}

test2() {
  SB_SetText("Test getSize()")
  size := mapPlacementPoints.getSize()
  SB_SetText("Tested getSize() -- returned '" . size . "'")
}

test3() {
  SB_SetText("Test displayPoints()")
  mapPlacementPoints.displayPoints()
  SB_SetText("Tested displayPoints()")
}

test4() {
  SB_SetText("Test clearPoints()")
  mapPlacementPoints.clearPoints()
  SB_SetText("Tested clearPoints()")
}

test5() {
  SB_SetText("Test openOrCreateDB()")
  mapPlacementPoints.openOrCreateDB()
  SB_SetText("Tested openOrCreateDB()")
}

test6() {
  SB_SetText("Test createTable()")
  mapPlacementPoints.createTable()
  SB_SetText("Tested createTable()")
}

test7() {
  SB_SetText("Test insertIntoDatabase(1, 1)")
  mapPlacementPoints.insertIntoDatabase(1, 1)
  SB_SetText("Tested insertIntoDatabase(1, 1)")
}

test8() {
  SB_SetText("Test getRow(1, 1)")
  mapPlacementPoints.getRow(1,1)
  SB_SetText("Tested getRow(1,1)")
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
