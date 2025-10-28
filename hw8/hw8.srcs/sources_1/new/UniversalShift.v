`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:45:37 PM
// Design Name: 
// Module Name: UniversalShift
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


module UniversalShift #(parameter N=32)(
    input wire dir, L, w0, wn, clk,
    output reg [N-1:0] Q
    input wire [N-1:0] R,
    );

    always @(posedge clk) begin
      if (L) begin
        Q <= R;
      end else if (dir) begin
        Q <= {Q[N-2:0], wn};
      end else begin
        Q <= {w0, Q[N-1:1]};
      end
    end
endmodule
