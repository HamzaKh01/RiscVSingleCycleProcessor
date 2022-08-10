module adder #(parameter WIDTH = 32)(a, b, y);
    input   [WIDTH-1:0] a, b;
    output  [WIDTH-1:0] y;
    assign y = a + b;
endmodule