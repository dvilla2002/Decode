`timescale 1ns / 1ps
module signtb();
reg [15:0] immediat;
wire [31:0]extended;
signExt SETB(immediat, extended);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, signtb);
end
initial begin
immediat = 16'hffff;
#2
immediat = 16'h3fff;
end
endmodule
