class AppPlayerBot {
  FANTASICA := "FANTASICA IMAGES/AppPlayer/fantasica-" . width . "_" . height . ".png"
  APP_DRAWER := "FANTASICA IMAGES/AppPlayer/app_drawer-" . width . "_" . height . ".png"
  ALL_APPS := "FANTASICA IMAGES/AppPlayer/all_apps-" . width . "_" . height . ".png"
  RECENTLY_PLAYED := "FANTASICA IMAGES/AppPlayer/recently_played-" . width . "_" . height . ".png"

  isAppPlayerHomePage() {
    if (detectObject(this.RECENTLY_PLAYED, 0, 0) || detectObject(this.ALL_APPS, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isFantasicaRecentlyPlayed() {
    if (detectObject(this.FANTASICA, 0, 0, 150)) {
      return true
    }
    else {
      return false
    }
  }

  openAppDrawer() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.APP_DRAWER, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 2000
      return true
    }
    else {
      return false
    }
  }

  startGame() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.FANTASICA, 0, 0, 150)) {
      clickAt(BUFFER_X, BUFFER_Y)
      sleep 2000
      return true
    }
    else {
      return false
    }
  }
}
