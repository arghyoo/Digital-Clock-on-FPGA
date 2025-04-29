`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2025 02:11:25
// Design Name: 
// Module Name: binarytoBCD
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


module binarytoBCD(
input [11:0] binary,
output reg[3:0] thos, // thousands
output reg[3:0] huns,
output reg[3:0] tens,
output reg[3:0] ones
);

reg[11:0]bcd_data=0;

always @(binary)
begin
bcd_data=binary;
thos=bcd_data/1000;
bcd_data=bcd_data%1000;
huns=bcd_data/100;
bcd_data=bcd_data%100;
tens= bcd_data/10;
ones=bcd_data%10;
end
endmodule
