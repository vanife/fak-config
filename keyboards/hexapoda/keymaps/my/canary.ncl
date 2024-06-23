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
     kc.W, kc.L, kc.Z, kc.P, kc.B,       kc.Y, kc.F, kc.O, kc.U, kc.N0,
     kc.C, kc.R, kc.S, kc.T, kc.G,       kc.M, kc.N, kc.E, kc.I, kc.A,
           kc.J, kc.V, kc.D,                   kc.H, kc.K, kc.N2,
                       kc.SPC, kc.SPC,   kc.ENT, kc.ENT,
                       # Combos
                       kc.V,
                       kc.Q,
                       kc.Y,
     ]
   ]
 }
