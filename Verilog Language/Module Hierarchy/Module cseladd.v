module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_low, sum_high_0, sum_high_1;
    wire carry_out_low;
    
    // Lower 16-bit adder: a[15:0] + b[15:0] + 0
    add16 adder_low (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_low),
        .cout(carry_out_low)
    );

    // Upper 16-bit adder assuming carry-in = 0
    add16 adder_high_0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_high_0),
        .cout()
    );

    // Upper 16-bit adder assuming carry-in = 1
    add16 adder_high_1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_high_1),
        .cout()
    );

    // 16-bit 2-to-1 multiplexer: select sum_high based on carry_out_low
    wire [15:0] sum_high;
    assign sum_high = carry_out_low ? sum_high_1 : sum_high_0;

    // Final 32-bit result
    assign sum = {sum_high, sum_low};
endmodule
