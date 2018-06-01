`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 07:34:34 PM
// Design Name: 
// Module Name: DecoderBehavioral
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


module DecoderBehavioral(
    input ed,
    input ad,
    input bd,
    input cd,
    output reg d0,
    output reg d1,
    output reg d2,
    output reg d3,
    output reg d4,
    output reg d5,
    output reg d6,
    output reg d7
    );
    
    always@(ed,ad,bd,cd)
    begin
    
    d0=1'b0; d1=1'b0; d2=1'b0; d3=1'b0; d4=1'b0; d5=1'b0; d6=1'b0; d7=1'b0;
    
    if(ed==1'b1)
        case({ad,bd,cd})
        3'b000 : d0=1'b1;
        3'b001 : d1=1'b1;
        3'b010 : d2=1'b1;
        3'b011 : d3=1'b1;
        3'b100 : d4=1'b1;
        3'b101 : d5=1'b1;
        3'b110 : d6=1'b1;
        3'b111 : d7=1'b1;
        default : begin
             d0=1'b0; d1=1'b0; d2=1'b0; d3=1'b0; d4=1'b0; d5=1'b0; d6=1'b0; d7=1'b0;
                  end
        endcase
    end
    
endmodule
