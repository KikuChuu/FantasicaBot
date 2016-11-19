class BingoBot {
  TITLE := ""
  SQUARE := ""
  RECEIVE := ""
  NOTICE := ""
  MY_PAGE := ""
  INBOX := ""
  detector := ""
  controller := ""

  __new(theDetector, theController) {
    this.TITLE := "FANTASICA IMAGES/BingoPage/title.png"
    this.SQUARE := "FANTASICA IMAGES/BingoPage/square.png"
    this.RECEIVE := "FANTASICA IMAGES/BingoPage/receive.png"
    this.NOTICE := "FANTASICA IMAGES/BingoPage/notice.png"
    this.MY_PAGE := "FANTASICA IMAGES/BingoPage/my_page.png"
    this.INBOX := "FANTASICA IMAGES/BingoPage/inbox.png"
    this.detector := theDetector
    this.controller := theController
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
      this.controller.click(this.detector.getPoint())
    }
  }

  receiveItem() {
    if (this.detector.detect(this.RECEIVE, 0, 0, 50)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  selectMyPage() {
    if (this.detector.detect(this.MY_PAGE, 0, 0, 50)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  selectInbox() {
    if (this.detector.detect(this.INBOX, 0, 0, 50)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  selectNotice() {
    if (this.detector.detect(this.NOTICE, 0, 0, 50)) {
      this.controller.click(this.detector.getPoint())
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
