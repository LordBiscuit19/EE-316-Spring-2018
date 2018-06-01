`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2018 08:19:03 PM
// Design Name: 
// Module Name: MuxStructural
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


module MuxStructural(
    input s0,
    input s1,
    input i0,
    input i1,
    input i2,
    input i3,
    output d
    );
    
    //defining wires for not signals
    wire s0_not, s1_not;
    
    //applying not logic gates to not wires
    not n0 (s0_not, s0);
    not n1 (s1_not, s1);
    
    //defining wires for and signals
    wire and0, and1, and2, and3;
    
    //instantiating and gates as per the schematic
    and g0 (and0, s0_not, s1_not, i0);
    and g1 (and1, s0, s1_not, i1);
    and g2 (and2, s0_not, s1, i2);
    and g3 (and3, s0, s1, i3);
    
    //instantiating or gate as per schematic
         
    or orGate (d, and0, and1, and2, and3);
      
endmodule
