`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 03:49:40 PM
// Design Name: 
// Module Name: tb_mux
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

module testbench ();
// simple mux test bench (part 4)
//  reg sw0, sw1, sw2;
//  wire led0;
//  wire [1:0] in;

//  assign in = {sw1, sw0};

//  mux DUT (
//      .i(in),
//      .sel(sw2),
//      .o(led0)
//  );

//  initial begin
//    sw0 = 0;
//    sw1 = 0;
//    sw2 = 0;
//    forever #12 sw0 = ~sw0;
//  end
//  initial begin
//    forever #14 sw1 = ~sw1;
//  end
//  initial begin
//    forever #16 sw2 = ~sw2;
//  end

// (part 6)
reg [3:0] X;
reg [3:0] Y;
wire [3:0] S;
wire carryout;
integer i, j;

CarrySelect DUT (0, X, Y, S, carryout);

initial begin
    X = 4'b0000;
    Y = 4'b0000;
end
    

initial begin
    for (i = 0; i < 16; i = i + 1) begin
        X = i;
        for (j = 0; j < 16; j = j + 1) begin
            Y = j;
            #5;
        end
    end
end


endmodule
