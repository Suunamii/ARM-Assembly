.global main /* main must be global, for C runtime to be able to call it*/
.func main /* main is a function, specifies between code and data*/

main:
  mov r0, #2 /*put a 2 inside the register r0, r0 contains the error code of function main*/
  bx lr  /* return from main*/
