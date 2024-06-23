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
     kc.V, kc.W, kc.F, kc.P, kc.B,       kc.J, kc.L, kc.Z, kc.U, kc.N0,
     kc.R, kc.S, kc.T, kc.H, kc.K,       kc.X, kc.N, kc.A, kc.I, kc.O,
           kc.C, kc.G, kc.D,                   kc.M, kc.N1, kc.N2,
                       kc.SPC, kc.SPC,   kc.E, kc.ENT,
                       # Combos
                       kc.V,
                       kc.Q,
                       kc.Y,
     ]
   ]
 }
