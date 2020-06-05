`timescale 1ns / 1ps

module Moore_11011_OL_2_always_Case(out, in, clk, rst);
output out;
input in, clk, rst;
reg out;

reg [2:0] state;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;
parameter S5 = 3'b101;

always@(posedge clk or posedge rst)

begin

if(rst)
 state <= S0;

else 
 begin
 case(state)
     S0: begin
			 if(in)                       // 1
			   state <= S1;
			 else
			   state <= S0;
			end
		
     S1: begin
			 if(in)                       // 1 
			   state <= S2;
			 else
			   state <= S0;
			end
			
     S2: begin
			 if(~in)                      // 0
			   state <= S3;
			 else
			   state <= S2;
			end
			
     S3: begin
			 if(in)                       // 1 
			   state <= S4;
			 else
			   state <= S0;
			end
			
     S4: begin
			 if(in)                       // 1 
			   state <= S5;
			 else
			   state <= S0;
			end
			
     S5: begin
			 if(in)                     
			   state <= S2;
			 else
			   state <= S3;
			end
 endcase
 end
end

always@(state)
begin
if(rst)
 out <= 1'b0;
else
 begin
  case(state)                                             //         if(state==S5)    out <= 1'b1;
      S0 : out <= 1'b0;		       	                  //         else             out <= 1'b0;
      S1 : out <= 1'b0;
		S2 : out <= 1'b0;
		S3 : out <= 1'b0;
		S4 : out <= 1'b0;
		S5 : out <= 1'b1;
  endcase
 end
end		
endmodule 
