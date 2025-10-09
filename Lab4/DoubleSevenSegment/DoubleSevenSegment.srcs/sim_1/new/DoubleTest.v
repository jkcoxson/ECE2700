`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 03:46:31 PM
// Design Name: 
// Module Name: decoder_test
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


module double_test();
    reg [7:0] wxyz;
    reg [3:0] an;
    wire [6:0] segNew;
 
    reg clk;
    reg [7:0] count;

    DoubleSevenSegment #(.PRESCALER(8)) DUT(.clk(clk), .sw(wxyz), .an(an), .seg(segNew));
    
    initial begin
      wxyz = 0;
      count = 0;
      clk = 0;

      #100
      forever #10 clk=~clk;
    end

    always @(posedge clk) begin
      count <= count + 1;
      wxyz <= count[7:0];
    end
endmodule
