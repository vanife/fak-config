let { tap, hold, td, combo, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
 {
  virtual_keys = [
    combo.make 50 [1, 2],
    combo.make 50 [2, 3],
    combo.make 50 [20, 21],
  ],
   layers = [
     [
     kc.X, kc.C, kc.L, kc.F, kc.P,       kc.K, kc.Z, kc.O, kc.U, kc.N0,
     kc.R, kc.S, kc.N, kc.T, kc.B,       kc.J, kc.H, kc.E, kc.I, kc.A,
           kc.W, kc.M, kc.G,                   kc.D, kc.N1, kc.N2,
                       kc.SPC, kc.SPC,   kc.ENT, kc.ENT,
                       # Combos
                       kc.V,
                       kc.Q,
                       kc.Y,
     ]
   ]
 }
