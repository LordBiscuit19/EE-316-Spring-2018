`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2018 08:52:36 AM
// Design Name: 
// Module Name: tb_SegmentDisplay
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

`timescale 1ns / 1ps

module tb_Decoder_Structural;

    //inputs to be defined as registers
    reg A;
    reg B; 
    reg C;
    reg D;
    
    //outputs to be defined as wires
    wire a;
    wire b;
    wire c;
    wire d;
    wire e;
    wire f;
    wire g;
    wire dp;
    wire AN0;
    wire AN1;
    wire AN2;
    wire AN3;
    
    //Initiat the unit under test (UUT)
    SegmentDisplay uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g),
        .dp(dp),
        .AN0(AN0),
        .AN1(AN1),
        .AN2(AN2),
        .AN3(AN3)
    );
    
    initial begin
    //initialze inputs
    A = 0;
    B = 0;
    C = 0;
    D = 0;
    
    #50; //wait 50 seconds for global reset to finish
    
    //stimulus - all input combinations followed by some wait time to observe the o/p
    
    $display ("TC01");
    if ({a,b,c,d,e,f,g} != 7'b0000001) $display ("Result is wrong");
    A = 0;                                       
    B = 0;                                       
    C = 0;                                       
    D = 1;
    #50                                       
    $display ("TC02");                           
    if ({a,b,c,d,e,f,g} != 7'b1001111) $display ("Result is wrong"); 
    
    A = 0;                                       
    B = 0;                                       
    C = 1;                                       
    D = 0;
    #50                                       
    $display ("TC03");                           
    if ({a,b,c,d,e,f,g} != 7'b0010010) $display ("Result is wrong");
    
    A = 0;                                       
    B = 0;                                       
    C = 1;                                       
    D = 1;
    #50                                       
    $display ("TC04");                           
    if ({a,b,c,d,e,f,g} != 7'b0000110) $display ("Result is wrong");      
    
    A = 0;                                       
    B = 1;                                       
    C = 0;                                       
    D = 0;
    #50                                       
    $display ("TC05");                           
    if ({a,b,c,d,e,f,g} != 7'b1001100) $display ("Result is wrong");     
    
    A = 0;                                       
    B = 1;                                       
    C = 0;                                       
    D = 1;
    #50                                       
    $display ("TC06");                           
    if ({a,b,c,d,e,f,g} != 7'b0100100) $display ("Result is wrong");
    
    A = 0;                                       
    B = 1;                                       
    C = 1;                                       
    D = 0;
    #50                                       
    $display ("TC07");                           
    if ({a,b,c,d,e,f,g} != 7'b1100000) $display ("Result is wrong");
    
    A = 0;                                       
    B = 1;                                       
    C = 1;                                       
    D = 1;
    #50                                       
    $display ("TC08");                           
    if ({a,b,c,d,e,f,g} != 7'b0001111) $display ("Result is wrong");
    
    A = 1;                                       
    B = 0;                                       
    C = 0;                                       
    D = 0;
    #50                                       
    $display ("TC11");                           
    if ({a,b,c,d,e,f,g} != 7'b0000000) $display ("Result is wrong");
    
    A = 1;                                       
    B = 0;                                       
    C = 0;                                       
    D = 1;
    #50                                       
    $display ("TC12");                           
    if ({a,b,c,d,e,f,g} != 7'b0001100) $display ("Result is wrong"); 
    
    A = 1;                                       
    B = 0;                                       
    C = 1;                                       
    D = 0;
    #50                                       
    $display ("TC13");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");
    
    A = 1;                                       
    B = 0;                                       
    C = 1;                                       
    D = 1;
    #50                                       
    $display ("TC14");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");      
    
    A = 1;                                       
    B = 1;                                       
    C = 0;                                       
    D = 0;
    #50                                       
    $display ("TC15");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");     
    
    A = 1;                                       
    B = 1;                                       
    C = 0;                                       
    D = 1;
    #50                                       
    $display ("TC16");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");
    
    A = 1;                                       
    B = 1;                                       
    C = 1;                                       
    D = 0;
    #50                                       
    $display ("TC17");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");
    
    A = 1;                                       
    B = 1;                                       
    C = 1;                                       
    D = 1;
    #50                                       
    $display ("TC18");                           
    if ({a,b,c,d,e,f,g} != 7'b1111111) $display ("Result is wrong");                   
    
    end
    
endmodule
