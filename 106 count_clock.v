module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    
    always @(posedge clk) begin
        if(reset) begin
        	pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'h0;
            ss <= 8'h0;
        end
        else if(~ena) ;
        else begin
            if(ss[3:0] == 4'h9)
                ss[3:0] <= 4'h0;
            else
                ss[3:0] <= 4'h1 + ss[3:0];
            
            if(ss[3:0] == 4'h9)
                begin
                    if(ss[7:4] == 4'h5)
                		ss[7:4] <= 4'h0;
            		else
                		ss[7:4] <= 4'h1 + ss[7:4];
                end
            
            if(ss == 8'h59) begin
                if(mm[3:0] == 4'h9)
                    mm[3:0] <= 4'h0;
                else
                    mm[3:0] <= 4'h1 + mm[3:0];
                
                if(mm[3:0] == 4'h9)
                    begin
                        if(mm[7:4] == 4'h5)
                    		mm[7:4] <= 4'h0;
                		else
                    		mm[7:4] <= 4'h1 + mm[7:4];
                    end
            end
            
            if(ss == 8'h59 && mm == 8'h59) begin
                if(hh == 8'h12)
                    hh <= 8'h1;
                else if(hh == 8'h09)
                    hh <= 8'h10;
                else
                    hh <= 8'h1 + hh;
            end
            
            if(ss == 8'h59 && mm == 8'h59 && hh == 8'h11) pm <= ~pm;
        end
    end

endmodule
