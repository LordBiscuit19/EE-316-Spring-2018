`timescale 1ns / 1ps


module ss_toggle(
    //input clk,
    input signal,
    input reset,
    output reg toggle
    );
        
    //reg [1:0] state = 2'b00;
    //reg [1:0] next_state;    
    reg buffer;
    initial begin
        toggle = 0;
        buffer = 1;
    end
    
    always @(posedge signal or posedge reset) begin
        if (reset)
            toggle <= 0;
        else begin
            toggle <= buffer;
            buffer <= ~buffer;
        end
    end

    
    //combinational logic
    /*
    always@(*) begin
        case (state)
        
            2'b00 : begin
                if(~signal)
                    next_state = 2'b00;
                else
                    next_state = 2'b01;
            end
                
            2'b01 : begin
                toggle = ~toggle;
                next_state = 2'b10;
            end
            
            2'b10: begin
                if(~signal)
                    next_state = 2'b00;
                else
                    next_state = 2'b10;
            end
            
            default : begin
                next_state = 2'b00;
                toggle = 1'b0;
                end
                
        endcase
    end
    
    
    
    //sequential logic
    always @(posedge clk) begin
        state <= next_state;
    end
    */
    
    
    
endmodule
