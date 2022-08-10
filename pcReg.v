module pcReg #(parameter WIDTH = 32)(clk,rst,pcIn,pc);

input clk,rst;
input [WIDTH-1:0] pcIn;
output reg [WIDTH-1:0]pc;

always@(posedge clk)begin

    if(rst)
        pc <= 32'h00000000;
    else
        pc <= pcIn;  

end
    
endmodule