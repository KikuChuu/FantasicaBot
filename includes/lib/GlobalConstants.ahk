﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Init_globals()
{
  global BLUESTACK_WINDOW_TITLE
  global FANTASICA_APP_X1, FANTASICA_APP_X2
  global QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2 
  global X1, Y1, X2, Y2
  global BINGO_START_X, BINGO_START_Y, BINGO_TILE_SIZE
  global SCAN_START_X, SCAN_START_Y, SCAN_TILE_SIZE ;
  global QUEST1_ICON, QUEST2_ICON ; Main page menu items
  global EPISODESELECT1_BUTTON, EPISODESELECT2_BUTTON, EPISODESELECT3_BUTTON
  global                        EPISODESELECT4_BUTTON, EPISODESELECT5_BUTTON
  global                        EPISODESELECT6_BUTTON, EPISODESELECT7_BUTTON
  global                        EPISODESELECT8_BUTTON, EPISODESELECT9_BUTTON
  global 						EPISODESELECT10_BUTTON
  global                        EPISODELISTNEXT_BUTTON, EPISODELISTNONEXT_BUTTON
  global SELECTEPISODE_BUTTON,STARTQUEST1_BUTTON,STARTQUEST2_BUTTON 
  global                      STARTQUEST3_BUTTON,STARTQUEST4_BUTTON
  global                      STARTQUEST5_BUTTON,STARTQUEST6_BUTTON
  global                      STARTQUEST7_BUTTON
  
  global DEPLOYUNIT_BUTTON, CALLALLY_BUTTON
  global                    CANCELPLACEMENT_BUTTON, CONFIRMUNITPLACEMENT_BUTTON
  global DEPLOYUNIT1_BUTTON, DEPLOYUNIT2_BUTTON, DEPLOYUNIT3_BUTTON, DEPLOYUNIT4_BUTTON
  global UNIT1_INVISIBLEBUTTON, UNIT2_INVISIBLEBUTTON, UNIT3_INVISIBLEBUTTON, UNIT4_INVISIBLEBUTTON
  global UNITFAVORITEON_BUTTON
  global DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON
  global                     NEXTPAGE_BUTTON, NONEXTPAGE_BUTTON, CALLALLYPAGE_TEXT
  global                     BACKQUEST_BUTTON, SORTBYDEFAULT_BUTTON
  global                     SORTBYGROUNDATK_BUTTON, SORTBYAIRATK_BUTTON
  global                     SORTBYSEAATK_BUTTON, UNITALL_BUTTON
  global                     UNITMELEE_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON
  global BACKTOEVENT_BUTTON, CHOOSEQUESTCOMPLETED_BUTTON, MYPAGE_BUTTON
  global                     TOWERCOMPLETEREWARDCARDBACK_BUTTON
  global QUESTCLEAR_TEXT
  global CONNECTIONERROR_BUTTON, FORCECLOSEAPP_BUTTON, CONNECTIONERROR_TEXT
  global 						 FANTASICALOADPAGE_TEXT
  global MAINTENANCEYES_BUTTON, MAINTENANCEOPTION_BUTTON, MAINTENANCE_TEXT
  global CONFIRMEXITAPP_BUTTON
  global DECLINEADVERTISEMENT_BUTTON, STARTGAME_BUTTON, RESUMEQUESTNO_BUTTON
  global DECLINEADVERTISEMENTMYPAGE_BUTTON, MAYBELATERADVERTISEMENT_BUTTON, CANCELADVERTISEMENT_BUTTON
  global                                    CLOSEADVERTISEMENT_BUTTON
  global ANNOUNCEMENT_BUTTON
  global ALLY_TEXT, ALLYPENDINGREQUEST_TEXT
  global MYPAGEID_TEXT, MYPAGEID2_TEXT
  global EVENT_ICON
  global TRAINING1_ICON, TRAINING2_ICON, TRAINING3_ICON
  global LOGINBINGOPANEL_ICON, LOGINBINGOMYPAGE_BUTTON, LOGINBINGORECEIVE_BUTTON
  global                       LOGINBINGO_TEXT
  global ROULETTESTART_BUTTON, ROULETTESTOP_BUTTON, ROULETTENINEBLUE3_TEXT
  global                       ROULETTENINEBLUE4_TEXT, ROULETTENINE_TEXT
  global                       ROULETTETHREE_TEXT
  global BACK_BUTTON
  global LOGINBONUSMYPAGE_BUTTON
  if WinExist("BlueStacks App Player")
  {
	BLUESTACK_WINDOW_TITLE := "BlueStacks App Player"
	WinActivate, %BLUESTACK_WINDOW_TITLE%
	WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
  }
  else if WinExist("Bluestacks App Player")
  {
	BLUESTACK_WINDOW_TITLE := "Bluestacks App Player"
	WinActivate, %BLUESTACK_WINDOW_TITLE%
	WinWaitActive, %BLUESTACK_WINDOW_TITLE%, , 2
  }
  else
  {
	MsgBox % "Did not find any of the following matching window titles: `n"
			 . "'BlueStacks App Player'`n'Bluestacks App Player'"
			 . "`nPausing the script."
	Pause
  }
  
  WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
  if (width == 677 && height == 1102)
  {
	FANTASICA_APP_X1 := 100
	FANTASICA_APP_X2 := 100
	
	WAIT_X :=
	WAIT_Y :=
	
	BINGO_START_X := 491
	BINGO_START_Y := 233
	BINGO_TILE_SIZE := 70
	
    QUEST_X1 := 293
	QUEST_Y1 := 840
	QUEST_X2 := 293
	QUEST_Y2 := 130
	
	SCAN_START_X := 167
    SCAN_START_Y := 68
	SCAN_TILE_SIZE := 78
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest-1102_677.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1102_677.png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-1102_677.png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-1102_677.png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-1102_677.png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-1102_677.png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-1102_677.png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-1102_677.png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-1102_677.png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-1102_677.png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-1102_677.png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-1102_677.png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-1102_677.png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-1102_677.png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-1102_677.png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-1102_677.png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-1102_677.png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-1102_677.png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-1102_677.png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-1102_677.png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-1102_677.png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-1102_677.png" ;quest #7 
	
	CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-1102_677.png ;the call ally button in questing
	CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-1102_677.png ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-1102_677.png ;confirm the location to place unit
	DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-1102_677.png	;The 'Deploy' button during questing
	
	DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1102_677.png ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-1102_677.png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-1102_677.png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-1102_677.png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1102_677.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1102_677.png ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-1102_677.png ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-1102_677.png ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-1102_677.png ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-1102_677.png ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-1102_677.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-1102_677.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-1102_677.png ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-1102_677.png ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-1102_677.png ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-1102_677.png ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-1102_677.png ;no specific sort
	SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-1102_677.png ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-1102_677.png ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-1102_677.png ;sort unit by strongest sea to weakest
	UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-1102_677.png ;type all
	UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-1102_677.png ; type melee
	UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-1102_677.png ;type missile
	UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-1102_677.png ;type magic
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-1102_677.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-1102_677.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-1102_677.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-1102_677.png ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-1102_677.png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-1102_677.png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-1102_677.png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-1102_677.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-1102_677.png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-1102_677.png
	MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance.png
	
	CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-1102_677.png ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-1102_677.png ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame-1102_677.png ;start game button 
	RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno-1102_677.png ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-1102_677.png ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-1102_677.png ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-1102_677.png ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-1102_677.png ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement-1102_677.png
	
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies-1102_677.png ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-1102_677.png ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid-1102_677.png ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena-1102_677.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!-1102_677.png ;Event icon on home page. Change this path for every event
	TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1-1102_677.png ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2-1102_677.png ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3-1102_677.png ;Training icon on homepage at index 3 (starting with index 0)
	
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-1102_677.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-1102_677.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-1102_677.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo-1102_677.png ;"Login Bingo"
	
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-1102_677.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-1102_677.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3-1102_677.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4-1102_677.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine-1102_677.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree-1102_677.png ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-1102_677.png"
	
	BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback-1102_677.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
  }
  else if (width == 1282 && height == 749)
  {
	FANTASICA_APP_X1 := 255
	FANTASICA_APP_X2 := 125
  
  	BINGO_START_X := 491
	BINGO_START_Y := 233
	BINGO_TILE_SIZE := 70
  
	QUEST_X1 := 500
	QUEST_Y1 := 623
	QUEST_X2 := 500
	QUEST_Y2 := 163
  
	SCAN_START_X := 465
    SCAN_START_Y := 99
	SCAN_TILE_SIZE := 51
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-1282_749.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1282_749.png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-1282_749.png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-1282_749.png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-1282_749.png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-1282_749.png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-1282_749.png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-1282_749.png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-1282_749.png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-1282_749.png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-1282_749.png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-1282_749.png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-1282_749.png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-1282_749.png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-1282_749.png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-1282_749.png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-1282_749.png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-1282_749.png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-1282_749.png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-1282_749.png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-1282_749.png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-1282_749.png" ;quest #7 
	
	CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-1282_749.png ;the call ally button in questing
	CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-1282_749.png ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-1282_749.png ;confirm the location to place unit
	DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-1282_749.png	;The 'Deploy' button during questing
	
	DEPLOYUNIT1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1282_749.png" ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-1282_749.png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-1282_749.png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-1282_749.png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1282_749.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1282_749.png ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-1282_749.png ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-1282_749.png ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-1282_749.png ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-1282_749.png    ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-1282_749.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-1282_749.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-1282_749.png ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-1282_749.png ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-1282_749.png ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-1282_749.png ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-1282_749.png ;no specific sort
	SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-1282_749.png ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-1282_749.png ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-1282_749.png ;sort unit by strongest sea to weakest
	UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-1282_749.png ;type all
	UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-1282_749.png ; type melee
	UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-1282_749.png ;type missile
	UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-1282_749.png ;type magic
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-1282_749.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-1282_749.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-1282_749.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-1282_749.png ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-1282_749.png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-1282_749.png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-1282_749.png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-1920_1080.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-1282_749.png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-1282_749.png
	MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance.png
	
	CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-1282_749.png ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-1282_749.png ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame-1282_749.png ;start game button 
	RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno-1282_749.png ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-1282_749.png ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-1282_749.png ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-1282_749.png ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-1282_749.png ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement-1282_749.png
	
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies-1282_749.png ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-1282_749.png ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid-1282_749.png ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena-1282_749.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!-1282_749.png ;Event icon on home page. Change this path for every event
	TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1-1282_749.png ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2-1282_749.png ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3-1282_749.png ;Training icon on homepage at index 3 (starting with index 0)	
	
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-1282_749.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-1282_749.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-1282_749.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo-1282_749.png ;"Login Bingo"
	
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-1282_749.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-1282_749.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3-1282_749.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4-1282_749.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine-1282_749.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree-1282_749.png ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-1282_749.png"
	
	BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback-1282_749.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
  }
  else if (width == 1920 && height == 1080)
  {
	FANTASICA_APP_X1 := 400
	FANTASICA_APP_X2 := 180
  
  	BINGO_START_X := 745
	BINGO_START_Y := 330
	BINGO_TILE_SIZE := 100
  
    QUEST_X1 := 840
	QUEST_Y1 := 870
	QUEST_X2 := 840
	QUEST_Y2 := 190
	
    SCAN_START_X := 702
    SCAN_START_Y := 132
	SCAN_TILE_SIZE := 75
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest-1920_1080.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1920_1080.png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-1920_1080.png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-1920_1080.png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-1920_1080.png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-1920_1080.png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-1920_1080.png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-1920_1080.png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-1920_1080.png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-1920_1080.png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-1920_1080.png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-1920_1080.png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-1920_1080.png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-1920_1080.png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-1920_1080.png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-1920_1080.png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-1920_1080.png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-1920_1080.png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-1920_1080.png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-1920_1080.png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-1920_1080.png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-1920_1080.png" ;quest #7 
	
	CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-1920_1080.png ;the call ally button in questing
	CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-1920_1080.png ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-1920_1080.png ;confirm the location to place unit
	DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-1920_1080.png	;The 'Deploy' button during questing
	
	DEPLOYUNIT1_BUTTON := "fANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1920_1080.png" ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-1920_1080.png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-1920_1080.png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-1920_1080.png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1920_1080.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1920_1080.png ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-1920_1080.png ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-1920_1080.png ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-1920_1080.png ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-1920_1080.png ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-1920_1080.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-1920_1080.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-1920_1080.png ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-1920_1080.png ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-1920_1080.png ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-1920_1080.png ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-1920_1080.png ;no specific sort
	SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-1920_1080.png ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-1920_1080.png ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-1920_1080.png ;sort unit by strongest sea to weakest
	UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-1920_1080.png ;type all
	UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-1920_1080.png ; type melee
	UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-1920_1080.png ;type missile
	UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-1920_1080.png ;type magic
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-1920_1080.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-1920_1080.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-1920_1080.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-1920_1080.png ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-1920_1080.png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-1920_1080.png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-1920_1080.png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-1920_1080.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-1920_1080.png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-1920_1080.png
	MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance.png
	
	CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-1920_1080.png ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-1920_1080.png ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame-1920_1080.png ;start game button 
	RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno-1920_1080.png ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-1920_1080.png ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-1920_1080.png ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-1920_1080.png ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-1920_1080.png ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement-1920_1080.png
	
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies-1920_1080.png ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-1920_1080.png ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid-1920_1080.png ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena-1920_1080.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!-1920_1080.png ;Event icon on home page. Change this path for every event
	TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1-1920_1080.png ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2-1920_1080.png ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3-1920_1080.png ;Training icon on homepage at index 3 (starting with index 0)
	
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-1920_1080.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-1920_1080.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-1920_1080.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo-1920_1080.png ;"Login Bingo"
	
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-1920_1080.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-1920_1080.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3-1920_1080.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4-1920_1080.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine-1920_1080.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree-1920_1080.png ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-1920_1080.png"
	
	BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback-1920_1080.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
  }
  else
  {
	MsgBox % "Unrecognized Window Size. Don't think this version supports it."
	         . "`nPausing the script"
	Pause
  }
  
  X2 := width
  Y2 := height
}

