module regFile #(parameter WIDTH = 32)(DataA, DataB, DataD, AddrA, AddrB, AddrD, WR, clk, rst);
	
	output [WIDTH-1:0] DataA, DataB;			// Data to be provided from register to execute the instruction
	input [WIDTH-1:0] DataD;						// Data to be loaded in the register
	input [4:0] AddrA, AddrB, AddrD;	    // Address (or number) of register to be WRitten or to be read
	input WR,clk,rst;								// input WR flag input
	reg [WIDTH-1:0] Reg_File [0:31];				// Register file

	assign DataA = Reg_File[AddrA];
	assign DataB = Reg_File[AddrB];
	
	always@(posedge clk)begin
		
		if(rst)begin
			Reg_File[0]<='h0;
			Reg_File[1]<='h0;
			Reg_File[2]<='h0;
			Reg_File[3]<='h0;
			Reg_File[4]<='h0;
			Reg_File[5]<='h0;
			Reg_File[6]<='h0;
			Reg_File[7]<='h0;
			Reg_File[8]<='h0;
			Reg_File[9]<='h0;
			Reg_File[10]<='h0;
			Reg_File[11]<='h0;
			Reg_File[12]<='h0;
			Reg_File[13]<='h0;
			Reg_File[14]<='h0;
			Reg_File[15]<='h0;
			Reg_File[16]<='h0;
			Reg_File[17]<='h0;
			Reg_File[18]<='h0;
			Reg_File[19]<='h0;
			Reg_File[20]<='h0;
			Reg_File[21]<='h0;
			Reg_File[22]<='h0;
			Reg_File[23]<='h0;
			Reg_File[24]<='h0;
			Reg_File[25]<='h0;
			Reg_File[26]<='h0;
			Reg_File[27]<='h0;
			Reg_File[28]<='h0;
			Reg_File[29]<='h0;
			Reg_File[30]<='h0;
			Reg_File[31]<='h0;

		end
		
		else if(WR & (AddrD!=0))begin
			Reg_File[AddrD]<=DataD;
		end

	end	

endmodule