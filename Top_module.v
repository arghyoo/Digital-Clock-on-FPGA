`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2025 03:36:54
// Design Name: 
// Module Name: Top_module
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


module Top_module(
input clk,
input sw,
input btnC,
input btnU,
input btnR,
output [6:0] seg,
output [3:0] an,
output [7:0] led );

wire [3:0] s1, s2, m1, m2, h1, h2;
reg hrup, minup;

wire btnCclr, btnUclr, btnRclr;
reg btnCclr_prev, btnUclr_prev, btnRclr_prev;

debounce dbC(btnC,clk,  btnCclr);
debounce dbU(btnU,clk,  btnUclr);
debounce dbR(btnR,clk,  btnRclr);

sevenseg_driver seg7(clk, 1'b0, h2, h1, m2, m1, seg, an);
// CORRECTED INSTANTIATION: Fixed output port order
digital_clock clock(
    .clk(clk),
    .en(sw),
    .rst(btnCclr),
    .hrup(hrup),
    .minup(minup),
    .s1(s1),
    .s2(s2),
    .m1(m1),
    .m2(m2),
    .h1(h1),
    .h2(h2)
);


always @(posedge clk)
begin 
btnUclr_prev<=btnUclr;
btnRclr_prev<=btnRclr;

if(btnUclr_prev==1'b0 && btnUclr==1'b1) hrup <=1'b1; else hrup<=1'b0;
if(btnRclr_prev==1'b0 && btnRclr==1'b1) minup <=1'b1; else minup<=1'b0;

end
assign led[7:0]={s2,s1};

endmodule

