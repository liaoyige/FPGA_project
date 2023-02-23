module divider_five
#
(
	parameter CNT_5 = 3'b100
)
(
	input wire sys_clk,
	input wire sys_rst_n,
	
	output wire clk_out
);

reg  [2:0]    cnt ;
reg  		  clk1;
reg  		  clk2;
reg  toggle_flag;


always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		toggle_flag <= 1'b0;
	else if(cnt == CNT_5/2 - 1'b1 || cnt == CNT_5 - 1'b1)
		toggle_flag <= 1'b1;
	else
			toggle_flag <= 1'b0;


always@(negedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		clk1 <= 1'b0;
	else if(toggle_flag)
		clk1 <= ~clk1;
	else
		clk1 <= clk1;

always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		clk2 <= 1'b0;
	else if(toggle_flag)
		clk2 <= ~clk2;	
	else
		clk2 <= clk2;

always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		cnt <= 3'b0;
	else if(cnt == CNT_5)
		cnt <= 3'b0;
	else
		cnt <= cnt + 3'b1;

assign clk_out = (clk1 | clk2);

endmodule
