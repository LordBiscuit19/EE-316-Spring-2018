`timescale 1ns / 1ps


module tb_clk_div_count;        
        
    reg clk = 0;
    reg ss = 0;
    reg reset = 0;
    wire ss_toggle;
    wire slow_clk;
    
    ss_toggle ut (clk, ss, ss_toggle);
    
    
    clk_div_count ut2(clk, slow_clk);
    
    
    initial begin
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #200
    
    ss = 0;
    
    #100;
    
    ss = 1;
    
    #100;
    
    ss = 0;
    
    end
    
    always
    #5 clk = ~clk;
    
endmodule
