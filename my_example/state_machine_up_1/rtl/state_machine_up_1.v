module state_machine_up_1
(
	input	wire	sys_clk,
	input	wire	sys_rst_n,
	input	wire	pi_money_half,
	input	wire	pi_money_one,
	
	output	reg		po_money,
	output	reg		po_cola
);

parameter	IDLE 	 = 5'b00001,	//这里可以用一个关键字定义多个常量
				HALF 	 = 5'b00010,	//中间用逗号分割开
				ONE	 	 = 5'b00100,
				ONE_HALF = 5'b01000,
				TWO		 = 5'b10000;	

wire [1:0] pi_money;	//该变量没有延迟所以是线网型变量，组合逻辑，用assign语句赋值
reg  [4:0] state;		//这里是时序逻辑，用reg型

assign  pi_money = {pi_money_one,pi_money_half};

always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
		state <= IDLE;
	else	case(state)
		IDLE:	if (pi_money == 2'b01)
			state <= HALF;
			else if(pi_money == 2'b10)
			state <= ONE;
			else
			state <= IDLE;
		HALF:	if (pi_money == 2'b01)
			state <= ONE;
			else if(pi_money == 2'b10)
			state <= ONE_HALF;
			else
			state <=HALF;
		ONE:	if (pi_money == 2'b01)
			state <= ONE_HALF;
			else if(pi_money == 2'b10)
			state <= TWO;
			else
			state <=ONE;
		ONE_HALF:if (pi_money == 2'b01)
			state <= TWO;
			else if(pi_money == 2'b10)
			state <= IDLE;
			else
			state <=ONE_HALF;
		TWO:	if(pi_money == 2'b00)
			state <= TWO;
			else 
			state <= IDLE;
		default state <=IDLE;
		endcase
		
always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
			po_cola <= 1'b0;
	else if(state == ONE_HALF && pi_money == 2'b10)
			po_cola <= 1'b1;
	else if(state == TWO && pi_money == 2'b01)
			po_cola <= 1'b1;
	else if(state == TWO && pi_money == 2'b10)
			po_cola <= 1'b1;
	else
			po_cola <= 1'b0;
		
always@(posedge sys_clk or negedge sys_rst_n)
	if(!sys_rst_n)
			po_money<= 1'b0;
	else if(state == TWO && pi_money == 2'b10)
			po_money<= 1'b1;
	else
			po_money<= 1'b0;
		
endmodule

