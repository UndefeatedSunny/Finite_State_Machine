`timescale 1ns / 1ps

module Moore_11011_NOL_1_always_Case(out, in, clk, rst);
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
			   state <= S1;
				out <= 1'b0;
			  end
			 else
			  begin
			   state <= S0;
				out <= 1'b0;
			  end
			end
		
     S1: begin
			 if(in)                       // 1 
			  begin
			   state <= S2;
				out <= 1'b0;
			  end
			 else
			  begin
			   state <= S0;
				out <= 1'b0;
			  end
			end
			
     S2: begin
			 if(~in)                      // 0
			  begin
			   state <= S3;
				out <= 1'b0;
			  end
			 else
			  begin
			   state <= S2;
				out <= 1'b0;
			  end
			end
			
     S3: begin
			 if(in)                       // 1			  
			 begin
			   state <= S4;
				out <= 1'b0;
			  end 
			 else
			  begin
			   state <= S0;
				out <= 1'b0;
			  end
			end
			
     S4: begin
			 if(in)                       // 1 
			  begin
			   state <= S5;
				out <= 1'b1;
			  end
			 else
			  begin
			   state <= S0;
				out <= 1'b0;
			  end
			end
			
     S5: begin
			 if(in)                     
			  begin
			   state <= S1;
				out <= 1'b0;
			  end
			 else
			  begin
			   state <= S0;
				out <= 1'b0;
			  end
			end
 endcase
 end
end
endmodule 
