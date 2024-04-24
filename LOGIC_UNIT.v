module LOGIC_UNIT #(parameter IN_DATA_WD = 16,
                    OUT_WD = IN_DATA_WD)(
input wire [IN_DATA_WD-1:0] A,B,
input wire                  CLK,RST,
input wire                  LOGIC_EN,
input wire  [1:0]           ALU_FUN,
output reg [OUT_WD-1:0]     LOGIC_OUT,
output reg                  LOGIC_FLAG);

always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        LOGIC_OUT<=0;
        LOGIC_FLAG<=0;
      end
    else if (LOGIC_EN)
      begin
        LOGIC_FLAG<=1;
        case(ALU_FUN)
          2'b00:LOGIC_OUT<=A&B;
          2'b01:LOGIC_OUT<=A|B;
          2'b10:LOGIC_OUT<=~(A&B);
          2'b11:LOGIC_OUT<=~(A|B);
        endcase
      end
    else
      begin
        LOGIC_OUT<=0;
        LOGIC_FLAG<=0;
      end
  end
  
endmodule
