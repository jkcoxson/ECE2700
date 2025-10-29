`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 01:46:57 PM
// Design Name: 
// Module Name: rotateLED
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


module rotateLED #(parameter PRESCALER = 25_000_000) (
    input mclk, shift, rst,
    input [7:0] D0,
    output [7:0] Q
    );
    
    wire slow_clock;
    ClockDivider #( .PRESCALER(PRESCALER) ) cd (.clkin(mclk), .clkout(slow_clock));
    
    wire [7:0] next_in;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : reg_loop
            assign next_in[i] = Q[(i + 7) % 8];
            
            Dregister dreg (
                .next(next_in[i]),
                .init(D0[i]),
                .shift(shift),
                .rst(rst),
                .clk(slow_clock),
                .q(Q[i])
            );
        end
    endgenerate
endmodule
