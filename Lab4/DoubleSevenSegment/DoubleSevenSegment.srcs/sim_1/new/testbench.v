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


module decoder_test(

    );
    reg [3:0] d;
    reg en;
    wire [15:0] o;
    reg clk;
    reg [4:0] count;

    decoder4_16 DUT(.d(d), .en(en), .o(o));
    
    initial begin
      d = 0;
      en = 0;
      count = 0;
      clk = 0;

      #100
      forever #10 clk=~clk;
    end

    always @(posedge clk) begin
      count <= count + 1;
      d <= count[3:0];
      en <= count[4];
    end
endmodule
