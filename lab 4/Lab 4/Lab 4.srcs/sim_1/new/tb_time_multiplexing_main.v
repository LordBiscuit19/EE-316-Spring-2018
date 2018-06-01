`timescale 1ns / 1ps


module tb_time_multiplexing_main;

reg clk;
reg reset;
reg [15:0] sw;
wire [3:0] an;
wire [6:0] sseg;

wire slow_clk;


time_multiplexing_main u7(
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .an(an),
    .sseg(sseg)
);

    //module instantiation of the clock divider
    clk_div_disp u5 (.clk(clk), .reset(reset), .clk_out(slow_clk));

initial begin

clk = 1;

#10

reset = 0;
sw = 16'b0011001000010000;

#160;

sw = 16'b0111011001010100;

#160;

sw = 16'b1011101010011000;

#160;

sw = 16'b1111111011011100;

#160;

reset = 1;

#160;
end


always
    #5 clk = ~clk;

endmodule
