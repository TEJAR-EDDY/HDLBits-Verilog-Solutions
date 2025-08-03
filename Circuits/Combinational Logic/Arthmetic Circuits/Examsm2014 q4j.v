module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum );

    wire c1, c2, c3; // carry wires between full adders

    fa fa0 (x[0], y[0], 1'b0,  sum[0], c1);     // LSB adder with cin = 0
    fa fa1 (x[1], y[1], c1,    sum[1], c2);
    fa fa2 (x[2], y[2], c2,    sum[2], c3);
    fa fa3 (x[3], y[3], c3,    sum[3], sum[4]); // MSB carry-out to sum[4]

endmodule

//full Adder code
module fa(
    input a, b, cin,
    output sum, cout );

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
