module top(clk, rst, wb_reg_write, wb_write_reg_location, mem_wb_write_data, if_id_instr, if_id_npc, id_ex_wb, id_ex_mem, id_ex_execute, id_ex_npc, id_ex_readdat1, id_ex_readdat2, id_ex_sign_ext, id_ex_instr_bits_2016, id_ex_instr_bits_1511);
input clk, rst, wb_reg_write;
input [4:0] wb_write_reg_location;
input [31:0] mem_wb_write_data, if_id_instr, if_id_npc;
output [1:0] id_ex_wb;
output [2:0] id_ex_mem;
output [3:0] id_ex_execute;
output [31:0] id_ex_npc, id_ex_readdat1,id_ex_readdat2, id_ex_sign_ext;
output [4:0] id_ex_instr_bits_2016,id_ex_instr_bits_1511;
wire [1:0] wb;
wire [2:0] mem;
wire [3:0] execute;
wire [31:0] npc, readdat1,readdat2, sign_ext;
control u1(clk, rst, if_id_instr[31:26], wb, mem, execute);
signExt u2(if_id_instr[15:0], sign_ext);
regfile u3(clk, rst, wb_reg_write, if_id_instr[25:21], if_id_instr[20:16], wb_write_reg_location, mem_wb_write_data, readdat1, readdat2);
idExLatch u4(clk, rst, wb, mem, execute, if_id_npc, readdat1, readdat2, sign_ext, if_id_instr[20:16], if_id_instr[15:11], id_ex_wb, id_ex_mem,id_ex_execute, id_ex_npc, id_ex_readdat1, id_ex_readdat2, id_ex_sign_ext, id_ex_instr_bits_2016, id_ex_instr_bits_1511);
endmodule
