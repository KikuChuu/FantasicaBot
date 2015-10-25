	;do not touch these two code line of code, they're for the event
	;RESTRICTPLACEMENTON_COL1= 966 ;1 = use specific coordinates, 0 = let program automatically find coordinates to place units
	;RESTRICTPLACEMENTON_COL2 = 651
	;RESTRICTPLACEMENTON_ROW1 = 0
	;RESTRICTPLACEMENTON_ROW2 = 0
	
	
BLUESTACK_WINDOW_TITLE := "Bluestacks App Player" ; Emulator title

Init_globals()
{
  global BLUESTACK_WINDOW_TITLE
  global QUEST_X1, QUEST_Y1, QUEST_X2, QUEST_Y2 
  global X1, Y1, X2, Y2
  global SCAN_START_X, SCAN_START_Y, SCAN_TILE_SIZE ;
  global QUEST_ICON, QUEST2_ICON ; Main page menu items
  global SELECTEPISODE_BUTTON,STARTQUEST1_BUTTON,STARTQUEST2_BUTTON 
  global                      STARTQUEST3_BUTTON,STARTQUEST4_BUTTON
  global                      STARTQUEST5_BUTTON,STARTQUEST6_BUTTON
  global                      STARTQUEST7_BUTTON
  
  global DEPLOYUNIT_BUTTON, CALLALLY_BUTTON
  global                    CANCELPLACEMENT_BUTTON, CONFIRMUNITPLACEMENT_BUTTON
  global DEPLOYUNIT1_BUTTON, UNIT1_INVISIBLEBUTTON, UNITFAVORITEON_BUTTON
  global DEPLOYALLY1_BUTTON, DEPLOYALLY2_BUTTON, DEPLOYALLY3_BUTTON
  global                     NEXTPAGE_BUTTON, NONEXTPAGE_BUTTON, CALLALLYPAGE_TEXT
  global                     BACKQUEST_BUTTON, SORTBYDEFAULT_BUTTON
  global                     SORTBYGROUNDATK_BUTTON, SORTBYAIRATK_BUTTON
  global                     SORTBYSEAATK_BUTTON, UNITALL_BUTTON
  global                     UNITMELEE_BUTTON, UNITMISSILE_BUTTON, UNITMAGIC_BUTTON
  global BACKTOEVENT_BUTTON, CHOOSEQUESTCOMPLETED_BUTTON, MYPAGE_BUTTON
  global                     TOWERCOMPLETEREWARDCARDBACK_BUTTON
  
  WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
  if (width == 677 && height = 1102)
  {
    QUEST_X1 := 293
	QUEST_Y1 := 840
	QUEST_X2 := 293
	QUEST_Y2 := 130
	
	SCAN_START_X := 239
    SCAN_START_Y := 233
	SCAN_TILE_SIZE := 79
	
	QUEST_ICON  := "FANTASICA IMAGES\MainPage\iconquest-1102_677.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1102_677.png" ;Quest icon on home page
	
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
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1102_677.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1102_677.png ;first unit when unable to deploy (due to insufficient unit cost)

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
  }
  else if (width == 1920 && height == 1080)
  {
    QUEST_X1 := 840
	QUEST_Y1 := 870
	QUEST_X2 := 840
	QUEST_Y2 := 190
	
    SCAN_START_X := 702
    SCAN_START_Y := 132
	SCAN_TILE_SIZE := 75
	
	QUEST_ICON := "FANTASICA IMAGES\MainPage\iconquest-1920_1080.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1920_1080.png" ;Quest icon on home page
	
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
	
	DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1920_1080.png ;first unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1920_1080.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1920_1080.png ;first unit when unable to deploy (due to insufficient unit cost)

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
  }
  else if (width == 1282 && height == 749)
  {
	QUEST_X1 := 500
	QUEST_Y1 := 623
	QUEST_X2 := 500
	QUEST_Y2 := 163
  
	SCAN_START_X := 465
    SCAN_START_Y := 99
	SCAN_TILE_SIZE := 51
	
	QUEST_ICON := "FANTASICA IMAGES\MainPage\iconquest-1282_749.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-1282_749.png" ;Quest icon on home page
	
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
	
	DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1282_749.png ;first unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-1282_749.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-1282_749.png ;first unit when unable to deploy (due to insufficient unit cost)

	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-1282_749.png    ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-1920_1080.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-1920_1080.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-1920_1080.png ;the 'next page' button on the ally selection
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
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-1920_1080.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-1282_749.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-1282_749.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-1920_1080.png ;The back button on reward card received upon completion of the tower
  }
  else
  {
	MsgBox % "Unrecognized Window Size. Don't think this version supports it.`n`nPausing"
	Pause
  }
  
  X2 := width
  Y2 := height
}


;MainPage
;--------
	;Bingo
	;-----
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo.png ;"Login Bingo"
	
	;Roulette
	;--------
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree.png ;the panel 3
	
EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!.png ;Event icon on home page. Change this path for every event
QUEST1_ICON = FANTASICA IMAGES\MainPage\iconquest1.png ;Quest icon on home page
QUEST2_ICON = FANTASICA IMAGES\MainPage\iconquest2.png ;Quest icon on home page
TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1.png ;Training icon on homepage at index 1 (starting with index 0)
TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2.png ;Training icon on homepage at index 2 (starting with index 0)
TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3.png ;Training icon on homepage at index 3 (starting with index 0)	
MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid.png ;The text called "id" at the very top of the fantasica homepage
MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info

	
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
		
;Ally
;----
	;AllyList
	;--------
	;use general purpose back button
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies.png ;the title of the ally list page
	
	;AllyPendingRequest
	;------------------
	;use general purpose back button
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval.png ; the text title of the ally requests pending page
	
;GeneralPurpose
;--------------
BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)

;ErrorRelated
;------------
CONNECTIONERROR_BUTTON = FANTASICA IMAGES\ErrorRelated\buttonconnectionerror.png ;The 'Yes' button when a connection error has occured.	
FORCECLOSEAPP_BUTTON = FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp.png ;force closes the app
CONNECTIONERROR_TEXT = FANTASICA IMAGES\ErrorRelated\textconnectionerror.png ;the dialog which indicates we need to restart the app
FANTASICALOADPAGE_TEXT = FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage.png ;the background image while fantasica is launching/loading

;Maintenance
;-----------
ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement.png
MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes.png
MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance.png

;Advertisement
;-------------
DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage).png ;advertisement on mypage	
MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement.png ;the 'maybe' button for the advertisement for other apps at the start screen
CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement.png ;cancel button for advertisement of other apps at the start screen
CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement.png ;closes the advertisement by clicking the 'x' button

;Bluestack
;---------
CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp.png ;The 'yes' button when exiting the bluestack app
EXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonexitapp.png ;the exit app button in the lower left corner of bluestack


;StartScreen
;-----------
DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement.png ;the 'No Thanks' button when an advertisement pops up
STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame.png ;start game button 
RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno.png ;do not resume an interrupted quest
	
	
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