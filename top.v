module top #(parameter WIDTH = 32)(clk,rst);

input clk,rst;

wire [WIDTH-1:0]pcIn,pc,DataA,DataB,wb,imm,pcPlus4,aluport1,aluport2,ALU_Out,ReadData,o_Data,WriteData;
wire [31:0] instruction;
wire [3:0]aluSel;
wire [2:0] immSel;
wire [1:0]BHW,wbSel;
wire regWEn,brUn,brEq,brLT,memW,signFlag,pcSel,aSel,bSel;

pcReg #(32) InsPcreg(.clk(clk),.rst(rst),.pcIn(pcIn),.pc(pc));
instrMem #(32) InsInstrMem(.pc(pc),.instruction(instruction));
regFile #(32) InsRegFile(.DataA(DataA), .DataB(DataB), .DataD(wb), .AddrA(instruction[19:15]), .AddrB(instruction[24:20]), .AddrD(instruction[11:7]), .WR(regWEn), .clk(clk), .rst(rst));
ImmGen #(32) InsImmGen(.instr(instruction[31:7]),.immsrc(immSel),.imm(imm));
branchComp #(32) InsBranchComp(.DataA(DataA),.DataB(DataB),.brUn(brUn),.brEq(brEq),.brLT(brLT));
adder #(32) InsPcplus4(.a(pc), .b(32'd4), .y(pcPlus4));
alu #(32) InsAlu(.A(aluport1),.B(aluport2),.ALU_Sel(aluSel),.ALU_Out(ALU_Out));
Data_Memory #(32) InsDataMem(.in_Data(WriteData),.A(ALU_Out),.clk(clk),.WE(memW),.o_Data(o_Data));
LSU #(32) Inslsu(.Address(ALU_Out),.Data(o_Data),.DatatoWrite(DataB),.BHW(BHW),.signFlag(signFlag),.MemWrite(memW),.ReadData(ReadData),.WriteData(WriteData));
decoder #(32) Insdecoder(.instr(instruction), .brEq(brEq), .brLT(brLT), .pcSel(pcSel), .immSel(immSel), .regWEn(regWEn), .brUn(brUn), .aSel(aSel), .bSel(bSel), .aluSel(aluSel), .memW(memW), .wbSel(wbSel), .signFlag(signFlag), .BHW(BHW));
mux2 #(32) InspcMux(.d0(pcPlus4),.d1(ALU_Out),.s(pcSel),.y(pcIn));
mux2 #(32) InspcOrAMux(.d0(DataA),.d1(pc),.s(aSel),.y(aluport1));
mux2 #(32) InsBOrImmMux(.d0(DataB),.d1(imm),.s(bSel),.y(aluport2));
mux3 #(32) InsWbMux(.d0(ReadData),.d1(ALU_Out),.d2(pcPlus4),.s(wbSel),.y(wb));

endmodule