class MainPageBot {
  QUEST_COOLDOWN := "FANTASICA IMAGES\MainPage\Status\quest_cooldown-" . width . "_" . height . ".png"
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
    global MENU_X1, MENU_X2, MENU_Y1, MENU_Y2

    MouseMove %MENU_X2%, %MENU_Y2%

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click %MENU_X2%, %MENU_Y2%, down }{ click %MENU_X1%, %MENU_Y1%, up }
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollRight()
  {
    global MENU_X1, MENU_X2, MENU_Y1, MENU_Y2

    MouseMove %MENU_X1%, %MENU_Y1%

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 30
    SendEvent { click %MENU_X1%, %MENU_Y1%, down }{ click %MENU_X2%, %MENU_Y2%, up }
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollFirst() {
    global MENU_X1, MENU_X2, MENU_Y1, MENU_Y2, width

    menuStartPointInPixels := 25
    menuLengthInPixels := width - 25

    MouseMove %menuStartPointInPixels%, %MENU_Y2%

    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 0
    loop, 5 {
      SendEvent { click %menuStartPointInPixels%, %MENU_Y2%, down }{ click %menuLengthInPixels%, %MENU_Y1%, up }
    }
    SetDefaultMouseSpeed tempMouseSpeed
  }

  scrollLast() {
    global MENU_X1, MENU_X2, MENU_Y1, MENU_Y2, width

    menuStartPointInPixels := 25
    menuLengthInPixels := width - 25

    MouseMove %menuLengthInPixels%, %MENU_Y1%
    
    tempMouseSpeed := A_DefaultMouseSpeed
    SetDefaultMouseSpeed 0
    loop, 5 {
      SendEvent { click %menuLengthInPixels%, %MENU_Y1%, down }{ click %menuStartPointInPixels%, %MENU_Y2%, up }
    }
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

  closeAnnouncement() 
  {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.ANNOUNCEMENT_HEADER, 0, 0, 50)) {
      fromX := BUFFER_X
      fromY := BUFFER_Y
      if (detectObject(this.CLOSE_ANNOUNCEMENT, fromX, fromY)) {
        clickAt(BUFFER_X, BUFFER_Y)
      }
    }
  }
}
