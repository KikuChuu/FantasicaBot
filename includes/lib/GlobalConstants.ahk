#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Init_globals()
{
	; Declare that call variables in this function are global variables
	global
	
	; Discover the window title
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

	; Obtain the window size in terms of width and height.
	; We use the width and height to set the bot's parameters such as
	; initial scan coordinates, the location to idly click, and image paths.
	WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
	if (width == 0 || height == 0)
	{
		MsgBox % "Invalid window size"
	}
	X2 := width
	Y2 := height


	if (width == 632 && height == 1030)
	{
		; The two coordinates tells the bot where it should idly click
		WAIT_X := 325
		WAIT_Y := 380

		; The first two parameters are coordinates taht tell the bot where 
		; the first bingo tile is located. 
		; The third parameter tells the bot the dimension (in pixels) of 
		; the square bingo tile.
		BINGO_START_X := 110
		BINGO_START_Y := 235
		BINGO_TILE_SIZE := 100

		; These four parameters are start and end coordinates used in the
		; quest procedure to control the amount of scrolling the bot should
		; perform (specified in pixels).
		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		MENU_X1 := 500
		MENU_Y1 := 975
		MENU_X2 := 50
		MENU_Y2 := 975
		
		; The first two parameters are coordinates used in the quest procedure's
		; findCoordinate functions and tells the bot where it should begin its
		; scan for a valid unit placement.
		; The third parameter tells the bot how large a unit tile roughly is.
		SCAN_START_X := 95
		SCAN_START_Y := 72
		SCAN_TILE_SIZE := 73
	}
	else if (width == 677 && height == 1102)
	{
		WAIT_X := 325
		WAIT_Y := 420

		BINGO_START_X := 110
		BINGO_START_Y := 265
		BINGO_TILE_SIZE := 110

		QUEST_X1 := 293
		QUEST_Y1 := 840
		QUEST_X2 := 293
		QUEST_Y2 := 130

		MENU_X1 := 520
		MENU_Y1 := 975
		MENU_X2 := 30
		MENU_Y2 := 975
		
		SCAN_START_X := 167
		SCAN_START_Y := 68
		SCAN_TILE_SIZE := 78
        
        CARDMENU_X := 100
		CARDMENU_Y := 800
	}
	else if (width == 1282 && height == 749)
	{
		WAIT_X := 490
		WAIT_Y := 300

		BINGO_START_X := 491
		BINGO_START_Y := 233
		BINGO_TILE_SIZE := 70

		QUEST_X1 := 500
		QUEST_Y1 := 623
		QUEST_X2 := 500
		QUEST_Y2 := 163

		MENU_X1 := 760
		MENU_Y1 := 710
		MENU_X2 := 445
		MENU_Y2 := 710
		
		SCAN_START_X := 465
		SCAN_START_Y := 99
		SCAN_TILE_SIZE := 51
        
        CARDMENU_X := 500
        CARDMENU_Y := 600
	}
	else if (width == 1920 && height == 1080)
	{
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
	}
	else
	{
		WAIT_X := 325
		WAIT_Y := 450

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
	}
  
	FANTASICAAPP_BUTTON := "FANTASICA IMAGES\Bluestack\appfantasica-" . width . "_" . height . ".png"
	POPUPCLOSE_BUTTON := "FANTASICA IMAGES\MainPage\buttonpopupclose-"  . width . "_" . height . ".png"
	
	QUEST1_ICON := "FANTASICA IMAGES\MainPage\iconquest1-" . width . "_" . height . ".png" ;Quest icon on home page	
	QUEST2_ICON := "FANTASICA IMAGES\MainPage\iconquest2-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST3_ICON := "FANTASICA IMAGES\MainPage\iconquest3-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST4_ICON := "FANTASICA IMAGES\MainPage\iconquest4-" . width . "_" . height . ".png" ;Quest icon on home page
	QUEST5_ICON := "FANTASICA IMAGES\MainPage\iconquest5-" . width . "_" . height . ".png" ;Quest icon on home page
	
	QUESTTIMER_TEXT := "FANTASICA IMAGES\MainPage\textquesttimer-" . width . "_" . height . ".png"
	
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
	
	QUEST_TEXT := "FANTASICA IMAGES\Quest\QuestSelection\textquest-" . width . "_" . height . ".png"
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
	HEALMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmid-" . width . "_" . height . ".png"
	HEALDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealdark-" . width . "_" . height . ".png" 
    HEALMOBACOIN_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoin-" . width . "_" . height . ".png"
    HEALMOBACOINMID_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoinmid-" . width . "_" . height . ".png"
    HEALMOBACOINDARK_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonhealmobacoindark-" . width . "_" . height . ".png"
	USEPOTIONYES_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonpotionyes-" . width . "_" . height . ".png" 
	OUTOFTP_TEXT := "FANTASICA IMAGES\Training\ActualTraining\texttrainingpoints-" . width . "_" . height . ".png"
	CONTINUETRAINING_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttoncontinuetraining-" . width . "_" . height . ".png"
	TRAININGMYPAGE_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonmypage-" . width . "_" . height . ".png"
	TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonfight-" . width . "_" . height . ".png"
	TRAININGSUMMONALLY_BUTTON := "FANTASICA IMAGES\Training\ActualTraining\buttonsummonally-" . width . "_" . height . ".png"
	
	TRAININGPROGRESSCOMPLETE_TEXT := "FANTASICA IMAGES\Training\ActualTraining\textprogresscomplete-" . width . "_" . height . ".png"
    
	CALLALLY_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncallally-" . width . "_" . height . ".png" ;the call ally button in questing
	CANCELPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement-" . width . "_" . height . ".png" ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement-" . width . "_" . height . ".png" ;confirm the location to place unit
	DEPLOYUNIT_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit-" . width . "_" . height . ".png"	;The 'Deploy' button during questing
	SKIPQUEST_BUTTON := "FANTASICA IMAGES\Quest\QuestBattle\buttonskip-" . width . "_" . height . ".png"
	
	DEPLOY_TEXT := "FANTASICA IMAGES\Quest\QuestBattle\Unit\textdeploy-" . width . "_" . height . ".png"
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
	QUESTRESULT_TEXT := "FANTASICA IMAGES\Quest\QuestResult\textquestresult-" . width . "_" . height . ".png"
	
	CONNECTIONERROR_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonconnectionerror-" . width . "_" . height . ".png" ;The 'Yes' button when a connection error has occured.	
	FORCECLOSEAPP_BUTTON := "FANTASICA IMAGES\ErrorRelated\buttonforcecloseapp-" . width . "_" . height . ".png" ;force closes the app
	CONNECTIONERROR_TEXT := "FANTASICA IMAGES\ErrorRelated\textconnectionerror-" . width . "_" . height . ".png" ;the dialog which indicates we need to restart the app
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
	
	FULLTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\textmaxtrainingpoints-" . width . "_" . height . ".png"
	DEPLETEDTRAININGPOINTS_TEXT := "FANTASICA IMAGES\MainPage\texttrainingpoints-" . width . "_" . height . ".png"
	TRAINING1_ICON := "FANTASICA IMAGES\MainPage\icontraining1-" . width . "_" . height . ".png" ;Training icon on homepage at index 1 (starting with index 0)
	TRAINING2_ICON := "FANTASICA IMAGES\MainPage\icontraining2-" . width . "_" . height . ".png" ;Training icon on homepage at index 2 (starting with index 0)
	TRAINING3_ICON := "FANTASICA IMAGES\MainPage\icontraining3-" . width . "_" . height . ".png" ;Training icon on homepage at index 3 (starting with index 0)	
	TRAINING4_ICON := "FANTASICA IMAGES\MainPage\icontraining4-" . width . "_" . height . ".png" ;Training icon on homepage at index 4 (starting with index 0)	
    TRAINING5_ICON := "FANTASICA IMAGES\MainPage\icontraining5-" . width . "_" . height . ".png" ;Training icon on homepage at index 5 (starting with index 0)	
	LOGINBINGOPANEL_ICON := "FANTASICA IMAGES\MainPage\Bingo\iconbingopanel-" . width . "_" . height . ".png" ;login bingo panel
	LOGINBINGOMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingomypage-" . width . "_" . height . ".png" ;button to return to mypage from login bingo
	LOGINBINGORECEIVE_BUTTON := "FANTASICA IMAGES\MainPage\Bingo\buttonbingoreceive-" . width . "_" . height . ".png" ; receive button when you click a panel in the daily login bingo
	LOGINBINGO_TEXT := "FANTASICA IMAGES\MainPage\Bingo\textbingo-" . width . "_" . height . ".png" ;"Login Bingo"
	
    INBOX1_ICON := "FANTASICA IMAGES\MainPage\iconinbox15-" . width . "_" . height . ".png"
    INBOX2_ICON := "FANTASICA IMAGES\MainPage\iconinbox16-" . width . "_" . height . ".png"
    INBOX_TITLE := "FANTASICA IMAGES\Inbox\texttitle-" . width . "_" . height . ".png"
    INBOX_ALL_BUTTON := "FANTASICA IMAGES\Inbox\buttonall-" . width . "_" . height . ".png"
    INBOX_ITEMS_BUTTON := "FANTASICA IMAGES\Inbox\buttonitems-" . width . "_" . height . ".png"
    INBOX_RECEIVE_BUTTON := "FANTASICA IMAGES\Inbox\buttonreceive-" . width . "_" . height . ".png"
    
	ROULETTESTART_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstartroulette-" . width . "_" . height . ".png" ;the start button to start spinning the wheel	
	ROULETTESTOP_BUTTON := "FANTASICA IMAGES\MainPage\Roulette\buttonstoproulette-" . width . "_" . height . ".png" ;the stop button to stop the wheel
	ROULETTENINEBLUE3_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue3-" . width . "_" . height . ".png" ;the blue panel 9 at the 3rd index
	ROULETTENINEBLUE4_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnineblue4-" . width . "_" . height . ".png" ;the blue panel 9 at the 4th index
	ROULETTENINE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textnine-" . width . "_" . height . ".png" ;the panel 9
	ROULETTETHREE_TEXT := "FANTASICA IMAGES\MainPage\Roulette\textthree-" . width . "_" . height . ".png" ;the panel 3
	
	LOGINBONUSMYPAGE_BUTTON := "FANTASICA IMAGES\MainPage\Bonus\buttonmypage-" . width . "_" . height . ".png"
	
	BACK_BUTTON := "FANTASICA IMAGES\_GeneralPupose\buttonback-" . width . "_" . height . ".png" ;The back button found in the bottom right corner of the app screen (not the corner of bluestack screen)
	
	;===========================================================================
	;***************************************************************************
	;---------------------------- EVENT VARIABLES ------------------------------
	;***************************************************************************
	;===========================================================================
    ; --------------------------------------------------------------------------
    ; ROLL THE DICE EVENT
    ; --------------------------------------------------------------------------
    DICE_EVENT_ICON := "FANTASICA IMAGES\Event\DiceEvent\iconevent-" . width . "_" . height . ".png"
    DICE_TITLE_IMAGE:= "FANTASICA IMAGES\Event\DiceEvent\imagetitle-" . width . "_" . height . ".png"
    DICE_BEGINEVENT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\buttonbeginevent-" . width . "_" . height . ".png"
    DICE_ROLL_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonrolldice-" . width . "_" . height . ".png"
    DICE_ROLLDISABLED_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonrolldicedisabled-" . width . "_" . height . ".png"
    DICE_DROPSSTOCK0_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textdropsstock0-" . width . "_" . height . ".png"
    DICE_MOVE_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonmove-" . width . "_" . height . ".png"
    DICE_HEAL_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonheal-" . width . "_" . height . ".png"
    DICE_OPENCHEST_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonopenchest-"  . width . "_" . height . ".png"
    DICE_SINGLEDICEFACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textdiceface1-" . width . "_" . height . ".png"
    DICE_FIVESETDICE1FACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textfivesetdice1face1-" . width . "_" . height . ".png"
    DICE_FIVESETDICE2FACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textfivesetdice2face1-" . width . "_" . height . ".png"
    DICE_FIVESETDICE3FACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textfivesetdice3face1-" . width . "_" . height . ".png"
    DICE_FIVESETDICE4FACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textfivesetdice4face1-" . width . "_" . height . ".png"
    DICE_FIVESETDICE5FACE1_TEXT := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\textfivesetdice5face1-" . width . "_" . height . ".png"
    DICE_STOP_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonstop-" . width . "_" . height . ".png"
    DICE_CLOSEPOPUP_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonclose-" . width . "_" . height . ".png"
    DICE_FIGHT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonfight-" . width . "_" . height . ".png"
    DICE_RESULTS_TITLE := "FANTASICA IMAGES\Event\DiceEvent\resultsscreen\texttitle-" . width . "_" . height . ".png"
    DICE_TOBOARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\resultsscreen\buttontoboard-" . width . "_" . height . ".png"
    DICE_NEXT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\resultsscreen\buttonnext-" . width . "_" . height . ".png"
    DICE_LEFT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonleftarrow-" . width . "_" . height . ".png"
    DICE_RIGHT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonrightarrow-" . width . "_" . height . ".png"
    DICE_UP_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonuparrow-" . width . "_" . height . ".png"
    DICE_DOWN_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttondownarrow-" . width . "_" . height . ".png"
    DICE_BOARDBACK_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonback-" . width . "_" . height . ".png"
    DICE_MPBACK_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\buttonback-" . width . "_" . height . ".png"
    DICE_DISCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttondiscard-" . width . "_" . height . ".png"
    DICE_DISCARDYES_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttondiscardyes-" . width . "_" . height . ".png"
    DICE_WARPBONUSBOARDYES_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\resultsscreen\buttonwarpbonusboardyes-" . width . "_" . height . ".png"
    DICE_POTIONPROMPT_TEXT := "FANTASICA IMAGES\Event\DiceEvent\battlescreen\textpotionprompt-" . width . "_" . height . ".png"
    DICE_USEPOTIONYES_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\battlescreen\buttonusepotionyes-" . width . "_" . height . ".png"
    DICE_USEPOTIONNO_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\battlescreen\buttonusepotionno-" . width . "_" . height . ".png"
    DICE_GIVEUPYES_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\battlescreen\buttongiveupyes-" . width . "_" . height . ".png"
    DICE_DICESMENU_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttondices-" . width . "_" . height . ".png"
    DICE_MASTER_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonmasterdice-" . width . "_" . height . ".png"
    DICE_PORTRAIT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonportraitdice-" . width . "_" . height . ".png"
    DICE_SKETCH_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonsketchdice-" . width . "_" . height . ".png"
    DICE_CLOSEDICESMENU_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonclosedicesmenu-" . width . "_" . height . ".png"
    DICE_CARDMENU_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmenu-" . width . "_" . height . ".png"
    DICE_FIRSTCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonfirstcard-" . width . "_" . height . ".png"
    DICE_CLOSECARDMENU_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonclosecardmenu-" . width . "_" . height . ".png"
    DICE_USECARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonusecard-" . width . "_" . height . ".png"
    DICE_USECARDYES_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonusecardyes-" . width . "_" . height . ".png"
    DICE_MOVE1CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove1-" . width . "_" . height . ".png"
    DICE_MOVE2CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove2-" . width . "_" . height . ".png"
    DICE_MOVE3CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove3-" . width . "_" . height . ".png"
    DICE_MOVE4CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove4-" . width . "_" . height . ".png"
    DICE_MOVE5CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove5-" . width . "_" . height . ".png"
    DICE_MOVE6CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove6-" . width . "_" . height . ".png"
    DICE_MOVE10CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardmove10-" . width . "_" . height . ".png"
    DICE_PROB1CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardprob1-" . width . "_" . height . ".png"
    DICE_PROB2CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardprob2-" . width . "_" . height . ".png"
    DICE_HIGHPROBCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardhighprob-" . width . "_" . height . ".png"
    DICE_LOWPROBCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardlowprob-" . width . "_" . height . ".png"
    DICE_ALLY2CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardally2-" . width . "_" . height . ".png"
    DICE_ALLY3CARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardally3-" . width . "_" . height . ".png"
    DICE_BRONZESTOPCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardbronzestop-" . width . "_" . height . ".png"
    DICE_SILVERSTOPCARD_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttoncardsilverstop-" . width . "_" . height . ".png"
    DICE_MENU_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonmenu-" . width . "_" . height . ".png"
    DICE_RETREAT_BUTTON := "FANTASICA IMAGES\Event\DiceEvent\boardscreen\buttonretreat-" . width . "_" . height . ".png"
    ; --------------------------------------------------------------------------
    ; TRAIN-ENCOUNTER EVENT
    ; --------------------------------------------------------------------------
	TRNECT_EVENT_ICON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\iconevent-" . width . "_" . height . ".png" ;Event icon on home page. Change this path for every event
	TRNECT_TRAIN_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\buttontrain-" . width . "_" . height . ".png"
	TRNECT_BOSSLIST_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\buttonbosslist-" . width . "_" . height . ".png"
	TRNECT_ASSISTLIST_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\buttonassist-" . width . "_" . height . ".png"
	TRNECT_TRAININGFIGHT_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\buttonfight-" . width . "_" . height . ".png"
	TRNECT_TRAININGFLEE_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\buttonflee-" . width . "_" . height . ".png"
	TRNECT_TRAININGUSEGLOBE_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\buttonuseglacialglobe-" . width . "_" . height . ".png"
	TRNECT_REGULARBOSS1_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imageregularboss1-" . width . "_" . height . ".png"
	TRNECT_REGULARBOSS2_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imageregularboss2-" . width . "_" . height . ".png"
	TRNECT_REGULARBOSS3_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imageregularboss3-" . width . "_" . height . ".png"
	TRNECT_SPECIALBOSS1_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imagespecialboss1-" . width . "_" . height . ".png"
	TRNECT_SPECIALBOSS2_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imagespecialboss2-" . width . "_" . height . ".png"
	TRNECT_LIMITEDBOSS_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Training\imagelimitedboss-" . width . "_" . height . ".png"
	TRNECT_EVENTTITLE_IMAGE := "FANTASICA IMAGES\Event\UnderTheStarrySkies\imageeventtitle-" . width . "_" . height . ".png"
	TRNECT_ASSISTALLY_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Assist\buttonassistally-" . width . "_" . height . ".png"
	TRNECT_ASSISTLIST2_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Assist\buttonassistlist-" . width . "_" . height . ".png"
	TRNECT_ASSISTALLIES_TEXT := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Assist\textassistallies-" . width . "_" . height . ".png"
	TRNECT_BOSSLISTFROMASSISTALLIES_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Assist\buttonbosslist-" . width . "_" . height . ".png"
	TRNECT_BOSSLIST_TEXT := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\textselectboss-" . width . "_" . height . ".png"
	TRNECT_USEEVENTITEM_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\buttonuseeventitem-" . width . "_" . height . ".png"
	TRNECT_REQUESTASSIST_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\buttonrequestassist-" . width . "_" . height . ".png"
	TRNECT_FIGHT_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\buttonfight-" . width . "_" . height . ".png"
	TRNECT_EVENT_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\buttonevent-" . width . "_" . height . ".png"
	TRNECT_POTIONFIGHT_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Bosses\buttonusepotion-" . width . "_" . height . ".png"
	TRNECT_SENDEVENTITEM_BUTTON := "FANTASICA IMAGES\Event\UnderTheStarrySkies\Assist\buttonsendeventitem-" . width . "_" . height . ".png"
	; ==========================================================================
    
    ; --------------------------------------------------------------------------
    ; COLISEUM EVENT
    ; --------------------------------------------------------------------------
    COL_EVENT_ICON := "FANTASICA IMAGES\Event\FiresOfPerdition\iconevent-" . width . "_" . height . ".png"
    COL_EVENTTITLE_IMAGE := "FANTASICA IMAGES\Event\FiresOfPerdition\imageeventtitle-" . width . "_" . height . ".png"
    COL_TOEVENT_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\buttontoeventselection-" . width . "_" . height . ".png"
    COL_SELECTIONPAGETITLE_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\SelectionPage\textselectionpagetitle-" . width . "_" . height . ".png"
    COL_COOLDOWN_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\SelectionPage\textcooldown-" . width . "_" . height . ".png"
    COL_BATTLEMODE_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\SelectionPage\buttonbattlemode-" . width . "_" . height . ".png"
    COL_AREA1_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\SelectionPage\buttonarea1-" . width . "_" . height . ".png"
    COL_AREA2_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\SelectionPage\buttonarea2-" . width . "_" . height . ".png"
    COL_SKIP_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\AreaPage\buttonskip-" . width . "_" . height . ".png"
    COL_RESULTSPAGETITLE_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\ResultsPage\textresultspagetitle-" . width . "_" . height . ".png"
    COL_HEROSELECTIONPAGETITLE_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\HeroSelectionPage\texttitle-" . width . "_" . height . ".png"
    COL_CHOOSEHERO1_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\HeroSelectionPage\buttonchoosehero1-" . width . "_" . height . ".png"
    COL_BATTLETITLE_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\BattlePage\texttitle-" . width . "_" . height . ".png"
    COL_BATTLECOOLDOWN_TEXT := "FANTASICA IMAGES\Event\FiresOfPerdition\BattlePage\textcooldown-" . width . "_" . height . ".png"
    COL_BATTLE_BUTTON := "FANTASICA IMAGES\Event\FiresOfPerdition\BattlePage\buttonbattle-" . width . "_" . height . ".png"
    ; ==========================================================================
    
     ; --------------------------------------------------------------------------
    ; FRONTLINES EVENT
    ; --------------------------------------------------------------------------
    FL_EVENT_ICON := "FANTASICA IMAGES\Event\Frontlines\iconevent-" . width . "_" . height . ".png"
    FL_TITLE_IMAGE := "FANTASICA IMAGES\Event\Frontlines\imagetitle-" . width . "_" . height . ".png"
    FL_CPBAR0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar0-" . width . "_" . height . ".png"
	FL_CPBAR1_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textcpbar1-" . width . "_" . height . ".png"
    FL_REWARDS_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonrewards-" . width . "_" . height . ".png"
    FL_REWARDSNOTIFICATION_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonrewardsnotification-" . width . "_" . height . ".png"
    FL_ASSISTNOTIFICATION_ICON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassistnotification-" . width . "_" . height . ".png"
    FL_ASSIST_BUTTON  := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonassist-" . width . "_" . height . ".png"
    FL_MYPAGE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonmypage-" . width . "_" . height . ".png"
    
	FL_FIGHT_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonfight-" . width . "_" . height . ".png"
    FL_HOLYWATERSTOCK0_TEXT := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\textholywaterstock0-" . width . "_" . height . ".png"
    FL_HOLYWATER_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonholywater-" . width . "_" . height . ".png"
    FL_HOLYWATERYES_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonholywateryes-" . width . "_" . height . ".png"
    FL_CLOSE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\maineventscreen\buttonclose-" . width . "_" . height . ".png"
    FL_SKILL1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskill1-" . width . "_" . height . ".png"
    FL_SKILL2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskill2-" . width . "_" . height . ".png"
	FL_SKILL3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskill3-" . width . "_" . height . ".png"
	FL_SKIP_BUTTON := "FANTASICA IMAGES\Event\Frontlines\battlescreen\buttonskip-" . width . "_" . height . ".png"
    
	FL_OPPONENTSELECTION_TITLE := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\texttitle-" . width . "_" . height . ".png"
    FL_OPPONENT1_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent1-" . width . "_" . height . ".png"
	FL_OPPONENT2_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent2-" . width . "_" . height . ".png"
	FL_OPPONENT3_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent3-" . width . "_" . height . ".png"
	FL_OPPONENT4_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent4-" . width . "_" . height . ".png"
	FL_OPPONENT5_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent5-" . width . "_" . height . ".png"
	FL_OPPONENT16_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent16-" . width . "_" . height . ".png"
	FL_OPPONENT17_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent17-" . width . "_" . height . ".png"
	FL_OPPONENT18_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent18-" . width . "_" . height . ".png"
	FL_OPPONENT19_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent19-" . width . "_" . height . ".png"
	FL_OPPONENT20_BUTTON := "FANTASICA IMAGES\Event\Frontlines\opponentselectionscreen\buttonopponent20-" . width . "_" . height . ".png"
	FL_BACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonback-" . width . "_" . height . ".png"
	FL_REMATCH_BUTTON := "FANTASICA IMAGES\Event\Frontlines\resultscreen\buttonrematch-" . width . "_" . height . ".png"
	FL_RESULTVICTORY_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textvictory-" . width . "_" . height . ".png"
    FL_RESULTDEFEAT_TEXT := "FANTASICA IMAGES\Event\Frontlines\resultscreen\textdefeat-" . width . "_" . height . ".png"
    
    FL_REWARDS_TITLE := "FANTASICA IMAGES\Event\Frontlines\rewardsscreen\texttitle-" . width . "_" . height . ".png"
    FL_RECEIVE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\rewardsscreen\buttonreceive-" . width . "_" . height . ".png"
    
    FL_ASSIST_TITLE := "FANTASICA IMAGES\Event\Frontlines\assistscreen\texttitle-" . width . "_" . height . ".png"
    FL_ASSISTBACK_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistback-" . width . "_" . height . ".png"
    FL_REQUESTASSISTANCE_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonrequestassistance-" . width . "_" . height . ".png"
	FL_ASSISTALL_BUTTON := "FANTASICA IMAGES\Event\Frontlines\assistscreen\buttonassistall-" . width . "_" . height . ".png"
    ; ==========================================================================
    
    TOP_CLIMBTREE_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\buttonclimbtree-" . width . "_" . height . ".png"
	TOP_TITLE_IMAGE := "FANTASICA IMAGES\Event\TreeOfParadise\imagetitle-" . width . "_" . height . ".png"
	TOP_ADVANCE1_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\Training\buttonadvance1-" . width . "_" . height . ".png"
	TOP_ADVANCE2_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\Training\buttonadvance2-" . width . "_" . height . ".png"
	TOP_FIGHT_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\Training\buttonfight-" . width . "_" . height . ".png"
	TOP_HEAL_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\Training\buttonheal-" . width . "_" . height . ".png"
	TOP_TRAININGBACK_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\Training\buttonback-" . width . "_" . height . ".png"
	TOP_TRAININGPOINTS_TEXT := "FANTASICA IMAGES\Event\TreeOfParadise\texttrainingpoints-" . width . "_" . height . ".png"
	TOP_BACKTOMAINPAGE_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\buttonback-" . width . "_" . height . ".png"
	TOP_FIGHTBOSS_BUTTON := "FANTASICA IMAGES\Event\TreeOfParadise\buttonfightboss-" . width . "_" . height . ".png"
	LB_SEAROAD_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\buttonsearoad-" . width . "_" . height . ".png"
	LB_YES_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\buttonyes-"  . width . "_" . height . ".png"
	LB_TITLE_IMAGE := "FANTASICA IMAGES\Event\LegionBattle\imagetitle-"  . width . "_" . height . ".png"
	LB_WALK1_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonwalk1-"  . width . "_" . height . ".png"
	LB_WALK2_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonwalk2-"  . width . "_" . height . ".png"
	LB_ADVANCE_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonadvance-"  . width . "_" . height . ".png"
	LB_FIGHTYES_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonyes-" . width . "_" . height . ".png"
	LB_RESULT1_TEXT := "FANTASICA IMAGES\Event\LegionBattle\Result\textbattlefieldresult-" . width . "_" . height . ".png"
	LB_RESULT2_TEXT := "FANTASICA IMAGES\Event\LegionBattle\Result\textbattleresult-" . width . "_" . height . ".png"
	LB_RESULT3_TEXT := "FANTASICA IMAGES\Event\LegionBattle\Result\textcompleteclearresult-" . width . "_" . height . ".png"
	LB_RESULTBACK_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Result\buttonback-" . width . "_" . height . ".png"
	LB_POTION_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonpotion-" . width . "_" . height . ".png"
	LB_BATTLEFIELDBACK_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonback-" . width . "_" . height . ".png"
	LB_FIGHT_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonfight-" . width . "_" . height . ".png"
	LB_AUTOBATTLE_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Battlefield\buttonautobattle-" . width . "_" . height . ".png"
	LB_COMPLETECLEARBACK_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Result\buttoncompleteclearback-" . width . "_" . height . ".png"
	LB_OCEANCALL_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\buttonoceancall-" . width . "_" . height . ".png"
	LB_ENEMYLIST_TEXT := "FANTASICA IMAGES\Event\LegionBattle\Enemylist\textenemylist-" . width . "_" . height . ".png"
	LB_FIGHTAGAIN_BUTTON := "FANTASICA IMAGES\Event\LegionBattle\Enemylist\buttonfight-" . width . "_" . height . ".png"
}
;Bluestack
;---------
EXITAPP_BUTTON = FANTASICA IMAGES\Bluestack\buttonexitapp.png ;the exit app button in the lower left corner of bluestack