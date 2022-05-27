module top_module();
    reg [1:0] in;
    wire out;
    
	andgate obj (in, out);
    initial begin
        in = 'b00;
        #10;
        in = 'b01;
        #10;
        in = 'b10;
        #10;
        in = 'b11;
    end
endmodule
