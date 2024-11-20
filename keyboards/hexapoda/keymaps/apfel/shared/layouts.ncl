let { tap, hold, macro, .. } = import "fak/keycode.ncl" in
let util = import "fak/util_functions.ncl" in

let de = import "lib/german.ncl" in
let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let tm = tap.reg.mod in
let me = tap.custom.media in
let XXXX = tap.none & hold.none in

let shared_layers = {
  NUM0 = [
   XXXX,    XXXX,    XXXX,    XXXX,    XXXX,        ks.PLUS, kc.N1,   kc.N2,   kc.N3,   kc.SLSH,
   md.lctl, md.lalt, md.lgui, md.lsft, XXXX,        kc.N0,   kc.N4,   kc.N5,   kc.N6,   kc.DOT,
            XXXX,    XXXX,    XXXX,                          kc.N7,   kc.N8,   kc.N9,
                              XXXX,    XXXX,        kc.E,    kc.N0,
  ],
  NAV0 = [
   XXXX,     XXXX,    kc.UP,   me.VOLU,  me.VOLD,     kc.LEFT, kc.PGDN, kc.PGUP,  kc.END,   kc.TAB,
   md.lctl,  kc.LEFT, kc.UP,   kc.RIGHT, me.MUTE,     kc.HOME, kc.DOWN, kc.UP,    kc.RGHT,  kc.TAB,
             XXXX,    kc.DOWN, XXXX,                           kc.PGDN, kc.PGUP,  kc.END,
                               XXXX,    XXXX,        XXXX,    XXXX,
  ],
#  NUM1 = [
#            kc.N9,   kc.N8,   kc.N7,   ks.ASTR,     ks.PLUS, kc.N7,   kc.N8,   kc.N9,
#            kc.N6,   kc.N5,   kc.N4,   kc.SLSH,     kc.MINS, kc.N4,   kc.N5,   kc.N6,
#   kc.N0,   kc.N3,   kc.N2,   kc.N1,                         kc.N1,   kc.N2,   kc.N3,   kc.DOT,
#                              XXXX,    XXXX,        kc.E,    kc.N0,
#                              XXXX,    XXXX,
#  ],
#  NAV1 = [
#            kc.INS,  kc.UP,   kc.BSPC, me.VOLD,     me.VOLU, kc.BSPC, kc.DEL,  kc.INS,
#            kc.LEFT, kc.DOWN, kc.RGHT, me.MUTE,     kc.LEFT, kc.DOWN, kc.UP,   kc.RGHT,
#   md.lctl, kc.HOME, kc.PGDN, kc.END,                        kc.HOME, kc.PGUP, kc.END,  kc.TAB,
#                              XXXX,    XXXX,        XXXX,    XXXX,
#                              XXXX,    XXXX,
#  ],
  NUMDE = [
   XXXX,    XXXX,    XXXX,    XXXX,    XXXX,        kc.N0,   kc.N1,   kc.N2,   kc.N3,   kc.DOT,
   md.lctl, md.lalt, md.lgui, md.lsft, XXXX,        kc.N0,   kc.N4,   kc.N5,   kc.N6,   kc.DOT,
            XXXX,    XXXX,    XXXX,                          kc.N7,   kc.N8,   kc.N9,
                              XXXX,    XXXX,        kc.E,    kc.N0,
  ],
  SYMDE = [
   de.ACUT, de.GRV,  de.LBRC, de.RBRC, de.QUES,     ks.EXLM, de.QUOT, de.DQUO, de.CIRC, ks.PERC,
   de.BSLS, de.HASH, de.LPRN, de.RPRN, de.TILD,     de.EQL,  de.PLUS, de.MINS, de.ASTR, de.SLSH,
            de.TILD, de.LCBR, de.RCBR,                       de.LABK, de.RABK, de.PIPE,
                              de.LCBR, de.RCBR,     XXXX,    XXXX,
  ],
  SYM = [
   ks.EXLM, kc.GRV,  ks.DQUO, kc.DOT,  kc.LBRC,     kc.RBRC, kc.BSLS, ks.PIPE, kc.SLSH,  kc.TAB,
   ks.EXLM, ks.AT,   ks.HASH, ks.DLR,  ks.LPRN,     ks.RPRN, ks.AMPR, ks.ASTR, ks.PERC,  kc.TAB,
            ks.TILD, kc.QUOT, ks.UNDS,                       kc.MINS, ks.PLUS, kc.EQL,
                              ks.LCBR, ks.RCBR,     XXXX,    XXXX,
  ],
  FUN = [
   XXXX,    XXXX,    XXXX,    XXXX,    XXXX,        kc.F12,  kc.F7,   kc.F8,   kc.F9,   kc.F10,
   XXXX,    XXXX,    XXXX,    XXXX,    XXXX,        kc.F11,  kc.F4,   kc.F5,   kc.F6,   kc.F10,
            XXXX,    XXXX,    XXXX,                          kc.F1,   kc.F2,   kc.F3,
                              XXXX,    XXXX,        XXXX,    XXXX,
  ],
} in

