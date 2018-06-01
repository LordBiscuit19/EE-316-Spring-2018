`timescale 1ns / 1ps

module top_module(
    input reset,
    input ss,
    input clk,
    input [1:0] mode,
    input [7:0] extVal,
    output wire [6:0] sseg,
    output wire [3:0] an,
    output wire dp
    );
    

    reg [3:0] ssegIntExt1 = 0;
    reg [3:0] ssegIntExt2 = 0;
    reg [3:0] extValReg1 = 0;
    reg [3:0] extValReg2 = 0;
    reg inc_dec;
    
    reg [3:0] cntToDisp1 = 0;
    reg [3:0] cntToDisp2 = 0;
    reg [3:0] cntToDisp3 = 0;
    reg [3:0] cntToDisp4 = 0;
    
    wire slow_clk;
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
    wire ss_toggle;
    wire clk_refresh;

    
    always @(*) begin
        extValReg1 = extVal [3:0];
        extValReg2 = extVal [7:4];
    end
    
    /*
    always @(*) begin
        case (mode)
            2'b00: begin
                inc_dec = 1;
                ssegIntExt1 = 0;
                ssegIntExt2 = 0;
            end
            
            2'b01: begin
                inc_dec = 1;
                if (extValReg1 < 10 && extValReg2 < 10) begin   //if the external values can be displayed with 1 digit
                    ssegIntExt1 = extValReg1;
                    ssegIntExt2 = extValReg2;
                end
                else begin      //if they can't be displayed wit one digit show 0
                    ssegIntExt1 = 0;
                    ssegIntExt2 = 0;
                end
            end
            
            2'b10: begin
                inc_dec = 0;
                ssegIntExt1 = 9;
                ssegIntExt2 = 9;
            end
            
            2'b11: begin
                inc_dec = 0;
                if (extValReg1 < 10 && extValReg2 < 10) begin   //if the external values can be displayed with 1 digit
                    ssegIntExt1 = extValReg1;
                    ssegIntExt2 = extValReg2;
                end
                else begin  //if they can't be displayed wit one digit show 0
                    ssegIntExt1 = 9;
                    ssegIntExt2 = 9;
                end
            end
        endcase
    end
    
    */
    ss_toggle c8(ss, reset, ss_toggle);
    
    //clkdiv_refresh c9(clk, clk_refresh);
    
    //clk_div_count c1(clk, slow_clk);
    
    initial begin
        ssegIntExt1 = 0;
        ssegIntExt2 = 0;
    end
    
    up_counter c2 (clk, reset, ss, ssegIntExt1, ssegIntExt2, cntTo7SegUp1, cntTo7SegUp2, cntTo7SegUp3, cntTo7SegUp4);
    
    //down_counter c10 (clk, reset, ss_toggle, ssegIntExt1, ssegIntExt2, cntTo7SegDn1, cntTo7SegDn2, cntTo7SegDn3, cntTo7SegDn4);
    
    //time_mux_state_machine c2(slow_clk, reset, ss_toggle, ssegIntExt1, ssegIntExt2, inc_dec, ssegInt1, ssegInt2, ssegInt3, ssegInt4)
    
    /*
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
    */
    
    hex_to_7seg c3(cntTo7SegUp1, ssegToDisp1);
    hex_to_7seg c4(cntTo7SegUp2, ssegToDisp2);
    hex_to_7seg c5(cntTo7SegUp3, ssegToDisp3);
    hex_to_7seg c6(cntTo7SegUp4, ssegToDisp4);
        

    disp_fsm c7(clk, ssegToDisp1, ssegToDisp2, ssegToDisp3, ssegToDisp4, an, sseg, dp);
    
endmodule
