  MVI A, 25H    ; Load first number (25H) into accumulator A
  MVI B, 38H    ; Load second number (38H) into register B
  MVI C, 00H    ; Clear register C to store carry

  ADD B         ; Add the content of register B to A
  JNC NEXT      ; Jump to NEXT if no carry (CY = 0)
  INR C         ; If carry occurs, increment register C

NEXT:         ; This label is for storing the final results
  STA 5000H     ; Store sum at memory location 5000H
  MOV A, C      ; Move carry content from C to A
  STA 5001H     ; Store carry at memory location 5001H

  HLT           ; Halt the program
