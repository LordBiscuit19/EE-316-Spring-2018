`timescale 1ns / 1ps

module tb_top_module;

    reg clk = 0;
    reg ss = 0;
    reg reset = 0;
    reg [3:0] ssegIntExt1 = 9;
    reg [3:0] ssegIntExt2 = 9;
    reg inc_dec = 0;
    reg [3:0] cntToDisp1;
    reg [3:0] cntToDisp2;
    reg [3:0] cntToDisp3;
    reg [3:0] cntToDisp4;

    
    
    wire [6:0] sseg;
    wire [3:0] an;
    wire dp;
    wire [3:0] cntTo7SegUp1;
    wire [3:0] cntTo7SegUp2;
    wire [3:0] cntTo7SegUp3;
    wire [3:0] cntTo7SegUp4;
    
    wire [3:0] cntTo7SegDn1;
    wire [3:0] cntTo7SegDn2;
    wire [3:0] cntTo7SegDn3; 
    wire [3:0] cntTo7SegDn4;
    
    wire [6:0] ssegToDisp1;
    wire [6:0] ssegToDisp2;
    wire [6:0] ssegToDisp3;
    wire [6:0] ssegToDisp4;
    
    //top_module ut (clk, ss, reset, mode, in, sseg, an, dp);
    
    up_counter c2 (clk, reset, ss, ssegIntExt1, ssegIntExt2, cntTo7SegUp1, cntTo7SegUp2, cntTo7SegUp3, cntTo7SegUp4);
        
    down_counter c10 (clk, reset, ss, ssegIntExt1, ssegIntExt2, cntTo7SegDn1, cntTo7SegDn2, cntTo7SegDn3, cntTo7SegDn4);
    
    always @(*) begin
      if (inc_dec) begin
          cntToDisp1 = cntTo7SegUp1;
          cntToDisp2 = cntTo7SegUp2;
          cntToDisp3 = cntTo7SegUp3;
          cntToDisp4 = cntTo7SegUp4;
      end
      
      else begin
          cntToDisp1 = cntTo7SegDn1;
          cntToDisp2 = cntTo7SegDn2;
          cntToDisp3 = cntTo7SegDn3;
          cntToDisp4 = cntTo7SegDn4;
      end
    end
    
    hex_to_7seg c3(cntToDisp1, ssegToDisp1);
    hex_to_7seg c4(cntToDisp2, ssegToDisp2);
    hex_to_7seg c5(cntToDisp3, ssegToDisp3);
    hex_to_7seg c6(cntToDisp4, ssegToDisp4);
        

    disp_fsm c7(clk, ssegToDisp1, ssegToDisp2, ssegToDisp3, ssegToDisp4, an, sseg, dp);    
    
    initial begin
    
    reset = 1;
    
    #20;
    
    reset = 0;
    ss = 1;
    
    #20;
    
    ss = 0;
    
    #20;
    
    ss = 1;
    
    #20;
    
    ss = 0;
    
    #20;
    
    ss = 1;
    
    #20;
    
    reset = 1;
    
    #20;
    
    reset = 0;
    ss = 1;
    
    #200;
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #300;
    
    end
    
    always
    #5 clk = ~clk;
    
    
endmodule