let cu = {
  # copy custom stuff from example
  COPY = md.lctl & kc.INS, # md.lctl & kc.C,
  PSTE = md.lsft & kc.INS, # md.lctl & kc.V,
  CUT  = md.lctl & kc.X,
  SCH  = macro.make [
    macro.tap kc.S,
    macro.release md.rsft,
    macro.tap kc.C,
    macro.tap kc.H,
  ],
  SZ = macro.make [ macro.press md.ralt, macro.tap kc.S,    macro.release md.ralt, ],
  AE = macro.make [ macro.press md.ralt, macro.tap ks.DQUO, macro.release md.ralt, macro.tap kc.A, ],
  OE = macro.make [ macro.press md.ralt, macro.tap ks.DQUO, macro.release md.ralt, macro.tap kc.O, ],
  UE = macro.make [ macro.press md.ralt, macro.tap ks.DQUO, macro.release md.ralt, macro.tap kc.U, ],
} in
let both_side_combos = [
  [kc.CAPS, 0, 7],
  # Caps word combo here once supported
  # [CW, 10, 13],
] in

let thumb_combos = [
  [de.OE, 28, 19],
  [de.AE, 28, 17],
  [de.UE, 28, 8],
  [de.SZ, 28, 11],
] in

{
  qwerty = {
    base_layout = "WERTYUIOSDFGHJKLAXCVM,.P..",
    thumbs = [kc.ESC, kc.SPC, kc.N, kc.ENT],
    combos = [
      # Left
      [kc.Q,    0,  1],
      [kc.Z,    17, 18], [kc.B,    18, 19],
      # Right
                                            [kc.QUOT, 5, 6],   [kc.SCLN, 6,  7],
                                            [kc.MINS, 20, 21], [kc.SLSH, 21, 22],
    ] @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM0,
      NAV = shared_layers.NAV0,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    }
  },

  bird = {
    base_layout = "XCLFPKZOU.RSNTBJHEIAWMGJD,",
    thumbs = [kc.ESC, kc.SPC, kc.ENT, kc.TAB],
    combos = [
      # Left
      [kc.V,    1,  2], [kc.Q,    2, 3],
      [kc.Y,    20, 21],
      # Right
                                            [kc.QUOT, 5, 6],   [kc.SCLN, 6,  7],
                                            [kc.MINS, 20, 22], [kc.SLSH, 21, 22],
    ] @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM0,
      NAV = shared_layers.NAV0,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    }
  },

  colemak = {
    base_layout = "WFPKJLUYRSTGMNEIAXCDH,.O",
    thumbs = [kc.ESC, kc.SPC, kc.ENT, kc.BSPC],
    combos = [
      # Left
      [kc.Q,    0,  1],  [kc.B,    1,  2],
      [kc.Z,    17, 18], [kc.V,    18, 19],
      # Right
                                            [kc.QUOT, 5, 6],   [kc.SCLN, 6,  7],
                                            [kc.MINS, 20, 21], [kc.SLSH, 21, 22],
    ] @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM0,
      NAV = shared_layers.NAV0,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    }
  },

  aptmak = {
    base_layout = "VWFPBJLZU'RSTHKXNAIOCGDM,.",
    thumbs = [kc.ESC, kc.SPC, kc.E, kc.ENT],
    combos = [
      # Left
      [kc.V,    1,  2],  [kc.Q,    2,  3],
      [ks.LCBR, 0,  8],  [kc.LBRC, 1,  9],  [ks.LPRN, 2,  10],  [ks.LABK, 3,  11],  [cu.SCH, 11, 13],
      [kc.B,    12, 3],  [kc.K,    12, 13],
      [kc.Y,    20, 21],
      # Right
                                            [tm.lctl & kc.BSPC, 6, 8],
                                            [kc.BSPC, 6, 7],   [kc.DEL,  7,  8],
      [ks.RABK, 4,  12], [ks.RPRN, 5,  13], [kc.RBRC, 6,  14], [ks.RCBR, 7,  15],
                                            [kc.J,    6,  17], [kc.X,    16, 17],
                                            [kc.MINS, 20, 23], [kc.SLSH, 21, 23],
    ] @ both_side_combos,
    layers = {
      NUM = shared_layers.NUM0,
      NAV = shared_layers.NAV0,
      SYM = shared_layers.SYM,
      FUN = shared_layers.FUN,
    },
  },
  aptmak_de = {
    base_layout = "VWFPBJLZU'RSTHKXNAIOCGDM,.",
    thumbs = [kc.ESC, kc.SPC, kc.E, kc.TAB],
    combos = [
      # Left
      [kc.V,    1,  2],  [kc.Q,    2,  3],
      [de.LCBR, 0,  8],  [de.LBRC, 1,  9],  [de.LPRN, 2,  10],  [de.LABK, 3,  11],  [cu.SCH, 11, 13],
      [kc.B,    12, 3],  [kc.K,    12, 13],
      [de.Z,    20, 21],
      # Right
                                            [tm.lctl & kc.BSPC, 6, 8],
                                            [kc.BSPC, 6, 7],   [kc.DEL,  7,  8],
      [ks.RABK, 4,  12], [ks.RPRN, 5,  13], [de.RBRC, 6,  14], [de.RCBR, 7,  15],
                                            [kc.J,    6,  17], [kc.X,    16, 17],
                                            [de.MINS, 20, 23], [de.SLSH, 21, 23],
                                            [kc.ENT,  23, 24],
    ] @ both_side_combos @ thumb_combos,
    layers = {
      NUM = shared_layers.NUMDE,
      NAV = shared_layers.NAV0,
      SYM = shared_layers.SYMDE,
      FUN = shared_layers.FUN,
    },
  },
}
