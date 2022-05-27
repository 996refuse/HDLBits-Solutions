// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase
    end
    assign result_is_zero = (0 == out);
endmodule
