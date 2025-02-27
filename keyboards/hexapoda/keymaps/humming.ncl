let { tap, hold, td, combo, .. } = import "fak/keycode.ncl" in
let config = import "shared/config.ncl" in

let _key_positions = [
# _ indicates virtual key
   0,  1,  2,  3,  4,      5,  6,  7,  8,  9,
  10, 11, 12, 13, 14,     15, 16, 17, 18, 19,
 _30, 20, 21, 22,_31,    _32, 23, 24, 25,_33,
              26, 27,     28, 29,
] in

# hummingbird keymap drawer config:
# https://keymap-drawer.streamlit.app/?example_yaml=hummingbird.yaml
# cols_thumbs_notation: '233^32+2>> 2<<+233^32', but the combos are screwed up then

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
{
  virtual_keys = [
    combo.make config.combo_timeout_ms [20, 21], # xc
    combo.make config.combo_timeout_ms [21, 22], # cv
    combo.make config.combo_timeout_ms [23, 24], # m,
    combo.make config.combo_timeout_ms [24, 25], # ,.
  ],
  layers = [
    [
      kc.Q, kc.W, kc.E, kc.R, kc.T, kc.Y, kc.U, kc.I, kc.O, kc.P,
      kc.A, kc.S, kc.D, kc.F, kc.G, kc.H, kc.J, kc.K, kc.L, kc.QUOT,
            kc.X, kc.C, kc.V,             kc.M, kc.DOT, kc.COMMA,
                  kc.SPC, kc.TAB,   kc.ENT, kc.BSPC,
      # Combos
      kc.Z,                   kc.B, kc.N,                   kc.SLASH,
     ]
   ]
}
