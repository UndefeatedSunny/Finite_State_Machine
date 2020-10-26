`timescale 1ns / 1ps

module moore11011_L(out, in, clk, rst); 
  output out;
  input in, clk, rst;
  
  parameter [4:0]S0=5'b00000,
  				 S1=5'b00001,
  				 S2=5'b00011,
   				 S3=5'b00110,
  				 S4=5'b01101,
    		     S5=5'b11011; 
  
  reg[4:0] next, state;
  
  always @(posedge clk or posedge rst)   // Middle Block
    begin
      if(rst)
        state <= S0;
      else
        state <= next;
    end
  
  always @(in or state)
    begin
    case(state)
      S0 :							// 1
        begin
          if(in)
            next <= S1;
          else
            next <= S0;
        end
      S1 :							// 10
        begin
          if(in)
            next <= S2;
          else
            next <= S0;
        end
      S2 :							// 101
        begin
          if(~in)
            next <= S3;
          else
            next <= S2;
        end
      S3 :							// 1011
        begin
          if(in)
            next <= S4;
          else
            next <= S0;
        end
      S4 :							// 10110
        begin
          if(in)
            next <= S5;
          else
            next <= S0;
        end
      S5 :
        begin
          if(in)
            next <= S2;
          else
            next <= S3;
        end
    endcase
  end
  
  assign out = ((state==S5)?1:0);
endmodule
