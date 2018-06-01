`timescale 1ns / 1ps



module time_mux_state_machine(
    input clk,
    input reset,
    input ss,
    input [3:0] extVal1,
    input [3:0] extVal2,
    input inc_dec,
    output reg [3:0] sseg1,
    output reg [3:0] sseg2,
    output reg [3:0] sseg3,
    output reg [3:0] sseg4
    );
    
    wire [3:0] anOut = 4'b0000;
    reg inc = 0;
    reg [2:0] state = 3'b000;
    reg [2:0] next_state = 3'b000;
    
    initial begin
        sseg1 = 0;
        sseg2 = 0;
        sseg3 = 0;
        sseg4 = 0;
    end
    
    
    
    always @(posedge clk) begin
    //the following code controls the states of the fsm
        case (state)
        
            3'b000: begin   //reset
                if (reset) begin
                    sseg1 <= 0;
                    sseg2 <= 0;
                    sseg3 <= extVal1;
                    sseg4 <= extVal2;
                end
                if (ss) begin
                    state = 3'b001;
                end 
            end
            
            3'b001: begin   //increment sseg1
            
                if (ss)
                    state = 3'b101;
                    
                else begin
            
                    if (inc_dec == 1) begin
                        sseg1 = sseg1 + 1;
                        if (sseg1 > 9)
                            state = 3'b010;
                        else
                            state = 3'b001;
                    end
                    if (inc_dec == 0) begin
                        sseg1 = sseg1 - 1;
                        if (sseg1 < 0)
                            state = 3'b010;
                        else
                            state = 3'b001;
                    end
                
                end
            end
            
            3'b010: begin   //increment sseg2
            
                if (ss)
                    state = 3'b101;
                
                else begin
                
                    if (inc_dec == 1) begin
                        sseg1 = 0;
                        sseg2 = sseg2 + 1;
                        if (sseg2 > 9)
                            state = 3'b011;
                        else
                            state = 3'b001;
                    end
                    if (inc_dec == 0) begin
                        sseg1 = 9;
                        sseg2 = sseg2 - 1;
                        if (sseg2 < 0)
                            state = 3'b011;
                        else
                            state = 3'b001;
                    end
                
                end
            end
            
            3'b011: begin   //increment sseg3
            
                if(ss)
                    state = 3'b101;
                
                else begin
                
                    if (inc_dec == 1) begin
                        sseg2 = 0;
                        sseg3 = sseg3 + 1;
                        if (sseg3 > 9)
                            state = 3'b100;
                        else
                            state = 3'b001;
                    end
                    if (inc_dec == 0) begin
                        sseg2 = 9;
                        sseg3 = sseg3 - 1;
                        if (sseg3 < 0)
                            state = 3'b100;
                        else
                            state = 3'b001;
                    end
                    
                end
            end
            
            3'b100: begin   //increment sseg4
                if (ss)
                    state = 3'b101;
                    
                else begin
                
                    if (inc_dec == 1) begin
                        if (sseg1>9 && sseg2>9 && sseg3>9 && sseg4>9)
                            state = 3'b101;
                        else begin
                            sseg3 = 0;
                            sseg4 = sseg4 + 1;
                            state = 3'b001;
                        end
                    end
                    if (inc_dec == 0) begin
                        if (sseg1<0 && sseg2<0 && sseg3<0 && sseg4<0)
                            state = 3'b101;
                        else begin
                            sseg3 = 9;
                            sseg4 = sseg4 - 1;
                            state = 3'b001;
                        end        
                    end
                    
                end
            end
            
            3'b101: begin
                if(ss)
                    state = 3'b001;
                if (reset)
                    state = 3'b000;
            end
            
            default begin
                state = 3'b000;
            end
            
        endcase
        
    end
    
    
    
endmodule
