module top_module (
    input a,
    input b,
    input c,
    output out
);

    wire and_out;

    // Instantiate the 5-input AND gate
    andgate u1 (
        .out(and_out),
        .a(a),
        .b(b),
        .c(c),
        .d(1'b1),  // tie unused inputs to 1
        .e(1'b1)
    );

    assign out = ~and_out;  // NAND = NOT(AND)

endmodule
