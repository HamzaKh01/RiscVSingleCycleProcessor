
module LSU #(parameter WIDTH = 32)(Address,Data,DatatoWrite,BHW,signFlag,MemWrite,ReadData,WriteData); 

    input [WIDTH-1:0] Address; 	// Input Address 
    input [WIDTH-1:0] Data; 
	input [WIDTH-1:0] DatatoWrite;
	
    input [1:0] BHW;
    input signFlag,MemWrite;
  
    output reg[WIDTH-1:0] ReadData; // Contents of memory location at Address
    output reg[WIDTH-1:0] WriteData;
    wire [WIDTH-1:0]Data;  
      
    // Data_Memory b1(.in_Data(ReadData),.A(Address),.clk(clk),.WE(MemWrite),.o_Data(Data));  
   		always 	@(*)		   //Memory write
   		begin
   		
			if (MemWrite==1) begin
				case (BHW)
					0: begin
						case (Address[1:0])
							0:
								WriteData = {Data[31:8],DatatoWrite[7:0]};
							1:
								WriteData = {Data[31:16],DatatoWrite[7:0],Data[7:0]};
							2:
								WriteData = {Data[31:24],DatatoWrite[7:0],Data[15:0]};
							3:
								WriteData = {DatatoWrite[7:0],Data[23:0]};
						endcase
					end
					1: begin
						case (Address[1])
							0:
								WriteData = {Data[31:16],DatatoWrite[15:0]};
							1:
								WriteData = {DatatoWrite[15:0],Data[15:0]};
						endcase
					end
					2: begin
						WriteData = DatatoWrite;
					end
				endcase
   				// Memory[Address>>2] = Data;
			end
   		
   		
   		else
   		begin	
				case (BHW)
					0: begin // BYTE
						case (Address[1:0]) // 31:24,23:16,15:8,7:0
							0: begin
								if (signFlag && Data[7])
									ReadData <= {24'hffffff,Data[7:0]};
								else 
									ReadData <= {24'b0,Data[7:0]};
							end
							1: begin
								if (signFlag && Data[15])
									ReadData <= {24'hffffff,Data[15:8]};
								else 
									ReadData <= {24'b0,Data[15:8]};
							end
							2: begin
								if (signFlag && Data[23])
									ReadData <= {24'hffffff,Data[23:16]};
								else 
									ReadData <= {24'b0,Data[23:16]};
							end
							3: begin
								if (signFlag && Data[31])
									ReadData <= {24'hffffff,Data[31:24]};
								else 
									ReadData <= {24'b0,Data[31:24]};
							end
						endcase
					end
					1: begin // HALFWORD
						case (Address[1])
							0: begin
								if (signFlag && Data[15])
									ReadData <= {16'hffff,Data[15:0]};
								else 
									ReadData <= {16'b0,Data[15:0]};
							end	
							1: begin
								if (signFlag && Data[31])
									ReadData <= {16'hffff,Data[31:16]};
								else 
									ReadData <= {16'b0,Data[31:16]};
							end
						endcase
					end
					2: begin // WORD
						ReadData <= Data;
					end
                    
                    default:begin ReadData <= Data;
                    end
				endcase
					
					
   		end 
   end
  endmodule