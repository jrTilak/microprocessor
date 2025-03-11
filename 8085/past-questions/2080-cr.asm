;There are 10 a bit data stored from memory location 7c00H. Copy that data to 7c20H if D6 is 1 and D4 is 0, otherwise copy by flipping bit D6 & D2

LXI H, 7C00H; source address to HL pair
LXI D, 7C20H; destination address to DE pair

MVI B, 0AH; initialize the counter to 10;

LOOP:
  ; copy the data from memory to accumulator
  MOV A, M;
  
  ;check if D6 is 1 and D4 is 0
  ANI 40H; 40H has 1 in bit 6 so, if the value has 0 in D6 it will trigger zero flag
  JZ  FLIP_BITS;

  ; check if D4 is 0
  MOV A, M; again move the value from memory to accumulator as it was modified by and operation
  ANI 10H; 10H has 1 ib bit 4; if the value has 0 in D4, it will trigger zero flag
  JNZ FLIP_BITS; flip if not 0

  MOV A, M
  JMP STORE_DATA;

  FLIP_BITS:
    MOV A, M ; take the value from memory
    XRI 44H; xor flips if xor with 1 else do nothing

  STORE_DATA:
    ;assuming our data is in accumulator
    STAX D;

    INX H; increase address HL
    INX D;
    DCR B; decrease only B register

    JNZ LOOP

HLT
