module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] min_0, min_1;
    // assign intermediate_result1 = compare? true: false;
	assign min_0 = a < b ? a : b;
    assign min_1 = c < d ? c : d;
    assign min = min_0 < min_1 ? min_0 : min_1;
    
endmodule
