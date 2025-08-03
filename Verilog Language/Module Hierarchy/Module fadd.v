module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire [15:0] sum_low, sum_high;
    wire carry_out;

    // Lower 16-bit adder (assume cin = 0)
    add16 add_lower (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(carry_out)
    );

    // Upper 16-bit adder (uses carry from lower adder)
    add16 add_upper (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_out),
        .sum(sum_high),
        .cout()  // carry-out ignored
    );

    assign sum = {sum_high, sum_low};  // Combine into 32-bit result
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

 assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
    

endmodule
