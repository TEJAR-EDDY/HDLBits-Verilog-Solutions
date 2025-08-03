module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
wire [99:0] carry;

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin: adder
            if (i == 0) begin
                fa fa0 (
                    .a(a[0]),
                    .b(b[0]),
                    .cin(cin),
                    .sum(sum[0]),
                    .cout(carry[0])
                );
            end else begin
                fa faN (
                    .a(a[i]),
                    .b(b[i]),
                    .cin(carry[i-1]),
                    .sum(sum[i]),
                    .cout(carry[i])
                );
            end
            assign cout[i] = carry[i];
        end
    endgenerate

endmodule
module fa (
    input a, b, cin,
    output sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
