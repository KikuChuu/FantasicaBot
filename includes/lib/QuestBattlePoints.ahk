#include %A_ScriptDir%/includes/lib/GlobalConstants.ahk

class QuestBattlePoints {
  __New() {
    global width, height
   
    this.index := 0
    this.key := ""

    this.keys := [ "a15", "b15", "c15", "d15", "e15", "f15", "g15", "h15", "i15", "j15", "k15", "l15", "m15", "n15", "o15"
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

    if (width == 436 && height == 718) {
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
    else if (width == 677 && height == 1102) {
      this.points["a15"] := [85, 85]
      this.points["b15"] := [115, 85]
      this.points["c15"] := [145,85]
      this.points["d15"] := [185, 85]
      this.points["e15"] := [225, 85]
      this.points["f15"] := [265, 85]
      this.points["g15"] := [305, 85]
      this.points["h15"] := [345, 85]
      this.points["i15"] := [385, 85]
      this.points["j15"] := [425, 85]
      this.points["k15"] := [465, 85]
      this.points["l15"] := [505, 85]
      this.points["m15"] := [545, 85]
      this.points["n15"] := [585, 85]
      this.points["o15"] := [625, 85]
      this.points["a14"] := [85, 125]
      this.points["b14"] := [115, 125]
      this.points["c14"] := [145, 125]
      this.points["d14"] := [185, 125]
      this.points["e14"] := [225, 125]
      this.points["f14"] := [265, 125]
      this.points["g14"] := [305, 125]
      this.points["h14"] := [345, 125]
      this.points["i14"] := [385, 125]
      this.points["j14"] := [425, 125]
      this.points["k14"] := [465, 125]
      this.points["l14"] := [505, 125]
      this.points["m14"] := [545, 125]
      this.points["n14"] := [585, 125]
      this.points["o14"] := [625, 125]
      this.points["a13"] := [85, 165]
      this.points["b13"] := [115, 165]
      this.points["c13"] := [145, 165]
      this.points["d13"] := [185, 165]
      this.points["e13"] := [225, 165]
      this.points["f13"] := [265, 165]
      this.points["g13"] := [305, 165]
      this.points["h13"] := [345, 165]
      this.points["i13"] := [385, 165]
      this.points["j13"] := [425, 165]
      this.points["k13"] := [465, 165]
      this.points["l13"] := [505, 165]
      this.points["m13"] := [545, 165]
      this.points["n13"] := [585, 165]
      this.points["o13"] := [625, 165]
      this.points["a12"] := [85, 195]
      this.points["b12"] := [115, 195]
      this.points["c12"] := [145, 195]
      this.points["d12"] := [185, 195]
      this.points["e12"] := [225, 195]
      this.points["f12"] := [265, 195]
      this.points["g12"] := [305, 195]
      this.points["h12"] := [345, 195]
      this.points["i12"] := [385, 195]
      this.points["j12"] := [425, 195]
      this.points["k12"] := [465, 195]
      this.points["l12"] := [505, 195]
      this.points["m12"] := [545, 195]
      this.points["n12"] := [585, 195]
      this.points["o12"] := [625, 195]
      this.points["a11"] := [85, 225]
      this.points["b11"] := [115, 225]
      this.points["c11"] := [145, 225]
      this.points["d11"] := [185, 225]
      this.points["e11"] := [225, 225]
      this.points["f11"] := [265, 225]
      this.points["g11"] := [305, 225]
      this.points["h11"] := [345, 225]
      this.points["i11"] := [385, 225]
      this.points["j11"] := [425, 225]
      this.points["k11"] := [465, 225]
      this.points["l11"] := [505, 225]
      this.points["m11"] := [545, 225]
      this.points["n11"] := [585, 225]
      this.points["o11"] := [625, 225]
      this.points["a10"] := [85, 265]
      this.points["b10"] := [115, 265]
      this.points["c10"] := [145, 265]
      this.points["d10"] := [185, 265]
      this.points["e10"] := [225, 265]
      this.points["f10"] := [265, 265]
      this.points["g10"] := [305, 265]
      this.points["h10"] := [345, 265]
      this.points["i10"] := [385, 265]
      this.points["j10"] := [425, 265]
      this.points["k10"] := [465, 265]
      this.points["l10"] := [505, 265]
      this.points["m10"] := [545, 265]
      this.points["n10"] := [585, 265]
      this.points["o10"] := [625, 265]
      this.points["a9"] := [85, 305]
      this.points["b9"] := [115, 305]
      this.points["c9"] := [145, 305]
      this.points["d9"] := [185, 305]
      this.points["e9"] := [225, 305]
      this.points["f9"] := [265, 305]
      this.points["g9"] := [305, 305]
      this.points["h9"] := [345, 305]
      this.points["i9"] := [385, 305]
      this.points["j9"] := [425, 305]
      this.points["k9"] := [465, 305]
      this.points["l9"] := [505, 305]
      this.points["m9"] := [545, 305]
      this.points["n9"] := [585, 305]
      this.points["o9"] := [625, 305]
      this.points["a8"] := [85, 345]
      this.points["b8"] := [115, 345]
      this.points["c8"] := [145, 345]
      this.points["d8"] := [185, 345]
      this.points["e8"] := [225, 345]
      this.points["f8"] := [265, 345]
      this.points["g8"] := [305, 345]
      this.points["h8"] := [345, 345]
      this.points["i8"] := [385, 345]
      this.points["j8"] := [425, 345]
      this.points["k8"] := [465, 345]
      this.points["l8"] := [505, 345]
      this.points["m8"] := [545, 345]
      this.points["n8"] := [585, 345]
      this.points["o8"] := [625, 345]
      this.points["a7"] := [85, 385]
      this.points["b7"] := [115, 385]
      this.points["c7"] := [145, 385]
      this.points["d7"] := [185, 385]
      this.points["e7"] := [225, 385]
      this.points["f7"] := [265, 385]
      this.points["g7"] := [305, 385]
      this.points["h7"] := [345, 385]
      this.points["i7"] := [385, 385]
      this.points["j7"] := [425, 385]
      this.points["k7"] := [465, 385]
      this.points["l7"] := [505, 385]
      this.points["m7"] := [545, 385]
      this.points["n7"] := [585, 385]
      this.points["o7"] := [625, 385]
      this.points["a6"] := [85, 425]
      this.points["b6"] := [115, 425]
      this.points["c6"] := [145, 425]
      this.points["d6"] := [185, 425]
      this.points["e6"] := [225, 425]
      this.points["f6"] := [265, 425]
      this.points["g6"] := [305, 425]
      this.points["h6"] := [345, 425]
      this.points["i6"] := [385, 425]
      this.points["j6"] := [425, 425]
      this.points["k6"] := [465, 425]
      this.points["l6"] := [505, 425]
      this.points["m6"] := [545, 425]
      this.points["n6"] := [585, 425]
      this.points["o6"] := [625, 425]
      this.points["a5"] := [85, 465]
      this.points["b5"] := [115, 465]
      this.points["c5"] := [145, 465]
      this.points["d5"] := [185, 465]
      this.points["e5"] := [225, 465]
      this.points["f5"] := [265, 465]
      this.points["g5"] := [305, 465]
      this.points["h5"] := [345, 465]
      this.points["i5"] := [385, 465]
      this.points["j5"] := [425, 465]
      this.points["k5"] := [465, 465]
      this.points["l5"] := [505, 465]
      this.points["m5"] := [545, 465]
      this.points["n5"] := [585, 465]
      this.points["o5"] := [625, 465]
      this.points["a4"] := [85, 505]
      this.points["b4"] := [115, 505]
      this.points["c4"] := [145, 505]
      this.points["d4"] := [185, 505]
      this.points["e4"] := [225, 505]
      this.points["f4"] := [265, 505]
      this.points["g4"] := [305, 505]
      this.points["h4"] := [345, 505]
      this.points["i4"] := [385, 505]
      this.points["j4"] := [425, 505]
      this.points["k4"] := [465, 505]
      this.points["l4"] := [505, 505]
      this.points["m4"] := [545, 505]
      this.points["n4"] := [585, 505]
      this.points["o4"] := [625, 505]
      this.points["a3"] := [85, 545]
      this.points["b3"] := [115, 545]
      this.points["c3"] := [145, 545]
      this.points["d3"] := [185, 545]
      this.points["e3"] := [225, 545]
      this.points["f3"] := [265, 545]
      this.points["g3"] := [305, 545]
      this.points["h3"] := [345, 545]
      this.points["i3"] := [385, 545]
      this.points["j3"] := [425, 545]
      this.points["k3"] := [465, 545]
      this.points["l3"] := [505, 545]
      this.points["m3"] := [545, 545]
      this.points["n3"] := [585, 545]
      this.points["o3"] := [625, 545]
      this.points["a2"] := [85, 585]
      this.points["b2"] := [115, 585]
      this.points["c2"] := [145, 585]
      this.points["d2"] := [185, 585]
      this.points["e2"] := [225, 585]
      this.points["f2"] := [265, 585]
      this.points["g2"] := [305, 585]
      this.points["h2"] := [345, 585]
      this.points["i2"] := [385, 585]
      this.points["j2"] := [425, 585]
      this.points["k2"] := [465, 585]
      this.points["l2"] := [505, 585]
      this.points["m2"] := [545, 585]
      this.points["n2"] := [585, 585]
      this.points["o2"] := [625, 585]
      this.points["a1"] := [85, 625]
      this.points["b1"] := [115, 625]
      this.points["c1"] := [145, 625]
      this.points["d1"] := [185, 625]
      this.points["e1"] := [225, 625]
      this.points["f1"] := [265, 625]
      this.points["g1"] := [305, 625]
      this.points["h1"] := [345, 625]
      this.points["i1"] := [385, 625]
      this.points["j1"] := [425, 625]
      this.points["k1"] := [465, 625]
      this.points["l1"] := [505, 625]
      this.points["m1"] := [545, 625]
      this.points["n1"] := [585, 625]
      this.points["o1"] := [625, 625]
    }
    else {
      MsgBox, 16, % "The window size of your Fantasica App Player is not supported"
      ExitApp
    }
  }

  nextKey(ByRef key) {
    if (this.index <  this.getKeySetSize()) {
      this.index++
    }
    else {
      this.reset()
      this.index++
    }
    this.key := this.keys[this.index] 
    key := this.key
  }

  getPoint() {
    return this.points[this.key] 
  }

  getKeySetSize() {
    return this.keys.length()
  }

; =================================================================================================
; ----------------------------------- PRIVATE MEMBER FUNCTIONS ------------------------------------
; =================================================================================================
  reset() {
    this.index := 0
  }
}
