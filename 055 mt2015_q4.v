module IA (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module IB ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);
	wire z1, z2;
    IA obj1(x, y, z1);
    IB obj2(x, y, z2);
    
    assign z = (z1 | z2) ^ (z1 & z2);
endmodule
