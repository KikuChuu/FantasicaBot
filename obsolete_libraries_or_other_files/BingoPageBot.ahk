class BingoPageBot {
  TITLE := "FANTASICA IMAGES/BingoPage/title-" . width . "_" . height . ".png"
  SQUARE := "FANTASICA IMAGES/BingoPage/square-" . width . "_" . height . ".png"
  RECEIVE := "FANTASICA IMAGES/BingoPage/receive-" . width . "_" . height . ".png"
  NOTICE := "FANTASICA IMAGES/BingoPage/notice-" . width . "_" . height . ".png"
  MY_PAGE := "FANTASICA IMAGES/BingoPage/my_page-" . width . "_" . height . ".png"
  INBOX := "FANTASICA IMAGES/BingoPage/inbox-" . width . "_" . height . ".png"
  detector := new Detector
 
  isBingoPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  selectSquare() {
    if (this.detector.detect(this.SQUARE, 0, 0, 75)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  receiveItem() {
    if (this.detector.detect(this.RECEIVE, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  selectMyPage() {
    if (this.detector.detect(this.MY_PAGE, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isBingoPage()) {
      this.selectSquare()
      this.receiveItem()
      this.selectMyPage()
    }
  }

  selectInbox() {
    if (this.detector.detect(this.INBOX, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  selectNotice() {
    if (this.detector.detect(this.NOTICE, 0, 0, 50)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }
}
