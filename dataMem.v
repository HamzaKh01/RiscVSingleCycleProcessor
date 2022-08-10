
module Data_Memory #(parameter WIDTH = 32) (
    input [WIDTH-1:0] in_Data,
    input [WIDTH-1:0] A,
    input clk,WE,
    output [WIDTH-1:0] o_Data
);
    reg [7:0] Data_Mem [0:255];
    wire [WIDTH-1:0]ad;
  
  assign ad = {A[WIDTH-1:2],2'b00};
  assign o_Data = {Data_Mem[ad+3],Data_Mem[ad+2],Data_Mem[ad+1],Data_Mem[ad]};
   always @(posedge clk) begin
        if (WE) begin
            {Data_Mem[ad +3],Data_Mem[ad+2],Data_Mem[ad+1],Data_Mem[ad]} <= in_Data;
        end
    end
    
    endmodule