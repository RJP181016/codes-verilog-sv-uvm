addi x1,x0,1       
addi x5,x0,10      
addi x3,x0,0       
loop:
    add x3,x3,x1   
    addi x1,x1,1   
    bne x1,x5,loop 
