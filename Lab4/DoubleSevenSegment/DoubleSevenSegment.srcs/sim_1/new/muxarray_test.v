`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2025 03:46:31 PM
// Design Name: 
// Module Name: muxarray_test
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


module muxarray_test();
    wire sel;
    reg clk;
    reg [7:0] count;
    wire [3:0] selected_sw;
    
    ClockDivider #(.PRESCALER(8)) CKD(
        .clkin(clk),
        .clkout(sel)
    );

    MUXArray DUT(.sel(sel), .a(count[3:0]), .b(count[7:4]), .o(selected_sw));
    
    initial begin
      count = 0;
      clk = 0;

      #100
      forever #10 clk=~clk;
    end

    always @(posedge clk) begin
      count <= count + 1;
    end
endmodule
