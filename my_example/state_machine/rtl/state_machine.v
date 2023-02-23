/* 一个简单的可乐机状态机实现 */
module state_machine
(
	input wire sys_clk,
	input wire sys_rst,
	input wire pi_money,
	
	output reg po_cola
);
parameter	IDLE = 3'b001;	//独热码
parameter	ONE  = 3'b010;
parameter	TWO	 = 3'b100;

reg [2:0] state;

//二段式状态机（如下）

always@(posedge sys_clk or negedge sys_rst)
	if(!sys_rst)
		state <= IDLE;
	else	case(state)
		IDLE: if(pi_money == 1'b1)
			state <= ONE;
			  else
			state <= IDLE;//考虑一下，这里用state看行不行
		ONE:  if(pi_money == 1'b1)
			state <= TWO;
			else
			state <= ONE;
		TWO:  if(pi_money == 1'b1)
			state <= IDLE;
			else
			state <= TWO;
		default:state  <=  IDLE;
		endcase
		
always@(posedge sys_clk or negedge sys_rst)
	if(!sys_rst)
		po_cola	<= 1'b0;
	else if((pi_money == 1'b1) && (state == TWO) )
		po_cola <= 1'b1;
	else
		po_cola <= 1'b0;
	
endmodule
 
