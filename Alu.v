module alu #(parameter WIDTH = 32)(
           input [WIDTH-1:0] A,B,  // ALU 32-bit Inputs
           input [3:0] ALU_Sel,// ALU Selection
           output reg [WIDTH-1:0] ALU_Out // ALU 32-bit Output
    );
    always @(*)begin
        case(ALU_Sel)
            4'b0000: // Addition
                ALU_Out = A + B ;
            4'b0001: // Subtraction
                ALU_Out = A - B ;
            4'b0010: // Logical shift left
                ALU_Out = A<<B;
            4'b0011: // Logical shift right
                ALU_Out = A>>B;
            4'b0100:  // arithmetic shift right
                ALU_Out = A>>>B;
            4'b0101: //  bitwise and
                ALU_Out = A & B;
            4'b0110: //  bitwise or
                ALU_Out = A | B;
            4'b0111: //  bitwise xor
                ALU_Out = A ^ B;
            4'b1000: // set less comparison
                ALU_Out = (A<B)?32'd1:32'd0 ;
            4'b1001: //signed Set less than
                ALU_Out = ($signed(A) < $signed(B))? 32'd1:32'd0;
            4'b1010: // set less comparison
                ALU_Out = B ;
            default: ALU_Out = A + B ;
        endcase
    end

endmodule