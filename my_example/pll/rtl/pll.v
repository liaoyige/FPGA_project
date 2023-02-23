module  pll
(
	input    wire  sys_clk,
	input    wire  rst,
	output   wire  clk_out_0,
	output   wire  locked
);
pll_ip pll_ip_inst (
		.refclk   (sys_clk),   //  refclk.clk
		.rst      (rst),      //   reset.reset
		.outclk_0 (clk_out_0), // outclk0.clk
		.locked   (locked)    //  locked.export
	);

endmodule