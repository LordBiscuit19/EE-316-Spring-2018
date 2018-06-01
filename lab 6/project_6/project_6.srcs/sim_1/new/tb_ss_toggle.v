`timescale 1ns / 1ps


module tb_ss_toggle;
    
    
    reg clk = 0;
    reg ss = 0;
    wire ss_toggle;
    
    ss_toggle ut (clk, ss, ss_toggle);
    
    
    initial begin
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #100
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #100;
    
    ss = 0;
    
    end
    
    always
    #5 clk = ~clk;
    
    
endmodule
