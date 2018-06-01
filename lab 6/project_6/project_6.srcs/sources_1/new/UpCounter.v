`timescale 1ns / 1ps


module UpCounter(
    input clk,
    input reset,
    input [3:0] load,
    output reg [3:0] out,
    output reg overflow
    );
    
    initial 
        out = 0;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= load;
        else begin
            out <= out + 1;
            overflow <= 0;
            if (out == 9) begin
                overflow <= 1;
                out <= 0;
            end
        end
    end
    
endmodule
