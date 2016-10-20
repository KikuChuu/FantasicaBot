class FantaTacticsBot {
  TITLE := "FANTASICA IMAGES/FantaTactics/cp_timer-" . width . "_" . height . ".png"
  CP := "FANTASICA IMAGES/FantaTactics/cp-" . width . "_" . height . ".png"
  CP_DOT := "FANTASICA IMAGES/FantaTactics/cp_dot-" . width . "_" . height . ".png"
  TEAM_FORMATION := "FANTASICA IMAGES/FantaTactics/team_formation-" . width . "_" . height . ".png"
  BATTLE_DEFAULT := "FANTASICA IMAGES/FantaTactics/battle-" . width . "_" . height . ".png"
  BATTLE_SINGLE_CP := "FANTASICA IMAGES/FantaTactics/battle_single_cp-" . width . "_" . height . ".png"
  BATTLE_TRIPLE_CP := "FANTASICA IMAGES/FantaTactics/battle_triple_cp-" . width . "_" . height . ".png"
  BATTLE_ALL_CP := "FANTASICA IMAGES/FantaTactics/battle_all_cp-" . width . "_" . height . ".png"
  _BOSS := "FANTASICA IMAGES/FantaTactics/boss-" . width . "_" . height . ".png"
  _SETTINGS := "FANTASICA IMAGES/FantaTactics/settings-" . width . "_" . height . ".png"
  CP_USAGE := "FANTASICA IMAGES/FantaTactics/cp_usage_setting-" . width . "_" . height . ".png"
  SINGLE_CP := "FANTASICA IMAGES/FantaTactics/single_cp-" . width . "_" . height . ".png"
  TRIPLE_CP := "FANTASICA IMAGES/FantaTactics/triple_cp-" . width . "_" . height . ".png"
  ALL_CP := "FANTASICA IMAGES/FantaTactics/all_cp-" . width . "_" . height . ".png"
  FAST_FORWARD_ON := "FANTASICA IMAGES/FantaTactics/ff_on-" . width . "_" . height . ".png"
  FAST_FORWARD_OFF := "FANTASICA IMAGES/FantaTactics/ff_off-" . width . "_" . height . ".png"
  AUTO_MODE_ON := "FANTASICA IMAGES/FantaTactics/am_on-" . width . "_" . height . ".png"
  AUTO_MODE_OFF := "FANTASICA IMAGES/FantaTactics/am_off-" . width . "_" . height . ".png"
  EXIT_SETTINGS := "FANTASICA IMAGES/FantaTactics/close-" . width . "_" . height . ".png"
  SQUAD_FORMATION := "FANTASICA IMAGES/FantaTactics/squad_formation-" . width . "_" . height . ".png"
  EXCHANGE_SHACKLES := "FANTASICA IMAGES/FantaTactics/exchange-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT := "FANTASICA IMAGES/FantaTactics/cp_restoration_prompt-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT_TIME_ELIXIR := "" ; Not yet supported
  CP_RESTORATION_PROMPT_TIME_ELIXIR_ZERO_STOCK := "" ; Not yet supported
  CP_RESTORATION_PROMPT_SIN_TONIC := "FANTASICA IMAGES/FantaTactics/cp_restoration_sin_tonic-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT_SIN_TONIC_ZERO_STOCK := "FANTASICA IMAGES/FantaTactics/cp_restoration_sin_tonic_zero_stock-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT_CONFIRM_TIME_ELIXIR := "FANTASICA IMAGES/FantaTactics/cp_restoration_prompt_confirm_time_elixir-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT_CONFIRM_SIN_TONIC := "FANTASICA IMAGES/FantaTactics/cp_restoration_prompt_confirm_sin_tonic-" . width . "_" . height . ".png"
  CP_RESTORATION_PROMPT_CLOSE := "FANTASICA IMAGES/FantaTactics/cp_restoration_prompt_close-" . width . "_" . height . ".png"
  SIN_TONIC_PROMPT := "FANTASICA IMAGES/FantaTactics/sin_tonic_prompt-" . width . "_" . height . ".png"
  SIN_TONIC_PROMPT_CONFIRM := "FANTASICA IMAGES/FantaTactics/sin_tonic_prompt_confirm-" . width . "_" . height . ".png"
  SIN_TONIC_PROMPT_CANCEL := "FANTASICA IMAGES/FantaTactics/sin_tonic_prompt_cancel-" . width . "_" . height . ".png"
  _NEXT := "FANTASICA IMAGES/FantaTactics/next-" . width . "_" . height . ".png"
  _TOP := "FANTASICA IMAGES/FantaTactics/top-" . width . "_" . height . ".png"
  VICTORY := "FANTASICA IMAGES/FantaTactics/victory-" . width . "_" . height . ".png"
  EXP_REWARD := "FANTASICA IMAGES/FantaTactics/experience_reward-" . width . "_" . height . ".png"

  __new() {
    this.detector := new Detector
  }

  isFantaTactics() {
    if (this.detector.detect(this.CP)) {
      return true
    }
    else {
      return false
    }
  }

  isCpDot() {
    if (this.detector.detect(this.CP_DOT)) {
      return true
    }
    else {
      return false
    }
  }

  isTeamFormation() {
    if (this.detector.detect(this.TEAM_FORMATION)) {
      return true
    }
    else {
      return false
    }
  }

  formTeam() {
    if (this.isTeamFormation()) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  settings() {
    if (this.detector.detect(this._SETTINGS)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  boss() {
    if (this.detector.detect(this._BOSS)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  battle() {
    if (this.detector.detect(this.BATTLE_DEFAULT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  battleSingleCp() {
    if (this.detector.detect(this.BATTLE_SINGLE_CP)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  battleTripleCp() {
    if (this.detector.detect(this.BATTLE_TRIPLE_CP)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  battleAllCp() {
    if (this.detector.detect(this.BATTLE_ALL_CP)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  isCpRestorationPrompt() {
    if (this.detector.detect(this.CP_RESTORATION_PROMPT, 0, 0)) {
      return true
    }
    else {
      return false
    }
  }

  isTimeElixirOutOfStock() {
    ; Not implemented
  }

  isSinTonicZeroStock() {
    if (this.detector.detect(this.CP_RESTORATION_PROMPT_SIN_TONIC_ZERO_STOCK)) {
      return true
    }
    else {
      return false
    }
  }

  restoreCpTimeElixir() {
    ; Not implemented
  }

  restoreCpSinTonic() {
    if (this.detector.detect(this.CP_RESTORATION_PROMPT)) {
      fromX := this.detector.foundPoint[1]
      fromY := this.detector.foundPoint[2] 
      if (this.detector.detect(this.CP_RESTORATION_PROMPT_CONFIRM_SIN_TONIC)) {
        clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
      }
    }
  }

  closeCpRestorationPrompt() {
    if (this.detector.detect(this.CP_RESTORATION_PROMPT_CLOSE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  isTimeElixirPrompt() {
    ; Not implemented
  }

  isSinTonicPrompt() {
    if (this.detector.detect(this.SIN_TONIC_PROMPT)) {
      return true
    }
    else {
      return false
    }
  }

  confirmSinTonic() {
    if (this.detector.detect(this.SIN_TONIC_PROMPT_CONFIRM)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2]) 
    } 
  }

  cancelSinTonic() {
    if (this.detector.detect(this.SIN_TONIC_PROMPT_CANCEL)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2]) 
    }
  }

  isVictory() {
    if (this.detector.detect(this.VICTORY)) {
      return true
    }
    else {
      return false
    }
  }

  isExperience() {
    if (this.detector.detect(this.EXP_REWARD)) {
      return true
    }
    else {
      return false
    }
  }

  next() {
    if (this.detector.detect(this._NEXT)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  top() {
    if (this.detector.detect(this._TOP)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isFantaTactics()) {
      while (this.isFantaTactics()) {
        if (this.isSinTonicPrompt()) {
          if (this.isCpDot()) {
            this.cancelSinTonic()
          }
          else {
            this.confirmSinTonic()
          }
        }
        else if (this.isCpRestorationPrompt()) {
          if (this.isSinTonicZeroStock()) {
            this.closeCpRestorationPrompt()
          }
          else if (this.isCpDot()) {
            this.closeCpRestorationPrompt()
          }
          else {
            this.restoreCpSinTonic()
          }
        }

        this.formTeam()
        this.boss()
        this.battle()
        this.battleSingleCp()
        this.battleTripleCp()
        this.battleAllCp()
      }
    }
    else if (this.isVictory()) {
      this.next()
    }
    else if (this.isExperience()) {
      this.top()
    }
  }
}