;Training
;--------
	;ActualTraining
	;--------------
	ADVANCE_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttonadvance.png ;advance button in training
	CONTINUETRAINING_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining.png ;the continue training button when a card is obtained in training
	EVENTFIGHTBOSS_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttoneventfightboss.png ;The button to accept a boss fight at point of encounter during Training
	FIGHT_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttonacceptbossfight.png
	MYPAGETRAINING_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttonmypagetraining.png ;the my page button during training 
	SENDBRAVE_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttonsendbrave.png ;the send brave button in training
	SUMMONALLY_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttonsummonally.png ;summon ally in training
	FIGHTBOSS_BUTTON = FANTASICA IMAGES\Training\ActualTraining\buttontrainingfightboss.png ;'fight' boss button during challenge training
		
	;TrainingSelection
	;-----------------
	TRAINING_TEXT = FANTASICA IMAGES\Training\TrainingSelection\texttraining.png ;the text title of the training selection page
	STARTTRAINING1_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining1.png ;training #1
	STARTTRAINING2_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining2.png ;training #2
	STARTTRAINING3_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining3.png ;training #3
	STARTTRAINING4_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining4.png ;training #4
	STARTTRAINING5_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining5.png ;training #5
	STARTTRAININGBOSS_BUTTON = FANTASICA IMAGES\Training\TrainingSelection\buttonstarttrainingboss.png ;training boss
		
