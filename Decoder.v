module decoder #(parameter WIDTH = 32)(instr, brEq, brLT, pcSel, immSel, regWEn, brUn, aSel, bSel, aluSel, memW, wbSel, signFlag, BHW);

    input[31:0] instr;
    input brEq, brLT;
    output reg pcSel, regWEn, brUn, aSel, bSel, memW,signFlag;
    output reg [1:0] BHW,wbSel;
    output reg [3:0]aluSel;
    output reg [2:0]immSel;

    wire [6:0] opCode;
    wire [2:0] funct3;
    wire [6:0] funct7;

    assign opCode = instr[6:0];
    assign funct3 = instr[14:12];
    assign funct7 = instr[31:25];

    always @(*)begin
        case(opCode)

            7'b0110011:begin  //R type

                case({funct7,funct3})
                    10'b0000000000:begin //add
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end

                    10'b0100000000:begin //sub
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0001;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end                    

                    10'b0000000001:begin //sll
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0010;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000010:begin //slt
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b1001;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000011:begin //sltu
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b1000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000100:begin //xor
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0111;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000101:begin //srl
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0011;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0100000101:begin //sra
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0100;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000110:begin//or
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0110;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000111:begin//and
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0101;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    default:begin //add
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end

                endcase
            end
            7'b0010011:begin  //I type
                casex({funct7,funct3})
                    10'bxxxxxxx000:begin //addi
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end                  

                    10'b0000000001:begin //slli
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0010;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'bxxxxxxx010:begin //slti
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b1001;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'bxxxxxxx011:begin //sltui
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b1000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'bxxxxxxx100:begin //xori
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0111;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0000000101:begin //srli
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0011;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'b0100000101:begin //srai
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0100;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'bxxxxxxx110:begin//ori
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0110;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    10'bxxxxxxx111:begin//andi
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0101;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    default:begin //addi
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end

                endcase
            end            
            7'b0000011:begin  //(I)load type
                case({funct3})
                    3'b000:begin //lb
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b1;
                        BHW      = 2'b00; 
                    end                  

                    3'b001:begin //lh
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b1;
                        BHW      = 2'b01; 
                    end
                    3'b010:begin //lw
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    3'b100:begin //lbu
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b00; 
                    end
                    3'b101:begin //lhu
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b01; 
                    end
                    default:begin //lw
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b1;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end                   
                endcase
            end
            7'b0100011:begin  //S type
                case({funct3})
                    3'b000:begin //sb
                        pcSel    = 1'b0;
                        immSel   = 3'b001;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b1;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b00; 
                    end                  

                    3'b001:begin //sh
                        pcSel    = 1'b0;
                        immSel   = 3'b001;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b1;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b01; 
                    end
                    3'b010:begin //sw
                        pcSel    = 1'b0;
                        immSel   = 3'b001;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b1;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                    default:begin //sw
                        pcSel    = 1'b0;
                        immSel   = 3'b001;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b1;
                        wbSel    = 2'b01;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end
                endcase
            end            
            7'b1100011:begin  //B type
                case({funct3})
                    3'b000:begin //beq
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10;
                        if(brEq)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;    

                    end                  

                    3'b001:begin //bne
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                        if(!brEq)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;  
                    end
                    3'b100:begin //blt
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                        if(brLT)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;  
                    end
                    3'b101:begin //bge
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                        if(!brLT)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;  
                    end
                    3'b110:begin //bltu
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b1;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                        if(brLT)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;  
                    end
                    3'b111:begin //bgeu
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b1;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                        if(!brLT)
                            pcSel= 1'b1;
                        else
                            pcSel= 1'b0;  
                    end
                    default:begin //bne
                        pcSel    = 1'b0;
                        immSel   = 3'b010;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b1;
                        bSel     = 1'b1;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end                     
                endcase
            end
            7'b1100111:begin  //I type(jalr)
                if(funct3==3'b000)begin
                    pcSel    = 1'b1;
                    immSel   = 3'b000;
                    regWEn   = 1'b1;
                    brUn     = 1'b0;
                    aSel     = 1'b0;
                    bSel     = 1'b1;
                    aluSel   = 4'b0000;
                    memW     = 1'b0;
                    wbSel    = 2'b10;
                    signFlag = 1'b0;
                    BHW      = 2'b10; 
                end
                else begin
                    pcSel    = 1'b0;
                    immSel   = 3'b000;
                    regWEn   = 1'b0;
                    brUn     = 1'b0;
                    aSel     = 1'b0;
                    bSel     = 1'b1;
                    aluSel   = 4'b0000;
                    memW     = 1'b0;
                    wbSel    = 2'b10;
                    signFlag = 1'b0;
                    BHW      = 2'b10; 
                end

            end
            7'b1101111:begin  //j type(jal)
                    pcSel    = 1'b1;
                    immSel   = 3'b011;
                    regWEn   = 1'b1;
                    brUn     = 1'b0;
                    aSel     = 1'b1;
                    bSel     = 1'b1;
                    aluSel   = 4'b0000;
                    memW     = 1'b0;
                    wbSel    = 2'b10;
                    signFlag = 1'b0;
                    BHW      = 2'b10; 
                end
            7'b0110111:begin  //U type(lui)
                    pcSel    = 1'b0;
                    immSel   = 3'b100;
                    regWEn   = 1'b1;
                    brUn     = 1'b0;
                    aSel     = 1'b1;
                    bSel     = 1'b1;
                    aluSel   = 4'b1010;
                    memW     = 1'b0;
                    wbSel    = 2'b01;
                    signFlag = 1'b0;
                    BHW      = 2'b10;             
                end
            7'b0010111:begin  //U type(auipc)
                    pcSel    = 1'b0;
                    immSel   = 3'b100;
                    regWEn   = 1'b1;
                    brUn     = 1'b0;
                    aSel     = 1'b1;
                    bSel     = 1'b1;
                    aluSel   = 4'b0000;
                    memW     = 1'b0;
                    wbSel    = 2'b01;
                    signFlag = 1'b0;
                    BHW      = 2'b10; 
                end
             default:begin  
                        pcSel    = 1'b0;
                        immSel   = 3'b000;
                        regWEn   = 1'b0;
                        brUn     = 1'b0;
                        aSel     = 1'b0;
                        bSel     = 1'b0;
                        aluSel   = 4'b0000;
                        memW     = 1'b0;
                        wbSel    = 2'b00;
                        signFlag = 1'b0;
                        BHW      = 2'b10; 
                    end                      
        endcase
    end
endmodule
