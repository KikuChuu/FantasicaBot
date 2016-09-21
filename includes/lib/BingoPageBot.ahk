class BingoPageBot {
  TITLE := "FANTASICA IMAGES/BingoPage/title-" . width . "_" . height . ".png"
  SQUARE := "FANTASICA IMAGES/BingoPage/square-" . width . "_" . height . ".png"
  RECEIVE := "FANTASICA IMAGES/BingoPage/receive-" . width . "_" . height . ".png"
  NOTICE := "FANTASICA IMAGES/BingoPage/notice-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/BingoPage/my_page-" . width . "_" . height . ".png"
  INBOX := "FANTASICA IMAGES/BingoPage/inbox-" . width . "_" . height . ".png"
  
  isBingoPage() {
    if (detectObject(this.TITLE, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  selectSquare() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.SQUARE, 0, 0, 50)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  receiveItem() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.RECEIVE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  selectMyPage() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.MY_PAGE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  doBingo() {
    while (this.isBingoPage()) {
      this.selectSquare()
      this.receiveItem()
      this.selectMyPage()
    }
  }

  selectInbox() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.INBOX, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }

  selectNotice() {
    global BUFFER_X, BUFFER_Y
    if (detectObject(this.NOTICE, 0, 0)) {
      clickAt(BUFFER_X, BUFFER_Y)
    }
  }
}
