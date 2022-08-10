module ImmGen #(parameter WIDTH = 32)(instr,immsrc,imm);

    input [31:7] instr;
    input [2:0]  immsrc;
    output reg 	[WIDTH-1:0] imm;
    always@(*)begin
        case(immsrc)
                // I−type
            3'b000:     imm = {{20{instr[31]}}, instr[31:20]};
                // S−type (stores)
            3'b001:     imm = {{20{instr[31]}}, instr[31:25], instr[11:7]};
                // B−type (branches)
            3'b010:      imm = {{20{instr[31]}}, instr[7],  instr[30:25], instr[11:8], 1'b0};    
                // J−type (branches)
            3'b011:      imm = {{12{instr[31]}}, instr[19:12],  instr[20], instr[30:21], 1'b0};
               // U−type 
            3'b100:      imm = { instr[31:12],{12{1'b0}}};
                
            default: 	imm = 32'bx; // undefined
        endcase
    end
endmodule