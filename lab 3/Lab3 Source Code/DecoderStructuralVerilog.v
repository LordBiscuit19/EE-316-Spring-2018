`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2018 07:31:05 PM
// Design Name: 
// Module Name: DecoderStructuralVerilog
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


module DecoderStructuralVerilog(
    input ed,
    input ad,
    input bd,
    input cd,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7
    );
    
    //Defining wires for not signals
    wire a_not, b_not, c_not;
    
    //Instatiating Not gates as per the schematic
    not no (a_not, ad);
    not n1 (b_not, bd);
    not n2 (c_not, cd);
    
    //Instantiating and gates as per the schematic
    and g0 (d0, ed, a_not, b_not, c_not);
    and g1 (d1, ed, a_not, b_not, cd);
    and g2 (d2, ed, a_not, bd, c_not);
    and g3 (d3, ed, a_not, bd, cd);
    and g4 (d4, ed, ad, b_not, c_not);
    and g5 (d5, ed, ad, b_not, cd);
    and g6 (d6, ed, ad, bd, c_not);
    and g7 (d7, ed, ad, bd, cd);
    
endmodule
