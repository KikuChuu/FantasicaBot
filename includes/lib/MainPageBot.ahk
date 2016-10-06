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
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isQuestCooldownDone() {
    if (detectObject(this.QUEST_COOLDOWN, 0, 0)) {
      return true
    }
    else {
      return false
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
    global BUFFER_X, BUFFER_Y

    numOfMenu := 23 ; Allow this value to be set in configs
    i := 0
    while (i < numOfMenu) {
      if (detectObject(theMenu, 0, 0, 150)) {
        clickAt(BUFFER_X, BUFFER_Y) ; click on the menu whose coords are stored in BUFFER vars
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
    return ""
  }

  isAnnouncement() {
    if (detectObject(this.ANNOUNCEMENT_HEADER, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }

  closeAnnouncement() 
  {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.CLOSE_ANNOUNCEMENT, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
