.data 
list:
    .word 4,5,-9,1,0,2,-3
/* list = label that acts as a pointer
            to the beginning of our data in memory
word = a serie of 32-bit values 
*/

.global _start 
_start: /* entry point of the program */

    ldr r0, =list
    ldr r1, [r0]
    /* LDR R1, [R0]: 
       Loads the first word from list into register R1 
       (which is 4). */
    ldr r2, [r0, #4]! 
    /* pre-increment load, increments r0 by 4(to point to 5)
       and loads that into r2  */
    ldr r2, [r0], #4
    /* 
    Post-increment: 
    The register is used for addressing and then incremented. 
    For example:

    LDR R2,[R0],#4

    Here, list[R0] is accessed first, 
    then R0 is incremented. 
    */   

    mov r0, #5
    mov r1, #7
    add r2, r0, r1
    sub r2, r0, r1
    mul r2, r0, r1

    subs r2, r0, r1
    adds r2, r0, r1
    adc r1, r0, r1

/* 
    
CPSR Flags and Suffix Instructions

The CPSR flags are affected by certain arithmetic instructions 
that have an 'S' suffix (e.g., ADDS, SUBS). These flags include:

    N (Negative): Set if the result of an operation is negative.
    Z (Zero): Set if the result is zero.
    C (Carry): Set if there's a carry out or borrow during an operation.
    V (Overflow): Set if there's an overflow from signed operations.

Here are some instructions that affect CPSR flags:

    SUBS: Subtracts like SUB but also updates CPSR flags. 
            It's useful for setting up conditions for subsequent 
            instructions.

    SUBS R2, R0, R1

This line not only subtracts the value in R1 from R0 
but also updates the CPSR flags based on the result.

    ADDS: This instruction adds two register values 
            and updates the CPSR flags based on the result. 
            For example:

    ADDS R2, R0, R1

This line performs addition (R2 = R0 + R1) 
and sets the CPSR flags accordingly. 
If the result is zero, the Z flag is set. 
If there's a carry out, the C flag is set.

    ADC: This instruction adds two register values along 
            with the carry flag from a previous operation. 
            For example:

    ADC R2, R0, R1

This line adds the values in R0 and R1 plus the carry flag 
from CPSR (if it's set). 
It's useful when performing multi-word arithmetic operations.
*/