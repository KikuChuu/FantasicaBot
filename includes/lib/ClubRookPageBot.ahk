class ClubRookPageBot {
  TITLE := "FANTASICA IMAGES/ClubRookPage/title-" . width . "_" . height . ".png"
  EXIT_PAGE := "FANTASICA IMAGES/ClubRookPage/back-" . width . "_" . height . ".png"

  isClubRookPage() {
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  exitPage() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.EXIT_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
