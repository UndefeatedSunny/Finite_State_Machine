`timescale 1ns / 1ps

module Mealy_11011_NOL_1_always_TB();

reg in1, clk1, rst1;
wire out1;

Mealy_11011_NOL_1_always_Case dut(.out(out1), .in(in1), .clk(clk1), .rst(rst1));

initial
begin

	clk1=1'b1;
	forever #5 clk1 =~clk1;

end


initial
begin

$monitor("Input = %b & Output = %b",in1,out1);

#0  rst1=1'b1;  in1=1'b1;
#10 rst1=1'b0;  in1=1'b1;
#10 rst1=1'b0;  in1=1'b1;
#10 rst1=1'b0;  in1=1'b0;
#10 rst1=1'b0;  in1=1'b1;
#10 rst1=1'b0;  in1=1'b1;

#10 $finish;
end
endmodule
