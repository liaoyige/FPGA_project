module mux2_1
(
	input wire [0:0] in_1,
	input wire [0:0] in_2,
	input wire [0:0] sel ,
	output wire out 
);

assign  out = (sel==1'b0) ? in_1 : in_2;

endmodule