`timescale 1ns / 1ps

module clk_div_count(
    input clk,
    output reg clk_out
    );
    
    reg [18:0] COUNT = 0;
    //reg [1:0] COUNT = 0;
    
    initial begin
        clk_out = 0;
    end
    
    always @(posedge clk) begin

        COUNT = COUNT+1;
            
        if (COUNT >= 500000) begin
            clk_out <= !clk_out;
            COUNT <= 0;
        end
    end
    
endmodule
