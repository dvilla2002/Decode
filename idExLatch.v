module idExLatch(clk, rst, ctl_wb, ctl_mem, ctl_ex, npc, readdat1, readdat2, sign_ext, instr_bits_2016, instr_bits_1511, ctl_wb_out, ctl_mem_out, ctl_ex_out, npc_out, readdat1_out, readdat2_out, sign_ext_out, instr_bits_2016_out, instr_bits_1511_out);
	input clk, rst;
	input [1:0] ctl_wb;
	input [2:0] ctl_mem;
	input [3:0] ctl_ex;
	input [31:0] npc, readdat1, readdat2, sign_ext; 
	input wire [4:0] instr_bits_2016, instr_bits_1511;
	
	output reg [1:0] ctl_wb_out;
	output reg [2:0] ctl_mem_out;
	output reg [3:0] ctl_ex_out;
	output reg [31:0] npc_out, readdat1_out, readdat2_out, sign_ext_out; 
	output reg [4:0] instr_bits_2016_out, instr_bits_1511_out;
always@(posedge clk)begin
	if(rst)begin
		ctl_wb_out <= 2'd0;
 		ctl_mem_out <= 3'd0;
	 	ctl_ex_out <= 4'd0;
		npc_out <= 32'd0;
		readdat1_out<= 32'd0;
		readdat2_out<= 32'd0;
		sign_ext_out <= 32'd0;
		instr_bits_2016_out <= 5'd0;
		instr_bits_1511_out <= 5'd0;
	end
	else begin
		ctl_wb_out <= ctl_wb;
 		ctl_mem_out <= ctl_mem;
	 	ctl_ex_out <= ctl_ex;
		npc_out <= npc;
		readdat1_out<= readdat1;
		readdat2_out<= readdat2;
		sign_ext_out <= sign_ext;
		instr_bits_2016_out <= instr_bits_2016;
		instr_bits_1511_out <= instr_bits_1511;
	end
end
endmodule
