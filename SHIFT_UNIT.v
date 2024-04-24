module SHIFT_UNIT #(parameter IN_DATA_WD = 16,
                    OUT_WD = IN_DATA_WD)(
input wire [IN_DATA_WD-1:0] A,B,
input wire                  CLK,RST,
input wire                  SHIFT_EN,
input wire  [1:0]           ALU_FUN,
output reg [OUT_WD-1:0]     SHIFT_OUT,
output reg                  SHIFT_FLAG);

always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        SHIFT_OUT<=0;
        SHIFT_FLAG<=0;
      end
    else if (SHIFT_EN)
      begin
        SHIFT_FLAG<=1;
        case(ALU_FUN)
          2'b00:SHIFT_OUT<=A>>1;
          2'b01:SHIFT_OUT<=A<<1;
          2'b10:SHIFT_OUT<=B>>1;
          2'b11:SHIFT_OUT<=B<<1;
                
        endcase
      end
    else
      begin
        SHIFT_OUT<=0;
        SHIFT_FLAG<=0;
      end
  end
  
endmodule
