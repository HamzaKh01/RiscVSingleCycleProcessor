`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.07.2022 23:41:43
// Design Name: 
// Module Name: testtt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testtt;

reg clk,rst;

top ins(.clk(clk),.rst(rst));

initial begin
clk=0;
rst=1;
#20
rst=0;

end

always #5 clk=~clk;
endmodule
