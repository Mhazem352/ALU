module CMP_UNIT #(parameter IN_DATA_WD = 16,
                    OUT_WD = IN_DATA_WD)(
input wire [IN_DATA_WD-1:0] A,B,
input wire                  CLK,RST,
input wire                  CMP_EN,
input wire  [1:0]           ALU_FUN,
output reg [OUT_WD-1:0]     CMP_OUT,
output reg                  CMP_FLAG);
always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        CMP_OUT<=0;
        CMP_FLAG<=0;
      end
    else if (CMP_EN)
      begin
        CMP_FLAG<=1;
        case(ALU_FUN)
          2'b00:CMP_OUT<=0;
          2'b01: begin
                  if(A==B) 
                  CMP_OUT<=1;
                  else
                  CMP_OUT<=0;
                 end
          2'b10:begin
                  if(A>B) 
                  CMP_OUT<=2;
                  else
                  CMP_OUT<=0;
                end
          2'b11:begin
                  if(A<B) 
                  CMP_OUT<=3;
                  else
                  CMP_OUT<=0;
                end
        endcase
      end
    else
      begin
        CMP_OUT<=0;
        CMP_FLAG<=0;
      end
  end
  
endmodule
