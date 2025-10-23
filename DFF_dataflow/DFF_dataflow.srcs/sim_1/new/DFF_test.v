`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 05:12:40 PM
// Design Name: 
// Module Name: DFF_test
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


module DFF_test();
    reg d;
    reg clk;
    
    wire q;
    
    reg mclk;
    reg [2:0] count;
    
    DFF_dataflow uut (
        .clk(clk),
        .d(d),
        .q(q)
     );
     
     initial begin
        clk = 0;
        d = 0;
        count = 0;
        mclk = 0;
        clk = 0;
        #100;
      end
      
      always #10 mclk=~mclk;
      
      always @(posedge mclk) begin
            count = count + 1;
            clk = count[2]^count[0];
            d = count[1];
       end
endmodule
