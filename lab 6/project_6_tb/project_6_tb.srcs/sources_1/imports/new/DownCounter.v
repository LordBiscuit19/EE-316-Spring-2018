`timescale 1ns / 1ps

module DownCounter(
    input clk,
    input reset,
    input [3:0] load,
    output reg [3:0] out,
    output reg overflow
    );
    
    initial 
        out = 9;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= load;
        else
            out <= out - 1;
            overflow <= 0;
            if (out == 4'b1111) begin
                overflow <= 1;
                out <= 9;
            end
    end
    
endmodule
