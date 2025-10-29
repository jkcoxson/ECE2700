`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2025 02:08:40 PM
// Design Name: 
// Module Name: counter
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


module counter #(parameter PRESCALER = 25_000_000) (
    input mclk,
    input incr,
    input rst,
    output [7:0] Q
    );
    
    wire slow_clock;
    ClockDivider #( .PRESCALER(PRESCALER) ) cd (.clkin(mclk), .clkout(slow_clock));
    
    wire [7:0] to_inc;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : reg_loop
            if (i == 0) begin
                assign to_inc[i] = incr & ~rst;
            end else begin
                assign to_inc[i] = (&Q[i-1:0]) & incr & ~rst;
            end
            
            JKFF jk (
                .j(to_inc[i]),
                .k(rst),
                .clk(slow_clock),
                .q(Q[i])
            );
        end
    endgenerate
endmodule
