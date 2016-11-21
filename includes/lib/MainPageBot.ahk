class MainPageBot {
  TITLE := ""
  QUEST_COOLDOWN := ""
  ROLL_THE_DICE := ""
  FANTA_TACTICS := ""
  TOWER := ""
  QUEST := ""
  TRAINING := ""
  CARD_PACK := ""
  UPGRADE_UNITS := ""
  LEANA_EXCHANGE_SHOP := ""
  BAZAAR := ""
  INN := ""
  SANCTUM := ""
  SELL := ""
  UNITS := ""
  ALLIES := ""
  MONSTER_FAMILIAR := ""
  BATTLE := ""
  INBOX := ""
  SHOP := ""
  PROFILE := ""
  SKILL := ""
  TRADE := ""
  HISTORY := ""
  OPTIONS := ""
  HELP := ""
  ANNOUNCEMENT_HEADER := ""
  CLOSE_ANNOUNCEMENT := ""
  MORE_MENUS := ""
  generalConfiguration := ""
  detector := ""
  MENU_P1 := ""
  MENU_P2 := ""

  __new(theGeneralConfiguration, theMainPageConfiguration, theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/MainPage/title.png"
    this.QUEST_COOLDOWN := "FANTASICA IMAGES\MainPage\Status\quest_cooldown.png"
    this.ROLL_THE_DICE := "FANTASICA IMAGES/MainPage/Menu/roll_the_dice.png"
    this.FANTA_TACTICS := "FANTASICA IMAGES/MainPage/Menu/fanta_tactics.png"
    this.TOWER := "FANTASICA IMAGES/MainPage/Menu/tower.png"
    this.QUEST := "FANTASICA IMAGES\MainPage\Menu\quest.png"
    this.TRAINING := "FANTASICA IMAGES\MainPage\Menu\training.png"
    this.CARD_PACK := "FANTASICA IMAGES\MainPage\Menu\card_pack.png"
    this.UPGRADE_UNITS := "FANTASICA IMAGES\MainPage\Menu\upgrade_units.png"
    this.LEANA_EXCHANGE_SHOP := "FANTASICA IMAGES\MainPage\Menu\leana_exchange_shop.png"
    this.BAZAAR := "FANTASICA IMAGES\MainPage\Menu\bazaar.png"
    this.INN := "FANTASICA IMAGES\MainPage\Menu\inn.png"
    this.SANCTUM := "FANTASICA IMAGES\MainPage\Menu\sanctum.png"
    this.SELL := "FANTASICA IMAGES\MainPage\Menu\sell.png"
    this.UNITS := "FANTASICA IMAGES\MainPage\Menu\units.png"
    this.ALLIES := "FANTASICA IMAGES\MainPage\Menu\allies.png"
    this.MONSTER_FAMILIAR := "FANTASICA IMAGES\MainPage\Menu\monster_familiar.png"
    this.BATTLE := "FANTASICA IMAGES\MainPage\Menu\battle.png"
    this.INBOX := "FANTASICA IMAGES\MainPage\Menu\inbox.png"
    this.SHOP := "FANTASICA IMAGES\MainPage\Menu\shop.png"
    this.PROFILE := "FANTASICA IMAGES\MainPage\Menu\profile.png"
    this.SKILL := "FANTASICA IMAGES\MainPage\Menu\skill.png"
    this.TRADE := "FANTASICA IMAGES\MainPage\Menu\trade.png"
    this.HISTORY := "FANTASICA IMAGES\MainPage\Menu\history.png"
    this.OPTIONS := "FANTASICA IMAGES\MainPage\Menu\options.png"
    this.HELP := "FANTASICA IMAGES\MainPage\Menu\help.png"
    this.ANNOUNCEMENT_HEADER := "FANTASICA IMAGES/MainPage/Announcement/announcement_header.png"
    this.CLOSE_ANNOUNCEMENT := "FANTASICA IMAGES/MainPage/Announcement/close.png"
    this.MORE_MENUS := "FANTASICA IMAGES/MainPage/more_menus.png"

    this.generalConfiguration := theGeneralConfiguration
    this.mainPageConfiguration := theMainPageConfiguration
    this.detector := theDetector
    this.controller := theController

    if (this.generalConfiguration.getWidth() == 436 && this.generalConfiguration.getHeight() == 718) {
      this.MENU_P1 := new Point(30, 650)
      this.MENU_P2 := new Point(130, 650)
    }
    else {
      this.MENU_P1 := new Point(30, 1000)
      this.MENU_P2 := new Point(130, 1000)
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


  getMenuPath(theMenuName) {
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

  scrollMenuRight()
  {
    mouseSpeed := 30
    dragCount := 1
    this.controller.drag(this.MENU_P2, this.MENU_P1, mouseSpeed, dragCount)
    sleep 500
  }

  scrollMenuFirst() {
    mouseSpeed := 2
    dragCount := 10
    this.controller.drag(this.MENU_P1, this.MENU_P2, mouseSpeed, dragCount)
    sleep 500
  }

  isMoreMenu() {
    fromX := this.generalConfiguration.getX() // 2
    fromY := this.generalConfiguration.getY() // 2
    if (this.detector.detect(this.MORE_MENUS, fromX, fromY)) {
      return true
    }
    else {
      return false
    }
  }

  selectMenu()
  {
    menuPath := this.getMenuPath(this.mainPageConfiguration.getMenu())
    loop {
      if (this.isAnnouncement()) {
        return false
      }
      else if (this.detector.detect(menuPath, 0, 0, 150)) {
        this.controller.click(this.detector.getPoint())
        sleep 1000
        return true
      }
      else if (this.isMoreMenu()) {
        this.scrollMenuRight()
      }
      else {
        this.scrollMenuFirst()
        return false
      }
    }
  }

  isAnnouncement() {
    if (this.detector.detect(this.ANNOUNCEMENT_HEADER, 0, 0, 50)) {
      return true
    }
    else {
      return false
    }
  }

  isCloseAnnouncement() {
    if (this.detector.detect(this.CLOSE_ANNOUNCEMENT)) {
      return true
    }
    else {
      return false
    }
  }

  closeAnnouncement() 
  {
    if (this.isCloseAnnouncement()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isMainPage()) {
      if (this.mainPageConfiguration.getMenu() == "QUEST") {
        if (this.isQuestTimerReady()) {
          this.selectMenu()
        }
      }
      else {
        this.selectMenu()
      }
    }
    else if (this.isAnnouncement()) {
      this.closeAnnouncement()
    }
  }
}
