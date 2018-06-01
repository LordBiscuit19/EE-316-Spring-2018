`timescale 1ns / 1ps


module clkdiv_refresh(
    input clk,
    output clk_out
    );
    
    reg [8:0] COUNT = 0;
    
    assign clk_out = COUNT[8];
    
    always @(posedge clk) begin
        COUNT = COUNT+1;
    end
    
endmodule
