#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Init_globals()
{
	global PEARLS_OF_THE_DEEP
	global BLUESTACK_WINDOW_TITLE
	global FANTASICAAPP_BUTTON
	global WAIT_X, WAIT_Y
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

	global CPBAR0_TEXT
	global CPBAR1_TEXT
	global FIGHT_BUTTON
	global CRITICAL_BUTTON
	global DRAIN_BUTTON
	global SPEED_BUTTON
	global SKIP_BUTTON
	global OPPONENT1_BUTTON
	global OPPONENT20_BUTTON
	global FRONTLINEBACK_BUTTON
	global REMATCH_BUTTON
	global CPCOUNT_TEXT
	global ASSIST_BUTTON
	global ASSIST_BACK_BUTTON
	global REQUESTASSISTANCE_BUTTON
	global ASSIST_ALL_BUTTON
  
  
	;=========================================================================
	;*************************************************************************
	;----------------------   TRAINING VARIABLES -----------------------------
	;*************************************************************************
	;=========================================================================
	global STARTTRAINING1_BUTTON, STARTTRAINING2_BUTTON, STARTTRAINING3_BUTTON
	global STARTTRAINING4_BUTTON, STARTTRAINING5_BUTTON, TRAININGCHALLENGE_BUTTON
	global SENDBRAVE_BUTTON
	global TRAININGMYPAGE_BUTTON
	global TRAINING_TEXT
	global ADVANCE_BUTTON, HEAL_BUTTON, CONTINUETRAINING_BUTTON
	global OUTOFTP_TEXT, TRAININGPROGRESSCOMPLETE_TEXT
	global TRAININGFIGHT_BUTTON, TRAININGSUMMONALLY_BUTTON
	
	;=========================================================================
	;*************************************************************************
	;---------------------- PEARL OF THE DEEP VARIABLES ----------------------
	;*************************************************************************
	;=========================================================================
  	global POTD_TRAINING_BUTTON
	global POTD_FIGHTBOSS_BUTTON
	global POTD_SKIP_BUTTON
	global POTD_TOPPAGE_BUTTON
	global POTD_GROUPSBATTLE_BUTTON
	global POTD_REQUESTHELP_BUTTON
	global POTD_FIGHTAGAIN_BUTTON, POTD_FIGHTAGAINTE_BUTTON, POTD_FIGHTAGAINYES_BUTTON
	global POTD_RESULTS_TEXT
	global POTD_MAINICON_TEXT
	global POTD_NINESTAR1_TEXT
	
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
  
  
  
  if (width == 632 && height == 1030)
  {
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-632_1030.png"
	
	WAIT_X := 325
	WAIT_Y := 380
	
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
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-632_1030.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-632_1030.png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-632_1030.png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-632_1030.png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-632_1030.png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-632_1030.png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-632_1030.png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-632_1030.png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-632_1030.png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-632_1030.png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-632_1030.png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-632_1030.png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-632_1030.png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-632_1030.png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-632_1030.png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-632_1030.png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-632_1030.png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-632_1030.png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-632_1030.png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-632_1030.png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-632_1030.png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-632_1030.png" ;quest #7 
	
	CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-632_1030.png ;the call ally button in questing
	CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-632_1030.png ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-632_1030.png ;confirm the location to place unit
	DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-632_1030.png	;The 'Deploy' button during questing

	DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-632_1030.png ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-632_1030.png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-632_1030.png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-632_1030.png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-632_1030.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-632_1030.png ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-632_1030.png ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-632_1030.png ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-632_1030.png ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-632_1030.png ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-632_1030.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-632_1030.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-632_1030.png ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-632_1030.png ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-632_1030.png ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-632_1030.png ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-632_1030.png ;no specific sort
	SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-632_1030.png ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-632_1030.png ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-632_1030.png ;sort unit by strongest sea to weakest
	UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-632_1030.png ;type all
	UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-632_1030.png ; type melee
	UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-632_1030.png ;type missile
	UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-632_1030.png ;type magic
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-632_1030.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-632_1030.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-632_1030.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-632_1030.png ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-632_1030.png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-632_1030.png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-632_1030.png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-632_1030.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-632_1030.png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-632_1030.png
	MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance-632_1030.png
	
	CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-632_1030.png ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-632_1030.png ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame-632_1030.png ;start game button 
	RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno-632_1030.png ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-632_1030.png ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-632_1030.png ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-632_1030.png ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-632_1030.png ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement-632_1030.png
	
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies-632_1030.png ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-632_1030.png ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid-632_1030.png ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena-632_1030.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!-632_1030.png ;Event icon on home page. Change this path for every event
	TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1-632_1030.png ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2-632_1030.png ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3-632_1030.png ;Training icon on homepage at index 3 (starting with index 0)
	
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-632_1030.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-632_1030.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-632_1030.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo-632_1030.png ;"Login Bingo"
	
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-632_1030.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-632_1030.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3-632_1030.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4-632_1030.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine-632_1030.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree-632_1030.png ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-632_1030.png"
	
	BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback-632_1030.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
	
	CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-632_1030.png"
	CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-632_1030.png"
	CPBAR2_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar2-632_1030.png"
	CPBAR3_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar3-632_1030.png"
	TIMER6_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\texttimer6-632_1030.png"
	FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-632_1030.png"
	CRITICAL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttoncritical-632_1030.png"
	DRAIN_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttondrain-632_1030.png"
	SPEED_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonspeed-632_1030.png"
	SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-632_1030.png"
	OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-632_1030.png"
	OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-632_1030.png"
	OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-632_1030.png"
	OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-632_1030.png"
	OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-632_1030.png"
	OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-632_1030.png"
	OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-632_1030.png"
	OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-632_1030.png"
	OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-632_1030.png"
	OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-632_1030.png"
	FRONTLINEBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-632_1030.png"
	REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-632_1030.png"
    CPCOUNT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textcpcount-632_1030.png"
	
	ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-632_1030.png"
    ASSIST_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-632_1030.png"
    REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-632_1030.png"
	ASSIST_ALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-632_1030.png"
	KOD_SUMMONALLY_BUTTON := "FANTASICA IMAGES\Event\KissOfDesire\BossFightScreen\buttonsummonally-632_1030.png"
	
	
  }
  else if (width == 677 && height == 1102)
  {
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-677_1102.png"
	
	WAIT_X := 325
	WAIT_Y := 380
	
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
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-677_1102.png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-677_1102.png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-677_1102.png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-677_1102.png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-677_1102.png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-677_1102.png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-677_1102.png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-677_1102.png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-677_1102.png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-677_1102.png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-677_1102.png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-677_1102.png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-677_1102.png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-677_1102.png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-677_1102.png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-677_1102.png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-677_1102.png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-677_1102.png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-677_1102.png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-677_1102.png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-677_1102.png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-677_1102.png" ;quest #7 
	
	if (RUINS_REBORN == 1)
	{
		RR_MYPAGE_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\buttonmypage-677_1102.png"
		RR_BATTLESTART_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\buttonbattlestart-677_1102.png"
		RR_BACK_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\resultscreen\buttonback-677_1102.png"
		CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-677_1102.png ;the call ally button in questing
		CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-677_1102.png ; the cancel placement button
		CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-677_1102.png ;confirm the location to place unit
		DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-677_1102.png	;The 'Deploy' button during questing
	}
	else
	{
		CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-677_1102.png ;the call ally button in questing
		CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-677_1102.png ; the cancel placement button
		CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-677_1102.png ;confirm the location to place unit
		DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-677_1102.png	;The 'Deploy' button during questing
	}
	
	DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-677_1102.png ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-677_1102.png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-677_1102.png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-677_1102.png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-677_1102.png ;favorite on
	UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-677_1102.png ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-677_1102.png ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-677_1102.png ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-677_1102.png ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-677_1102.png ;ally1 top of the list
	DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-677_1102.png	;ally2 second on the list
	DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-677_1102.png	;ally3 third on the list
	NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-677_1102.png ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-677_1102.png ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-677_1102.png ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-677_1102.png ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-677_1102.png ;no specific sort
	SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-677_1102.png ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-677_1102.png ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-677_1102.png ;sort unit by strongest sea to weakest
	UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-677_1102.png ;type all
	UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-677_1102.png ; type melee
	UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-677_1102.png ;type missile
	UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-677_1102.png ;type magic
	
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-677_1102.png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-677_1102.png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage-677_1102.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-677_1102.png ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-677_1102.png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-677_1102.png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-677_1102.png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-677_1102.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-677_1102.png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON = FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-677_1102.png
	MAINTENANCEOPTION_BUTTON = FANTASICA IMAGES\Maintenance\buttonoption.png
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance-677_1102.png
	
	CONFIRMEXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-677_1102.png ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON = FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-677_1102.png ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON = FANTASICA IMAGES\StartScreen\buttonstartgame-677_1102.png ;start game button 
	RESUMEQUESTNO_BUTTON = FANTASICA IMAGES\StartScreen\buttonresumequestno-677_1102.png ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON = FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-677_1102.png ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-677_1102.png ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-677_1102.png ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON = FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-677_1102.png ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON = FANTASICA IMAGES\Maintenance\buttonannouncement-677_1102.png
	
	ALLY_TEXT = FANTASICA IMAGES\Ally\AllyList\textallies-677_1102.png ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT = FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-677_1102.png ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT = FANTASICA IMAGES\MainPage\textmypageid-677_1102.png ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT = FANTASICA IMAGES\MainPage\textmypageidarena-677_1102.png ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON = FANTASICA IMAGES\iconmandragoramarch!-677_1102.png ;Event icon on home page. Change this path for every event
	TRAINING1_ICON = FANTASICA IMAGES\MainPage\icontraining1-677_1102.png ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON = FANTASICA IMAGES\MainPage\icontraining2-677_1102.png ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON = FANTASICA IMAGES\MainPage\icontraining3-677_1102.png ;Training icon on homepage at index 3 (starting with index 0)
	
	LOGINBINGOPANEL_ICON = FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-677_1102.png ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-677_1102.png ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON = FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-677_1102.png ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT = FANTASICA IMAGES\MainPage\Bingo\textbingo-677_1102.png ;"Login Bingo"
	
	ROULETTESTART_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-677_1102.png ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON = FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-677_1102.png ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue3-677_1102.png ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnineblue4-677_1102.png ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textnine-677_1102.png ;the panel 9
	ROULETTETHREE_TEXT = FANTASICA IMAGES\MainPage\Roulette\textthree-677_1102.png ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-677_1102.png"
	
	BACK_BUTTON = FANTASICA IMAGES\_GeneralPupose\buttonback-677_1102.png ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
	
	CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-677_1102.png"
	CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-677_1102.png"
	CPBAR2_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar2-677_1102.png"
	CPBAR3_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar3-677_1102.png"
	TIMER6_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\texttimer6-677_1102.png"
	FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-677_1102.png"
	CRITICAL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttoncritical-677_1102.png"
	DRAIN_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttondrain-677_1102.png"
	SPEED_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonspeed-677_1102.png"
	SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-677_1102.png"
	OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-677_1102.png"
	OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-677_1102.png"
	OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-677_1102.png"
	OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-677_1102.png"
	OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-677_1102.png"
	OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-677_1102.png"
	OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-677_1102.png"
	OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-677_1102.png"
	OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-677_1102.png"
	OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-677_1102.png"
	FRONTLINEBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-677_1102.png"
	REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-677_1102.png"
    CPCOUNT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textcpcount-677_1102.png"
	
	ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-677_1102.png"
    ASSIST_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-677_1102.png"
    REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-677_1102.png"
	ASSIST_ALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-677_1102.png"
  }
  else if (width == 1282 && height == 749)
  {
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-" . width . "_" . height . ".png"
  	WAIT_X := 490
	WAIT_Y := 300
  
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
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-" . width . "_" . height . ".png" ;Quest icon on home page
	
	EPISODESELECT1_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode1-" . width . "_" . height . ".png"
	EPISODESELECT2_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode2-" . width . "_" . height . ".png"
	EPISODESELECT3_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode3-" . width . "_" . height . ".png"
	EPISODESELECT4_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode4-" . width . "_" . height . ".png"
	EPISODESELECT5_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode5-" . width . "_" . height . ".png"
	EPISODESELECT6_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode6-" . width . "_" . height . ".png"
	EPISODESELECT7_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode7-" . width . "_" . height . ".png"
	EPISODESELECT8_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode8-" . width . "_" . height . ".png"
	EPISODESELECT9_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode9-" . width . "_" . height . ".png"
	EPISODESELECT10_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonselectepisode10-" . width . "_" . height . ".png"
	
	EPISODELISTNEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnextpage-" . width . "_" . height . ".png"
	EPISODELISTNONEXT_BUTTON := "FANTASICA IMAGES\Quest\EpisodeSelection\buttonnonextpage-" . width . "_" . height . ".png"
	
	SELECTEPISODE_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode-" . width . "_" . height . ".png" ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1-" . width . "_" . height . ".png" ;quest #1
	STARTQUEST2_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2-" . width . "_" . height . ".png" ;quest #2
	STARTQUEST3_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3-" . width . "_" . height . ".png" ;quest #3
	STARTQUEST4_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4-" . width . "_" . height . ".png" ;quest #4
	STARTQUEST5_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5-" . width . "_" . height . ".png" ;quest #5
	STARTQUEST6_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6-" . width . "_" . height . ".png" ;quest #6
	STARTQUEST7_BUTTON := "FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7-" . width . "_" . height . ".png" ;quest #7 
	
	STARTTRAINING1_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining1-" . width . "_" . height . ".png"
	STARTTRAINING2_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining2-" . width . "_" . height . ".png" 
	STARTTRAINING3_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining3-" . width . "_" . height . ".png"
	STARTTRAINING4_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining4-" . width . "_" . height . ".png" 
	STARTTRAINING5_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttraining5-" . width . "_" . height . ".png"
	TRAININGCHALLENGE_BUTTON := "FANTASICA IMAGES\Training\TrainingSelection\buttonstarttrainingboss-" . width . "_" . height . ".png"
	TRAINING_TEXT := "FANTASICA IMAGES\Training\TrainingSelection\texttraining-" . width . "_" . height . ".png"
	ADVANCE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonadvance-" . width . "_" . height . ".png" 
	SENDBRAVE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsendbrave-" . width . "_" . height . ".png"
	HEAL_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonheal-" . width . "_" . height . ".png" 
	OUTOFTP_TEXT := "FANTASICA IMAGES\Training\ActualTraining\texttrainingpoints-" . width . "_" . height . ".png"
	CONTINUETRAINING_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining-" . width . "_" . height . ".png"
	TRAININGMYPAGE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonmypage-" . width . "_" . height . ".png"
	TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonfight-" . width . "_" . height . ".png"
	TRAININGSUMMONALLY_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsummonally-" . width . "_" . height . ".png"
	
	TRAININGPROGRESSCOMPLETE_TEXT := "FANTASICA IMAGES\Training\ActualTraining\textprogresscomplete-" . width . "_" . height . ".png"
	
	if (PEARLS_OF_THE_DEEP == 1)
	{
		POTD_TRAINING_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\buttontraining-" . width . "_" . height . ".png"
		POTD_FIGHTBOSS_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Training\buttonfight-" . width . "_" . height . ".png"
		POTD_SKIP_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Battle\buttonskip-" . width . "_" . height . ".png"
		POTD_TOPPAGE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\buttonbacktoeventpage-" . width . "_" . height . ".png"
		POTD_GROUPSBATTLE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\buttongroupbattles-" . width . "_" . height . ".png"
		POTD_REQUESTHELP_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonrequesthelp-" . width . "_" . height . ".png"
		POTD_FIGHTAGAIN_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagain-" . width . "_" . height . ".png"
		POTD_RESULTS_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\Results\textresults-" . width . "_" . height . ".png"
		POTD_MAINICON_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\icon1-" . width . "_" . height . ".png"
		POTD_NINESTAR1_TEXT := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\textninestar.png"
		POTD_FIGHTAGAINTE_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagainte-" . width . "_" . height . ".png"
		POTD_FIGHTAGAINYES_BUTTON := "FANTASICA IMAGES\Event\PearlsOfTheDeep\CheckBattles\buttonfightagainyes-" . width . "_" . height . ".png"
	}
	else
	{
		CALLALLY_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-" . width . "_" . height . ".png" ;the call ally button in questing
		CANCELPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-" . width . "_" . height . ".png" ; the cancel placement button
		CONFIRMUNITPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-" . width . "_" . height . ".png" ;confirm the location to place unit
		DEPLOYUNIT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-" . width . "_" . height . ".png"	;The 'Deploy' button during questing
	}
	
	DEPLOYUNIT1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-" . width . "_" . height . ".png" ;first unit in the 'Deploy List'
	DEPLOYUNIT2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit2-" . width . "_" . height . ".png" ;second unit in the 'Deploy List'
	DEPLOYUNIT3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit3-" . width . "_" . height . ".png" ;third unit in the 'Deploy List'
	DEPLOYUNIT4_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit4-" . width . "_" . height . ".png" ;fourth unit in the 'Deploy List'
	UNITFAVORITEON_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon-" . width . "_" . height . ".png" ;favorite on
	UNIT1_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1-" . width . "_" . height . ".png" ;first unit when unable to deploy (due to insufficient unit cost)
	UNIT2_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit2-" . width . "_" . height . ".png" ;second unit when unable to deploy (due to insufficient unit cost)
	UNIT3_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit3-" . width . "_" . height . ".png" ;third unit when unable to deploy (due to insufficient unit cost)
	UNIT4_INVISIBLEBUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit4-" . width . "_" . height . ".png" ;fourth unit when unable to deploy (due to insufficient unit cost)
	
	DEPLOYALLY1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1-" . width . "_" . height . ".png"    ;ally1 top of the list
	DEPLOYALLY2_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2-" . width . "_" . height . ".png" ;ally2 second on the list
	DEPLOYALLY3_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3-" . width . "_" . height . ".png" ;ally3 third on the list
	NEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist)-" . width . "_" . height . ".png" ;the 'next page' button on the ally selection
	NONEXTPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist)-" . width . "_" . height . ".png" ;the 'no next page' button on the ally selection
	
	CALLALLYPAGE_TEXT := "FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage-" . width . "_" . height . ".png" ;the page titled 'Call Ally'
	
	BACKQUEST_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection-" . width . "_" . height . ".png" ;the back button found in quest's unit selection
	SORTBYDEFAULT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault-" . width . "_" . height . ".png" ;no specific sort
	SORTBYGROUNDATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk-" . width . "_" . height . ".png" ;Sort unit by strongest land to weakest
	SORTBYAIRATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk-" . width . "_" . height . ".png" ;sort unit by strongest air to weakest
	SORTBYSEAATK_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk-" . width . "_" . height . ".png" ;sort unit by strongest sea to weakest
	UNITALL_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall-" . width . "_" . height . ".png" ;type all
	UNITMELEE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee-" . width . "_" . height . ".png" ; type melee
	UNITMISSILE_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile-" . width . "_" . height . ".png" ;type missile
	UNITMAGIC_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic-" . width . "_" . height . ".png" ;type magic
	
	BACKTOEVENT_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed)-" . width . "_" . height . ".png" ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed)-" . width . "_" . height . ".png" ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonmypage-" . width . "_" . height . ".png" ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON := "FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard-" . width . "_" . height . ".png" ;The back button on reward card received upon completion of the tower
	QUESTCLEAR_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestclear-" . width . "_" . height . ".png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-" . width . "_" . height . ".png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-" . width . "_" . height . ".png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-1920_1080.png" ;the dialog which indicates we need to restart the app
	FANTASICALOADPAGE_TEXT := "FANTASICA IMAGES\ErrorRelated\textfantasicaloadpage-" . width . "_" . height . ".png" ;the background image while fantasica is launching/loading
	
	MAINTENANCEYES_BUTTON := "FANTASICA IMAGES\Maintenance\buttonmaintenanceyes-" . width . "_" . height . ".png"
	MAINTENANCEOPTION_BUTTON := "FANTASICA IMAGES\Maintenance\buttonoption.png"
	MAINTENANCE_TEXT := "FANTASICA IMAGES\Maintenance\textmaintenance-" . width . "_" . height . ".png"
	
	CONFIRMEXITAPP_BUTTON := "FANTASICA IMAGES\Bluestack\buttonconfirmexitapp-" . width . "_" . height . ".png" ;The 'yes' button when exiting the bluestack app
	
	DECLINEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\StartScreen\buttondeclineadvertisement-" . width . "_" . height . ".png" ;the 'No Thanks' button when an advertisement pops up
	STARTGAME_BUTTON := "FANTASICA IMAGES\StartScreen\buttonstartgame-" . width . "_" . height . ".png" ;start game button 
	RESUMEQUESTNO_BUTTON := "FANTASICA IMAGES\StartScreen\buttonresumequestno-" . width . "_" . height . ".png" ;do not resume an interrupted quest
	
	DECLINEADVERTISEMENTMYPAGE_BUTTON := "FANTASICA IMAGES\Advertisement\buttondeclineadvertisement(mypage)-" . width . "_" . height . ".png" ;advertisement on mypage	
	MAYBELATERADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttonmaybelateradvertisement-" . width . "_" . height . ".png" ;the 'maybe' button for the advertisement for other apps at the start screen
	CANCELADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncanceladvertisement-" . width . "_" . height . ".png" ;cancel button for advertisement of other apps at the start screen
	CLOSEADVERTISEMENT_BUTTON := "FANTASICA IMAGES\Advertisement\buttoncloseadvertisement-" . width . "_" . height . ".png" ;closes the advertisement by clicking the 'x' button
	
	ANNOUNCEMENT_BUTTON := "FANTASICA IMAGES\Maintenance\buttonannouncement-" . width . "_" . height . ".png"
	
	ALLY_TEXT := "FANTASICA IMAGES\Ally\AllyList\textallies-" . width . "_" . height . ".png" ;the title of the ally list page
	ALLYPENDINGREQUEST_TEXT := "FANTASICA IMAGES\Ally\AllyPendingRequest\textallywaitingapproval-" . width . "_" . height . ".png" ; the text title of the ally requests pending page
	
	MYPAGEID_TEXT := "FANTASICA IMAGES\MainPage\textmypageid-" . width . "_" . height . ".png" ;The text called "id" at the very top of the fantasica homepage
	MYPAGEID2_TEXT := "FANTASICA IMAGES\MainPage\textmypageidarena-" . width . "_" . height . ".png" ;The text called "id" at the very topof the fantasica homepage, but offset due to arena info
	
	EVENT_ICON := "FANTASICA IMAGES\iconmandragoramarch!-" . width . "_" . height . ".png" ;Event icon on home page. Change this path for every event
	TRAINING1_ICON := "FANTASICA IMAGES\MainPage\icontraining1-" . width . "_" . height . ".png" ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON := "FANTASICA IMAGES\MainPage\icontraining2-" . width . "_" . height . ".png" ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON := "FANTASICA IMAGES\MainPage\icontraining3-" . width . "_" . height . ".png" ;Training icon on homepage at index 3 (starting with index 0)	
	
	LOGINBINGOPANEL_ICON := "FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-" . width . "_" . height . ".png" ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-" . width . "_" . height . ".png" ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-" . width . "_" . height . ".png" ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT := "FANTASICA IMAGES\MainPage\Bingo\textbingo-" . width . "_" . height . ".png" ;"Login Bingo"
	
	ROULETTESTART_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-" . width . "_" . height . ".png" ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-" . width . "_" . height . ".png" ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue3-" . width . "_" . height . ".png" ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue4-" . width . "_" . height . ".png" ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnine-" . width . "_" . height . ".png" ;the panel 9
	ROULETTETHREE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textthree-" . width . "_" . height . ".png" ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-" . width . "_" . height . ".png"
	
	BACK_BUTTON := "FANTASICA IMAGES\_GeneralPupose\buttonback-" . width . "_" . height . ".png" ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
	
	CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-" . width . "_" . height . ".png"
	CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-" . width . "_" . height . ".png"
	CPBAR2_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar2-" . width . "_" . height . ".png"
	CPBAR3_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar3-" . width . "_" . height . ".png"
	TIMER6_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\texttimer6-" . width . "_" . height . ".png"
	FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-" . width . "_" . height . ".png"
	CRITICAL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttoncritical-" . width . "_" . height . ".png"
	DRAIN_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttondrain-" . width . "_" . height . ".png"
	SPEED_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonspeed-" . width . "_" . height . ".png"
	SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-" . width . "_" . height . ".png"
	OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-" . width . "_" . height . ".png"
	OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-" . width . "_" . height . ".png"
	OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-" . width . "_" . height . ".png"
	OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-" . width . "_" . height . ".png"
	OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-" . width . "_" . height . ".png"
	OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-" . width . "_" . height . ".png"
	OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-" . width . "_" . height . ".png"
	OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-" . width . "_" . height . ".png"
	OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-" . width . "_" . height . ".png"
	OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-" . width . "_" . height . ".png"
	FRONTLINEBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-" . width . "_" . height . ".png"
	REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-" . width . "_" . height . ".png"
    CPCOUNT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textcpcount-" . width . "_" . height . ".png"
	
	ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-" . width . "_" . height . ".png"
    ASSIST_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-" . width . "_" . height . ".png"
    REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-" . width . "_" . height . ".png"
	ASSIST_ALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-" . width . "_" . height . ".png"
  }
  else if (width == 1920 && height == 1080)
  {
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-1920_1080.png"
  
  	WAIT_X := 735
	WAIT_Y := 425
  
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
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-1920_1080.png" ;Quest icon on home page
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
	
	if (RUINS_REBORN == 1)
	{
		RR_MYPAGE_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\buttonmypage-1920_1080.png"
		RR_BATTLESTART_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\buttonbattlestart-1920_1080.png"
		RR_BACK_BUTTON := "FANTASICA IMAGES\Event\FromTheRuinsReborn\resultscreen\buttonback-1920_1080.png"
		CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-1920_1080.png ;the call ally button in questing
		CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-1920_1080.png ; the cancel placement button
		CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-1920_1080.png ;confirm the location to place unit
		DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-1920_1080.png	;The 'Deploy' button during questing
	}
	else
	{
		CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-1920_1080.png ;the call ally button in questing
		CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-1920_1080.png ; the cancel placement button
		CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-1920_1080.png ;confirm the location to place unit
		DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-1920_1080.png	;The 'Deploy' button during questing
	}
	
	DEPLOYUNIT1_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1-1920_1080.png" ;first unit in the 'Deploy List'
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
	MAINTENANCE_TEXT = FANTASICA IMAGES\Maintenance\textmaintenance-1920_1080.png
	
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
	
	CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-1920_1080.png"
	CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-1920_1080.png"
	CPBAR2_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar2-1920_1080.png"
	CPBAR3_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar3-1920_1080.png"
	TIMER6_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\texttimer6-1920_1080.png"
	FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-1920_1080.png"
	CRITICAL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttoncritical-1920_1080.png"
	DRAIN_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttondrain-1920_1080.png"
	SPEED_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonspeed-1920_1080.png"
	SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-1920_1080.png"
	OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-1920_1080.png"
	OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-1920_1080.png"
	OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-1920_1080.png"
	OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-1920_1080.png"
	OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-1920_1080.png"
	OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-1920_1080.png"
	OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-1920_1080.png"
	OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-1920_1080.png"
	OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-1920_1080.png"
	OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-1920_1080.png"
	FRONTLINEBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-1920_1080.png"
	REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-1920_1080.png"
    CPCOUNT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textcpcount-1920_1080.png"
	
	ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-1920_1080.png"
    ASSIST_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-1920_1080.png"
    REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-1920_1080.png"
	ASSIST_ALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-1920_1080.png"
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