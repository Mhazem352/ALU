`timescale 1us/1ps
module ALU_TB ();
 parameter IN_WD = 16;
 parameter ARITH_WD = 2 * IN_WD;
 parameter LOGIC_WD = IN_WD;
 parameter SHIFT_WD = IN_WD;
 parameter CMP_WD = IN_WD ;
reg signed [IN_WD-1:0] A_tb,B_tb;
reg CLK_tb,RST_tb;
reg [3:0] ALU_FUN_tb;
wire signed [ARITH_WD-1:0] ARITH_OUT_tb;
wire [LOGIC_WD-1:0] LOGIC_OUT_tb;
wire [CMP_WD-1:0] CMP_OUT_tb;
wire [SHIFT_WD-1:0] SHIFT_OUT_tb;
wire ARITH_FLAG_tb,LOGIC_FLAG_tb,CMP_FLAG_tb,SHIFT_FLAG_tb;
wire CARRY_OUT_tb;

ALU_TOP dut (
    .A(A_tb),
    .B(B_tb),
    .CLK(CLK_tb),
    .RST(RST_tb),
    .ALU_FUN(ALU_FUN_tb),
    .ARITH_OUT(ARITH_OUT_tb),
    .LOGIC_OUT(LOGIC_OUT_tb),
    .CMP_OUT(CMP_OUT_tb),
    .SHIFT_OUT(SHIFT_OUT_tb),
    .ARITH_FLAG(ARITH_FLAG_tb),
    .LOGIC_FLAG(LOGIC_FLAG_tb),
    .CMP_FLAG(CMP_FLAG_tb),
    .SHIFT_FLAG(SHIFT_FLAG_tb),
    .CARRY_OUT(CARRY_OUT_tb)
);

localparam T=10;
always
 begin
   CLK_tb=0;
   #((2*T) /5);
   CLK_tb=1;
   #((3*T) /5);
 end

initial 
  begin
    RST_tb=1'b0;
    #2;
    RST_tb=1'b1;
    $display("test adding 1");
    A_tb='shFFEE;
    B_tb='shFFCE;
    ALU_FUN_tb=4'b0000;
    #10;
    
    $display("test adding 2");
    A_tb='d18;
    #10;
    $display("test adding 3");
    A_tb='shFFEE;
    B_tb='d50;
    #10;
    $display("test adding 4");
    A_tb='d18;
    #10;
    $display("test sub 1");
    A_tb=-'d5;
    B_tb=-'d55;
    ALU_FUN_tb=1;
    #10;
    $display("test sub 2");
    A_tb='d5;
    B_tb=-'d55;
    #10;
    $display("test sub 3");
    A_tb=-'d5;
    B_tb='d55;
    #10;
    $display("test sub 4");
    A_tb='d5;
    B_tb='d55;
    #10;
    $display("test mul 1");
    A_tb=-'d5;
    B_tb=-'d55;
    ALU_FUN_tb=2;
    #10;
    $display("test mul 2");
    A_tb='d5;
    B_tb=-'d55;
    #10;
    $display("test mul 3");
    A_tb=-'d5;
    B_tb='d55;
    #10;
    $display("test mul 4");
    A_tb='d5;
    B_tb='d55;
    #10;
    $display("test div 1");
    A_tb=-'d5;
    B_tb=-'d55;
    ALU_FUN_tb=3;
    #10;
    $display("test div 2");
    A_tb='d5;
    B_tb=-'d55;
    #10;
    $display("test div 3");
    A_tb=-'d5;
    B_tb='d55;
    #10;
    $display("test div 4");
    A_tb='d5;
    B_tb='d55;
    #10;
    $display("test anding ");
    A_tb='d25;
    B_tb='d94;
    ALU_FUN_tb=4;
    #10;
    $display("test oring ");
    ALU_FUN_tb=5;
    #10;
    $display("test nand ");
    ALU_FUN_tb=6;
    #10;
    $display("test nor ");
    ALU_FUN_tb=7;
    #10;
    $display("test CMP op");
    ALU_FUN_tb=8;
    #10;
    ALU_FUN_tb=9;
    #10;
    ALU_FUN_tb=10;
    #10;
    ALU_FUN_tb=11;
    #10;
    A_tb='d94;
    B_tb='d30;
    ALU_FUN_tb=9;
    #10;
    ALU_FUN_tb=10;
    #10;
    ALU_FUN_tb=11;
    #10;

    A_tb='d100;
    B_tb='d100;
    ALU_FUN_tb=9;
    #10;
    ALU_FUN_tb=10;
    #10;
    ALU_FUN_tb=11;
    #10;
    $display("test shifting ops");
    A_tb='d25;
    B_tb='d94;
    ALU_FUN_tb=12;
    #10;
    ALU_FUN_tb=13;
    #10;
    ALU_FUN_tb=14;
    #10;
    ALU_FUN_tb=15;
    #100;
    $stop;
  end
endmodule
