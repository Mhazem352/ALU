module ALU_TOP 
#( parameter IN_WD = 16,
             ARITH_WD = 2 * IN_WD,
             LOGIC_WD = IN_WD,
             SHIFT_WD = IN_WD,
             CMP_WD = IN_WD )
( input wire [IN_WD-1:0]     A,B,
  input wire [3:0]           ALU_FUN,
  input wire                 CLK,RST,
  output wire [ARITH_WD-1:0] ARITH_OUT,
  output wire [LOGIC_WD-1:0] LOGIC_OUT,
  output wire [SHIFT_WD-1:0] SHIFT_OUT,
  output wire [CMP_WD-1:0]   CMP_OUT,
  output wire                CARRY_OUT,
  output wire                ARITH_FLAG,
  output wire                LOGIC_FLAG,
  output wire                CMP_FLAG,
  output wire                SHIFT_FLAG );
  
  wire  ARITH_EN;
  wire  LOGIC_EN;
  wire  CMP_EN;
  wire  SHIFT_EN;
  
  DECODER U_decoder
    ( .ALU_FUN(ALU_FUN[3:2]),
      .SHIFT_EN(SHIFT_EN),
      .ARITH_EN(ARITH_EN),
      .CMP_EN(CMP_EN),
      .LOGIC_EN(LOGIC_EN)
      );
  
  ARITH_UNIT #(.IN_DATA_WD(IN_WD),.OUT_WD(ARITH_WD)) U_arith
  (.A(A),
   .B(B),
   .CLK(CLK),
   .RST(RST),
   .ALU_FUN(ALU_FUN[1:0]),
   .ARITH_EN(ARITH_EN),
   .ARITH_FLAG(ARITH_FLAG),
   .CARRY_OUT(CARRY_OUT),
   .ARITH_OUT(ARITH_OUT) );
  
   
  LOGIC_UNIT #(.IN_DATA_WD(IN_WD),.OUT_WD(LOGIC_WD)) U_logic
  (.A(A),
   .B(B),
   .CLK(CLK),
   .RST(RST),
   .ALU_FUN(ALU_FUN[1:0]),
   .LOGIC_OUT(LOGIC_OUT),
   .LOGIC_FLAG(LOGIC_FLAG),
   .LOGIC_EN(LOGIC_EN) );
   
   CMP_UNIT #(.IN_DATA_WD(IN_WD),.OUT_WD(CMP_WD)) U_cmp
   (.A(A),
   .B(B),
   .CLK(CLK),
   .RST(RST),
   .ALU_FUN(ALU_FUN[1:0]),
   .CMP_OUT(CMP_OUT),
   .CMP_FLAG(CMP_FLAG),
   .CMP_EN(CMP_EN)
   );
   
   SHIFT_UNIT #(.IN_DATA_WD(IN_WD),.OUT_WD(SHIFT_WD)) U_shift
   (.A(A),
   .B(B),
   .CLK(CLK),
   .RST(RST),
   .ALU_FUN(ALU_FUN[1:0]),
   .SHIFT_OUT(SHIFT_OUT),
   .SHIFT_FLAG(SHIFT_FLAG),
   .SHIFT_EN(SHIFT_EN)
   );
endmodule
