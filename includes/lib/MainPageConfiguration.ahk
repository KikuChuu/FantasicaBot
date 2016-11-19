class MainPageConfiguration {
  menu := ""

  __new(theMenu) {
    if (this.isValidMenu(theMenu)) {
      this.menu := theMenu
    }
    else {
      MsgBox % "Input a valid menu name in the User inputs."
      ExitApp
    }
  }

  setMenu(theMenu) {
    this.menu := theMenu
  }

  getMenu() {
    return this.menu
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
      return false
    }
  }
}
