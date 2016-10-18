class MainPageBot {
  TITLE := "FANTASICA IMAGES/MainPage/title-" . width . "_" . height . ".png"
  QUEST_COOLDOWN := "FANTASICA IMAGES\MainPage\Status\quest_cooldown-" . width . "_" . height . ".png"
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
  detector := new Detector

  __New() {
    global width, height
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

  isValidMenu(theMenu) {
    if (theMenu == this.TOWER) {
      return true
    }
    else if (theMenu == this.QUEST) {
      return true
    }
    else if (theMenu == this.TRAINING) {
      return true
    }
    else if (theMenu == this.CARD_PACK) {
      return true
    }
    else if (theMenu == this.UPGRADE_UNITS) {
      return true
    }
    else if (theMenu == this.LEANA_EXCHANGE_SHOP) {
      return true
    }
    else if (theMenu == this.BAZAAR) {
      return true
    }
    else if (theMenu == this.INN) {
      return true
    }
    else if (theMenu == this.SANCTUM) {
      return true
    }
    else if (theMenu == this.SELL) {
      return true
    }
    else if (theMenu == this.UNITS) {
      return true
    }
    else if (theMenu == this.ALLIES) {
      return true
    }
    else if (theMenu == this.MONSTER_FAMILIAR) {
      return true
    }
    else if (theMenu == this.BATTLE) {
      return true
    }
    else if (theMenu == this.INBOX) {
      return true
    }
    else if (theMenu == this.SHOP) {
      return true
    }
    else if (theMenu == this.PROFILE) {
      return true
    }
    else if (theMenu == this.SKILL) {
      return true
    }
    else if (theMenu == this.TRADE) {
      return true
    }
    else if (theMenu == this.HISTORY) {
      return true
    }
    else if (theMenu == this.OPTIONS) {
      return true
    }
    else if (theMenu == this.HELP) {
      return true
    }
    else {
      MsgBox % "Features for this menu is not yet implemented"
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
        return "" ; end the function
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

  play(theMenu) {
    if (this.isMainPage()) {
      if (this.isValidMenu(theMenu)) {
        if (theMenu == this.QUEST) {
          if (this.isQuestTimerReady()) {
            this.selectMenu(theMenu)
          }
        }
      }
    }
    else if (this.isAnnouncement()) {
      this.closeAnnouncement()
    }
  }
}
