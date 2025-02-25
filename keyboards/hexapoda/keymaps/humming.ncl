let { tap, hold, td, combo, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
{
  virtual_keys = [
    combo.make 50 [20, 21], # xc
    combo.make 50 [21, 22], # cv
    combo.make 50 [23, 24], # m,
    combo.make 50 [24, 25], # ,.
  ],
  layers = [
    [
      kc.Q, kc.W, kc.E, kc.R, kc.T, kc.Y, kc.U, kc.I, kc.O, kc.P,
      kc.A, kc.S, kc.D, kc.F, kc.G, kc.H, kc.J, kc.K, kc.L, kc.QUOT,
            kc.X, kc.C, kc.V,             kc.M, kc.DOT, kc.COMMA,
                  kc.SPC, kc.TAB,   kc.ENT, kc.BSPC,
      # Combos
      kc.Z,                   kc.B, kc.N,                   kc.SLASH
     ]
   ]
}
