module mux2_1
(
	input wire [0:0] in_1,		//输入信号1
	input wire [0:0] in_2,		//输入信号2
	input wire [0:0] sel,		//选通信号
	output reg [0:0] out		//输出信号
);


always@(*)// （*）就等于 （sel,in_1,in_2）
if(sel == 1'b1)
	begin
		out = in_1;
	end
	else
	begin
		out = in_2;
	end
endmodule