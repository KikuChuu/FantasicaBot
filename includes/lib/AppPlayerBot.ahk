class AppPlayerBot {
  FANTASICA := ""
  APP_DRAWER := ""
  ALL_APPS_TITLE := ""
  RECENTLY_PLAYED_TITLE := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.FANTASICA := "FANTASICA IMAGES/AppPlayer/fantasica.png"
    this.APP_DRAWER := "FANTASICA IMAGES/AppPlayer/app_drawer.png"
    this.ALL_APPS_TITLE := "FANTASICA IMAGES/AppPlayer/all_apps.png"
    this.RECENTLY_PLAYED_TITLE := "FANTASICA IMAGES/AppPlayer/recently_played.png"
    this.detector := theDetector
    this.controller := theController
  }

  isHomeScreen() {
    if (this.detector.detect(this.RECENTLY_PLAYED_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isInstalledAppsScreen() {
    if (this.detector.detect(this.ALL_APPS_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isFantasicaRecentlyPlayed() {
    if (this.isHomeScreen()) {
      if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  isFantasicaInstalled() {
    if (this.isInstalledAppsScreen()) {
      if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  installedApps() {
    if (this.detector.detect(this.APP_DRAWER)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  startFantasica() {
    if (this.isFantasicaRecentlyPlayed()) {
      this.controller.click(this.detector.getPoint())
    }
    else if (this.isFantasicaInstalled()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  play() {
    if (this.isHomeScreen()) {
      if (this.isFantasicaRecentlyPlayed()) {
        this.startFantasica()
      }
      else {
        this.installedApps()
      }
    }
    else if (this.isInstalledAppsScreen()) {
      if (this.isFantasicaInstalled()) {
        this.startFantasica()
      }
      else {
        MsgBox % "Fantasica is not yet installed. Verify that it's properly installed and start it once."
        ExitApp ; Exit program on failure
      }
    }
  }
}
