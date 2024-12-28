.global main /* main must be global, for C runtime to be able to call it*/
.func main /* main is a function, specifies between code and data*/
.func add2

main:
  mov r0, #1 /*put a 2 inside the register r0, r0 contains the error code of function main*/
  mov r1, #3
  bl add2
  mov r3, #4
  b stop /* to stop a loop */

add2:
  add r2, r0, r1
  bx lr  /* return to caller (returning to main)*/


/* 
bl (Branch with Link):

    Springt zu einer Funktion und 
    speichert die Rücksprungadresse im lr-Register (lr=main).

bx lr:

    Springt zurück zur Adresse, 
    die im lr-Register gespeichert ist (lr -> main).
*/

