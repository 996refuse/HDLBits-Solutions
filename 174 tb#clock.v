module top_module ( );
    reg clk = 0;
	always 
    begin
        #5; // high for 5 * timescale = 5 ns
        clk = ~ clk;
    end
    
    
    dut obj( .clk(clk) ) ;

endmodule
