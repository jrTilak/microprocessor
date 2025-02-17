;Addition of 8 bit numbers from memory

LXI H, 1000H; fetch the value from address 1000H to memory

MOV A, M; A <- M

INX H; increase the address pointing by HL pair, now points to 1001H

ADD M; A <- A + M

STA 1002H; store the value of A to memory address 1002H

HLT; end