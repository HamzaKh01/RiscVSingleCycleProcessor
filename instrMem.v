module instrMem #(parameter WIDTH = 32)(pc,instruction);

input [WIDTH-1:0] pc;
output reg [31:0] instruction;

always@(*)begin

    case(pc)

//32'h00: instruction = 32'h00500113; //From book
//32'h04: instruction = 32'h00C00193;
//32'h08: instruction = 32'hFF718393;
//32'h0c: instruction = 32'h0023E233;
//32'h10: instruction = 32'h0041F2B3;
//32'h14: instruction = 32'h004282B3;
//32'h18: instruction = 32'h02728863;
//32'h1c: instruction = 32'h0041A233;
//32'h20: instruction = 32'h00020463;
//32'h24: instruction = 32'h00000293;
//32'h28: instruction = 32'h0023A233;
//32'h2C: instruction = 32'h005203B3;
//32'h30: instruction = 32'h402383B3;
//32'h34: instruction = 32'h0471AA23;
//32'h38: instruction = 32'h06002103;
//32'h3C: instruction = 32'h005104B3;
//32'h40: instruction = 32'h008001EF;
//32'h44: instruction = 32'h00100113;
//32'h48: instruction = 32'h00910133;
//32'h4C: instruction = 32'h0221A023;
//32'h50: instruction = 32'h00210063;

32'h00: instruction = 32'h00C00413;	//addi x8 x0 12  //calculate gcd of 12 and 9
32'h04: instruction = 32'h00900493;	//addi x9 x0 9	
32'h08: instruction = 32'h00940C63;	//beq x8 x9 24	
32'h0c: instruction = 32'h00944663;	//blt x8 x9 12	
32'h10: instruction = 32'h40940433;	//sub x8 x8 x9	
32'h14: instruction = 32'hFF5FF06F;	//jal x0 -12	
32'h18: instruction = 32'h408484B3;	//sub x9 x9 x8
32'h1c: instruction = 32'hFEDFF06F;	//jal x0 -20	
32'h20: instruction = 32'h0000006F;	//jal x0 0


//Calculating LCM of 2 and 8

//32'h00: instruction = 32'h00800093;	//addi x1 x0 8	addi x1, x0, 8
//32'h04: instruction = 32'h00200113;	//addi x2 x0 2	addi x2, x0, 2
//32'h08: instruction = 32'h000081B3;	//add x3 x1 x0	add x3, x1, x0
//32'h0C: instruction = 32'h00010233;	//add x4 x2 x0	add x4, x2, x0
//32'h10: instruction = 32'h0041E663;	//bltu x3 x4 12	start: bltu x3,x4,less_x3
//32'h14: instruction = 32'h00326863;	//bltu x4 x3 16	bltu x4,x3,less_x4
//32'h18: instruction = 32'h00418A63;	//beq x3 x4 20	beq x3,x4,stop
//32'h1c: instruction = 32'h001181B3;	//add x3 x3 x1	less_x3: add x3,x3,x1
//32'h20: instruction = 32'hFF1FF06F;	//jal x0 -16	j start
//32'h24: instruction = 32'h00220233;	//add x4 x4 x2	less_x4: add x4,x4,x2
//32'h28: instruction = 32'hFE9FF06F;	//jal x0 -24	j start
//32'h2c: instruction = 32'h0000006F;	//jal x0 0	stop: j stop


    endcase

end
    
endmodule