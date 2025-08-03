module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_low, sum_high;
    wire carry;

    // First 16-bit adder: lower half (bits 15:0)
    add16 adder_low (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(carry)
    );

    // Second 16-bit adder: upper half (bits 31:16), with carry from lower half
    add16 adder_high (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry),
        .sum(sum_high),
        .cout()         // Final carry-out is ignored
    );

    // Combine both halves into a single 32-bit sum
    assign sum = {sum_high, sum_low};

endmodule
