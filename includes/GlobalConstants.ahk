	;do not touch these two code line of code, they're for the event
	;RESTRICTPLACEMENTON_COL1= 966 ;1 = use specific coordinates, 0 = let program automatically find coordinates to place units
	;RESTRICTPLACEMENTON_COL2 = 651
	;RESTRICTPLACEMENTON_ROW1 = 0
	;RESTRICTPLACEMENTON_ROW2 = 0
	
;FANTASICA SCREEN DIMENSION
;--------------------------
X1 := 0
Y1 := 0
X2 := 1920
Y2 := 1080

BLUESTACK_WINDOW_TITLE := "Bluestacks App Player"
SCAN_START_X := 0 ; QuestProcedure.ahk
SCAN_START_Y := 0 ; QuestProcedure.ahk
SCAN_TILE_SIZE := 0 ; QuestProcedure.ahk

Init_globals()
{
  global X1, Y1, X2, Y2
  global SCAN_START_X, SCAN_START_Y, BLUESTACK_WINDOW_TITLE, SCAN_TILE_SIZE
  WinGetPos,,,width, height, %BLUESTACK_WINDOW_TITLE%
  if (width == 677 && height = 1102)
  {
	SCAN_START_X := 239
    SCAN_START_Y := 233
	SCAN_TILE_SIZE := 79
  }
  else if (width == 1920 && height == 1080)
  {
    SCAN_START_X := 702
    SCAN_START_Y := 132
	SCAN_TILE_SIZE := 75
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

;Quest
;-----
	;QuestBattle
	;-----------
		;Ally
		;----
		DEPLOYALLY1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally1.png ;ally1 top of the list
		DEPLOYALLY2_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally2.png	;ally2 second on the list
		DEPLOYALLY3_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttondeployally3.png	;ally3 third on the list
		NEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnextpage(allylist).png ;the 'next page' button on the ally selection
		NONEXTPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Ally\buttonnonextpage(allylist).png ;the 'no next page' button on the ally selection
		
		CALLALLYPAGE_TEXT = FANTASICA IMAGES\Quest\QuestBattle\Ally\textcallallypage.png ;the page titled 'Call Ally'
		
		;BothUnitAlly
		;------------
		BACKQUEST_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonbackallyselection.png ;the back button found in quest's unit selection
		SORTBYDEFAULT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbydefault.png ;no specific sort
		SORTBYGROUNDATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbygroundatk.png ;Sort unit by strongest land to weakest
		SORTBYAIRATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyairatk.png ;sort unit by strongest air to weakest
		SORTBYSEAATK_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonsortbyseaatk.png ;sort unit by strongest sea to weakest
		UNITALL_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitAlly\buttonunitall.png ;type all
		UNITMELEE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmelee.png ; type melee
		UNITMISSILE_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmissile.png ;type missile
		UNITMAGIC_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\BothUnitally\buttonunitmagic.png ;type magic
		
		;Unit
		;----
		DEPLOYUNIT1_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttondeployunit1.png ;first unit in the 'Deploy List'
		UNITFAVORITEON_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\buttonunitfavoriteon.png ;favorite on
		UNIT1_INVISIBLEBUTTON = FANTASICA IMAGES\Quest\QuestBattle\Unit\invisiblebuttonunit1.png ;first unit when unable to deploy (due to insufficient unit cost)
			
	CALLALLY_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncallally.png ;the call ally button in questing
	CANCELPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttoncancelplacement.png ; the cancel placement button
	CONFIRMUNITPLACEMENT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttonconfirmunitplacement.png ;confirm the location to place unit
	DEPLOYUNIT_BUTTON = FANTASICA IMAGES\Quest\QuestBattle\buttondeployunit.png	;The 'Deploy' button during questing
		
	;QuestResult
	;-----------
	BACKTOEVENT_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktoevent(completed).png ; The 'Back to Event' button after defeating a event boss encountered during training
	CHOOSEQUESTCOMPLETED_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonchoosequest(completed).png ;The 'Choose Quest' button on the results page after completing a quest
	MYPAGE_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonmypage.png ;The 'My Page' button on the results page after questing
	TOWERCOMPLETEREWARDCARDBACK_BUTTON = FANTASICA IMAGES\Quest\QuestResult\buttonbacktowercompleterewardcard.png ;The back button on reward card received upon completion of the tower
	;QuestSelection
	;--------------
	SELECTEPISODE_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonselectepisode.png ;The 'Select Episode' button for quest
	STARTQUEST1_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest1.png ;quest #1
	STARTQUEST2_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest2.png ;quest #2
	STARTQUEST3_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest3.png ;quest #3
	STARTQUEST4_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest4.png ;quest #4
	STARTQUEST5_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest5.png ;quest #5
	STARTQUEST6_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest6.png ;quest #6
	STARTQUEST7_BUTTON = FANTASICA IMAGES\Quest\QuestSelection\buttonstartquest7.png ;quest #7 
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
	
	;Shadowflame Citadel
	;-------------------
	;BUTTON PATHS
	ACCEPTBOSSFIGHT_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonacceptbossfight.png ;the 'Yes' button to the boss dialog in arena
	BATTLE_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonbattle.png ;button to begin battle with another player
	BATTLEOFHEROES_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonbattleofheroes.png ;the button to transition to the pvp event page
	;FIGHT_ARENA_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfight.png ;begin a floor of the arena
	FIGHTFIRSTHERO_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfightfirsthero.png ;button to battle against the first hero 
	FIGHTSECONDHERO_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfightsecondhero.png ;button to battle against the second hero
	FIGHTTHIRDHERO_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfightthirdhero.png ;button to battle against the third hero
	FLOOR1_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor1.png
	FLOOR2_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor2.png
	FLOOR3_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor3.png ;begin floor 3 of the arena
	FLOOR4_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor4.png ;begin floor 4 of the arena
	FLOOR5_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor5.png ;begin floor 5 of the arena
	FLOOR6_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonfloor6.png ;begin floor 6 of the arena
	SHADOWFLAMECITADELARENA_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonshadowflamecitadelarena.png ;the button to transition to the npc arena event page
	RETREAT_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonretreat.png ;the 'Retreat' button when you fail an arena
	SEARCHAGAIN_BUTTON = FANTASICA IMAGES\Event\Shadowflame Citadel\buttonsearchagain.png ;The 'Search Again' button to search for different opponents
	
	;TEXT
	SHADOWFLAMEARENA_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textshadowflamecitadelarena.png ;title page of the npc arena
	BATTLEOFHEROES_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textbattleofheroescooldown.png ;ready to start battle when found
	GEMSTONEPALACEOFLIGHTCOOLDOWN9_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textgemstonepalaceoflightcooldown(9-te).png ;ready to start quest when found offset cuz of single digit te)
	GEMSTONEPALACEOFLIGHTCOOLDOWN_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textgemstonepalaceoflightcooldown.png ;ready to start quest when found
	GEMSTONEPALACEOFLIGHTCOOLDOWN100_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textgemstonepalaceoflightcooldown(100+te).png ; ;ready to start quest when found (offset cuz of 100+ te)
	FIRSTFIVESTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textfirstfivestar.png ;first in list 5-star opponent in battle of heroes  
	FIRSTFOURSTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textfirstfourstar.png ;first in list 4-star opponent in battle of heroes
	SECONDFIVESTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textsecondfivestar.png ;second in list 5-star opponent in battle of heroes
	SECONDFOURSTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textsecondfourstar.png ;second in list 4-star opponent in battle of heroes
	THIRDFIVESTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textthirdfivestar.png ;third in list 5-star opponent in battle of heroes
	THIRDFOURSTAR_TEXT = FANTASICA IMAGES\Event\Shadowflame Citadel\textthirdfourstar.png ;third in list 4-star opponent in battle of heroes
	
	;The Doomsday Tower Revelations
	;------------------------------
	ENTERNEWTOWER_BUTTON = FANTASICA IMAGES\Event\RevelationTower\buttonenternewtower.png ; the button to enter a new specific tower
	ENTERTOWER_BUTTON = FANTASICA IMAGES\Event\RevelationTower\buttonentertower.png ; the button to enter a specific tower
	FIGHTTOWERBOSS_BUTTON = FANTASICA IMAGES\Event\RevelationTower\buttonfighttowerboss.png ;the button to fight a boss
	USENIGHTSTONE_BUTTON = FANTASICA IMAGES\Event\RevelationTower\buttonusenightstone.png ;the button to use a nightstone to open the crimston tower
	
	;crimson tower not open
	TOWEROFAGONY_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttowerofagony.png ;the text for tower of agony
	TOWEROFCHAINS_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttowerofchains.png ;the text for tower of chains
	TOWEROFLIGHT_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttoweroflight.png ;the text for tower of light
	CRIMSONTOWER_TEXT = FANTASICA IMAGES\Event\RevelationTower\textthecrimsontower.png ;the text for the crimson tower when it is not up
	DEMONTOWER_TEXT = FANTASICA IMAGES\Event\RevelationTower\textthedemontower.png ;the text for the demon tower when it not up
	
	;crimson tower open
	TOWEROFAGONY2_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttowerofagony2.png ;the text for tower of agony when the crimson tower is avaiable
	TOWEROFCHAINS2_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttowerofchains2.png ;the text for tower of chains when the crimson tower is avaiable
	TOWEROFLIGHT2_TEXT = FANTASICA IMAGES\Event\RevelationTower\texttoweroflight2.png ;the text for tower of light when the crimson tower is avaiable
	CRIMSONTOWER2_TEXT = FANTASICA IMAGES\Event\RevelationTower\textthecrimsontower2.png ;the text for the crimson tower when it is up
	DEMONTOWER2_TEXT = FANTASICA IMAGES\Event\RevelationTower\textthedemontower2.png ;the text for the demon tower when it is up
	CRIMSONTOWERTIMERDOWN_TEXT = FANTASICA IMAGES\Event\RevelationTower\textcrimsontowertimerdown.png ;the timer diplaying 0:00 to indicate the portal to the crimson tower is not available
	
	
		;Inside the tower
		;----------------
		TOWERADVANCE_BUTTON = FANTASICA IMAGES\Event\RevelationTower\Tower\buttontoweradvance.png ; advance in the tower
		TOWERBACK_BUTTON = FANTASICA IMAGES\Event\RevelationTower\Tower\buttontowerback.png ; back button inside the tower
		NIGHTSTONE_TEXT = FANTASICA IMAGES\Event\RevelationTower\Tower\textnightstone.png ; the timer's background color indicating the portal to the crimson tower is available
			;Encountered swarm
			;-----------------
			FIGHTSWARM_BUTTON = FANTASICA IMAGES\Event\RevelationTower\Tower\buttonfightswarm.png ;accept to fight a swarm
			FLEESWARM_BUTTON = FANTASICA IMAGES\Event\RevelationTower\Tower\buttonfleeswarm.png ;refuse to fight a swarm and continue advancing the tower

        ; Mysterious Manor
        ;------------------
        BATTLESTART_BUTTON = FANTASICA IMAGES\Event\Mysterious Manor\buttonbattlestart.png ; Enter manor
        BATTLESTARTTE_BUTTON = FANTASICA IMAGES\Event\Mysterious Manor\buttonbattlestarttimeelixir.png ; Enter manor
        MANOR_MENU = FANTASICA IMAGES\Event\Mysterious Manor\menumanor.png
        MANOR_BACK_BUTTON = FANTASICA IMAGES\Event\Mysterious Manor\buttonmanorback.png