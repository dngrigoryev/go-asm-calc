#include "textflag.h"

TEXT ·LowerBound(SB), NOSPLIT, $0
    MOVQ data+0(FP), R8
    MOVQ value+24(FP), R14
    MOVQ $-1, R9
    MOVQ r+8(FP), R10
loop:
    LEAQ 1(R9), AX
    CMPQ AX, R10
    JGE break
    MOVQ R9, R11
    ADDQ R10, R11
    SARQ $1, R11
    CMPQ 0(R8)(R11*8), R14
    JGE move_r
    MOVQ R11, R9
    JMP loop
move_r:
    MOVQ R11, R10
    JMP loop
break:
    MOVQ R10, ret+32(FP)
    RET
