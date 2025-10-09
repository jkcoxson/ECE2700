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


module seven_decoder_test();
    reg [3:0] wxyz;
    wire [6:0] segNew, segTruthTable, err;
    wire not_the_same;
    
    reg clk;
    reg [3:0] count;

    NewSevenSegment DUT(.wxyz(wxyz), .seg(segNew));
    SevenSegmentTruthTable REF(.d(wxyz), .D(segTruthTable));
    
    assign err = segNew^segTruthTable;
    assign not_the_same = |err;
    
    initial begin
      wxyz = 0;
      count = 0;
      clk = 0;

      #100
      forever #10 clk=~clk;
    end

    always @(posedge clk) begin
      count <= count + 1;
      wxyz <= count[3:0];
    end
endmodule
