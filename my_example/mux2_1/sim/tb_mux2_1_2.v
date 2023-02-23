`timescale 1ns/1ns
module tb_mux2_1();

reg in_1;
reg in_2;
reg sel;
wire out;

initial
	begin
		in_1 = 1'b0;
		in_2 = 1'b0;
		sel  = 1'b0;
	end
	
always #10 in_1 <= ($random)%2;
always #10 in_2 <= ($random)%2;
always #10 sel  <= ($random)%2;

initial
	begin
		$timeformat(-9,0,"ns",6); 	//第一个表示是10的-9次方，也就是ns，
									//第二个表示精确到小数点后几位
									//第三个表示单位与第一个对齐，也就是注释为ns
									//第四个表示最少打印6个数字字符
		$monitor("@time t:in_1=%b in_2=%b sel=%b out=%b",$time,in_1,in_2,sel);
	end
	
endmodule