`timescale 1ns / 1ps

module tb_top_module;

    reg clk = 0;
    reg ss = 0;
    reg reset = 0;
    reg [1:0] mode = 0;
    reg [7:0] in = 8'b10011001;
    
    wire [6:0] sseg;
    wire [3:0] an;
    wire dp;
    
    top_module ut (clk, ss, reset, mode, in, sseg, an, dp);
    
    
    initial begin
    
    ss = 1;
    
    #100;
    
    ss = 0;
    
    #10000;
    
    ss = 1;
    
    #10000;
    
    ss = 0;
    
    #10000;
    
    mode = 1;
    reset = 1;
    
    #10000
    reset = 0;
    ss = 1;
    
    #100;
    
    ss = 0;
    
    #10000;
    
    end
    
    always
    #5 clk = ~clk;
    
    
endmodule
