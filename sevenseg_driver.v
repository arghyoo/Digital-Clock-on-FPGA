`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.04.2025 01:53:44
// Design Name: 
// Module Name: sevenseg_driver
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

module sevenseg_driver(
input clk,
input clr,
input [3:0] in1,
input [3:0] in2,
input [3:0] in3,
input [3:0] in4,
output reg [6:0] seg,
output reg [3:0]  an
);

wire [6:0] seg1, seg2, seg3, seg4;
reg [12:0] segclk;

localparam LEFT=2'b00, MIDLEFT=2'b01, MIDRIGHT =2'b10, RIGHT=2'b11;
reg [1:0] state=LEFT;

always@(posedge clk)
segclk<=segclk+1'b1;

always@(posedge segclk[12] or posedge clr)
begin 
if(clr==1)
begin
seg<=7'b0000000;
an<=4'b0000;
state<=LEFT;
end

else 
begin 
//case(state)

//LEFT:
//begin 
//seg<=seg1;
//an<=4'b0111;
//state<=MIDLEFT;
//end
//MIDLEFT:
//begin
//seg<=seg2;
//an<=4'b1011;
//state<=MIDRIGHT;
//end

//MIDRIGHT:
//begin
//seg<=seg3;
//an<=4'b1101;
//state<=RIGHT;
//end
//endcase


case(state)
            LEFT: begin
                seg <= seg1;
                an <= 4'b0111;
                state <= MIDLEFT;
            end
            MIDLEFT: begin
                seg <= seg2;
                an <= 4'b1011;
                state <= MIDRIGHT;
            end
            MIDRIGHT: begin
                seg <= seg3;
                an <= 4'b1101;
                state <= RIGHT;
            end
            RIGHT: begin
                seg <= seg4;
                an <= 4'b1110;
                state <= LEFT;
            end
        endcase

end 
end

Decoder_7_segment a(in1,seg1);
Decoder_7_segment b(in2,seg2);
Decoder_7_segment c(in3,seg3);
Decoder_7_segment d(in4,seg4);

endmodule

