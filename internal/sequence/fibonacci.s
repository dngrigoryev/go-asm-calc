#include "textflag.h"

TEXT ·Fibonacci(SB), NOSPLIT, $0
    MOVQ n+0(FP), R15
    CMPQ R15, $0
    JNE non_zero
    MOVQ $0, ret+8(FP)
    RET
non_zero:
    MOVQ $0, R8
    MOVQ $1, R9
loop:
    SUBQ $1, R15
    JS break
    JZ break
    MOVQ R9, R10
    ADDQ R8, R9
    MOVQ R10, R8
    JMP loop
break:
    MOVQ R9, ret+8(FP)
    RET
