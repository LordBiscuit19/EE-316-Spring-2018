`timescale 1ns / 1ps


module clkdiv(
    input clk,
    input reset,
    output clk_out
    );
    
    reg [25:0] COUNT = 2'b00000000000000000000000000;
    
    assign clk_out = COUNT[25];
    
    always @(posedge clk) begin
        if (reset)
            COUNT = 0;
        else
            COUNT = COUNT+1;
        end
    
endmodule
