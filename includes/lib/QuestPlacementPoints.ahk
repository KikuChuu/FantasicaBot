class QuestPlacementPoints {
  ; These two matrices are just ideas. Only the first matrix represents an implemented search strategy
  ; Scan in a linear fashion, left-right, top-down
  ; [A1 ][B1 ][C1 ][D1 ][E1 ][F1 ][G1 ][H1 ][I1 ][J1 ][K1 ][L1 ][M1 ][N1 ][O1 ]
  ; [A2 ][B2 ][C2 ][D2 ][E2 ][F2 ][G2 ][H2 ][I2 ][J2 ][K2 ][L2 ][M2 ][N2 ][O2 ]
  ; [A3 ][B3 ][C3 ][D3 ][E3 ][F3 ][G3 ][H3 ][I3 ][J3 ][K3 ][L3 ][M3 ][N3 ][O3 ]
  ; [A4 ][B4 ][C4 ][D4 ][E4 ][F4 ][G4 ][H4 ][I4 ][J4 ][K4 ][L4 ][M4 ][N4 ][O4 ]
  ; [A5 ][B5 ][C5 ][D5 ][E5 ][F5 ][G5 ][H5 ][I5 ][J5 ][K5 ][L5 ][M5 ][N5 ][O5 ]
  ; [A6 ][B6 ][C6 ][D6 ][E6 ][F6 ][G6 ][H6 ][I6 ][J6 ][K6 ][L6 ][M6 ][N6 ][O6 ]
  ; [A7 ][B7 ][C7 ][D7 ][E7 ][F7 ][G7 ][H7 ][I7 ][J7 ][K7 ][L7 ][M7 ][N7 ][O7 ]
  ; [A8 ][B8 ][C8 ][D8 ][E8 ][F8 ][G8 ][H8 ][I8 ][J8 ][K8 ][L8 ][M8 ][N8 ][O8 ]
  ; [A9 ][B9 ][C9 ][D9 ][E9 ][F9 ][G9 ][H9 ][I9 ][J9 ][K9 ][L9 ][M9 ][N9 ][O9 ]
  ; [A10][B10][C10][D10][E10][F10][G10][H10][I10][J10][K10][L10][M10][N10][O10]
  ; [A11][B11][C11][D11][E11][F11][G11][H11][I11][J11][K11][L11][M11][N11][O11]
  ; [A12][B12][C12][D12][E12][F12][G12][H12][I12][J12][K12][L12][M12][N12][O12]
  ; [A13][B13][C13][D13][E13][F13][G13][H13][I13][J13][K13][L13][M13][N13][O13]
  ; [A14][B14][C14][D14][E14][F14][G14][H14][I14][J14][K14][L14][M14][N14][O14]
  ; [A15][B15][C15][D15][E15][F15][G15][H15][I15][J15][K15][L15][M15][N15][O15]

  ; Scan the perimeter first and work inward
  ; [A1 ][B1 ][C1 ][D1 ][E1 ][F1 ][G1 ][H1 ][I1 ][J1 ][K1 ][L1 ][M1 ][N1 ][O1]
  ; [K4 ][L4 ][M4 ][N4 ][O4 ][A5 ][B5 ][C5 ][D5 ][E5 ][F5 ][G5 ][H5 ][I5 ][A2]
  ; [J4 ][N7 ][O7 ][A8 ][B8 ][C8 ][D8 ][E8 ][F8 ][G8 ][H8 ][I8 ][J8 ][J5 ][B2]
  ; [I4 ][M7 ][I10][J10][K10][L10][M10][N10][O10][A11][B11][C11][K8 ][K5 ][C2]
  ; [H4 ][L7 ][H10][K12][L12][M12][N12][O12][A13][B13][C13][D11][L8 ][L5 ][D2]
  ; [G4 ][K7 ][G10][J12][E14][F14][G14][H14][I14][J14][D13][E11][M8 ][M5 ][E2]
  ; [F4 ][J7 ][F10][I12][D14][F15][G15][H15][I15][K14][E13][F11][N8 ][N5 ][F2]
  ; [E4 ][I7 ][E10][H12][C14][E15][N15][O15][J15][L14][F13][G11][O8 ][O5 ][G2]
  ; [D4 ][H7 ][D10][G12][B14][D15][M15][L15][K15][M14][G13][H11][A9 ][A6 ][H2]
  ; [C4 ][G7 ][C10][F12][A14][C15][B15][A15][O14][N14][H13][I11][B9 ][B6 ][I2]
  ; [B4 ][F7 ][B10][E12][O13][N13][M13][L13][K13][J13][I13][J11][C9 ][C6 ][J2]
  ; [A4 ][E7 ][A10][D12][C12][B12][A12][O11][N11][M11][L11][K11][D9 ][D6 ][K2]
  ; [O3 ][D7 ][O9 ][N9 ][M9 ][L9 ][K9 ][J9 ][I9 ][H9 ][G9 ][F9 ][E9 ][E6 ][L2]
  ; [N3 ][C7 ][B7 ][A7 ][O6 ][N6 ][M6 ][L6 ][K6 ][J6 ][I6 ][H6 ][G6 ][F6 ][M2]
  ; [M3 ][L3 ][K3 ][J3 ][I3 ][H3 ][G3 ][F3 ][E3 ][D3 ][C3 ][B3 ][A3 ][O2 ][N2]
  generalConfiguration := ""
  points := []
  index := 0
  point := ""

  __new(theGeneralConfiguration) {
    A1 := 1
    B1 := 2
    C1 := 3
    D1 := 4
    E1 := 5
    F1 := 6
    G1 := 7
    H1 := 8
    I1 := 9
    J1 := 10
    K1 := 11
    L1 := 12
    M1 := 13
    N1 := 14
    O1 := 15
    A2 := 16
    B2 := 17
    C2 := 18
    D2 := 19
    E2 := 20
    F2 := 21
    G2 := 22
    H2 := 23
    I2 := 24
    J2 := 25
    K2 := 26
    L2 := 27
    M2 := 28
    N2 := 29
    O2 := 30
    A3 := 31
    B3 := 32
    C3 := 33
    D3 := 34
    E3 := 35
    F3 := 36
    G3 := 37
    H3 := 38
    I3 := 39
    J3 := 40
    K3 := 41
    L3 := 42
    M3 := 43
    N3 := 44
    O3 := 45
    A4 := 46
    B4 := 47
    C4 := 48
    D4 := 49
    E4 := 50
    F4 := 51
    G4 := 52
    H4 := 53
    I4 := 54
    J4 := 55
    K4 := 56
    L4 := 57
    M4 := 58
    N4 := 59
    O4 := 60
    A5 := 61
    B5 := 62
    C5 := 63
    D5 := 64
    E5 := 65
    F5 := 66
    G5 := 67
    H5 := 68
    I5 := 69
    J5 := 70
    K5 := 71
    L5 := 72
    M5 := 73
    N5 := 74
    O5 := 75
    A6 := 76
    B6 := 77
    C6 := 78
    D6 := 79
    E6 := 80
    F6 := 81
    G6 := 82
    H6 := 83
    I6 := 84
    J6 := 85
    K6 := 86
    L6 := 87
    M6 := 88
    N6 := 89
    O6 := 90
    A7 := 91
    B7 := 92
    C7 := 93
    D7 := 94
    E7 := 95
    F7 := 96
    G7 := 97
    H7 := 98
    I7 := 99
    J7 := 100
    K7 := 101
    L7 := 102
    M7 := 103
    N7 := 104
    O7 := 105
    A8 := 106
    B8 := 107
    C8 := 108
    D8 := 109
    E8 := 110
    F8 := 111
    G8 := 112
    H8 := 113
    I8 := 114
    J8 := 115
    K8 := 116
    L8 := 117
    M8 := 118
    N8 := 119
    O8 := 120
    A9 := 121
    B9 := 122
    C9 := 123
    D9 := 124
    E9 := 125
    F9 := 126
    G9 := 127
    H9 := 128
    I9 := 129
    J9 := 130
    K9 := 131
    L9 := 132
    M9 := 133
    N9 := 134
    O9 := 135
    A10 := 136
    B10 := 137
    C10 := 138
    D10 := 139
    E10 := 140
    F10 := 141
    G10 := 142
    H10 := 143
    I10 := 144
    J10 := 145
    K10 := 146
    L10 := 147
    M10 := 148
    N10 := 149
    O10 := 150
    A11 := 151
    B11 := 152
    C11 := 153
    D11 := 154
    E11 := 155
    F11 := 156
    G11 := 157
    H11 := 158
    I11 := 159
    J11 := 160
    K11 := 161
    L11 := 162
    M11 := 163
    N11 := 164
    O11 := 165
    A12 := 166
    B12 := 167
    C12 := 168
    D12 := 169
    E12 := 170
    F12 := 171
    G12 := 172
    H12 := 173
    I12 := 174
    J12 := 175
    K12 := 176
    L12 := 177
    M12 := 178
    N12 := 179
    O12 := 180
    A13 := 181
    B13 := 182
    C13 := 183
    D13 := 184
    E13 := 185
    F13 := 186
    G13 := 187
    H13 := 188
    I13 := 189
    J13 := 190
    K13 := 191
    L13 := 192
    M13 := 193
    N13 := 194
    O13 := 195
    A14 := 196
    B14 := 197
    C14 := 198
    D14 := 199
    E14 := 200
    F14 := 201
    G14 := 202
    H14 := 203
    I14 := 204
    J14 := 205
    K14 := 206
    L14 := 207
    M14 := 208
    N14 := 209
    O14 := 210
    A15 := 211
    B15 := 212
    C15 := 213
    D15 := 214
    E15 := 215
    F15 := 216
    G15 := 217
    H15 := 218
    I15 := 219
    J15 := 220
    K15 := 221
    L15 := 222
    M15 := 223
    N15 := 224
    O15 := 225

    this.generalConfiguration := theGeneralConfiguration

    if (this.generalConfiguration.getWidth() == 436 && this.generalConfiguration.getHeight() == 718) {
      this.points[A1] := new Point(55, 55)
      this.points[B1] := new Point(75, 55)
      this.points[C1] := new Point(100, 55)
      this.points[D1] := new Point(120, 55)
      this.points[E1] := new Point(150, 55)
      this.points[F1] := new Point(170, 55)
      this.points[G1] := new Point(200, 55)
      this.points[H1] := new Point(220, 55)
      this.points[I1] := new Point(250, 55)
      this.points[J1] := new Point(270, 55)
      this.points[K1] := new Point(300, 55)
      this.points[L1] := new Point(320, 55)
      this.points[M1] := new Point(350, 55)
      this.points[N1] := new Point(380, 55)
      this.points[O1] := new Point(400, 55)

      this.points[A2] := new Point(55, 85)
      this.points[B2] := new Point(85, 85)
      this.points[C2] := new Point(100, 85)
      this.points[D2] := new Point(120, 85)
      this.points[E2] := new Point(150, 85)
      this.points[F2] := new Point(170, 85)
      this.points[G2] := new Point(200, 85)
      this.points[H2] := new Point(220, 85)
      this.points[I2] := new Point(250, 85)
      this.points[J2] := new Point(270, 85)
      this.points[K2] := new Point(300, 85)
      this.points[L2] := new Point(320, 85)
      this.points[M2] := new Point(350, 85)
      this.points[N2] := new Point(380, 85)
      this.points[O2] := new Point(400, 85)

      this.points[A3] := new Point(55, 105)
      this.points[B3] := new Point(75, 105)
      this.points[C3] := new Point(100, 105)
      this.points[D3] := new Point(120, 105)
      this.points[E3] := new Point(150, 105)
      this.points[F3] := new Point(170, 105)
      this.points[G3] := new Point(200, 105)
      this.points[H3] := new Point(220, 105)
      this.points[I3] := new Point(250, 105)
      this.points[J3] := new Point(270, 105)
      this.points[K3] := new Point(300, 105)
      this.points[L3] := new Point(320, 105)
      this.points[M3] := new Point(350, 105)
      this.points[N3] := new Point(380, 105)
      this.points[O3] := new Point(400, 105)

      this.points[A4] := new Point(55, 130)
      this.points[B4] := new Point(75, 130)
      this.points[C4] := new Point(100, 130)
      this.points[D4] := new Point(120, 130)
      this.points[E4] := new Point(150, 130)
      this.points[F4] := new Point(170, 130)
      this.points[G4] := new Point(200, 130)
      this.points[H4] := new Point(220, 130)
      this.points[I4] := new Point(250, 130)
      this.points[J4] := new Point(270, 130)
      this.points[K4] := new Point(300, 130)
      this.points[L4] := new Point(320, 130)
      this.points[M4] := new Point(350, 130)
      this.points[N4] := new Point(380, 130)
      this.points[O4] := new Point(400, 130)

      this.points[A5] := new Point(55, 160)
      this.points[B5] := new Point(75, 160)
      this.points[C5] := new Point(100, 160)
      this.points[D5] := new Point(120, 160)
      this.points[E5] := new Point(150, 160)
      this.points[F5] := new Point(170, 160)
      this.points[G5] := new Point(200, 160)
      this.points[H5] := new Point(220, 160)
      this.points[I5] := new Point(250, 160)
      this.points[J5] := new Point(270, 160)
      this.points[K5] := new Point(300, 160)
      this.points[L5] := new Point(320, 160)
      this.points[M5] := new Point(350, 160)
      this.points[N5] := new Point(380, 160)
      this.points[O5] := new Point(400, 160)

      this.points[A6] := new Point(55, 180)
      this.points[B6] := new Point(75, 180)
      this.points[C6] := new Point(100, 180)
      this.points[D6] := new Point(120, 180)
      this.points[E6] := new Point(150, 180)
      this.points[F6] := new Point(170, 180)
      this.points[G6] := new Point(200, 180)
      this.points[H6] := new Point(220, 180)
      this.points[I6] := new Point(250, 180)
      this.points[J6] := new Point(270, 180)
      this.points[K6] := new Point(300, 180)
      this.points[L6] := new Point(320, 180)
      this.points[M6] := new Point(350, 180)
      this.points[N6] := new Point(380, 180)
      this.points[O6] := new Point(400, 180)

      this.points[A7] := new Point(55, 210)
      this.points[B7] := new Point(75, 210)
      this.points[C7] := new Point(100, 210)
      this.points[D7] := new Point(120, 210)
      this.points[E7] := new Point(150, 210)
      this.points[F7] := new Point(170, 210)
      this.points[G7] := new Point(200, 210)
      this.points[H7] := new Point(220, 210)
      this.points[I7] := new Point(250, 210)
      this.points[J7] := new Point(270, 210)
      this.points[K7] := new Point(300, 210)
      this.points[L7] := new Point(320, 210)
      this.points[M7] := new Point(350, 210)
      this.points[N7] := new Point(380, 210)
      this.points[O7] := new Point(400, 210)

      this.points[A8] := new Point(55, 230)
      this.points[B8] := new Point(75, 230)
      this.points[C8] := new Point(100, 230)
      this.points[D8] := new Point(120, 230)
      this.points[E8] := new Point(150, 230)
      this.points[F8] := new Point(170, 230)
      this.points[G8] := new Point(200, 230)
      this.points[H8] := new Point(220, 230)
      this.points[I8] := new Point(250, 230)
      this.points[J8] := new Point(270, 230)
      this.points[K8] := new Point(300, 230)
      this.points[L8] := new Point(320, 230)
      this.points[M8] := new Point(350, 230)
      this.points[N8] := new Point(380, 230)
      this.points[O8] := new Point(400, 230)

      this.points[A9] := new Point(55, 260)
      this.points[B9] := new Point(75, 260)
      this.points[C9] := new Point(100, 260)
      this.points[D9] := new Point(120, 260)
      this.points[E9] := new Point(150, 260)
      this.points[F9] := new Point(170, 260)
      this.points[G9] := new Point(200, 260)
      this.points[H9] := new Point(220, 260)
      this.points[I9] := new Point(250, 260)
      this.points[J9] := new Point(270, 260)
      this.points[K9] := new Point(300, 260)
      this.points[L9] := new Point(320, 260)
      this.points[M9] := new Point(350, 260)
      this.points[N9] := new Point(380, 260)
      this.points[O9] := new Point(400, 260)

      this.points[A10] := new Point(55, 280)
      this.points[B10] := new Point(75, 280)
      this.points[C10] := new Point(100, 280)
      this.points[D10] := new Point(120, 280)
      this.points[E10] := new Point(150, 280)
      this.points[F10] := new Point(170, 280)
      this.points[G10] := new Point(200, 280)
      this.points[H10] := new Point(220, 280)
      this.points[I10] := new Point(250, 280)
      this.points[J10] := new Point(270, 280)
      this.points[K10] := new Point(300, 280)
      this.points[L10] := new Point(320, 280)
      this.points[M10] := new Point(350, 280)
      this.points[N10] := new Point(380, 280)
      this.points[O10] := new Point(400, 280)

      this.points[A11] := new Point(55, 300)
      this.points[B11] := new Point(75, 300)
      this.points[C11] := new Point(100, 300)
      this.points[D11] := new Point(120, 300)
      this.points[E11] := new Point(150, 300)
      this.points[F11] := new Point(170, 300)
      this.points[G11] := new Point(200, 300)
      this.points[H11] := new Point(220, 300)
      this.points[I11] := new Point(250, 300)
      this.points[J11] := new Point(270, 300)
      this.points[K11] := new Point(300, 300)
      this.points[L11] := new Point(320, 300)
      this.points[M11] := new Point(350, 300)
      this.points[N11] := new Point(380, 300)
      this.points[O11] := new Point(400, 300)

      this.points[A12] := new Point(55, 330)
      this.points[B12] := new Point(75, 330)
      this.points[C12] := new Point(100, 330)
      this.points[D12] := new Point(120, 330)
      this.points[E12] := new Point(150, 330)
      this.points[F12] := new Point(170, 330)
      this.points[G12] := new Point(200, 330)
      this.points[H12] := new Point(220, 330)
      this.points[I12] := new Point(250, 330)
      this.points[J12] := new Point(270, 330)
      this.points[K12] := new Point(300, 330)
      this.points[L12] := new Point(320, 330)
      this.points[M12] := new Point(350, 330)
      this.points[N12] := new Point(380, 330)
      this.points[O12] := new Point(400, 330)

      this.points[A13] := new Point(55, 350)
      this.points[B13] := new Point(75, 350)
      this.points[C13] := new Point(100, 350)
      this.points[D13] := new Point(120, 350)
      this.points[E13] := new Point(150, 350)
      this.points[F13] := new Point(170, 350)
      this.points[G13] := new Point(200, 350)
      this.points[H13] := new Point(220, 350)
      this.points[I13] := new Point(250, 350)
      this.points[J13] := new Point(270, 350)
      this.points[K13] := new Point(300, 350)
      this.points[L13] := new Point(320, 350)
      this.points[M13] := new Point(350, 350)
      this.points[N13] := new Point(380, 350)
      this.points[O13] := new Point(400, 350)

      this.points[A14] := new Point(55, 380)
      this.points[B14] := new Point(75, 380)
      this.points[C14] := new Point(100, 380)
      this.points[D14] := new Point(120, 380)
      this.points[E14] := new Point(150, 380)
      this.points[F14] := new Point(170, 380)
      this.points[G14] := new Point(200, 380)
      this.points[H14] := new Point(220, 380)
      this.points[I14] := new Point(250, 380)
      this.points[J14] := new Point(270, 380)
      this.points[K14] := new Point(300, 380)
      this.points[L14] := new Point(320, 380)
      this.points[M14] := new Point(350, 380)
      this.points[N14] := new Point(380, 380)
      this.points[O14] := new Point(400, 380)

      this.points[A15] := new Point(55, 415)
      this.points[B15] := new Point(75, 415)
      this.points[C15] := new Point(100, 415)
      this.points[D15] := new Point(120, 415)
      this.points[E15] := new Point(150, 415)
      this.points[F15] := new Point(170, 415)
      this.points[G15] := new Point(200, 415)
      this.points[H15] := new Point(220, 415)
      this.points[I15] := new Point(250, 415)
      this.points[J15] := new Point(270, 415)
      this.points[K15] := new Point(300, 415)
      this.points[L15] := new Point(320, 415)
      this.points[M15] := new Point(350, 415)
      this.points[N15] := new Point(380, 415)
      this.points[O15] := new Point(400, 415)
    }
    else if (this.generalConfiguration.getWidth() == 677 && this.generalConfiguration.getHeight() == 1102) {
      this.points[A1] := new Point(85, 85)
      this.points[B1] := new Point(115, 85)
      this.points[C1] := new Point(145, 85)
      this.points[D1] := new Point(185, 85)
      this.points[E1] := new Point(225, 85)
      this.points[F1] := new Point(265, 85)
      this.points[G1] := new Point(305, 85)
      this.points[H1] := new Point(345, 85)
      this.points[I1] := new Point(385, 85)
      this.points[J1] := new Point(425, 85)
      this.points[K1] := new Point(465, 85)
      this.points[L1] := new Point(505, 85)
      this.points[M1] := new Point(545, 85)
      this.points[N1] := new Point(585, 85)
      this.points[O1] := new Point(625, 85)

      this.points[A2] := new Point(85, 125)
      this.points[B2] := new Point(115, 125)
      this.points[C2] := new Point(145, 125)
      this.points[D2] := new Point(185, 125)
      this.points[E2] := new Point(225, 125)
      this.points[F2] := new Point(265, 125)
      this.points[G2] := new Point(305, 125)
      this.points[H2] := new Point(345, 125)
      this.points[I2] := new Point(385, 125)
      this.points[J2] := new Point(425, 125)
      this.points[K2] := new Point(465, 125)
      this.points[L2] := new Point(505, 125)
      this.points[M2] := new Point(545, 125)
      this.points[N2] := new Point(585, 125)
      this.points[O2] := new Point(625, 125)

      this.points[A3] := new Point(85, 165)
      this.points[B3] := new Point(115, 165)
      this.points[C3] := new Point(145, 165)
      this.points[D3] := new Point(185, 165)
      this.points[E3] := new Point(225, 165)
      this.points[F3] := new Point(265, 165)
      this.points[G3] := new Point(305, 165)
      this.points[H3] := new Point(345, 165)
      this.points[I3] := new Point(385, 165)
      this.points[J3] := new Point(425, 165)
      this.points[K3] := new Point(465, 165)
      this.points[L3] := new Point(505, 165)
      this.points[M3] := new Point(545, 165)
      this.points[N3] := new Point(585, 165)
      this.points[O3] := new Point(625, 165)

      this.points[A4] := new Point(85, 195)
      this.points[B4] := new Point(115, 195)
      this.points[C4] := new Point(145, 195)
      this.points[D4] := new Point(185, 195)
      this.points[E4] := new Point(225, 195)
      this.points[F4] := new Point(265, 195)
      this.points[G4] := new Point(305, 195)
      this.points[H4] := new Point(345, 195)
      this.points[I4] := new Point(385, 195)
      this.points[J4] := new Point(425, 195)
      this.points[K4] := new Point(465, 195)
      this.points[L4] := new Point(505, 195)
      this.points[M4] := new Point(545, 195)
      this.points[N4] := new Point(585, 195)
      this.points[O4] := new Point(625, 195)

      this.points[A5] := new Point(85, 225)
      this.points[B5] := new Point(115, 225)
      this.points[C5] := new Point(145, 225)
      this.points[D5] := new Point(185, 225)
      this.points[E5] := new Point(225, 225)
      this.points[F5] := new Point(265, 225)
      this.points[G5] := new Point(305, 225)
      this.points[H5] := new Point(345, 225)
      this.points[I5] := new Point(385, 225)
      this.points[J5] := new Point(425, 225)
      this.points[K5] := new Point(465, 225)
      this.points[L5] := new Point(505, 225)
      this.points[M5] := new Point(545, 225)
      this.points[N5] := new Point(585, 225)
      this.points[O5] := new Point(625, 225)

      this.points[A6] := new Point(85, 265)
      this.points[B6] := new Point(115, 265)
      this.points[C6] := new Point(145, 265)
      this.points[D6] := new Point(185, 265)
      this.points[E6] := new Point(225, 265)
      this.points[F6] := new Point(265, 265)
      this.points[G6] := new Point(305, 265)
      this.points[H6] := new Point(345, 265)
      this.points[I6] := new Point(385, 265)
      this.points[J6] := new Point(425, 265)
      this.points[K6] := new Point(465, 265)
      this.points[L6] := new Point(505, 265)
      this.points[M6] := new Point(545, 265)
      this.points[N6] := new Point(585, 265)
      this.points[O6] := new Point(625, 265)

      this.points[A7] := new Point(85, 305)
      this.points[B7] := new Point(115, 305)
      this.points[C7] := new Point(145, 305)
      this.points[D7] := new Point(185, 305)
      this.points[E7] := new Point(225, 305)
      this.points[F7] := new Point(265, 305)
      this.points[G7] := new Point(305, 305)
      this.points[H7] := new Point(345, 305)
      this.points[I7] := new Point(385, 305)
      this.points[J7] := new Point(425, 305)
      this.points[K7] := new Point(465, 305)
      this.points[L7] := new Point(505, 305)
      this.points[M7] := new Point(545, 305)
      this.points[N7] := new Point(585, 305)
      this.points[O7] := new Point(625, 305)

      this.points[A8] := new Point(85, 345)
      this.points[B8] := new Point(115, 345)
      this.points[C8] := new Point(145, 345)
      this.points[D8] := new Point(185, 345)
      this.points[E8] := new Point(225, 345)
      this.points[F8] := new Point(265, 345)
      this.points[G8] := new Point(305, 345)
      this.points[H8] := new Point(345, 345)
      this.points[I8] := new Point(385, 345)
      this.points[J8] := new Point(425, 345)
      this.points[K8] := new Point(465, 345)
      this.points[L8] := new Point(505, 345)
      this.points[M8] := new Point(545, 345)
      this.points[N8] := new Point(585, 345)
      this.points[O8] := new Point(625, 345)

      this.points[A9] := new Point(85, 385)
      this.points[B9] := new Point(115, 385)
      this.points[C9] := new Point(145, 385)
      this.points[D9] := new Point(185, 385)
      this.points[E9] := new Point(225, 385)
      this.points[F9] := new Point(265, 385)
      this.points[G9] := new Point(305, 385)
      this.points[H9] := new Point(345, 385)
      this.points[I9] := new Point(385, 385)
      this.points[J9] := new Point(425, 385)
      this.points[K9] := new Point(465, 385)
      this.points[L9] := new Point(505, 385)
      this.points[M9] := new Point(545, 385)
      this.points[N9] := new Point(585, 385)
      this.points[O9] := new Point(625, 385)

      this.points[A10] := new Point(85, 425)
      this.points[B10] := new Point(115, 425)
      this.points[C10] := new Point(145, 425)
      this.points[D10] := new Point(185, 425)
      this.points[E10] := new Point(225, 425)
      this.points[F10] := new Point(265, 425)
      this.points[G10] := new Point(305, 425)
      this.points[H10] := new Point(345, 425)
      this.points[I10] := new Point(385, 425)
      this.points[J10] := new Point(425, 425)
      this.points[K10] := new Point(465, 425)
      this.points[L10] := new Point(505, 425)
      this.points[M10] := new Point(545, 425)
      this.points[N10] := new Point(585, 425)
      this.points[O10] := new Point(625, 425)

      this.points[A11] := new Point(85, 465)
      this.points[B11] := new Point(115, 465)
      this.points[C11] := new Point(145, 465)
      this.points[D11] := new Point(185, 465)
      this.points[E11] := new Point(225, 465)
      this.points[F11] := new Point(265, 465)
      this.points[G11] := new Point(305, 465)
      this.points[H11] := new Point(345, 465)
      this.points[I11] := new Point(385, 465)
      this.points[J11] := new Point(425, 465)
      this.points[K11] := new Point(465, 465)
      this.points[L11] := new Point(505, 465)
      this.points[M11] := new Point(545, 465)
      this.points[N11] := new Point(585, 465)
      this.points[O11] := new Point(625, 465)

      this.points[A12] := new Point(85, 505)
      this.points[B12] := new Point(115, 505)
      this.points[C12] := new Point(145, 505)
      this.points[D12] := new Point(185, 505)
      this.points[E12] := new Point(225, 505)
      this.points[F12] := new Point(265, 505)
      this.points[G12] := new Point(305, 505)
      this.points[H12] := new Point(345, 505)
      this.points[I12] := new Point(385, 505)
      this.points[J12] := new Point(425, 505)
      this.points[K12] := new Point(465, 505)
      this.points[L12] := new Point(505, 505)
      this.points[M12] := new Point(545, 505)
      this.points[N12] := new Point(585, 505)
      this.points[O12] := new Point(625, 505)

      this.points[A13] := new Point(85, 545)
      this.points[B13] := new Point(115, 545)
      this.points[C13] := new Point(145, 545)
      this.points[D13] := new Point(185, 545)
      this.points[E13] := new Point(225, 545)
      this.points[F13] := new Point(265, 545)
      this.points[G13] := new Point(305, 545)
      this.points[H13] := new Point(345, 545)
      this.points[I13] := new Point(385, 545)
      this.points[J13] := new Point(425, 545)
      this.points[K13] := new Point(465, 545)
      this.points[L13] := new Point(505, 545)
      this.points[M13] := new Point(545, 545)
      this.points[N13] := new Point(585, 545)
      this.points[O13] := new Point(625, 545)

      this.points[A14] := new Point(85, 585)
      this.points[B14] := new Point(115, 585)
      this.points[C14] := new Point(145, 585)
      this.points[D14] := new Point(185, 585)
      this.points[E14] := new Point(225, 585)
      this.points[F14] := new Point(265, 585)
      this.points[G14] := new Point(305, 585)
      this.points[H14] := new Point(345, 585)
      this.points[I14] := new Point(385, 585)
      this.points[J14] := new Point(425, 585)
      this.points[K14] := new Point(465, 585)
      this.points[L14] := new Point(505, 585)
      this.points[M14] := new Point(545, 585)
      this.points[N14] := new Point(585, 585)
      this.points[O14] := new Point(625, 585)

      this.points[A15] := new Point(85, 625)
      this.points[B15] := new Point(115, 625)
      this.points[C15] := new Point(145, 625)
      this.points[D15] := new Point(185, 625)
      this.points[E15] := new Point(225, 625)
      this.points[F15] := new Point(265, 625)
      this.points[G15] := new Point(305, 625)
      this.points[H15] := new Point(345, 625)
      this.points[I15] := new Point(385, 625)
      this.points[J15] := new Point(425, 625)
      this.points[K15] := new Point(465, 625)
      this.points[L15] := new Point(505, 625)
      this.points[M15] := new Point(545, 625)
      this.points[N15] := new Point(585, 625)
      this.points[O15] := new Point(625, 625)
    }
  }

  size() {
    return this.points.length()
  }

  getPoint() {
    return this.point
  }

  nextPoint() {
    if (this.index < this.points.length()) {
      this.index++
    }
    else {
      this.reset()
      this.index++
    }
    this.point := this.points[this.index]
  }

  reset() {
    this.index := 0
    this.point := ""
  }
}
