`timescale 1ns / 1ps


module tb_up_counter;
        
    reg clk = 0;
    reg ss = 0;
    reg reset = 0;
    reg [3:0] extLoad1;
    reg [3:0] extLoad2;
    wire [3:0] out1;
    wire [3:0] out2;
    wire [3:0] out3;
    wire [3:0] out4;
    wire slow_clk;
    wire ss_toggle;
    
    
    
    clk_div_count ut2 (clk, slow_clk);
    
    ss_toggle ut3(clk, ss, ss_toggle);
        
    up_counter ut (slow_clk, reset, ss_toggle, extLoad1, extLoad2, out1, out2, out3, out4);
    
    
    initial begin
    
    ss = 1;
    extLoad1 = 0;
    extLoad2 = 0;
    
    #100;
    
    ss = 0;
    
    #200
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #100;
    
    ss = 0;
    
    #100;
    
    ss=1;
    
    #2000;
    
    end
    
    always
    #5 clk = ~clk;
    
endmodule
