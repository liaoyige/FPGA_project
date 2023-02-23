`timescale 1ns/1ns
module  tb_pll();

reg  		sys_clk ;
reg			rst;

wire	clk_out_0;
wire	locked;

initial		
	begin
		sys_clk = 1'b0;
		rst <= 1'b0;
		#20;
		rst <= 1'b1;
	end

always #10 sys_clk = ~sys_clk;

pll  pll_inst
(
	.sys_clk  (sys_clk),
	.rst      (rst),
	.clk_out_0(clk_out_0),
	.locked   (locked)
);

endmodule