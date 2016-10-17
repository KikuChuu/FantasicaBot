class AppPlayerBot {
  FANTASICA := "FANTASICA IMAGES/AppPlayer/fantasica-" . width . "_" . height . ".png"
  APP_DRAWER := "FANTASICA IMAGES/AppPlayer/app_drawer-" . width . "_" . height . ".png"
  ALL_APPS := "FANTASICA IMAGES/AppPlayer/all_apps-" . width . "_" . height . ".png"
  RECENTLY_PLAYED := "FANTASICA IMAGES/AppPlayer/recently_played-" . width . "_" . height . ".png"
  detector := new Detector

  isAppPlayerHomePage() {
    if (this.detector.detect(this.RECENTLY_PLAYED) || this.detector.detect(this.ALL_APPS)) {
      return true
    }
    else {
      return false
    }
  }

  isFantasicaRecentlyPlayed() {
    if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
      return true
    }
    else {
      return false
    }
  }

  openAppDrawer() {
    if (this.detector.detect(this.APP_DRAWER)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 2000
      return true
    }
    else {
      return false
    }
  }

  startGame() {
    if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 2000
      return true
    }
    else {
      return false
    }
  }
}
