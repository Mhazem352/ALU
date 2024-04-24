module DECODER (
  input wire [1:0] ALU_FUN,
  output reg       ARITH_EN,LOGIC_EN,CMP_EN,SHIFT_EN);
always @(*)
  begin
    ARITH_EN=1'b0;
    LOGIC_EN=1'b0;
    CMP_EN=1'b0;
    SHIFT_EN=1'b0;
    case (ALU_FUN)
      2'b00:ARITH_EN=1'b1;
      2'b01:LOGIC_EN=1'b1;
      2'b10:CMP_EN=1'b1;
      2'b11:SHIFT_EN=1'b1;
    endcase
  end
endmodule
