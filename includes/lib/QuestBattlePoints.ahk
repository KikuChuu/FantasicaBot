class QuestBattlePoints {
  savedKey := ""
  savedIndex := 0

  keys := [ "a15", "b15", "c15", "d15", "e15", "f15", "g15", "h15", "i15", "j15", "k15", "l15", "m15", "n15", "o15"
    , "a14", "b14", "c14", "d14", "e14", "f14", "g14", "h14", "i14", "j14", "k14", "l14", "m14", "n14", "o14"
    , "a13", "b13", "c13", "d13", "e13", "f13", "g13", "h13", "i13", "j13", "k13", "l13", "m13", "n13", "o13"
    , "a12", "b12", "c12", "d12", "e12", "f12", "g12", "h12", "i12", "j12", "k12", "l12", "m12", "n12", "o12"
    , "a11", "b11", "c11", "d11", "e11", "f11", "g11", "h11", "i11", "j11", "k11", "l11", "m11", "n11", "o11"
    , "a10", "b10", "c10", "d10", "e10", "f10", "g10", "h10", "i10", "j10", "k10", "l10", "m10", "n10", "o10"
    , "a9", "b9", "c9", "d9", "e9", "f9", "g9", "h9", "i9", "j9", "k9", "l9", "m9", "n9", "o9"
    , "a8", "b8", "c8", "d8", "e8", "f8", "g8", "h8", "i8", "j8", "k8", "l8", "m8", "n8", "o8"
    , "a7", "b7", "c7", "d7", "e7", "f7", "g7", "h7", "i7", "j7", "k7", "l7", "m7", "n7", "o7"
    , "a6", "b6", "c6", "d6", "e6", "f6", "g6", "h6", "i6", "j6", "k6", "l6", "m6", "n6", "o6"
    , "a5", "b5", "c5", "d5", "e5", "f5", "g5", "h5", "i5", "j5", "k5", "l5", "m5", "n5", "o5"
    , "a4", "b4", "c4", "d4", "e4", "f4", "g4", "h4", "i4", "j4", "k4", "l4", "m4", "n4", "o4"
    , "a3", "b3", "c3", "d3", "e3", "f3", "g3", "h3", "i3", "j3", "k3", "l3", "m3", "n3", "o3"
    , "a2", "b2", "c2", "d2", "e2", "f2", "g2", "h2", "i2", "j2", "k2", "l2", "m2", "n2", "o2"
    , "a1", "b1", "c1", "d1", "e1", "f1", "g1", "h1", "i1", "j1", "k1", "l1", "m1", "n1", "o1"]

  __New() {
    this.points["a15"] := [55, 55]
    this.points["b15"] := [75, 55]
    this.points["c15"] := [100,55]
    this.points["d15"] := [120, 55]
    this.points["e15"] := [150, 55]
    this.points["f15"] := [170, 55]
    this.points["g15"] := [200, 55]
    this.points["h15"] := [220, 55]
    this.points["i15"] := [250, 55]
    this.points["j15"] := [270, 55]
    this.points["k15"] := [300, 55]
    this.points["l15"] := [320, 55]
    this.points["m15"] := [350, 55]
    this.points["n15"] := [380, 55]
    this.points["o15"] := [400, 55]
    this.points["a14"] := [55, 85]
    this.points["b14"] := [85, 85]
    this.points["c14"] := [100, 85]
    this.points["d14"] := [120, 85]
    this.points["e14"] := [150, 85]
    this.points["f14"] := [170, 85]
    this.points["g14"] := [200, 85]
    this.points["h14"] := [220, 85]
    this.points["i14"] := [250, 85]
    this.points["j14"] := [270, 85]
    this.points["k14"] := [300, 85]
    this.points["l14"] := [320, 85]
    this.points["m14"] := [350, 85]
    this.points["n14"] := [380, 85]
    this.points["o14"] := [400, 85]
    this.points["a13"] := [55, 105]
    this.points["b13"] := [75, 105]
    this.points["c13"] := [100, 105]
    this.points["d13"] := [120, 105]
    this.points["e13"] := [150, 105]
    this.points["f13"] := [170, 105]
    this.points["g13"] := [200, 105]
    this.points["h13"] := [220, 105]
    this.points["i13"] := [250, 105]
    this.points["j13"] := [270, 105]
    this.points["k13"] := [300, 105]
    this.points["l13"] := [320, 105]
    this.points["m13"] := [350, 105]
    this.points["n13"] := [380, 105]
    this.points["o13"] := [400, 105]
    this.points["a12"] := [55, 130]
    this.points["b12"] := [75, 130]
    this.points["c12"] := [100, 130]
    this.points["d12"] := [120, 130]
    this.points["e12"] := [150, 130]
    this.points["f12"] := [170, 130]
    this.points["g12"] := [200, 130]
    this.points["h12"] := [220, 130]
    this.points["i12"] := [250, 130]
    this.points["j12"] := [270, 130]
    this.points["k12"] := [300, 130]
    this.points["l12"] := [320, 130]
    this.points["m12"] := [350, 130]
    this.points["n12"] := [380, 130]
    this.points["o12"] := [400, 130]
    this.points["a11"] := [55, 160]
    this.points["b11"] := [75, 160]
    this.points["c11"] := [100, 160]
    this.points["d11"] := [120, 160]
    this.points["e11"] := [150, 160]
    this.points["f11"] := [170, 160]
    this.points["g11"] := [200, 160]
    this.points["h11"] := [220, 160]
    this.points["i11"] := [250, 160]
    this.points["j11"] := [270, 160]
    this.points["k11"] := [300, 160]
    this.points["l11"] := [320, 160]
    this.points["m11"] := [350, 160]
    this.points["n11"] := [380, 160]
    this.points["o11"] := [400, 160]
    this.points["a10"] := [55, 180]
    this.points["b10"] := [75, 180]
    this.points["c10"] := [100, 180]
    this.points["d10"] := [120, 180]
    this.points["e10"] := [150, 180]
    this.points["f10"] := [170, 180]
    this.points["g10"] := [200, 180]
    this.points["h10"] := [220, 180]
    this.points["i10"] := [250, 180]
    this.points["j10"] := [270, 180]
    this.points["k10"] := [300, 180]
    this.points["l10"] := [320, 180]
    this.points["m10"] := [350, 180]
    this.points["n10"] := [380, 180]
    this.points["o10"] := [400, 180]
    this.points["a9"] := [55, 210]
    this.points["b9"] := [75, 210]
    this.points["c9"] := [100, 210]
    this.points["d9"] := [120, 210]
    this.points["e9"] := [150, 210]
    this.points["f9"] := [170, 210]
    this.points["g9"] := [200, 210]
    this.points["h9"] := [220, 210]
    this.points["i9"] := [250, 210]
    this.points["j9"] := [270, 210]
    this.points["k9"] := [300, 210]
    this.points["l9"] := [320, 210]
    this.points["m9"] := [350, 210]
    this.points["n9"] := [380, 210]
    this.points["o9"] := [400, 210]
    this.points["a8"] := [55, 230]
    this.points["b8"] := [75, 230]
    this.points["c8"] := [100, 230]
    this.points["d8"] := [120, 230]
    this.points["e8"] := [150, 230]
    this.points["f8"] := [170, 230]
    this.points["g8"] := [200, 230]
    this.points["h8"] := [220, 230]
    this.points["i8"] := [250, 230]
    this.points["j8"] := [270, 230]
    this.points["k8"] := [300, 230]
    this.points["l8"] := [320, 230]
    this.points["m8"] := [350, 230]
    this.points["n8"] := [380, 230]
    this.points["o8"] := [400, 230]
    this.points["a7"] := [55, 260]
    this.points["b7"] := [75, 260]
    this.points["c7"] := [100, 260]
    this.points["d7"] := [120, 260]
    this.points["e7"] := [150, 260]
    this.points["f7"] := [170, 260]
    this.points["g7"] := [200, 260]
    this.points["h7"] := [220, 260]
    this.points["i7"] := [250, 260]
    this.points["j7"] := [270, 260]
    this.points["k7"] := [300, 260]
    this.points["l7"] := [320, 260]
    this.points["m7"] := [350, 260]
    this.points["n7"] := [380, 260]
    this.points["o7"] := [400, 260]
    this.points["a6"] := [55, 280]
    this.points["b6"] := [75, 280]
    this.points["c6"] := [100, 280]
    this.points["d6"] := [120, 280]
    this.points["e6"] := [150, 280]
    this.points["f6"] := [170, 280]
    this.points["g6"] := [200, 280]
    this.points["h6"] := [220, 280]
    this.points["i6"] := [250, 280]
    this.points["j6"] := [270, 280]
    this.points["k6"] := [300, 280]
    this.points["l6"] := [320, 280]
    this.points["m6"] := [350, 280]
    this.points["n6"] := [380, 280]
    this.points["o6"] := [400, 280]
    this.points["a5"] := [55, 300]
    this.points["b5"] := [75, 300]
    this.points["c5"] := [100, 300]
    this.points["d5"] := [120, 300]
    this.points["e5"] := [150, 300]
    this.points["f5"] := [170, 300]
    this.points["g5"] := [200, 300]
    this.points["h5"] := [220, 300]
    this.points["i5"] := [250, 300]
    this.points["j5"] := [270, 300]
    this.points["k5"] := [300, 300]
    this.points["l5"] := [320, 300]
    this.points["m5"] := [350, 300]
    this.points["n5"] := [380, 300]
    this.points["o5"] := [400, 300]
    this.points["a4"] := [55, 330]
    this.points["b4"] := [75, 330]
    this.points["c4"] := [100, 330]
    this.points["d4"] := [120, 330]
    this.points["e4"] := [150, 330]
    this.points["f4"] := [170, 330]
    this.points["g4"] := [200, 330]
    this.points["h4"] := [220, 330]
    this.points["i4"] := [250, 330]
    this.points["j4"] := [270, 330]
    this.points["k4"] := [300, 330]
    this.points["l4"] := [320, 330]
    this.points["m4"] := [350, 330]
    this.points["n4"] := [380, 330]
    this.points["o4"] := [400, 330]
    this.points["a3"] := [55, 350]
    this.points["b3"] := [75, 350]
    this.points["c3"] := [100, 350]
    this.points["d3"] := [120, 350]
    this.points["e3"] := [150, 350]
    this.points["f3"] := [170, 350]
    this.points["g3"] := [200, 350]
    this.points["h3"] := [220, 350]
    this.points["i3"] := [250, 350]
    this.points["j3"] := [270, 350]
    this.points["k3"] := [300, 350]
    this.points["l3"] := [320, 350]
    this.points["m3"] := [350, 350]
    this.points["n3"] := [380, 350]
    this.points["o3"] := [400, 350]
    this.points["a2"] := [55, 380]
    this.points["b2"] := [75, 380]
    this.points["c2"] := [100, 380]
    this.points["d2"] := [120, 380]
    this.points["e2"] := [150, 380]
    this.points["f2"] := [170, 380]
    this.points["g2"] := [200, 380]
    this.points["h2"] := [220, 380]
    this.points["i2"] := [250, 380]
    this.points["j2"] := [270, 380]
    this.points["k2"] := [300, 380]
    this.points["l2"] := [320, 380]
    this.points["m2"] := [350, 380]
    this.points["n2"] := [380, 380]
    this.points["o2"] := [400, 380]
    this.points["a1"] := [55, 415]
    this.points["b1"] := [75, 415]
    this.points["c1"] := [100, 415]
    this.points["d1"] := [120, 415]
    this.points["e1"] := [150, 415]
    this.points["f1"] := [170, 415]
    this.points["g1"] := [200, 415]
    this.points["h1"] := [220, 415]
    this.points["i1"] := [250, 415]
    this.points["j1"] := [270, 415]
    this.points["k1"] := [300, 415]
    this.points["l1"] := [320, 415]
    this.points["m1"] := [350, 415]
    this.points["n1"] := [380, 415]
    this.points["o1"] := [400, 415]
  }

  getPoint(thePoint) {
    return this.points[thePoint] 
  }

  getKey(theIndex) {
    return this.keys[theIndex]
  }

  setSavedIndex(theIndex) {
    this.savedIndex := theIndex
  }

  getSavedIndex() {
    return this.savedIndex
  }

  setSavedKey(theKey) {
    this.savedKey := theKey
  }

  getSavedKey() {
    return this.savedKey
  }

  getKeySetSize() {
    return this.keys.length()
  }

  isIndexValid(theIndex) {
    if (theIndex >= 1 && theIndex <= this.getKeySetSize()) {
      return true
    }
    else {
      return false
    }
  }

  isKeyValid(theSearchKey) {
    loop % this.getKeySetSize() {
      if (theSearchKey == this.getKey(A_Index)) {
        return true
      }
    }

    return false
  }
}
