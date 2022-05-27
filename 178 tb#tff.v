module top_module ();
    reg clk, reset, t;
    wire q;
    
    tff obj(
    clk,
    reset,   // active-high synchronous reset
    t,       // toggle
    q
	);
        
    always begin
        #5;
        clk = ~clk;
    end
	initial begin
        clk = 0;
        reset = 1;
        #5;
        clk = 1;
        #1;
        reset = 0;
        t = 1;
        
        #5;
        clk = 0;
        
        #5;
        clk = 1;
        
    end
endmodule
