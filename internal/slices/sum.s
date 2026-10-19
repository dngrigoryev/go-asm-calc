#include "textflag.h"

TEXT ·Sum(SB), NOSPLIT, $0
    MOVQ data+0(FP), R8
    MOVQ len+8(FP), R9
    XORQ R10, R10
    CMPQ R9, $0
    JE fin
loop:
    MOVLQSX (R8), R11
    ADDQ R11, R10
    ADDQ $4, R8
    SUBQ $1, R9
    JNZ loop
fin:
    MOVQ R10, ret+24(FP)
    RET
