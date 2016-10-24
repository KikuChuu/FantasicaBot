class InboxBot {
  _ITEMS := "FANTASICA IMAGES/Inbox/items-" . width . "_" . height . ".png"
  _RECEIVE := "FANTASICA IMAGES/Inbox/receive-" . width . "_" . height . ".png"
  EXIT_INBOX := "FANTASICA IMAGES/Inbox/exit_inbox-" . width . "_" . height . ".png"
  FILTER_OPENED := "FANTASICA IMAGES/Inbox/filter_opened-" . width . "_" . height . ".png"
  OPEN_FILTER := "FANTASICA IMAGES/Inbox/open_filter-" . width . "_" . height . ".png"
  TITLE := "FANTASICA IMAGES/Inbox/title-" . width . "_" . height . ".png"

  __new() {
    this.detector := new Detector
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

  play(theGiftType) {
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
