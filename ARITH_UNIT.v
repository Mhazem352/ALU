module ARITH_UNIT #(parameter IN_DATA_WD = 16,
                    OUT_WD = 2* IN_DATA_WD)(
  input wire signed [IN_DATA_WD-1:0] A,B,
  input wire                         CLK,RST,ARITH_EN,
  input wire        [1:0]            ALU_FUN,
  output reg signed [OUT_WD-1:0]     ARITH_OUT,
  output reg                         ARITH_FLAG,
  output wire                        CARRY_OUT
    );
always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    ARITH_OUT<=0;
    ARITH_FLAG<=0;
   end
  else if (ARITH_EN)
    begin
      ARITH_FLAG<=1;
      case(ALU_FUN[1:0])
        2'b00:ARITH_OUT<=A+B;
        2'b01:ARITH_OUT<=A-B;
        2'b10:ARITH_OUT<=A*B;
        2'b11:ARITH_OUT<=A/B;
      endcase
    end
  else 
    begin
      ARITH_OUT<=0;
      ARITH_FLAG<=0;
    end
 end      
  
assign CARRY_OUT = ARITH_OUT[IN_DATA_WD];
  
endmodule
