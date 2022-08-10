module branchComp #(parameter WIDTH = 32)(
    input [WIDTH-1:0] DataA,DataB,
    input brUn,
    output reg brEq,brLT
    );
      always @ * begin
        if(brUn) begin    //Unsigned comparison
            brEq = (DataA == DataB)? 1'b1:1'b0;
            brLT = (DataA < DataB)? 1'b1:1'b0;
        end
        else begin      //Signed comparison
            brEq = ($signed(DataA) == $signed(DataB))? 1'b1:1'b0;
            brLT = ($signed(DataA) < $signed(DataB))? 1'b1:1'b0;
            end
      end
    endmodule
