`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 02:15:19 PM
// Design Name: 
// Module Name: multiplier_seq_tb
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


module multiplier_seq_tb;

    reg clk;
    reg rst;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;
   
    multiplier_seq uut(.clk(clk),.rst(rst),.a(a),.b(b),.p(p));
   
   initial begin
        clk = 0;
        forever #5 clk = ~clk;       // 100 MHz clock (period = 10 ns)
    end
   
    initial begin
    
         rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'b0010; b = 4'b0010;
         #1000;
        
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd5; b = 4'b0010;
         #1000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd3; b = 4'b0010;
         #1000;
         
          rst = 1'b1;
         #10; rst = 1'b0;
         a = 4'd4; b = 4'b0010;
         #1000;
        
        $stop;
    end

endmodule
