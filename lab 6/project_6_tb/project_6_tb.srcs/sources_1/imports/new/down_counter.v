`timescale 1ns / 1ps

module down_counter(
    input clk,
    input reset,
    input ss,
    input[3:0] ext_ld1,
    input[3:0] ext_ld2,
    output reg [3:0] reg_d1,
    output reg [3:0] reg_d2,
    output reg [3:0] reg_d3,
    output reg [3:0] reg_d4
);

initial begin
    reg_d1 = 0;
    reg_d2 = 0;
    reg_d3 = 0;
    reg_d4 = 0;
end

always @(posedge clk) begin
    
    if (reset) begin
        reg_d1 = 9;
        reg_d2 = 9;
        reg_d3 = ext_ld1;
        reg_d4 = ext_ld2;
    end
        
        if (!(reg_d1==0 && reg_d2==0 && reg_d3==0 && reg_d4==0)) begin
        
            if(reg_d1 == 0) begin
                reg_d1 <= 9;
                if(reg_d2 == 0) begin
                    reg_d2 <= 9;
                    if (reg_d3 == 0) begin
                        reg_d3 <= 9;
                        if (reg_d4 == 0) begin
                        end
                        else
                            reg_d4 <= reg_d4-1;
                    end
                    else
                        reg_d3 <= reg_d3-1;
                end
                else
                    reg_d2 <= reg_d2-1;
            end
            else begin
                if(ss)
                    reg_d1 <= reg_d1-1;
            end
        
        end
end

endmodule