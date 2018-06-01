`timescale 1ns / 1ps

module clk_div_disp(
    input clk,
    input reset,
    output clk_out
    );
    
    reg [1:0] COUNT = 2'b00;
    
    assign clk_out = COUNT[1];
    
    always @(posedge clk) begin
        if (reset)
            COUNT = 0;
        else
            COUNT = COUNT+1;
        end
    
endmodule
