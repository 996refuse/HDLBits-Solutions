module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    reg [255:0] q_next;
    integer i, j;
    integer i_s, i_a, j_s, j_a;
    
    always @(*) begin
        for(i = 0; i < 16; ++ i)
            for(j = 0; j < 16; ++ j)
                begin
                    if(i == 0)
                        i_s = 15;
                    else
                        i_s = i - 1;
                    
                    if(j == 0)
                        j_s = 15;
                    else
                        j_s = j - 1;
                    
                    if(i == 15)
                        i_a = 0;
                    else
                        i_a = i + 1;
                    
                    if(j == 15)
                        j_a = 0;
                    else
                        j_a = j + 1;
                    
                    case(q[i_a+j_s*16] + q[i_s+j_a*16] + q[i_s+j_s*16] + q[i_a+j_a*16] + q[i_s+j*16] + q[i_a+j*16] + q[i+j_s*16] + q[i+j_a*16])
                        4'b0010: q_next[i+j*16] <= q[i+j*16];
                        4'b0011: q_next[i+j*16] <= 1;
                        default: q_next[i+j*16] <= 0;
                    endcase
                end
    end
    
    always @(posedge clk) begin
        if(load)
            q <= data;
        else
	    	q <= q_next;
    end

endmodule
