; Direct addition of 8 bit numbers

MVI A, 02H ; A <- 02H
MVI B, 03H ; A <- 03H

ADD B; A <- A + B

STA 1050H; store the value of A in memory address 1050H

HLT; end