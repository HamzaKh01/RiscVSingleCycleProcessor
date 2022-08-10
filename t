.data
.word 2, 4, 6, 8
n: .word -9

.text
main:
    add t0, x0, x0
    addi t1, x0, 1
    la t3, n
    lw t3, 0(t3)
    addi t4,t3,-2
    slt t5,t4,t3
    sltu t6,t4,t3