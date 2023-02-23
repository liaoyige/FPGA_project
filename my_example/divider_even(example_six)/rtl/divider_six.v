module divider_six
#
(
	parameter CNT_SIX = 2'b10
)
(
	input wire sys_clk,
	input wire sys_rst_n,
	
	output reg clk_out
);

reg [1:0] cnt;
reg 	  cnt_flag;

always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		cnt <= 2'b0;
	else if(cnt_flag == 1'b1)
		cnt <= 2'b0;
	else
		cnt <= cnt +2'b1;

always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		cnt_flag <= 1'b0;
	else if(cnt == CNT_SIX - 1)
		cnt_flag <= 1'b1;
	else	
		cnt_flag <= 1'b0;
always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		clk_out <= 1'b0;
	else if(cnt_flag == 1'b1)
		clk_out <= ~clk_out;
	else
		clk_out <= clk_out;

endmodule

