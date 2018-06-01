`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2018 01:08:58 PM
// Design Name: 
// Module Name: tb_ANDgate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ANDgate;

    reg a;
    reg b;
    
    wire out;
    
    ANDgate and_gate0(
        .a(a),
        .b(b),
        .out(out)
    );
    
    initial
        begin
        
            a = 1'b0;
            b = 1'b0;
            
            #50
            
            a = 1'b0;
            b = 1'b1;
            
            #50
            
            a = 1'b1;
            b = 1'b0;
            
            #50
            
            a = 1'b1;
            b = 1'b1;
            
        end

endmodule
