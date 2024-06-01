let { ColToRowKey, .. } = import "fak/keyboard.ncl" in
let { CH552T, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552T,
  matrix = {
    cols = [35, 13, 15, 16],
    rows = [34, 31, 30, 17, 11]
  },
  usb_dev = {
    vendor_id = 43962, # 0xABBA
    product_id = 2,
    product_ver = 256, # 0x0100
  },
  keys =
    let M = ColToRowKey in
    [
      M 0 1, M 0 0, M 1 0, M 1 4,   M 2 4, M 2 0, M 3 0, M 3 1,
             M 1 1, M 0 2, M 1 2,   M 2 2, M 3 2, M 2 1,
                    M 0 3, M 1 3,   M 2 3, M 3 3,
    ]
}

#   00 01 02 03 04    05 06 07 08
#  09 10 11 12 13      14 15 16 17 18
# 19 20 21 22 23   24   25 26 27 28 29
