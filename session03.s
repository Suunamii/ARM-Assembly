.data

/* ensure variable is 4-byte alignes

Was bedeutet .balign 4?
    Das ist eine Direktive (Anweisung für den Assembler).
    Sie sorgt dafür, dass die nächste Variable (oder Adresse) 
    im Speicher auf eine 4-Byte-Grenze ausgerichtet ist.

    Warum ist das wichtig?
        Viele Prozessoren, wie ARM, 
        benötigen Daten auf bestimmten Speichergrenzen 
        (z. B. 4-Byte-Grenzen für 32-Bit-Werte).
        Wenn eine Variable nicht richtig ausgerichtet ist, 
        kann es langsamer werden oder zu Fehlern führen. 
        
Zwischenliegende Daten:

    Wenn im Code vor einem .word-Wert Daten 
    mit einer kleineren Größe (z. B. ein .byte, 1 Byte) 
    gespeichert werden, ist die Speicheradresse 
    nicht mehr automatisch auf 4 Bytes ausgerichtet.

    .balign sorgt dann dafür, dass die nächste Variable 
    auf die richtige Grenze verschoben wird.*/

.balign 4
/* define storage for myvar1
with value 3 , with 4 bytes  */
myvar1:
    .word 3 

.balign 4
myvar2:
    .word 4

.text 

.balign 4
.global main

main:
    ldr r1, addr_of_myvar1 /* r1 = address of myvar1 */
    ldr r1, [r1]           /* value loaded into r1*/
    ldr r2, addr_of_myvar2
    ldr r2, [r2]
    add r0, r1, r2
    bx lr


/* Das ist ein Label, 
das die Adresse von myvar1 im Speicher enthält 
(nicht den Wert von myvar1 selbst). */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2