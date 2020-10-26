`timescale 1ns / 1ps

module moore11011_L_tb();
  reg in, clk, rst;
  wire out;
  
  moore11011_L dut(out, in, clk, rst); 
  
  initial
    begin
      clk=0;
      rst=1;
    end
  always #5 clk = ~clk;
  
  initial
    begin
      $monitor($time, "in=%b, out=%b",in,out);
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  initial 
    begin
      #0  rst=1'b1;
      #10 in=1'b1; rst =1'b0;
      #10 in=1'b1;
      #10 in=1'b0;
      #10 in=1'b1;
      #10 in=1'b1;
    
      #10 in=1'b0;
      #10 in=1'b1;
      #10 in=1'b1;
		
      #10 in=1'b1;
      #10 in=1'b0;
      #10 in=1'b1;
      #10 in=1'b1;
		
      #10 $finish;
    end
endmodule