;GeneralPurpose
;--------------

;Bluestack
;---------
EXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonexitapp.png ;the exit app button in the lower left corner of bluestack
	
;Event
;-----
	;TrainingEvent
	;----------------
	
	ASSISTALLY_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonassistally.png ;Assist an ally
	BACKTOASSISTALLIES_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonbacktoassistallieslist.png ;The button returns the user to the ally list
	BOSSLIST_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonbosslist.png ;the bosslist button that is in the boss fled page	
	EVENTBACK_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttoneventback.png ;the button that returns user to event page when clicked. Found in failed bosslist page	
	RESUMEPREVIOUSBATTLE_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonresumepreviousbattle.png ;button to transition from event page to list of failed bosses	
	REQUESTASSISTANCE_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonrequestassistance.png ;the request assistance button in the failed boss list
	RETRYBOSS_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonretryboss.png ;the button to reattempt a failed boss fight
	RETRYBOSSPOTION_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonretrybosspotion.png ;the button to reattempt a failed boss fight. Appears only with insufficient tp
	SENDANDVIEWASSISTS_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttonsendandviewassists.png ;Takes user from the the main event page to the assit allies list
	TRAINEVENT_BUTTON = FANTASICA IMAGES\Event\TrainingEvent\buttontrainevent.png ;train button for event
	
	ASSISTALLIES_TEXT = FANTASICA IMAGES\Event\TrainingEvent\textassistallies.png ;The Title of the Assist allies list page
	ALLYASSISTZERO_TEXT = FANTASICA IMAGES\Event\TrainingEvent\textallyassistzero.png ;an instance of a dynamic text that indicates no allies
	ASSISTALLYRESULT_TEXT = FANTASICA IMAGES\Event\TrainingEvent\textassistallyresult.png ;The title of result page after assisting an ally
	SELECTBOSS_TEXT = FANTASICA IMAGES\Event\TrainingEvent\textselectboss.png ;a static text that is in the failed bosslist page