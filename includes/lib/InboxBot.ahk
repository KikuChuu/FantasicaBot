class InboxBot {
  _ITEMS := ""
  _RECEIVE := ""
  EXIT_INBOX := ""
  FILTER_OPENED := ""
  OPEN_FILTER := ""
  TITLE := ""
  this.detector := ""
  this.controller := ""

  __new(theDetector, theController) {
    _ITEMS := "FANTASICA IMAGES/Inbox/items.png"
    _RECEIVE := "FANTASICA IMAGES/Inbox/receive.png"
    EXIT_INBOX := "FANTASICA IMAGES/Inbox/exit_inbox.png"
    FILTER_OPENED := "FANTASICA IMAGES/Inbox/filter_opened.png"
    OPEN_FILTER := "FANTASICA IMAGES/Inbox/open_filter.png"
    TITLE := "FANTASICA IMAGES/Inbox/title.png"
    this.detector := theDetector
    this.controller := theController
  }

  exitInbox() {
    if (this.detector.detect(this.EXIT_INBOX)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  isInbox() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isFilterOpened() {
    if (this.detector.detect(this.FILTER_OPENED)) {
      return true
    }
    else {
      return false
    }
  }

  isGift() {
    if (this.detector.detect(this._RECEIVE)) {
      return true
    }
    else {
      return false
    }
  }

  isItems() {
    if (this.detector.detect(this._ITEMS)) {
      return true
    }
    else {
      return false
    }
  }

  isOpenFilter() {
    if (this.detector.detect(this.OPEN_FILTER)) {
      return true
    }
    else {
      return false
    }
  }

  items() {
    if (this.isItems()) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      sleep 2000
    }
  }

  openFilter() {
    if (this.isOpenFilter()) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  receive() {
    if (this.isGift()) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play(theGiftType := "") {
    if (this.isInbox()) {
      while (this.isInbox()) {
        if (theGiftType == "ITEMS") {
          if (this.isOpenFilter()) {
            this.openFilter()
          }
          else if (this.isFilterOpened()) {
            if (this.isItems()) {
              this.items()
            }
          }
        }

        if (this.isGift()) {
          this.receive()
        }
        else {
          this.exitInbox() 
        }
      }
    }
  }
}
