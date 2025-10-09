`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 04:46:12 PM
// Design Name: 
// Module Name: decoder4_16
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


module decoder4_16(
    input [3:0] d,
    input en,
    output [15:0] o
    );

    decoder3_8 high (
      .en(~d[3] & en),
      .d(d[2:0]),
      .o(o[15:8])
    );
    decoder3_8 low (
      .en(d[3] & en),
      .d(d[2:0]),
      .o(o[7:0])
    );
endmodule
