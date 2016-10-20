class InboxBot {
  TITLE := "FANTASICA IMAGES/Inbox/title-" . width . "_" . height . ".png"
  _RECEIVE := "FANTASICA IMAGES/Inbox/receive-" . width . "_" . height . ".png"
  EXIT_INBOX := "FANTASICA IMAGES/Inbox/exit_inbox-" . width . "_" . height . ".png"

  __new() {
    this.detector := new Detector
  }

  isInbox() {
    if (this.detector.detect(this.TITLE)) {
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

  receive() {
    if (this.isGift()) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  exitInbox() {
    if (this.detector.detect(this.EXIT_INBOX)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isInbox()) {
      while (this.isInbox()) {
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
