`timescale 1ns / 1ps

module Mealy_11011_NOL_3_always_Case(out, in, clk, rst);
output out;
input in, clk, rst;
reg out;

reg [2:0] state;
reg [2:0] next_state;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

always@(posedge clk or posedge rst)
begin

if(rst)
 state <= S0;
else
 state <= next_state;
end

always@(in or state)
begin
 case(state)
     S0: begin
			 if(in)                       // 1
			   next_state <= S1;
			 else
			   next_state <= S0;
			end
		
     S1: begin
			 if(in)                        // 1
			   next_state <= S2;
			 else
			   next_state <= S0;
			end
			
     S2: begin             
			 if(~in)                       // 0
			   next_state <= S3;
			 else
			   next_state <= S2;
			end
			
     S3: begin
			 if(in)                         // 1
			   next_state <= S4;
			 else
			   next_state <= S0;
			end
			
     S4: begin
			 if(in)                         // 1
			   next_state <= S0;
			 else
			   next_state <= S0;
			end
 endcase
end

always@(posedge clk or posedge rst)
begin
 if(rst)
  out <= 1'b0;
  else 
   begin
	case(state)
	S0 : out <= 1'b0;
	S1 : out <= 1'b0;
	S2 : out <= 1'b0;
	S3 : out <= 1'b0;
	S4 : begin
	      if(in)
			 out <= 1'b1;
			else 
			 out <= 1'b0;
		  end
	endcase 
   end
end
endmodule 
