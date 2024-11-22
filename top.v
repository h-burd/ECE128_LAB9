`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 02:43:49 PM
// Design Name: 
// Module Name: top
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


module top(clk, a, b , p, rst);

    input clk;
    input rst;
    input [3:0] a;
    input [3:0] b;
    output [7:0] p;
   
    multiplier_seq uut(.clk(clk),.rst(rst),.a(a),.b(b),.p(p));
   



endmodule
