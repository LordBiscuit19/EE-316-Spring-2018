`timescale 1ns / 1ps


module tb_rising_edge_detector;

reg clk;
reg signal;
reg reset;


wire outedge;
wire slow_clk;

clkdiv c1(clk, reset, slow_clk);


rising_edge_detector ut(
    .clk(clk),
    .signal(signal),
    .reset(reset),
    .outedge(outedge)
);

initial begin

clk = 0;
signal = 0;
reset = 0;

#100;

signal = 1;
reset = 0;

#100

signal = 0;
reset = 0;

#100

signal = 1;
reset = 1;

#100 

reset = 0;

end

always
#5 clk = ~clk;

endmodule
