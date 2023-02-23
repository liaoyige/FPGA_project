`timescale 1ns/1ns
module tb_state_machine();

reg sys_clk;
reg sys_rst;
reg pi_money;

wire po_cola;

initial
	begin
		sys_clk = 1'b1;		//从画的第一个竖的灰色虚线后面开始写测试函数
		sys_rst <= 1'b0;
		#20					//这里就让它走一个周期，别怕，一样的效果其实#5也可以，但是不直观
		sys_rst <= 1'b1;
		pi_money <= 1'b0;
	end

always #10 sys_clk = ~sys_clk;
always #20 pi_money <= {$random}%2;

wire 	[2:0]	state = state_machine_inst1.state;//这一步是将例化模块中的state信号线牵出来给到这个tb测试模块中

initial
	begin
		$timeformat(-9,0,"ns",6);
		$monitor("@time %t:state = %b ,pi_money = %b,po_cola = %b",$time,state,pi_money,po_cola);
	end

state_machine state_machine_inst1
(
	.sys_clk (sys_clk),
	.sys_rst (sys_rst),
	.pi_money(pi_money),

	.po_cola (po_cola)
);

endmodule