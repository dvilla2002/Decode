`timescale 1ns / 1ps
module controltb();
reg clk, rst;
reg [5:0] opcode;
wire [1:0] wb;
wire [2:0] mem;
wire [3:0] ex;
parameter RTYPE = 	6'd0;
parameter LW = 		6'b100011;
parameter SW = 		6'b101011;
parameter BEQ = 	6'b000100;
parameter NOP = 	6'b100000;
control CONTROLTB(clk, rst, opcode, wb, mem, ex);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, controltb);
end
initial begin
	clk = 0;
	repeat(200) #2 clk=~clk;
end
initial begin
	rst = 1;
	opcode = RTYPE;
	#6 rst = 0;
	#6 opcode = LW;
	#6 opcode = SW;
	#6 opcode = BEQ;
	#6 opcode = NOP;
	#6 opcode = 6'b111100;
end
endmodule
