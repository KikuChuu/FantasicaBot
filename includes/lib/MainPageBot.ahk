class MainPageBot {
  TITLE := "FANTASICA IMAGES/MainPage/title-" . width . "_" . height . ".png"
  QUEST_COOLDOWN := "FANTASICA IMAGES\MainPage\Status\quest_cooldown-" . width . "_" . height . ".png"
  ROLL_THE_DICE := "FANTASICA IMAGES/MainPage/Menu/roll_the_dice-" . width . "_" . height . ".png"
  FANTA_TACTICS := "FANTASICA IMAGES/MainPage/Menu/fanta_tactics-" . width . "_" . height . ".png"
  TOWER := "FANTASICA IMAGES/MainPage/Menu/tower-" . width . "_" . height . ".png"
  QUEST := "FANTASICA IMAGES\MainPage\Menu\quest-" . width . "_" . height . ".png"
  TRAINING := "FANTASICA IMAGES\MainPage\Menu\training-" . width . "_" . height . ".png"
  CARD_PACK := "FANTASICA IMAGES\MainPage\Menu\card_pack-" . width . "_" . height . ".png"
  UPGRADE_UNITS := "FANTASICA IMAGES\MainPage\Menu\upgrade_units-" . width . "_" . height . ".png"
  LEANA_EXCHANGE_SHOP := "FANTASICA IMAGES\MainPage\Menu\leana_exchange_shop-" . width . "_" . height . ".png"
  BAZAAR := "FANTASICA IMAGES\MainPage\Menu\bazaar-" . width . "_" . height . ".png"
  INN := "FANTASICA IMAGES\MainPage\Menu\inn-" . width . "_" . height . ".png"
  SANCTUM := "FANTASICA IMAGES\MainPage\Menu\sanctum-" . width . "_" . height . ".png"
  SELL := "FANTASICA IMAGES\MainPage\Menu\sell-" . width . "_" . height . ".png"
  UNITS := "FANTASICA IMAGES\MainPage\Menu\units-" . width . "_" . height . ".png"
  ALLIES := "FANTASICA IMAGES\MainPage\Menu\allies-" . width . "_" . height . ".png"
  MONSTER_FAMILIAR := "FANTASICA IMAGES\MainPage\Menu\monster_familiar-" . width . "_" . height . ".png"
  BATTLE := "FANTASICA IMAGES\MainPage\Menu\battle-" . width . "_" . height . ".png"
  INBOX := "FANTASICA IMAGES\MainPage\Menu\inbox-" . width . "_" . height . ".png"
  SHOP := "FANTASICA IMAGES\MainPage\Menu\shop-" . width . "_" . height . ".png"
  PROFILE := "FANTASICA IMAGES\MainPage\Menu\profile-" . width . "_" . height . ".png"
  SKILL := "FANTASICA IMAGES\MainPage\Menu\skill-" . width . "_" . height . ".png"
  TRADE := "FANTASICA IMAGES\MainPage\Menu\trade-" . width . "_" . height . ".png"
  HISTORY := "FANTASICA IMAGES\MainPage\Menu\history-" . width . "_" . height . ".png"
  OPTIONS := "FANTASICA IMAGES\MainPage\Menu\options-" . width . "_" . height . ".png"
  HELP := "FANTASICA IMAGES\MainPage\Menu\help-" . width . "_" . height . ".png"
  ANNOUNCEMENT_HEADER := "FANTASICA IMAGES/MainPage/Announcement/announcement_header-" . width . "_" . height . ".png"
  CLOSE_ANNOUNCEMENT := "FANTASICA IMAGES/MainPage/Announcement/close-" . width . "_" . height . ".png" 

  __new(theMenuName) {
    global width, height
    this.detector := ""

    if (width == 436 && height == 718) {
      this.MENU_X1 := 30
      this.MENU_Y1 := 650
      this.MENU_X2 := 130
      this.MENU_Y2 := 650
    }
    else {
      this.MENU_X1 := 30
      this.MENU_Y1 := 1000
      this.MENU_X2 := 130
      this.MENU_Y2 := 1000
    }

    if (this.isValidMenu(theMenuName)) {
      this._menu := this.getMenu(theMenuName)
    }
    else {
      ExitApp
    }
  }

  isMainPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isQuestTimerReady() {
    if (this.detector.detect(this.QUEST_COOLDOWN)) {
      return true
    }
    else {
      return false
    }
  }

  isValidMenu(theMenuName) {
    if (theMenuName == "ROLL THE DICE") {
      return true
    }
    else if (theMenuName == "FANTA TACTICS") {
      return true
    }
    else if (theMenuName == "TOWER") {
      return true
    }
    else if (theMenuName == "QUEST") {
      return true
    }
    else if (theMenuName == "TRAINING") {
      return true
    }
    else if (theMenuName == "CARD PACK") {
      return true
    }
    else if (theMenuName == "UPGRADE UNITS") {
      return true
    }
    else if (theMenuName == "LEANA EXCHANGE SHOP") {
      return true
    }
    else if (theMenuName == "BAZAAR") {
      return true
    }
    else if (theMenuName == "INN") {
      return true
    }
    else if (theMenuName == "SANCTUM") {
      return true
    }
    else if (theMenuName == "SELL") {
      return true
    }
    else if (theMenuName == "UNITS") {
      return true
    }
    else if (theMenuName == "ALLIES") {
      return true
    }
    else if (theMenuName == "MONSTER FAMILIAR") {
      return true
    }
    else if (theMenuName == "BATTLE") {
      return true
    }
    else if (theMenuName == "INBOX") {
      return true
    }
    else if (theMenuName == "SHOP") {
      return true
    }
    else if (theMenuName == "PROFILE") {
      return true
    }
    else if (theMenuName == "SKILL") {
      return true
    }
    else if (theMenuName == "TRADE") {
      return true
    }
    else if (theMenuName == "HISTORY") {
      return true
    }
    else if (theMenuName == "OPTIONS") {
      return true
    }
    else if (theMenuName == "HELP") {
      return true
    }
    else {
      MsgBox % "Features for this menu is not yet implemented"
      ExitApp
    }
  }

  getMenu(theMenuName) {
    if (theMenuName == "ROLL THE DICE") {
      return this.ROLL_THE_DICE
    }
    else if (theMenuName == "FANTA TACTICS") {
      return this.FANTA_TACTICS
    }
    else if (theMenuName == "TOWER") {
      return this.TOWER
    }
    else if (theMenuName == "QUEST") {
      return this.QUEST
    }
    else if (theMenuName == "TRAINING") {
      return this.TRAINING
    }
    else if (theMenuName == "CARD PACK") {
      return this.CARD_PACK
    }
    else if (theMenuName == "UPGRADE UNITS") {
      return this.UPGRADE_UNITS
    }
    else if (theMenuName == "LEANA EXCHANGE SHOP") {
      return this.LEANA_EXCHANGE_SHOP
    }
    else if (theMenuName == "BAZAAR") {
      return this.BAZAAR
    }
    else if (theMenuName == "INN") {
      return this.INN
    }
    else if (theMenuName == "SANCTUM") {
      return this.SANCTUM
    }
    else if (theMenuName == "SELL") {
      return this.SELL
    }
    else if (theMenuName == "UNITS") {
      return this.UNITS
    }
    else if (theMenuName == "ALLIES") {
      return this.ALLIES
    }
    else if (theMenuName == "MONSTER FAMILIAR") {
      return this.MONSTER_FAMILIAR
    }
    else if (theMenuName == "BATTLE") {
      return this.BATTLE
    }
    else if (theMenuName == "INBOX") {
      return this.INBOX
    }
    else if (theMenuName == "SHOP") {
      return this.SHOP
    }
    else if (theMenuName == "PROFILE") {
      return this.PROFILE
    }
    else if (theMenuName == "SKILL") {
      return this.SKILL
    }
    else if (theMenuName == "TRADE") {
      return this.TRADE
    }
    else if (theMenuName == "HISTORY") {
      return this.HISTORY
    }
    else if (theMenuName == "OPTIONS") {
      return this.OPTIONS
    }
    else if (theMenuName == "HELP") {
      return this.HELP
    }
    else {
      MsgBox % "This menu isn't implemented"
      ExitApp
    }
  }

  scrollLeft()
  {
    menuX1 := this.MENU_X1
    menuY1 := this.MENU_Y1
    menuX2 := this.MENU_X2
    menuY2 := this.MENU_Y2

    MouseMove this.MENU_X1, this.MENU_Y1

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click %menuX1%, %menuY1%, down }{ click %menuX2%, %menuY2%, up }
    sleep 500
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollRight()
  {
    menuX1 := this.MENU_X1
    menuY1 := this.MENU_Y1
    menuX2 := this.MENU_X2
    menuY2 := this.MENU_Y2

    MouseMove this.MENU_X2, this.MENU_Y2

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click %menuX2%, %menuY2%, down }{ click %menuX1%, %menuY1%, up }
    sleep 500
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollFirst() {
    menuX1 := this.MENU_X1
    menuY1 := this.MENU_Y1
    menuX2 := this.MENU_X2
    menuY2 := this.MENU_Y2

    MouseMove this.MENU_X1, this.MENU_Y1

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 10 {
      SendEvent { click %menuX1%, %menuY1%, down }{ click %menuX2%, %menuY2%, up }
      sleep 50
    }
    sleep 500
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollLast() {
    menuX1 := this.MENU_X1
    menuY1 := this.MENU_Y1
    menuX2 := this.MENU_X2
    menuY2 := this.MENU_Y2

    MouseMove this.MENU_X2, this.MENU_Y2

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 2
    loop, 10 {
      SendEvent { click %menuX2%, %menuY2%, down }{ click %menuX1%, %menuY1%, up }
      sleep 50
    }
    sleep 500
    SetDefaultMouseSpeed tempMouseSpeed
  }

  ; selectMenu - It accepts a menu as input and selects it in the main page. This function must be invoked in the main page
  selectMenu(theMenu)
  {
    numOfMenu := 23 ; Allow this value to be set in configs
    i := 0
    while (i < numOfMenu) {
      if (this.isAnnouncement()) {
        return false
      }
      else if (this.detector.detect(theMenu, 0, 0, 150)) {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2]) ; click on the menu whose coords are stored in BUFFER vars
        sleep 1000
        return true
      }
      else {
        this.scrollRight()
        i := i + 1
      }
    }

    if (i >= numOfMenu) {
      this.scrollFirst()
    }
    return false
  }

  isAnnouncement() {
    if (this.detector.detect(this.ANNOUNCEMENT_HEADER, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }

  closeAnnouncement() 
  {
    if (this.detector.detect(this.CLOSE_ANNOUNCEMENT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isMainPage()) {
      if (this._menu == this.QUEST) {
        if (this.isQuestTimerReady()) {
          this.selectMenu(this._menu)
        }
      }
      else if (this._menu == this.ROLL_THE_DICE) {
        this.selectMenu(this._menu)
      }
      else if (this._menu == this.FANTA_TACTICS) {
        this.selectMenu(this._menu)
      }
      else if (this._menu == this.TRAINING) {
        this.selectMenu(this._menu)
      }
      else if (this._menu == this.TOWER) {
        this.selectMenu(this._menu)
      }
    }
    else if (this.isAnnouncement()) {
      this.closeAnnouncement()
    }
  }
}
