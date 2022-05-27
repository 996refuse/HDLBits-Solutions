module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output reg [3:0] LEDR
); //
    wire [3:0] R = SW;
    wire clk = KEY[0];
    wire E = KEY[1];
    wire L = KEY[2];
    wire w = KEY[3];

    MUXDFF obj[3:0]({4{clk}}, {4{E}}, {4{L}}, {w, LEDR[3:1]}, R, LEDR);
endmodule

module MUXDFF (
	input clk,
    input e,
    input l,
    input w,
    input r,
    output reg q
);
    always @(posedge clk) q <= l ? r : (e ? w : q);
endmodule
