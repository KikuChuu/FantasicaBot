class BingoBot {
  TITLE := ""
  SQUARE := ""
  RECEIVE := ""
  NOTICE := ""
  MY_PAGE := ""
  INBOX := ""
  detector := ""

  __new(theDetector) {
    this.TITLE := "FANTASICA IMAGES/BingoPage/title.png"
    this.SQUARE := "FANTASICA IMAGES/BingoPage/square.png"
    this.RECEIVE := "FANTASICA IMAGES/BingoPage/receive.png"
    this.NOTICE := "FANTASICA IMAGES/BingoPage/notice.png"
    this.MY_PAGE := "FANTASICA IMAGES/BingoPage/my_page.png"
    this.INBOX := "FANTASICA IMAGES/BingoPage/inbox.png"
    this.detector := theDetector
  }
 
  isBingo() {
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

  play() {
    if (this.isBingo()) {
      while (this.isBingo()) {
        this.selectSquare()
        this.receiveItem()
        this.selectMyPage()
      }
    }
  }
}
