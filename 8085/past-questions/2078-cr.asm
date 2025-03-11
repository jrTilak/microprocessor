/**
* An array of bytes is stored in starting memory location C301H. Length of this array is stored in memory location C300H. Writ an assembly language program to add upper and lower nibble of each byte ans store the sum starting from memory location C401H
 */

LXI H, 0C300H   ; Load counter address to HL
MOV B, M        ; Load the count to B register

LXI H, 0C301H   ; Load source address to HL pair
LXI D, 0C401H   ; Load destination address to DE pair

LOOP: 
  MOV A, M      ; Load the byte from memory

  ; Extract upper nibble
  ANI 0F0H      ; Mask lower nibble (keep upper)
  MOV C, A      ; Store upper nibble in C
  RRC           ; Rotate right
  RRC           ; Rotate right
  RRC           ; Rotate right
  RRC           ; Rotate right (Now upper nibble is at lower nibble position)

  MOV A, M      ; Load the byte again
  ANI 0FH       ; Mask upper nibble (keep lower nibble)

  ADD C         ; Add upper and lower nibble

  STAX D        ; Store result at destination memory

  INX H         ; Move to next byte in source
  INX D         ; Move to next location in destination

  DCR B         ; Decrement counter
  JNZ LOOP      ; Repeat until counter reaches zero

HLT


