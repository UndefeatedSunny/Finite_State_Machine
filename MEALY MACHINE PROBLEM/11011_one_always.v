`timescale 1ns / 1ps

module Mealy_11011_NOL_1_always_Case(out, in, clk, rst);
output out;
input in, clk, rst;
reg out;

reg [2:0] state;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

always@(posedge clk or posedge rst)

begin

if(rst)
begin
 out <= 1'b0;
 state <= S0;
end

else 
 begin
 case(state)
     S0: begin
			 if(in)                       // 1
			  begin
			   out <= 1'b0;
			   state <= S1;
			  end
			 else
			  begin
			   out <= 1'b0;
			   state <= S0;
			  end
			end
		
     S1: begin
			 if(in)                        // 1
			  begin
			   out <= 1'b0;
			   state <= S2;
			  end
			 else
			  begin
			   out <= 1'b0;
			   state <= S0;
			  end
			end
			
     S2: begin             
			 if(~in)                       // 0
			  begin
			   out <= 1'b0;
			   state <= S3;
			  end
			 else
			  begin
			   out <= 1'b0;
			   state <= S2;
			  end
			end
			
     S3: begin
			 if(in)                         // 1
			  begin
			   out <= 1'b0;
			   state <= S4;
			  end
			 else
			  begin
			   out <= 1'b0;
			   state <= S0;
			  end
			end
			
     S4: begin
			 if(in)                         // 1
			  begin
			   out <= 1'b1;
			   state <= S0;
			  end
			 else
			  begin
			   out <= 1'b0;
			   state <= S0;
			  end
			end
 endcase
 end
end
endmodule 
