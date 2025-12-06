`timescale 1ns / 1ps
module regfiletb();
reg clk, rst, regwrite;
reg [4:0] rs, rt, rd;
reg [31:0] writedata;
wire [31:0] A_readdat1, B_readdat2;
regfile REGFILETB(clk, rst, regwrite, rs, rt, rd, writedata, A_readdat1, B_readdat2);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, regfiletb);
end
initial begin
	clk = 0;
	repeat(200) #1 clk=~clk;
end
initial begin
	regwrite =0;
	rst =1;
	rs =0;
	rt =2;
	rd =2;
	writedata = 32'hAAAAAAAA;
	#10 rst = 0;
	#10 regwrite = 1;
	#10 regwrite = 0;
	end
endmodule
