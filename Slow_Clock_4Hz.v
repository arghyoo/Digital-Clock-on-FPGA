`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2025 03:12:40
// Design Name: 
// Module Name: Slow_Clock_4Hz
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


module Slow_Clock_4Hz(
input clk_in,
output  reg clk_out);

reg [25:0] count=0;
//reg clk_out;

always @(posedge clk_in)
begin
count<=count+1;
if(count==12_500_000)
begin
count<=0;
clk_out=~clk_out;

end
end
endmodule
