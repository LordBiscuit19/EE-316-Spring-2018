`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 08:29:00 PM
// Design Name: 
// Module Name: MuxBehavioral
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


module MuxBehavioral(
    input s0,
    input s1,
    input i0,
    input i1,
    input i2,
    input i3,
    output reg d
    );
    
    always@*
    begin
    
        case({s1,s0})
            2'b00 : d = i0;
            2'b01 : d = i1;
            2'b10 : d = i2;
            2'b11 : d = i3;
            default : d = 0;
        endcase
    
    end
endmodule
