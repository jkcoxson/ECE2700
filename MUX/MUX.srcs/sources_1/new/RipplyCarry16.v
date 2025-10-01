`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2025 03:41:10 PM
// Design Name: 
// Module Name: RipplyCarry16
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


module RipplyCarry16(
    input [15:0] X,
    input [15:0] Y,
    input Cin,
    input Cout,
    output [15:0] S
    );

    wire [2:0] carry_wire;
    
    RippleCarry4 stage0(0, {X[0], X[1], X[2], X[3]}, {Y[0], Y[1], Y[2], Y[3]}, {S[0], S[1], S[2], S[3]}, carry_wire[0]);
    RippleCarry4 stage1(carry_wire[0], {X[4], X[5], X[6], X[7]}, {Y[4], Y[5], Y[6], Y[7]}, {S[4], S[5], S[6], S[7]}, carry_wire[1]);
    RippleCarry4 stage2(carry_wire[1], {X[8], X[9], X[10], X[11]}, {Y[8], Y[9], Y[10], Y[11]}, {S[8], S[9], S[10], S[11]}, carry_wire[2]);
    RippleCarry4 stage3(carry_wire[2], {X[12], X[13], X[14], X[15]}, {Y[12], Y[13], Y[14], Y[15]}, {S[12], S[13], S[14], S[15]}, Cout);
endmodule
