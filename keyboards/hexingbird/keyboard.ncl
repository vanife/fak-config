let { DirectPinKey, ColToRowKey, PeripheralSideKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in



let side_periph = {
  mcu = CH552T,
  split.channel = CH552T.features.uart_12_13,
  matrix = {
	  cols = [32, 14, 15, 16, 17],
	  rows = [35, 34, 33]
  },
  keys =
    let M = ColToRowKey in
  [
  M 4 0, M 3 0, M 2 0, M 1 0, M 0 0,
  M 4 1, M 3 1, M 2 1, M 1 1, M 0 1,
  M 4 2, M 3 2, M 2 2, M 1 2, M 0 2,
  ],
} in

# The central side has two fields that aren't in the peripheral:
# `split.peripheral` and `usb_dev`
{
  mcu = CH552T,
  split.channel = CH552T.features.uart_30_31,
  split.peripheral = side_periph,
  usb_dev = {
    # Nickel doesn't support hex literals yet
    vendor_id = 43962,
    product_id = 69,
    product_ver = 420,
  },
  matrix = {
	  cols = [32, 14, 15, 16, 17],
	  rows = [35, 34, 33]
  },
  keys =
    let S = PeripheralSideKey in
    let M = ColToRowKey in
  [
  S 0,  S 1,  S 2,  S 3,  S 4,      M 0 0, M 1 0, M 2 0, M 3 0, M 4 0,
  S 5,  S 6,  S 7,  S 8,  S 9,      M 0 1, M 1 1, M 2 1, M 3 1, M 4 1,
        S 11, S 12, S 13,                  M 1 2, M 2 2, M 3 2,
                    S 10, S 14,     M 0 2, M 4 2,
  ]
}
