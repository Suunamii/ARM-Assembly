/* 
ldr (Load Register):

   Register erhält einen Wert aus dem Speicher.

str (Store Register):

    Speichert den Wert aus einem Register in den Speicher.

-------------------
mov r1, addr_of_myvar1: Ist das korrekt?

ist es nicht korrekt, 
weil addr_of_myvar1 ein Label ist, 
das eine Adresse darstellt, die zur Laufzeit im Speicher liegt. 
ARM-Assembler versteht addr_of_myvar1 als Speicherinhalt, 
nicht als direkten Wert
*/

.data

.balign 4
myvar1:
    .word 0

.balign 4
myvar2:
    .word 0

.text

.balign 4
.global main
main:
    ldr r1, addr_of_myvar1
    mov r3, #3
    str r3, [r1]
    ldr r2, addr_of_myvar2
    mov r3, #4
    str r3, [r2]

    ldr r1, addr_of_myvar1
    ldr r1, [r1]
    ldr r2, addr_of_myvar2
    ldr r2, [r2]
    add r0, r1, r2
    bx lr

addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2