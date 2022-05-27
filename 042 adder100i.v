module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

        
       wire [100:0] carry_in;
       assign carry_in[0] = cin;
       
    genvar i;
       generate
           for(i=0; i<100; i=i+1)
              begin:shit
                  fadd obj(a[i], b[i], carry_in[i], carry_in[i+1], sum[i]);
              end
       endgenerate
    
    assign cout[99:0] = carry_in[100:1];
endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
