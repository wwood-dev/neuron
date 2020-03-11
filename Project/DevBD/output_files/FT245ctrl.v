module FT245IO(
input wire Clock,
input wire Reset,
inout wire [7:0] Data,
output reg ReadStrobe,
output reg WriteStrobe,
input wire ReadOK,
input wire WriteOK,
output reg ResetDev,
output reg [7:0] ReceivedData,
input wire [7:0] DataToSend,
input wire ReadReq,
input wire WriteReq,
output reg DataValid,
output reg ready);

reg [3:0]State;
initial State<=0;

assign Data=(State==3)?DataToSend:8'bz;

always @(posedge Clock)
   begin
	case(State)
	 0:begin //Idle
	   if (WriteReq&WriteOK)
	     begin
		  State<=3;
		  end
		else
		  if (ReadReq&ReadOK)
		    begin
			 State<=6;
			 ReadStrobe<=0;
			 end
		  else
		  begin
		  ReadStrobe<=1'b1;
		  WriteStrobe<=1'b1;
		  DataValid<=0;
		  end
	   end
	  3:begin
		 WriteStrobe<=0;
		 State<=0;
	    end
	  6:begin 
	    ReceivedData<=Data;
		 State<=0;
		 ReadStrobe<=1'b1;
		 DataValid<=1'b1;
		 end
	  endcase
	  ready<=(State==0);
	end
	
	
	
endmodule

module counter(
input wire clk,
input wire ena,
output reg [7:0]R);

initial R<=0;

always @(posedge clk)
  R<=R+ena;

endmodule

